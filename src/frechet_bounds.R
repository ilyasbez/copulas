# Grid
u <- seq(0, 1, length.out = 100)
v <- seq(0, 1, length.out = 100)

# Copulas upper, independence, lower
C_U <- outer(u, v, function(u, v) pmin(u, v))
C_I <- outer(u, v, function(u, v) u * v)
C_L <- outer(u, v, function(u, v) pmax(u + v - 1, 0))

# layout: 2*3 
par(mfrow = c(2, 3), mar = c(2, 2, 3, 1))

# Farben
col_upper <- adjustcolor("skyblue", alpha.f = 0.6)
col_ind   <- adjustcolor("palegreen3", alpha.f = 0.6)
col_lower <- adjustcolor("tomato", alpha.f = 0.6)

# 3d plots

persp(u, v, C_L,
      theta = 35, phi = 25,
      col = col_lower,
      border = "grey50",
      shade = 0.3,
      ltheta = 120,
      ticktype = "detailed",
      main = "Fréchet Lower Bound Copula",
      cex.main = 1.6)

persp(u, v, C_I,
      theta = 35, phi = 25,
      col = col_ind,
      border = "grey50",
      shade = 0.3,
      ltheta = 120,
      ticktype = "detailed",
      main = "Unabhängigkeitscopula",
      cex.main = 1.6)

persp(u, v, C_U,
      theta = 35, phi = 25,
      col = col_upper,
      border = "grey50",
      shade = 0.3,
      ltheta = 120,
      ticktype = "detailed",
      main = "Fréchet Upper Bound Copula",
      cex.main = 1.6)

# konturplots

contour(u, v, C_L,
        levels = seq(0, 1, by = 0.2),
        col = "red3",
        lwd = 2,
        xlab = "u", ylab = "v",
        cex.main = 1.4)

contour(u, v, C_I,
        levels = seq(0, 1, by = 0.2),
        col = "darkgreen",
        lwd = 2,
        xlab = "u", ylab = "v",
        cex.main = 1.4)

contour(u, v, C_U,
        levels = seq(0, 1, by = 0.2),
        col = "skyblue4",
        lwd = 2,
        xlab = "u", ylab = "v",
        cex.main = 1.4)
