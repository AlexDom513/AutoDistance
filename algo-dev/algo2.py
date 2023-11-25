#---------------------------------------------------------------------------------------------
#   AlexDom513 --- 10/27/23
#---------------------------------------------------------------------------------------------
#   -Run simulation and understand how different parameters will affect PID controller output
#   -Model represents cart on ramp that can change angle relative to ground
#---------------------------------------------------------------------------------------------

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.animation import FuncAnimation

#simulation params
SEC = 10
TIME_STEP = 0.001
ITER = int(SEC * (1/TIME_STEP))
ITERSKIP = 1

#initial conditions
INITIAL_X = 0                   #in m, initial displacement of cart
INITIAL_VX = 0                  #in m/s, initial velocity of cart
INITIAL_THETA = 0               #in degrees, initial angle of ram
MAX_THETA = 6.379               #in degrees with initial track layout

#setpoint we are targeting
SETPOINT = 0.25                  #~25 cm

#physics params
MASS = 0.1                      #light cart
G = -9.81                       #gravity, m/s

#gains
KP = 2
KI = 0.05
KD = 1.8

#represents physics of a cart on a ramp, one of the sides of the ramp is fixed,
#the other side is adjustable by angle theta relative to the x-axis
class Cart():
  def __init__(self):
    self.ddx = np.sin(INITIAL_THETA) * MASS * G
    self.dx = INITIAL_VX
    self.x = INITIAL_X

  #only consider force due to gravity (parallel to the ramp)
  def set_ddx(self, theta):
    self.ddx = (np.sin(theta) * MASS * G)
  def get_ddx(self):
    return self.ddx
  def set_dx(self):
    self.dx += self.ddx * TIME_STEP
  def get_dx(self):
    return self.dx
  def set_x(self):
    self.x = self.x + self.dx * TIME_STEP
  def get_x(self):
    return self.x

class PID():
  def __init__(self,KP,KI,KD,target):
    self.kp = KP
    self.ki = KI
    self.kd = KD
    self.setpoint = target
    self.error = 0
    self.integral_error = 0
    self.error_last = 0
    self.derivative_error = 0
    self.output = 0

  def compute(self,pos):
    self.error = self.setpoint - pos                                    #error is difference between where we want to be and where we are
    self.integral_error += self.error * TIME_STEP                       #integral error is the summation of all error over time
    self.derivative_error = (self.error - self.error_last) / TIME_STEP  #derivative error is the difference in error at each time
    self.error_last = self.error                                        #update last error after done using it

    #P (proportional): if error increases, output increases; if error decreases, output decreases
    #I (integral): if error persists over time, the integral term increases the control output
    #D (derivative): reduces control output as error approaches the setpoint; if error is stable or decreasing, minimal effect on control output

    #multiply by negative 1 because +theta causes negative displacement while -theta causes positive displacement
    self.output = -1*(self.kp * self.error + self.ki * self.integral_error + self.kd * self.derivative_error)
    return self.output

#setup simulation
pid = PID(KP,KI,KD,SETPOINT)
cart = Cart()
cartLoc = []
thetaVals = []

acc = []
vel = []
disp = []

#run simulation
for i in range(ITER):

  #compute new angle, set limits +20 and -20 degrees max, assume theta is already in radians
  theta = pid.compute(cart.get_x())
  if (theta > np.deg2rad(MAX_THETA)):
    theta = np.deg2rad(MAX_THETA)
  elif (theta < np.deg2rad(-MAX_THETA)):
    theta = np.deg2rad(-MAX_THETA)

  #update physics, theta in radians
  cart.set_ddx(theta)
  cart.set_dx()
  cart.set_x()

  #tracking
  cartLoc.append(cart.get_x())
  thetaVals.append(np.rad2deg(theta))

  acc.append(cart.get_ddx())
  vel.append(cart.get_dx())
  disp.append(cart.get_x())

#plot results
plt.subplot(2,1,1)
plt.plot(cartLoc[ITERSKIP:])
plt.axhline(SETPOINT, color = 'red')
plt.title('Cart Position')
plt.xlabel('Iteration')
plt.ylabel('x-displacement')

plt.subplot(2,1,2)
plt.plot(thetaVals[ITERSKIP:])
plt.title('Ramp Angle')
plt.xlabel('Iteration')
plt.ylabel('Theta')
plt.tight_layout()
plt.show()

plt.plot(acc[ITERSKIP:], label='Acceleration')
plt.plot(vel[ITERSKIP:], label='Velocity')
plt.plot(disp[ITERSKIP:], label='Displacement')
plt.legend()
plt.show()