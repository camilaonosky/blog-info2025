from django.urls import path
from .views import articulo, index, RegistrarUsuario, registro_exitoso

urlpatterns = [
    path('', index, name='index'),
    path('articulo/<int:articulo_id>/', articulo, name='articulo'),
    path('registrar-usuario/', RegistrarUsuario.as_view(), name='registrar_usuario'),
    path('registro-exitoso/', registro_exitoso, name='registro_exitoso')
]   