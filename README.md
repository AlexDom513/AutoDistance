# autoDistance
The goal of this project is to implement a simple [PID controller](https://en.wikipedia.org/wiki/Proportional%E2%80%93integral%E2%80%93derivative_controller) using a FPGA. [(1)](https://www.youtube.com/watch?v=JFTJ2SS4xyA) and [(2)](https://www.youtube.com/watch?v=oy58S4beC9c) served as the inspiration for this project. Note that a FPGA is being used as an exercise. It is likely more convenient to use of a microcontroller for this application.

## PID Algorithm
Before starting to implement the PID controller in hardware, a [Python script](https://github.com/AlexDom513/autoDistance/blob/main/algo-dev/algo2.py) was used to understand the algorithm and the system it would be used in. The script was set up in such a way that the user can specify variables like the set-point, the PID gains, and the cart mass.

A simulation then shows how the cart position is affected by the changing angle of a ramp:


<img src="media/sim.png" width="534" height="400">


## FPGA Modules
### PulseController
The module is responsible for interacting with the ultrasonic sensor. According to the [datasheet](https://github.com/AlexDom513/autoDistance/blob/main/datasheets/HCSR04.pdf), the FPGA must send a 10 microsecond trigger pulse. The sensor the sends eight 40 kHz pulses and detects whether there is a returned pulse. If there is a returned pulse, the time of high output from the sensor is proportional to the distance detected.

### PIDController
After obtaining the cart distance in the PulseController module, the PIDController module is used to compute an appropriate ramp angle so that the cart will be directed towards the ramp's center. Proportional gain (P) is a function of where the cart is located along the ramp. Integral gain (I) continues to increase while the cart's true position is different from the target position. Derivative gain (D) is dependent on how quickly the cart is approaching the target position. A state machine is used to jump between states that contain different computations (error, gains, ramp angle, scaling/saturation).

### StepperController
Whenever a new ramp angle is computed, it is passed to the StepperController module. This module translates the value into physical movement by the stepper motor attached to the ramp. Two state machines are used to implement this functionality (Stepper State Machine & Pulse State Machine). The Stepper State Machine has a counter that is used to track the position of the stepper motor. The counter is set to 0 during startup. We then monitor whether the output from PIDController is greater than or less than the current value of the counter. Depending on the condition, we will either have the stepper motor increment or decrement from its current position. A direction signal is set and the Pulse State Machine is used to send trigger pulses to a A4988 motor controller. The stepper motor finally increments or decrements.


## CAD
This was my first serious attempt at creating a 3D model! All parts were printed using PLA on a PRUSA MK3.

<img src="media/cad.png" width="360" height="200">

[My Parts](https://cad.onshape.com/documents/018887aac5e3fe98b3ecc4ac/w/28ee8de5f592833dfd0388a2/e/8ab51c28ebdef6fccae7c0ab?renderMode=1&uiState=657551bd4254d404bca63ac2) |
[HC-SR04 Model](https://grabcad.com/library/hcsr04-ultrasonic-sensor-1) |
[NEMA-17 Model](https://grabcad.com/library/nema17-42-40-1) |
[Motor Bracket](https://grabcad.com/library/nema-17-stepper-motor-mounting-bracket-2)

