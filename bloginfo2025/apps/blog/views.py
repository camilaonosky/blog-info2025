from django.shortcuts import render
from .models import Articulo

# Create your views here.

def index(request):
    articulos = Articulo.objects.all()
    return render(request, 'blog/index.html', {'articulos': articulos}) 

# Vista para la pagina de un articulo del blog
def articulo(request, articulo_id):
    articulo = Articulo.objects.get(id=articulo_id)
    return render(request, 'blog/articulo.html', {'articulo': articulo})