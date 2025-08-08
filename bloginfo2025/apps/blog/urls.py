from django.urls import path
from .views import articulo, index

urlpatterns = [
    path('', index, name='index'),
    path('articulo/<int:articulo_id>/', articulo, name='articulo'),
]