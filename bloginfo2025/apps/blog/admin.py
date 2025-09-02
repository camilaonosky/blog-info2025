from django.contrib import admin
from .models import Articulo, Comentario, Categoria, Mensaje_Contacto

# Register your models here.

admin.site.register(Articulo)
admin.site.register(Comentario)
admin.site.register(Categoria)
admin.site.register(Mensaje_Contacto)