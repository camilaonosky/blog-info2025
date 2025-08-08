from django.shortcuts import render
from .models import Articulo

# Create your views here.

def index(request):
    articulos = Articulo.objects.all()
    return render(request, 'blog/index.html', {'articulos': articulos}) 