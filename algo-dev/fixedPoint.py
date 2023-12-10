#---------------------------------------------------------------------------------------------
#   Alexander Domagala --- 11/20/23
#---------------------------------------------------------------------------------------------
#   - Unify sensor, pid, and control numbers
#---------------------------------------------------------------------------------------------

import numpy as np
import matplotlib.pyplot as plt
from fixedpoint import FixedPoint

# #convert binary fractions to decimal
# def binary_fraction_to_decimal(binary_fraction):
# 	decimal_fraction = 0.0
# 	for i, bit in enumerate(binary_fraction):
# 		decimal_fraction += int(bit) * 2**(-(i + 1))
# 	return decimal_fraction

#convert decimal to fixed point binary
Q1 = FixedPoint(1.8, signed=True, m=7, n=12, overflow_alert='error', str_base=2)
print(Q1.qformat)
print(str(Q1))
print('\n')

# #fixed point addition/subtraction
# x = FixedPoint(1.5, m=6, n=12, signed=1)
# y = FixedPoint(8, m=6, n=12, signed=1)
# a = x - y
# print(f'  {x:q}\n- {y:q}\n------\n {a:q}')
# print(float(a))
# print('\n')

#generate sine lookup for different angle values
# for i in range(-50,50, 5):
# 	val = np.sin(np.deg2rad(i*1.8))
# 	Q1 = FixedPoint(val, signed=True, m=7, n=12, overflow_alert='error', str_base=2)
# 	print("elsif (sPID_Position < " + str(i) + ") then")
# 	print("  vCurr_Acc         := \"" + str(Q1) + "\";")