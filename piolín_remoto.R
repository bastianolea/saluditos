
library(magick)

piolines <- c("https://cdn.pensador.com/es/imagenes/buenos-dias-con.jpg",
              "https://cdn.pensador.com/es/imagenes/que-tu-cafe-este.jpg",
              "https://cdn.pensador.com/es/imagenes/hoy-es-un-buen-dia.jpg"
) 

piolín <- sample(piolines, 1)

piolín |> 
  magick::image_read() |> 
  magick::image_resize(300)


piolín |> 
  magick::image_read() |> 
  magick::image_resize(300) |> 
  image_composite(gravity = "center")



figura <- piolín |> 
  image_read() |> 
  image_resize(300)

fondo <- image_blank(width = 500, 
                     height = 500, 
                     color = "#181818")

image_composite(fondo, figura, 
                gravity = "center")


