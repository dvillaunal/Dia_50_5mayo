"__Protocolo:__

+ Daniel Felipe Villa Rengifo

+ Lenguaje: R

+ Tema: Manejo de arreglos en R

+ Fuentes:
  
  1. [geeksforgeeks](https://www.geeksforgeeks.org/array-operations-in-r-programming/)
  2. [Data Flair](https://data-flair.training/blogs/r-array/)"

## ----Sintaxis, eval=FALSE, include=FALSE-----------------------------------------------------
## "array_name <- array(data, dim= (row_size,
##                                 column_size,
##                                 matrices,
##                                 dim_names))"


## ----Ejemplo 1-------------------------------------------------------------------------------
# Creando dos vectores de diferentes longitudes:
message("\n# Creando dos vectores de diferentes longitudes:")

u <- c(1,3,5)

v <- -5:0

## Tomando estos vectores como entrada para el array:
message("\n## Tomando estos vectores como entrada para el array:")

a <- array(c(u,v), dim = c(3,3,2))

cat("\n> a <- array(c(u,v), dim = c(3,3,2))", "\n \nOUTPUT:\n")
print(a)


## --------------------------------------------------------------------------------------------
# Tomando el Ejemplo anterior:
cat("\n# Tomando el Ejemplo anterior:\n")

a <- array(c(u,v), dim = c(3,3,2))

cat("\n> a <- array(c(u,v), dim = c(3,3,2))", "\n \nOUTPUT:\n")
print(a)

## Nombrando filas, columnas y matrices:
cat("\n## Nombrando filas, columnas y matrices:\n")

col_names <- c("Col1","Col2","Col3")  
row_names <- c("fila1","fila2","fila3")  
matriz_names <- c("Matriz1","Matriz2") 

cat("\ncol_names <- c(\"Col1\",\"Col2\",\"Col3\")", "\nrow_names <- c(\"fila1\",\"fila2\",\"fila3\")", "\nmatrix_names <- c(\"Matriz1\",\"Matriz2\")\n")

# Tomando los vectores para ponerlos en el array:
message("\n# Tomando los vectores para ponerlos en el array:")

anom <- array(c(u,v), dim = c(3,3,2), dimnames = list(row_names, col_names, matriz_names))

cat("\n> anom <- array(c(u,v), dim = c(3,3,2), dimnames = list(row_names, col_names, matriz_names))", "\n \nOUTPUT:\n")
print(anom)



## --------------------------------------------------------------------------------------------
"anom[Fila, Columna, Matriz]"
cat("\nanom[Fila, Columna, Matriz]")

# Llamar una fila:
print("# Llamar una fila:")
print(anom[1,,])

# Llamar una columna:
print("# Llamar una columna:")
print(anom[,1,])

# Llamar una matriz:
print("# Llamar una columna:")
print(anom[,,1])


## --------------------------------------------------------------------------------------------
# Creamos un nuevo array:
message("\n# Creamos un nuevo array:")

v1 <- c(0,1,1,2)
v2 <- c(3,5,8,13,21,34,55,89,144,233,377,610)

fibo <- array(c(v1, v2), dim = c(4,4,3))
print(fibo)

# Sumemos y Restemos la matriz 1 y la 3:
message("\n# Sumemos la matriz 1 y la 3:")

print("Matriz 1")
cat("\nfibo[,,1]", "\n \nOUTPUT:\n")
print(fibo[,,1])

print("Matriz 3")
cat("\nfibo[,,3]", "\n \nOUTPUT:\n")
print(fibo[,,3])

# Suma:
message("\n# Suma:")
cat("\nfibo[,,1] + fibo[,,3]", "\n \nOUTPUT:\n")
print(fibo[,,1] + fibo[,,3])

# Resta:
message("\n# Resta:")
cat("\nfibo[,,1] - fibo[,,3]", "\n \nOUTPUT:\n")
print(fibo[,,1] - fibo[,,3])


## ----eval=FALSE, include=FALSE---------------------------------------------------------------
## "apply(x, margin, fun)"


## ----Ejemplo apply 1-------------------------------------------------------------------------
# Intentemos la suma con apply():
message("\n# Intentemos la suma con apply():")

## array anterior:
cat("\n## array anterior:")
print(fibo)

## Sumamos el array:
print("## Sumamos el array:")

cat("\n> apply(fibo,c(1,2), sum)", "\n \nOUTPUT:\n")
print(apply(fibo,c(1,2), sum))


## ----Ejemplo apply 2-------------------------------------------------------------------------
#Definimos una función:
message("\n#Definimos una función:")

cuadrado <- function(x){
  "Calcula el Cuadrado de la matriz"
  return(x^2)
}

## Ahora se la aplicamos a nuestro array:
cat("\n## Ahora se la aplicamos a nuestro array:\n")

print(fibo)

## Sobre columnas y filas con numeros pseudo aletorios:
cat("\n## Sobre columnas y filas con numeros pseudo aletorios:\n")

for (t in 1:10) {
  s <- sample(1:3, size = 1, replace = T)
  if (s == 3){
    cua <- apply(fibo, c(1,2), cuadrado)
    message("\nSobre Ambos\n")
    print(cua)
  }else{
    if(s==1){
      cua <- apply(fibo, s, cuadrado)
      message("\nSobre Filas\n")
      print(cua)
    }else{
      cua <- apply(fibo, 2, cuadrado)
      message("\nSobre Columnas\n")
      print(cua)
    }
  }
}