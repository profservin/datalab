##Comunicación y esfuerzos comerciales
##Maestro Alejandro Servin V.1.0
##Ejercicios 1.1 a 1.11

#Ejercicio 1.1 - Realiza las siguientes cuatro operaciones matemáticas

#5 - 3  
#5/ 3  
#5 * (10 - 3)  
#sqrt(4)

#Ejercicio 1.2 - Realiza una operación matemática desde la consola. Así se evita la saturación en el script.

#Ejercicio 1.3. - Instala y corre las siguientes librerías junto con el libro de texto del curso
install.packages("githubinstall")
library(githubinstall)

install.packages("devtools")
library(devtools)
devtools::install_github("kosukeimai/qss-package",  build_vignettes = TRUE)

library("qss")

install.packages("tidyverse")
library(tidyverse)

#Ejercicio 1.4. - Guarda el resultado de la suma como un objeto llamado "resultado"
resultado <- 5 + 3 
print(resultado)

#Ejercicio 1.5. - Guarda de nuevo el resultado de la operación, usando también el nombre "resultado"
resultado <- 5 - 3 
print(resultado)

#Ejercicio 1.6. - Corre el siguiente comando para validar que el objeto "resultado" forma parta del entorno (Environment)
ls()

#Ejercicio 1.7. - Crea un objeto utilizando tu nombre de pila (en minísculas) y tu profesión. Después tu nombre_apellido con tu matrícula
alex <- "empresario y profesor"
alex_servin <- "990991"

#Ejercicio 1.8 - Revisa en dónde estás archivando tus trabajos
getwd()

#Ejercicio 1.9 - Carga los datos estadísticos de la población mundial United Nations Population
data("UNpop")

#Ejercicio 1.10 - Visualiza la base de datos de la población mundial de acuerco con la ONU
View(UNpop)

#Ejercicio 1.11 - Recorta los tres primeros años de la base de datos UNpop
UNpop %>% slice(1:3) %>% select(year)
