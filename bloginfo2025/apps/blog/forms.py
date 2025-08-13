from django.contrib.auth.forms import UserCreationForm
from django.forms import ClearableFileInput, ModelForm, TextInput, Textarea
from .models import Articulo, Usuario
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