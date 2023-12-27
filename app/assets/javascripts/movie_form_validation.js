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
  