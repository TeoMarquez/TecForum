from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),
    path('oa/', views.oa, name='oa'),
    path('success/', views.success, name='success'),  # URL para la página de éxito
]


