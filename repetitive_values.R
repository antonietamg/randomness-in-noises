##### Series with repetitive values must have Fourier values = 0
##### But double precision causes very small values resposible of
##### weird structures in the Fourier Phases spectrum (that must be = 0, too)

#serie <- rep(0,10000)
serie1 <- rep(5, 10000)

#ft_serie <- fft(serie)
ft_serie1 <- fft(serie1)

# phases <- atan2(Re(ft_serie), Im(ft_serie))
# amps <- (abs(ft_serie))^2
# plot(phases, cex = .1)
# plot(amps, log="y", cex = .1)

phases <- atan2(Im(ft_serie1), Re(ft_serie1))
#amps <- (abs(ft_serie1))^2
plot(phases, cex = .1, type = "p")
#plot(amps, log="y", cex = .1)
print(ft_serie1)
