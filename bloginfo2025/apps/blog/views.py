from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic import CreateView
from .forms import ArticuloForm, RegistroUsuarioForm
from .models import Articulo, Usuario
from django.contrib.auth import logout


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

def cerrar_sesion(request):
    logout(request)
    return render(request, 'usuarios/logout.html')

def crear_articulo(request):
    if request.method == 'POST':
        form = ArticuloForm(request.POST, request.FILES)
        if form.is_valid():
            articulo = form.save(commit=False)
            articulo.autor = request.user
            articulo.save()
            return redirect('articulo', articulo_id=articulo.pk)
    else:
        form = ArticuloForm()
    return render(request, 'blog/crear-articulo.html', {'form': form})
