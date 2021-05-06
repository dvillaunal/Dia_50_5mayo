__Protocolo:__

+ Daniel Felipe Villa Rengifo

+ Lenguaje: R

+ Tema: Manejo de arreglos en R

+ Fuentes:
  
  1. [geeksforgeeks](https://www.geeksforgeeks.org/array-operations-in-r-programming/)
  2. [Data Flair](https://data-flair.training/blogs/r-array/)
  
# Arrays

En R, los arrays son los objetos de datos que nos permiten almacenar datos en más de dos dimensiones. En R, un array se crea con la ayuda de la función `array()`. Esta función `array()` toma un vector como entrada y para crear un array utiliza los valores de los vectores en el parámetro `dim`.

Por ejemplo, si creamos un array de dimensión `(2, 3, 4)` entonces se __crearán 4 matrices rectangulares de 2 filas y 3 columnas__

![](https://techvidvan.com/tutorials/wp-content/uploads/sites/2/2020/01/R-data-strucutres.jpg)


# Sintaxis:

La sintaxis de los arrays en R es la que se describe a continuación:


```{r Sintaxis, eval=FALSE, include=FALSE}
"array_name <- array(data, dim= (row_size,
                                column_size,
                                matrices,
                                dim_names))"
```


+ __data:__
  
  Los datos son el primer argumento de la función array(). Es un vector de entrada que se da al array.
  
+  __matrices:__

   En R, un array consiste en matrices multidimensionales.
   
+ __row_size:__

  Este parámetro define el número de elementos de fila que puede almacenar un array.
  
+ __column_size:__

  Este parámetro define el número de elementos de las columnas que puede almacenar un array.
  
+ __dim_names:__

  Este parámetro se utiliza para cambiar los nombres por defecto de las filas y columnas.
  
# ¿Como Crear Arrays?

En R, la creación de arrays es bastante sencilla. Podemos crear fácilmente un array utilizando la función vector (`c()`) y `array()`. 

En un array, los datos se almacenan en forma de matriz.
Sólo hay dos pasos para crear una matriz que son los siguientes:
  
  1. crearemos dos vectores de diferentes longitudes.
  
  2. Una vez creados nuestros vectores, tomamos estos vectores como entradas a la matriz.

```{r Ejemplo 1}
# Creando dos vectores de diferentes longitudes:
message("\n# Creando dos vectores de diferentes longitudes:")

u <- c(1,3,5)

v <- -5:0

## Tomando estos vectores como entrada para el array:
message("\n## Tomando estos vectores como entrada para el array:")

a <- array(c(u,v), dim = c(3,3,2))

cat("\n> a <- array(c(u,v), dim = c(3,3,2))", "\n \nOUTPUT:\n")
print(a)
```

# Nombrar las filas y columnas

podemos dar los nombres a las filas, columnas y matrices del array. Esto se hace con la ayuda del parámetro `dim_name` de la función `array()`.

No es necesario dar el nombre a las filas y columnas. Sólo se utiliza para diferenciar la fila y la columna para una mejor comprensión.

```{r}
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

```

# Acceso a los elementos del array

Se accede a los elementos con la ayuda del índice. Simplemente, podemos acceder a los elementos del array con la ayuda del método de indexación.

```{r}
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
```

# Diferentes operaciones con Arrays:

El array está formado por matrices en múltiples dimensiones, de modo que las operaciones sobre los elementos de un array se realizan accediendo a los elementos de las matrices.

## Suma y resta

La matriz multidimensional tiene que ser convertida a la matriz unidimensional, para poder ser sumada o restada.

```{r}
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
```

## Cálculos sobre elementos del Array

Una función llamada `apply()`, ayuda a aplicar cualquier operación a través de los elementos del array.

### Sintaxis

```{r eval=FALSE, include=FALSE}
"apply(x, margin, fun)"
```

Aquí `x` es un _array_, el margen aquí se refiere a filas o columnas.
  
  1. MARGIN=1 para la operación por filas
  
  2. MARGIN=2 para la operación por columnas
  
  3. MARGIN=c(1,2) para ambos.
  
`fun` es la función aplicada a través de los elementos de la matriz del marco de datos. Pueden ser las funciones estándar que forman parte de R o funciones personalizadas (definidas por el usuario)

```{r Ejemplo apply 1}
# Intentemos la suma con apply():
message("\n# Intentemos la suma con apply():")

## array anterior:
cat("\n## array anterior:")
print(fibo)

## Sumamos el array:
print("## Sumamos el array:")

cat("\n> apply(fibo,c(1,2), sum)", "\n \nOUTPUT:\n")
print(apply(fibo,c(1,2), sum))
```

```{r Ejemplo apply 2}
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
```