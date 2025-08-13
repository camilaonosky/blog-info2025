from django.urls import path
from .views import articulo, index, RegistrarUsuario, registro_exitoso, cerrar_sesion, crear_articulo
from django.contrib.auth.views import LoginView


urlpatterns = [
    path('', index, name='index'),
    path('articulo/<int:articulo_id>/', articulo, name='articulo'),
    path('registrar-usuario/', RegistrarUsuario.as_view(), name='registrar_usuario'),
    path('registro-exitoso/', registro_exitoso, name='registro_exitoso'),
    path('logout/', cerrar_sesion, name='cerrar_sesion'),
    path('login/', LoginView.as_view(template_name='usuarios/login.html',
        redirect_authenticated_user=True), name='login'),
    path('crear-articulo/', crear_articulo, name='crear_articulo')
]   