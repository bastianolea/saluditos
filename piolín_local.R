library(magick)

piolines <- list.files("imágenes", full.names = TRUE)

piolín <- sample(piolines, 1)



magick::image_read(piolín)


