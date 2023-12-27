# Examen-Sustitutorio


## Parte 1
- Instalando gemas
![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/d4886a8f-c536-4c99-8022-d85573492629)

- Creando el esquema de base de datos inicial

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/2b22f9b5-31c3-4c95-92ba-814a861ad21f)

- verificando que Rspec y cucumber funcionen correctamente

![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/6da9838a-eaed-46ea-bca8-b15f3e0ad645)

![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/ab95a5d1-5b50-4800-a3a9-d25a127d38b2)


- El paso background debería fallar. El primer fallo de prueba en un escenario debería ser: Undefined step: the director of "Alien" should be "Ridley Scott " ¿Qué tendrás que hacer para solucionar ese error específico?

Falta definir un paso en Cucumber que verifique si el director de una película específica es el esperado

- Añadiendo la migración para la columna director a la tabla movie

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/2924a437-db4d-45eb-acb9-b266a44360eb)

- Actualizando la base de datos de prueba:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/ce0dd129-5495-452f-a1fa-c6bc6824eaf1)


No es necesario modificar el archivo del modelo Movie para que reconozca el nuevo campo, ya que Rails automáticamente mapea los campos de la base de datos a atributos del modelo.

- Los pasos que se espera que se aprueben es el background, ya que esto puebla la base de datos con para la nueva columna director.

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/e5efe395-c064-47da-8832-c4131d5caeec)

-  

- Añadiendo a la vista principal

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/ea045931-26f1-4659-8241-073a8c5e74ca)

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/0ee8640f-a444-4b94-a1ad-8324579884d8)

- Añadiendo a la vista edit

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/27ecedae-0e78-4a28-9f9b-6408c7f344fe)

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/1c92a752-0eea-450c-a0c0-52fe93cb56a2)

- Añadiendo a la vista show

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/7469be56-18a8-4767-9916-5a927a21fa79)

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/4fb63768-94f4-4b5c-99ac-66556710e2e5)



## Parte 2

- ¿Cuál es la diferencia entre autenticación y autorización?

La autenticación es para verificar que un usuario sea el que esta autorizado para ingresar a una aplicación web y la autorización son los permisos que se le dan a un usuario ya autenticado para acceder a algún recurso.
