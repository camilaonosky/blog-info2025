from django.db import models

# Create your models here.
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.urls import reverse

    
class Usuario(AbstractUser):
    nombre = models.CharField(max_length=45)
    apellido = models.CharField(max_length=45)
    email = models.EmailField()
    fecha_nacimiento = models.DateField('Fecha_nacimiento', default='2000-1-1')
    es_colaborador = models.BooleanField('Es_colaborador', default=False)
    imagen = models.ImageField(null=True, blank=True, upload_to='usuarios', default='usuarios/usuario_default.png')

    def __str__(self):
        return f'{self.nombre} {self.apellido}'
    
    def get_absolute_url(self):
        return reverse('index')

class Articulo(models.Model):
    titulo = models.CharField(max_length=200)
    contenido = models.TextField()
    autor = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)
    imagen_portada = models.ImageField(upload_to='portadas/', blank=True, null=True)

    def __str__(self):
        return self.titulo

class Comentario(models.Model):
    articulo = models.ForeignKey(Articulo, related_name='comentarios', on_delete=models.CASCADE)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    contenido = models.TextField()
    autor = models.ForeignKey(Usuario, on_delete=models.CASCADE)

    def __str__(self):
        return f'Comentario de {self.autor} en {self.articulo}'
    
class Mensaje_Contacto(models.Model):
    nombre = models.CharField(max_length=100)
    email = models.EmailField()
    mensaje = models.CharField(max_length=400)
    fecha_envio = models.DateTimeField(auto_now_add=True)