from django.contrib.auth.forms import UserCreationForm
from django.forms import ClearableFileInput, EmailInput, ModelForm, TextInput, Textarea
from .models import Articulo, Comentario, Usuario, Mensaje_Contacto
from django.db import transaction


class RegistroUsuarioForm(UserCreationForm):
    class Meta:
        model = Usuario
        fields = [ 'nombre', 'apellido', 'email', 'fecha_nacimiento', 'imagen','username', 'password1', 'password2']

    @transaction.atomic
    def save(self):
        user = super().save(commit=False)
        user.is_superuser = False
        user.is_staff = False
        user.save()
        return user

class ArticuloForm(ModelForm):
    class Meta:
        model = Articulo
        fields = ['titulo', 'contenido', 'imagen_portada']
        widgets = {
            'titulo': TextInput(attrs={'class': 'form-control'}),
            'contenido': Textarea(attrs={'class': 'form-control', 'rows': 6}),
            'imagen_portada': ClearableFileInput(attrs={'class': 'form-control'}),
        }

class ComentarioForm(ModelForm):
    class Meta:
        model = Comentario
        fields = ['contenido']
        widgets = {
            'contenido': Textarea(attrs={
                'class': 'form-control',
                'rows': 3,
                'placeholder': 'Escribí tu comentario...'
            }),
        }

class MensajeContactoForm(ModelForm):
    class Meta:
        fields = ['nombre', 'email', 'mensaje']
        model = Mensaje_Contacto
        widgets = {
            'nombre': TextInput(attrs={'class': 'form-control', 'placeholder': 'Tu nombre'}),
            'email': EmailInput(attrs={'class': 'form-control', 'placeholder': 'Tu email'}),
            'mensaje': Textarea(attrs={'class': 'form-control', 'rows': 5, 'placeholder': 'Escribí tu mensaje'}),
        }
