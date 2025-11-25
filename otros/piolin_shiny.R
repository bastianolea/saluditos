
library(shiny)


piolín <- "https://raw.githubusercontent.com/bastianolea/piolines/master/imágenes/piolin_1.jpg"

imagen <- div(style = "width: 60%; margin: auto; background-color: black;",
    img(src = piolín)
)

temporal <- tempfile(fileext = ".html")

writeLines(text = as.character(imagen), 
           temporal)


rstudioapi::viewer(temporal)
