

## Saluditos

Código e instrucciones para tener imágenes de saludo al inciar RStudio.

Opciones:
- Bendiciones (piolín)
- Gatitos via [Cats As a Service](https://cataas.com/)

### Instrucciones

Editar el `.RProfile` con:

```r
usethis::edit_r_profile()
```

Poner esto dentro del `.RProfile`:
```r
# copiar esto y ponerlo en el .RProfile
setHook("rstudio.sessionInit", function(newSession) {
  
  ###
  # aquí
  ###
  
}, action = "append")
```

Luego poner dentro de lo anterior (donde dice _aquí_) el código del script `saludito.R`.

En la parte de `opciones`, puedes elegir entre `gatos` o `piolín`.

Puedes ejecutar el script para previsualizar su resultado, y ajustar las opciones si deseas.

El contenido del `.RProfile` quedaría así (puedes copiarlo y pegarlo todo para ahorrarte tiempo):

```r
setHook("rstudio.sessionInit", function(newSession) {
  if (newSession) {
    
    library(shiny)
    
    # opciones
    saludito <- "gatos"
    tamaño <- "60%"
    fondo <- "#181818"
    
    # escoger imagen
    if (saludito %in% c("gato", "gatos")) {
      imagen <- "https://cataas.com/cat"
      
    } else if (saludito %in% c("piolín", "piolin", "piolines")) {
      piolines <- paste0("https://raw.githubusercontent.com/bastianolea/piolines/master/img/piolin_", 1:12, ".jpg")
      imagen <- sample(piolines, 1)
    }
    
    # crear página en html
    imagen <- tags$body(
      style = paste("background-color:", fondo, "; display: flex; justify-content: center;"),
      img(src = imagen, style = paste("max-height:", tamaño, "; margin: auto;"))
    )
    
    # crear archivo temporal
    temporal <- tempfile(fileext = ".html")
    
    # escribir la página al archivo temporal
    writeLines(text = as.character(imagen), temporal)
    
    # ver en Rstudio
    rstudioapi::viewer(temporal)
    
    
  }
}, action = "append")
```

Ahora cuando abras RStudio aparecerá una imagen al azar!


