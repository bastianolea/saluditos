library(magick)

gatito <- "https://cataas.com/cat"

figura <- gatito |> 
  image_read() |> 
  image_resize(300)

tamaño <- grDevices::dev.size("px")/2

fondo <- image_blank(width = tamaño[1], 
                     height = tamaño[2], 
                     color = "#181818")

salida <- image_composite(fondo, 
                          figura, 
                          gravity = "center")

print(salida, info = FALSE)
