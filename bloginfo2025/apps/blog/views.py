from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import CreateView
from .forms import RegistroUsuarioForm
from .models import Articulo, Usuario

# Create your views here.

def index(request):
    articulos = Articulo.objects.all()
    return render(request, 'blog/index.html', {'articulos': articulos}) 

# Vista para la pagina de un articulo del blog
def articulo(request, articulo_id):
    articulo = Articulo.objects.get(id=articulo_id)
    return render(request, 'blog/articulo.html', {'articulo': articulo})

class RegistrarUsuario(CreateView):
    model = Usuario
    form_class = RegistroUsuarioForm
    template_name = 'usuarios/registrar.html'
    success_url = reverse_lazy('registro_exitoso')

def registro_exitoso(request):
    return render(request, 'usuarios/registro-exitoso.html', {})
