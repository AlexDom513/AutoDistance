#Purpose is to run a simulation and understand how different parameters will affect PID system
#based on: https://www.youtube.com/watch?v=ZMI_kpNUgJM and #https://github.com/Jmack66/TVC-Sim/blob/main/Graphics.py

import control as ct
import matplotlib.pyplot as plt
import turtle
import time
import numpy as np
from matplotlib.animation import FuncAnimation

#GLOBAL PARAMS
TIMER = 0
TIME_STEP = 0.001
SETPOINT = 10
SIM_TIME = 100
INITIAL_X = 20
INITIAL_VX = 0
MASS = 1
LENGTH = 7
HEIGHT = 24
HYPOTENUSE = np.sqrt(np.power(7,2) + np.power(24,2))
THETA = np.arctan(HEIGHT/LENGTH)
G = -9.81

class Simulation():
    def __init__(self):
        self.screen = turtle.Screen()
        self.screen.setup(800,800)
        self.marker = turtle.Turtle()
        self.marker.color('red')
        self.marker.penup()             #disable drawing on canvas
        self.marker.left(180)           #turn left by 180 degrees
        self.marker.goto(15,SETPOINT)   #move to specified location on canvas
        self.sim = True
        self.timer = 0

class Ball():
    def __init__(self):
        #self.marker = turtle.Turtle()
        #self.marker.shape('circle')
        #self.marker.color('blue')
        #self.marker.goto(0,0)
        #self.marker.speed(0)
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
        self.output = self.kp * self.error + self.ki * self.integral_error + self.kd * self.derivative_error
        return self.output

#main
#while(timer < 5):
    #sim = Simulation()
    #ball = Ball()
    #time.sleep(2)
    #timer += 1
ball = Ball()
xVals = []
xCoord = []
yCoord = []
for i in range(10000):
    ball.set_ddx(20)
    ball.set_dx()
    ball.set_x()
    #print(ball.get_dx())
    xCoord.append(np.cos(THETA)*ball.get_x())
    yCoord.append(np.sin(THETA)*ball.get_x())
    print(str(xCoord[i]) + ', ' + str(yCoord[i]))
#plt.scatter(xCoord,yCoord)
#plt.show()
print('done')





#visualization
fig, ax = plt.subplots()
line, = ax.plot([], [], lw=2)

ax.set_xlim(min(xCoord) - 10, max(xCoord) + 10)
ax.set_ylim(min(yCoord) - 10, max(yCoord) + 10)

# Initialization function
def init():
    line.set_data([], [])
    return line,

# Animation function
def animate(frame):
    x = xCoord[:frame]
    y = yCoord[:frame]
    line.set_data(x, y)
    #print(frame)
    return line,

# Create the animation
animation = FuncAnimation(fig, animate, init_func=init, frames=len(xCoord), interval=0.00000001, blit=True)

# Show the animation (you can also save it to a file)
plt.show()