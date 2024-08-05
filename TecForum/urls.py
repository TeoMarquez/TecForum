from django.contrib import admin
from django.urls import path, include
from my_app import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('my_app.urls')),  # Incluye las URLs de tu aplicación
]

handler404 = 'my_app.views.error_404'  # Configura la vista para manejar el error 404
