---

# TecForum

TecForum es una aplicación web para la gestión de informacion relacionada con la catedra estudiantil. Está construida usando Django, MySQL y Js para la gestión de datos.

## Características

- Registro e inicio de sesión de usuarios.

## Requisitos

- Python 3.11
- Django 5.0.7
- MySQL
- XAMPP

## Instalación

1. **Clonar el repositorio:**

    ```bash
    git clone https://github.com/tu-usuario/tecforum.git
    cd tecforum
    ```

2. **Crear y activar un entorno virtual:**

    ```bash
    python -m venv venv
    source venv/bin/activate  # En Windows usa `venv\Scripts\activate`
    ```

3. **Instalar las dependencias:**

    ```bash
    pip install -r requirements.txt
    ```

4. **Configurar la base de datos:**

    - Asegúrate de tener MySQL corriendo en XAMPP en el puerto 3307.
    - Crear una base de datos llamada `tecforum`.

5. **Migrar la base de datos:**

    ```bash
    python manage.py migrate
    ```

8. **Ejecutar la aplicación:**

    ```bash
    python manage.py runserver
    ```

## Uso

- Accede a `http://127.0.0.1:8000/` en tu navegador para ver la aplicación en acción.
- Usa el panel de administración en `http://127.0.0.1:8000/admin/` para gestionar usuarios y contenido.

