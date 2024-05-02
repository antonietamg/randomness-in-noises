

# ███    ██  ██████  ██ ███████ ███████ ███████ 
# ████   ██ ██    ██ ██ ██      ██      ██      
# ██ ██  ██ ██    ██ ██ ███████ █████   ███████ 
# ██  ██ ██ ██    ██ ██      ██ ██           ██ 
# ██   ████  ██████  ██ ███████ ███████ ███████ 

    ####### Noises and Random Walks #########
    ###########   April, 2024     ########### 

# By Antonieta Martínez-Guerrero
# Complex Systems Lab, Universidad Autónoma del Estado de Morelos
# PI and original idea: Dr. Markus F. Müller

############## Testing randomness in noises #################### 

library(tuneR)

# ----- random walk over the white noise series ----- 

set.seed(584)
gauss_noise <- rnorm(100000, mean = 0, sd = 1)
hist(gauss_noise)
cum_gaus <- cumsum(gauss_noise)

tf <- fft(cum_gaus)
phases <- atan2(Re(tf), Im(tf))
amps <- (abs(tf))^2

plot(phases)
plot(amps, log="xy")

#wave_obj <- Wave(left = cum_gaus, samp.rate = 44100, bit = 16)

# Save the wave object as a WAV file
#writeWave(wave_obj, "walk.wav")

# ----- random walk over the colored noise series ----- 

color_noise <- noise(kind = "pink", duration = 0.25, xunit = "time", stereo = F)
# kind = "red": brown noise
# kind = "white": white noise
# kind = "pink": pink noise

tf <- fft(color_noise@left)
phases <- atan2(Re(tf), Im(tf))
amps <- (abs(tf))^2
plot(phases, cex = .1)
#plot(amps, log="xy", cex = .1)

#wave_obj <- Wave(left = brown_noise@left, samp.rate = 44100, bit = 16)

# Save the wave object as a WAV file
#writeWave(wave_obj, "b_noise.wav")

cum_noise <- cumsum(color_noise@left)

tf <- fft(cum_noise)
phases <- atan2(Re(tf), Im(tf))
amps <- (abs(tf))^2
plot(phases, cex = .1)
#plot(amps, log="xy", cex = .1)
