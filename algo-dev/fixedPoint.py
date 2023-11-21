#---------------------------------------------------------------------------------------------
#   AlexDom513 --- 11/20/23
#---------------------------------------------------------------------------------------------
#   -Unify sensor, pid, and control numbers
#---------------------------------------------------------------------------------------------

import numpy as np
import matplotlib.pyplot as plt
from fixedpoint import FixedPoint

#distance bounds (in meters)
MIN_DIST = 0.001
MAX_DIST = 0.501

Q = FixedPoint(0.0029, signed=True, m=0, n=18, overflow_alert='error', str_base=2)
print(Q.qformat)
print(str(Q))