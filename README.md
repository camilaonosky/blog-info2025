# blog-info2025
Trabajo final "Blog de Videojuegos"



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
- Verificacion de creacion de tablas