#---------------------------------------------------------------------------------------------
#   AlexDom513 --- 11/20/23
#---------------------------------------------------------------------------------------------
#   -Unify sensor, pid, and control numbers
#---------------------------------------------------------------------------------------------

import numpy as np
import matplotlib.pyplot as plt
from fixedpoint import FixedPoint

#convert binary fractions to decimal
def binary_fraction_to_decimal(binary_fraction):
	decimal_fraction = 0.0
	for i, bit in enumerate(binary_fraction):
		decimal_fraction += int(bit) * 2**(-(i + 1))
	return decimal_fraction

#convert decimal to fixed point binary
Q1 = FixedPoint(0.01715, signed=False, m=0, n=12, overflow_alert='error', str_base=2)
print(Q1.qformat)
print(str(Q1))