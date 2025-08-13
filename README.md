# blog-info2025
Trabajo final "Blog de Videojuegos"
INTEGRANTES: 
    Paola, Zarza
    Onosky, Camila
    Gutierrez, Yanina   

# PASOS
 - Crear entorno virtual `py -m venv .venv`
 - Activar `.\.venv\Scripts\activate` 
 - Instalar django `pip install django`
 - Instalar mysql (permite conectar a bases de datos mysql) `pip install mysqlclient`
 - Instalar dotenv (lee variables de entorno desde un archivo) `pip install python-dotenv`
 - Generar requirements.txt (contiene dependencias del proyecto) `pip freeze > requirements.txt`
 - Agrego archivos creados/modificados al area de stage `git add -A`
 - Verifico los archivos en stage `git status`
 - Commit de archivos `git commit -m "instalo dependencias"`
 - Inicializo proyecto `django-admin startproject bloginfo2025 `
 - Creacion de carpeta para apps `mkdir apps`
 - Inicializo app BLOG `django-admin startapp blog`
 - Inicializo el servidor desde "bloginfo2025" `py manage.py runserver`
 - Creacion de BD en worbench nombrada **bloginfo2025**
 - Creacion de archivo .env, configuracion de variables y base de datos
 - Aplico migraciones `python manage.py migrate` (creacion de tablas en  la db propias de django)
- Verificacion de creacion de tablas.
- Definicion de modelos (clases o entidades que representan tablas en la db).
- Configuracion carpeta **media** y path `/media/` (almacena imagenes).
- Instalacion de pillow (libreria para manejo de imagenes) `python -m pip install Pillow`
- Generar migraciones `manage.py makemigrations ` (compara los modelos actuales con los de db, genera el archivo migraciones que contiene los cambios a realizar en la db)
- Aplico cambios a la db `manage.py migrate`
- Registro admin para articulos y comentarios
- Se crea super usuario `python manage.py createsuperuser`
- Creacion de plantilla/telmplate **index.html**
- Configruacion directorio de templates
- Creacion de la vista de home (index.html)
- Configuracion de la URL de home 
- Configuracion de visualizacion de imagenes en el navegador
- Generacion de Script SQL(codigo) a traves de copilot para la insercion de articulos en db.
- Ejecutar script SQL en la bd
- Creacion del template **articulo.html** + vista en apps.blog.views.py + configuracion de URL
- Modifico template de **index.html** para agregar boton "Leer mas".
- Creacion de modelo para usuarios
- Creacion de nuevo archivo **forms.py**
- Nuevo formulario para registrar usuarios en la db **RegistrarUsuario**
- Nueva carpeta "Usuarios", se utilizara para almacenar templates de usuarios **registrar.html** + vistas + URLS
- Agrego pagina de registro exitoso template + vista + URL **registro-exitoso**
- Se crea barra de navegacion para las URLs
- Creacion de template para cerrar sesion + vista + URL **cerrar-sesion**
- Se agrega creacion de articulos
