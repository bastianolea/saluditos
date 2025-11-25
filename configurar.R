usethis::edit_r_profile(scope = "project")

# copiar esto y ponerlo en el .rprofile
setHook("rstudio.sessionInit", function(newSession) {
  
  ###
  ### aquí
  ###
  
}, action = "append")