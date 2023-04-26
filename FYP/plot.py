import matplotlib.pyplot as plt
import numpy as np
import wave

file = 'FYP\sample - Copy.wav'

wav_file = wave.open(file,'r')

#Extract Raw Audio from Wav File
signal = wav_file.readframes(-1)
if wav_file.getsampwidth() == 1:
    signal = np.array(np.frombuffer(signal, dtype='UInt8')-128, dtype='Int8')
elif wav_file.getsampwidth() == 2:
    signal = np.frombuffer(signal, dtype=np.int16)
else:
    raise RuntimeError("Unsupported sample width")

deinterleaved = [signal[idx::wav_file.getnchannels()] for idx in range(wav_file.getnchannels())]

#Get time from indices
fs = wav_file.getframerate()
Time=np.linspace(0, int(len(signal)/wav_file.getnchannels()/fs), num=int(len(signal)/wav_file.getnchannels()))

#Plot
plt.figure(1)
plt.title('Signal Wave...')
for channel in deinterleaved:
    plt.plot(Time,channel)
plt.show()