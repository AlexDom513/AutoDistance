import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

path = 'system-debug/noise_test.csv'
data = pd.read_csv(path)
signal = data[' Motor Pulse Signal (V)']
data.head()

fs = 1253.01
fft_result = np.fft.fft(signal)
fft_norm = fft_result / len(fft_result)
frequencies = np.fft.fftfreq(len(fft_norm), 1/fs)

# Plot the Fourier Transform
numPoints = len(fft_norm)
plt.plot(frequencies[:numPoints // 2], np.abs(fft_norm[:numPoints // 2]))
plt.title('Fourier Transform')
plt.xlabel('Frequency (Hz)')
plt.ylabel('Amplitude Spectrum')
plt.show()