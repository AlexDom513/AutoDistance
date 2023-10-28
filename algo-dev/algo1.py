#---------------------------------------------------------------------------------------------
#   AlexDom513 --- 10/27/23
#---------------------------------------------------------------------------------------------
#   -Run simulation and understand how different parameters will affect PID controller output
#   -Model represents ball on a ramp being pushed by a fan
#   -based on: https://www.youtube.com/watch?v=ZMI_kpNUgJM
#---------------------------------------------------------------------------------------------

import control as ct
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.animation import FuncAnimation

#GLOBAL PARAMS
SEC = 20
TIME_STEP = 0.001
ITER = int(SEC * (1/TIME_STEP))
SETPOINT = 100
INITIAL_X = 0
INITIAL_VX = 0
MASS = 0.1
LENGTH = 7
HEIGHT = 24
HYPOTENUSE = np.sqrt(np.power(LENGTH,2) + np.power(HEIGHT,2))
THETA = np.arctan(HEIGHT/LENGTH)
G = -9.81
KP = 5
KI = 1.5
KD = 2

#represents physics of a ball on ramp, pushed by fan
class Ball():
    def __init__(self):
        self.ddx = G * np.sin(THETA)
        self.dx = INITIAL_VX
        self.x = INITIAL_X

    #only need to consider x-axis (defined parallel to ramp)
    def set_ddx(self,fanForce):
        self.ddx = (np.sin(THETA) * MASS * G + fanForce) / MASS
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

        #use gains to compute the output control signals
        #P (proportional): if error increases, output increases; if error decreases, output decreases
        #I (integral): if error persists over time, the integral term increases the control output
        #D (derivative): reduces control output as error approaches the setpoint; if error is stable or decreasing, minimal effect on control output
        self.output = self.kp * self.error + self.ki * self.integral_error + self.kd * self.derivative_error
        return self.output

#simulation
pid = PID(KP,KI,KD,SETPOINT)
ball = Ball()
ballPos = []
xCoord = []
yCoord = []
fanForceHist = []
for i in range(ITER):
    fanForce = pid.compute(ball.get_x())
    ballPos.append(ball.get_x())
    ball.set_ddx(fanForce)
    ball.set_dx()
    ball.set_x()
    xCoord.append(np.cos(THETA)*ball.get_x())
    yCoord.append(np.sin(THETA)*ball.get_x())
    fanForceHist.append(fanForce)
    #print(str(xCoord[i]) + ', ' + str(yCoord[i]))

#visualization
fig, ax = plt.subplots()
line, = ax.plot([], [], lw=2)
point, = ax.plot([], [], 'o', lw=2)
target, = ax.plot([], [], 'o', lw=2)
txt = ax.annotate("",xy=(0,0), xytext=(20,20))
ax.set_xlim(min(xCoord) - 10, max(xCoord) + 10)
ax.set_ylim(min(yCoord) - 10, max(yCoord) + 10)
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_title('(X,Y) Position w/ Force Applied')
ax.grid(True)

#initialization function
def init():
    line.set_data([], [])
    point.set_data([], [])
    target.set_data(np.cos(THETA)*SETPOINT, SETPOINT)
    txt.set_text("")
    return line, point, txt

#animation function
def animate(frame):
    x = xCoord[:frame]
    y = yCoord[:frame]
    line.set_data(x,y)
    if (frame > 0):
        point.set_data(x[-1],y[-1])
        txt.set_text('force applied: ' + str(round(fanForceHist[frame-1],1)) +
                      ' N\nforce gravity: ' + str(round(np.sin(THETA) * MASS * G,1)) + ' N')
        txt.set_position((-8, 0))
    return line, point, txt

#create animation
print('starting simulation: ' + str(ITER*TIME_STEP) + ' (s) duration')
animation = FuncAnimation(fig, animate, init_func=init, frames=len(xCoord), interval=0.01*TIME_STEP, blit=True)
plt.show()

#plot path traveled along the ramp
plt.plot(np.arange(len(ballPos))*TIME_STEP, ballPos)
plt.xlabel('Time (s)')
plt.ylabel('Position')
plt.grid()
plt.show()

#plot force applied by fan
plt.hist(fanForceHist[1:], bins=100, edgecolor='black')
plt.xlabel('Force Applied (N)')
plt.ylabel('Frequency')
plt.show()