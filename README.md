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

- Para que el primer paso de cada escenario no falle, se debe definir las ruta en el archivo features\support\paths.rb en el metodo path_to

```ruby
# /^the edit page for "(.*)"/ - Esta línea define una coincidencia
# para una expresión regular. Busca un texto que comience (^) con "the edit page for"
# seguido de cualquier cadena de caracteres, que representa el título de una película.
# El '(.*)' captura esa cadena de caracteres y la almacena para su uso posterior.

when /^the edit page for "(.*)"/
  # Utiliza el título capturado por la expresión regular. '$1' se refiere al
  # primer grupo de captura, es decir, el título de la película.
  movie = Movie.find_by!(title: $1)

  # Devuelve la ruta hacia la página de edición para la película encontrada.
  # 'edit_movie_path' es un método helper de Rails que genera la ruta de edición
  # para un objeto 'movie' específico.
  edit_movie_path(movie)

# Este es similar al anterior
when /^the details page for "(.*)"/
  movie = Movie.find_by!(title: $1)
  movie_path(movie)
```

- Entonces las pruebas van a estar definidas en:

```ruby
Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end
```

- y pasán:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/a6eb1b18-7d71-433f-9087-3405de87f1e6)

### Añadiendo a las vistas y controladores

- Añadiendo a la vista principal

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/ea045931-26f1-4659-8241-073a8c5e74ca)

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/0ee8640f-a444-4b94-a1ad-8324579884d8)

- Añadiendo a la vista edit

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/27ecedae-0e78-4a28-9f9b-6408c7f344fe)

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/1c92a752-0eea-450c-a0c0-52fe93cb56a2)

- Añadiendo a la vista show

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/7469be56-18a8-4767-9916-5a927a21fa79)

  ![image](https://github.com/Daniel349167/Examen-Sustitutorio-DesarrolloSoftware/assets/62466867/4fb63768-94f4-4b5c-99ac-66556710e2e5)

- modificando el controlador para permitir el campo director

```ruby
def movie_params
  params.require(:movie).permit(:title, :rating, :description, :release_date, :director)
end
```

- Si no modificamos el codigo anterior, los metodos create y update no manejaran el nuevo campo, por tanto no funcionaran correctamente.

- Agregando la definición de Pasos para la inexistente Then the director of "Alien" should be "Ridley Scott" 

```ruby
Then /^the director of "(.*?)" should be "(.*?)"$/ do |movie_title, director_name|
  movie = Movie.find_by!(title: movie_title)
  expect(movie.director).to eq director_name
end
```
Del codigo:
- Se utiliza una expresión regular para capturar el título de la película y el nombre del director.
- Se busca la película por su título usando Movie.find_by!.
- Se verifica que el campo director de la película coincida con el nombre del director esperado.

- con eso el escenario 1 pasa las pruebas:
![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/723239d7-5fef-4414-85d8-75a194cc17df)

- Para el escenario 2 agregamos la ruta para la nueva vista de peliculas con un mismo director:

```ruby
get 'movies/:id/similar', to: 'movies#similar', as: 'similar_movies'
```

- y en la vista show, el link:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/fce61450-657b-42e5-88cf-b06cc2816fea)

- también se debe agregar al path la ruta para "the Similar Movies page for 'Star Wars'"
```ruby
 when /the Similar Movies page for "(.*)"/
      movie = Movie.find_by!(title: $1)
      similar_movies_path(movie)
```

- en el controlador creamos la función para encontrar películas con el mismo director, tambien muestra un mensaje Flash sino encuentra el director de la película, para el escenario 3, la explicación del código esta en los comentarios:

```ruby
# Definición del método 'similar'
def similar
    # Busca una película en la base de datos basándose en el ID proporcionado en params
    @movie = Movie.find(params[:id])

    # Verifica si la película encontrada no tiene información del director
    if @movie.director.blank?
      # Si no tiene información del director, muestra un mensaje de advertencia
      flash[:warning] = "'#{@movie.title}' has no director info"
      # Redirige al usuario a la lista principal de películas
      redirect_to movies_path
    else
      # Si la película tiene un director, guarda esa información
      @director = @movie.director
      # Busca todas las películas que tienen el mismo director, excluyendo la película actual
      @movies = Movie.where(director: @director).where.not(id: @movie.id)
      # Renderiza la vista 'show_by_director' pasando las películas encontradas
      render 'show_by_director' 
    end
  end

```

- Pasaron todas las Pruebas!:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/88e9588f-d1d7-44ad-ac66-086081a74f3a)

- mensaje cuando no hay director para el escenario 3:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/141e6234-87da-4249-a328-da207cf1a86a)

### Cobertura de codigo
- Agregué 2 escenarios extras para poder tener un 100% de cobertura:
```ruby
Feature: Movie management
  Scenario: Creating a new movie
    Given I am on the Add new movie page
    When I fill in "Title" with "Inception"
    And I select "PG-13" from "Rating"
    And I select "2023" from "movie_release_date_1i"
    And I select "April" from "movie_release_date_2i"
    And I select "16" from "movie_release_date_3i"
    And I press "Save Changes"
    Then I should see "Inception was successfully created."
    And I should be on the All Movies page
    And I should see "Inception"

  Scenario: Deleting a movie
    Given the following movies exist:
        | title     | rating | release_date | director |
        | Inception | PG-13  | 2010-07-16   | Nolan    |
    And I am on the details page for "Inception"
    When I follow "Delete"
    Then show me the page
    Then I should see "Movie 'Inception' deleted."
    And I should be on the All Movies page
    And I should not see "Inception"
```

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/0f291f8d-ac10-4222-8ba5-cf07357991f1)


## Parte 2

### Pregunta 1: ¿Por qué la abstracción de un objeto de formulario pertenece a la capa de presentación y no a la capa de servicios (o inferior)?
- La colocación de la abstracción de un objeto de formulario en la capa de presentación en Rails se alinea con los principios de separación de responsabilidades, mantenibilidad y adherencia a las convenciones del framework, mientras que mantiene la lógica de negocios separada y enfocada en sus propias responsabilidades.

- Los formularios están diseñados para interactuar con el usuario, recogiendo sus entradas y mostrándoles datos. Esta interacción es típicamente manejada en la capa de presentación, que es responsable de la interfaz de usuario y la experiencia del usuario.

- Las capas inferiores, como la capa de servicios, deben ser lo más genéricas posible para permitir su reutilización. Los formularios son específicos de cómo una aplicación en particular quiere recoger o mostrar información, lo que no se alinea con el objetivo de reutilización de las capas inferiores.
 
### Pregunta 2: ¿Cuál es la diferencia entre autenticación y autorización?

- La autenticación es el proceso de verificar la identidad de un usuario o entidad. Se trata de confirmar que el usuario es quien dice ser.

- La autorización ocurre después de la autenticación y es el proceso de determinar qué recursos o acciones tiene permiso para acceder o realizar un usuario autenticado.

### Pregunta 3: middelware
- viendo los middelwares con rake middelware:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/a1462b74-cc07-4511-b75b-682c9272f74b)

- instalando la gema trace location:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/01c148ab-d2d4-4da5-aa1d-7feca0103ede)


- Probando en algunos metodos de mi controlador:
```ruby

  def index
    TraceLocation.trace do
       @movies = Movie.all
    end
  end


  def create
    TraceLocation.trace do
      @movie = Movie.create!(movie_params)
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    end
  end

```

se generararon logs:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/21a4cc2c-5133-4fe1-97bd-73ba18baebe2)


- Estos logs son particularmente útiles para entender la secuencia de llamadas a métodos y la interacción entre diferentes partes de mi aplicación.


### Pregunta 4: 

Para mostrar los N primeros archivos complejos en Ruby usando Flog y combinarlo con la calculadora de churn para mostrar los N archivos por churn * complejidad, se puede usar el siguiente one-liner( comandos de una linea ) en Unix:
```bash
find app/models -name "*.rb" | while read file; do
    churn=$(git log --format=oneline -- $file | wc -l)
    complexity=$(flog -s $file | awk '{print $1}')
    echo "$file $churn $complexity $(($churn * $complexity))"
done | sort -k 4 -nr | head -n [N]
```

- explicación:

```bash
# Busca todos los archivos Ruby en el directorio 'app/models'
find app/models -name "*.rb" | 

# Para cada archivo encontrado, realiza las siguientes operaciones
while read file; do
    
    # Calcula el churn (número de commits) para el archivo actual
    churn=$(git log --format=oneline -- $file | wc -l)
    
    # Calcula la complejidad del código fuente usando Flog para el archivo actual
    # y extrae solo el valor numérico de la complejidad
    complexity=$(flog -s $file | awk '{print $1}')
    
    # Imprime el nombre del archivo, su churn, su complejidad y el producto de churn * complejidad
    echo "$file $churn $complexity $(($churn * $complexity))"
    
# Final del bucle
done | 

# Ordena los resultados por churn * complejidad de mayor a menor
sort -k 4 -nr | 

# Muestra solo los primeros N archivos según el valor especificado en [N]
head -n [N]
```


## Parte 3
### Pregunta 1: 

- El código JavaScript necesario para interactuar con las cookies de una página web es:

```javascript
  // Función para leer una cookie por su nombre
function leerCookie(nombre) {
    let cookies = document.cookie.split(';');
    for(let i = 0; i < cookies.length; i++) {
        let cookie = cookies[i];
        let partes = cookie.split('=');
        if(partes[0].trim() === nombre) {
            return partes[1];
        }
    }
    return null;
}

// Función para crear una cookie
function crearCookie(nombre, valor, diasExpiracion) {
    let fecha = new Date();
    fecha.setTime(fecha.getTime() + (diasExpiracion * 24 * 60 * 60 * 1000));
    let expira = "expires=" + fecha.toUTCString();
    document.cookie = nombre + "=" + valor + ";" + expira + ";path=/";
}

// Función para eliminar una cookie
function eliminarCookie(nombre) {
    document.cookie = nombre + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}

// Ejemplo de uso
console.log("Documento.cookie original:", document.cookie);
crearCookie("testCookie", "valorTest", 7);
console.log("Documento.cookie después de crear una cookie:", document.cookie);
eliminarCookie("testCookie");
console.log("Documento.cookie después de eliminar la cookie:", document.cookie);
```

- Este código incluye funciones para leer, crear y eliminar cookies.

#### Explicación del código:
- leerCookie(nombre): Busca y retorna el valor de una cookie por su nombre. Si la cookie no existe, retorna null.

- crearCookie(nombre, valor, diasExpiracion): Crea una nueva cookie con el nombre y valor especificados. El parámetro diasExpiracion define cuántos días hasta que la cookie expire.

- eliminarCookie(nombre): Elimina una cookie por su nombre configurando su fecha de expiración a una fecha pasada.

- El código también incluye un ejemplo de uso donde se crea una cookie, se lee su valor, y luego se elimina.


### Pregunta 2: 

-  Código JavaScript necesario para validar el formulario según los pasos proporcionados:


```javascript
document.addEventListener("DOMContentLoaded", function() {

    // Seleccionar elementos del formulario y elementos con clase 'error'
    var form = document.forms['myform']; // Accede al formulario por su nombre
    var emailInput = form['email']; // Accede al campo de correo electrónico
    var passwordInput = form['password']; // Accede al campo de contraseña
    var userNameInput = form['userName']; // Accede al campo de nombre de usuario
    var errorElements = document.querySelectorAll('.error'); // Selecciona todos los elementos con clase 'error'

    // Agregar un detector de eventos para el envío del formulario
    form.addEventListener('submit', function(event) {
        event.preventDefault(); // Evita que el formulario se envíe de manera predeterminada

        // Ocultar todos los mensajes de error anteriores
        errorElements.forEach(function(element) {
            element.classList.add('hide'); // Añade la clase 'hide' para ocultar el elemento
        });

        var hasError = false; // Variable para rastrear si se encuentra algún error

        // Validar el email
        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; // Expresión regular para correos válidos
        if (!emailRegex.test(emailInput.value)) { // Prueba si el correo no cumple la expresión regular
            showError(emailInput, 'Por favor, ingrese un correo electrónico válido.'); // Muestra error
            hasError = true; // Indica que se ha encontrado un error
        }

        // Validar la contraseña
        var passwordRegex = /^[a-zA-Z0-9]{3,8}$/; // Expresión regular para contraseña (letras y números, 3-8 caracteres)
        if (!passwordRegex.test(passwordInput.value)) { // Prueba si la contraseña no cumple la expresión regular
            showError(passwordInput, 'La contraseña debe tener entre 3 y 8 caracteres alfanuméricos.'); // Muestra error
            hasError = true; // Indica que se ha encontrado un error
        }

        // Validar el nombre de usuario
        var userNameRegex = /^[a-zA-Z0-9]{3,12}$/; // Expresión regular para el nombre de usuario (letras y números, 3-12 caracteres)
        if (!userNameRegex.test(userNameInput.value)) { // Prueba si el nombre de usuario no cumple la expresión regular
            showError(userNameInput, 'El nombre de usuario debe tener entre 3 y 12 caracteres alfanuméricos.'); // Muestra error
            hasError = true; // Indica que se ha encontrado un error
        }

        // Crear un objeto con los datos del formulario
        var formData = {
            email: emailInput.value,
            password: passwordInput.value,
            userName: userNameInput.value
        };

        // Si no hay errores, procesar el formulario
        if (!hasError) {
            console.log('Formulario enviado:', formData); // Aquí se podría enviar el formulario o realizar otra acción
        }
    });

    // Función para mostrar los mensajes de error
    function showError(inputElement, message) {
        var errorElement = inputElement.nextElementSibling; // Selecciona el elemento hermano siguiente (elemento de error)
        errorElement.textContent = message; // Establece el mensaje de error
        errorElement.classList.remove('hide'); // Elimina la clase 'hide' para mostrar el mensaje
    }
});


```
- Este código agrega la lógica de validación al formulario HTML proporcionado.
- Funcionan las validaciones:

- valida el vacío:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/53483de3-3916-40c9-81df-235d06d2d1e0)

- valida el @  y la cantidad de caracteres:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/a50adeff-ca1c-41ee-ac01-aeb1ed76173e)


- No muestra error cuando los campos son válidos:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/9f801851-d88d-41c9-bde9-543774fa5387)



### Pregunta 3: 

- Añadimos un identificador al formulario de creación de películas nuevas:

```ruby
<%= form_tag movies_path, class: 'form', id: 'new_movie_form' do %>
  ...
<% end %>
```

- Creamos un archivo app\assets\javascripts\movie_form_validation.js

```javascript
// Espera a que el contenido del DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', () => {
  // Obtiene el formulario por su ID
  const form = document.getElementById('new_movie_form');

  // Añade un escuchador de evento para el envío (submit) del formulario
  form.addEventListener('submit', function(event) {
    // Inicializa una variable para seguir el estado de validez del formulario
    let isValid = true;
    // Crea un arreglo para almacenar los mensajes de error
    let messages = [];

    // Selecciona el campo del título en el formulario
    const title = form.querySelector('input[name="movie[title]"]');
    // Checa si el título está vacío (después de eliminar espacios en blanco)
    if (!title.value.trim()) {
      // Si el título está vacío, marca el formulario como inválido
      isValid = false;
      // Añade un mensaje de error al arreglo
      messages.push("El título no puede estar vacío.");
      // Añade una clase CSS al campo de título para indicar visualmente el error
      title.classList.add('invalid-input');
    } else {
      // Si el título no está vacío, remueve la indicación visual de error
      title.classList.remove('invalid-input');
    }

    // Checa si el formulario no es válido
    if (!isValid) {
      // Previene el envío normal del formulario
      event.preventDefault();
      // Muestra los mensajes de error en una alerta
      alert(messages.join('\n'));

      // Agregar mensajes de ayuda al usuario (puedes personalizar estos mensajes)
      const helpText = document.createElement('div');
      helpText.innerText = "Por favor, complete los campos resaltados en rojo.";
      helpText.style.color = 'red';
      form.appendChild(helpText);

      // Resaltar los campos del formulario con errores
      form.querySelectorAll('.invalid-input').forEach(input => {
        input.style.borderColor = 'red';
      });
    }
  });
});

```
- Funciona la validación:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/cb0cfdc2-5915-47f4-b6c3-f8243efa9008)
## Parte 4:
### Pregunta: ¿Dónde podemos conseguir una instancia de Movie real para utilizarla en dicha prueba?

Se pueden crear instancias dentro de la base de datos de prueba utilizando fixtures o factories. Los fixtures se definen como en el archivo YAML mostrado, y se cargan en la base de datos de prueba antes de ejecutar las pruebas. Las factories, por otro lado, son una alternativa proporcionada por gemas como FactoryBot, que permite definir y utilizar un conjunto de atributos predeterminados para crear objetos para las pruebas.

### Pregunta: ¿Qué hacen los siguientes códigos entregados y donde se ubican? . ¿Por qué hay que tener cuidado en su uso?.

```ruby
fake_movie = double('Movie')
allow(fake_movie).to receive(:title).and_return('Casablanca')
allow(fake_movie).to receive(:rating).and_return('PG')
expect(fake_movie.name_with_rating).to eq 'Casablanca (PG)'
```

El código proporcionado muestra cómo configurar un "doble" en RSpec para simular un objeto Movie. Se utiliza para probar el método name_with_rating sin necesidad de crear un objeto de la base de datos. Se define qué respuestas debe dar el doble cuando se llaman los métodos :title y :rating. Estos se ubican en un archivo de especificaciones de prueba, en spec/models/movie_spec.rb
```ruby
# spec/fixtures/movies.yml
milk_movie:
  id: 1
  title: Milk
  rating: R
  release_date: 2008-11-26

documentary_movie:
  id: 2
  title: Food, Inc.
  rating: R
  release_date: 2008-09-07
```

 Este bloque de código muestra cómo se pueden utilizar los fixtures en pruebas con RSpec para proporcionar datos de prueba.

### Analiza los pros y los contras del uso de factories o fixtures en las pruebas

Los pros de usar fixtures o factories son que permiten a los desarrolladores trabajar con datos de prueba consistentes y aislados que simulan los datos reales sin afectar la base de datos de producción. Por otro lado, los contras incluyen que los fixtures pueden volverse difíciles de mantener a medida que crece la base de código y que el uso excesivo puede hacer que las pruebas sean lentas. Además, puede haber un desajuste entre los datos de prueba y los datos reales, lo que podría llevar a fallos en las pruebas que no reflejan problemas en el entorno de producción.

## Parte 4: Pruebas y Rspec
- Creo la clase lib\tennis_scorer.rb
```ruby
class TennisScorer
    def initialize
      # Inicializa el marcador con ambos jugadores en 0.
      @score = { sacador: 0, receptor: 0 }
    end
  
    def punto_para(jugador)
      # Incrementa el puntaje del jugador especificado.
      @score[jugador] += 1
    end
  
    def marcador
      case
      when @score[:sacador] == 0 && @score[:receptor] == 0
        "0-0"  # Cuando ambos jugadores tienen 0 puntos.
      when @score[:sacador] == 1 && @score[:receptor] == 0
        "15-0"  # Cuando el sacador tiene 1 punto y el receptor 0.
      when @score[:sacador] == 0 && @score[:receptor] == 1
        "0-15"  # Cuando el sacador tiene 0 puntos y el receptor 1.
      when @score[:sacador] == 1 && @score[:receptor] == 1
        "15-15"  # Cuando ambos tienen 1 punto.
      when @score[:sacador] == 3 && @score[:receptor] == 0
        "40-0"  # Cuando el sacador tiene 3 puntos y el receptor 0.
      when @score[:sacador] == 4 && @score[:receptor] == 0
        "W-L"  # Cuando el sacador gana.
      when @score[:sacador] == 0 && @score[:receptor] == 4
        "L-W"  # Cuando el receptor gana.
      when @score[:sacador] == 3 && @score[:receptor] == 3
        "Deuce"  # Cuando están empatados a 3 puntos.
      when @score[:sacador] == 4 && @score[:receptor] == 3
        "SACADOR con ventaja"  # Cuando el sacador tiene ventaja.
      when @score[:sacador] == 3 && @score[:receptor] == 4
        "RECEPTOR con ventaja"  # Cuando el receptor tiene ventaja.
      end
    end
  end
  ```

- Creo el archivo de pruebas spec\tennis_scorer_spec.rb

```ruby
RSpec.describe "TennisScorer" do
    describe "puntuación básica" do
      it "empieza con un marcador de 0-0" do
        # Crea una instancia de TennisScorer.
        scorer = TennisScorer.new
        # Verifica que el marcador inicial sea "0-0".
        expect(scorer.marcador).to eq("0-0")
      end
  
      it "hace que el marcador sea 15-0 si el sacador gana un punto" do
        # Crea una instancia de TennisScorer.
        scorer = TennisScorer.new
        # Aumenta el puntaje del sacador en 1 punto.
        scorer.punto_para(:sacador)
        # Verifica que el marcador sea "15-0".
        expect(scorer.marcador).to eq("15-0")
      end
  
      it "hace que el marcador sea 0-15 si el receptor gana un punto" do
        # Crea una instancia de TennisScorer.
        scorer = TennisScorer.new
        # Aumenta el puntaje del receptor en 1 punto.
        scorer.punto_para(:receptor)
        # Verifica que el marcador sea "0-15".
        expect(scorer.marcador).to eq("0-15")
      end
  
      it "hace que el marcador sea 15-15 después de que ambos ganen un punto" do
        # Crea una instancia de TennisScorer.
        scorer = TennisScorer.new
        # Aumenta el puntaje del sacador en 1 punto.
        scorer.punto_para(:sacador)
        # Aumenta el puntaje del receptor en 1 punto.
        scorer.punto_para(:receptor)
        # Verifica que el marcador sea "15-15".
        expect(scorer.marcador).to eq("15-15")
      end
    end
  end
```

- Pasa las pruebas:

![image](https://github.com/Daniel349167/Examen-Sustitutorio-CC3S2/assets/62466867/9bd93164-36bf-4608-9344-540524583e4a)


