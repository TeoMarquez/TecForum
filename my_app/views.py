from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages
from .forms import *

def register(request):
    if request.method == 'POST':
        form = AlumnoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('success')
        else:
            print("Form errors:", form.errors)  # Imprime errores en la consola
    else:
        form = AlumnoForm()
    return render(request, 'register.html', {'form': form})

def login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            messages.success(request, "Inicio de sesión exitoso")
            return redirect('success')  # Redirige a la página deseada
        else:
            # Mostrar errores del formulario
            for field in form:
                for error in field.errors:
                    messages.error(request, f"Error en {field.label}: {error}")
    else:
        form = LoginForm()

    return render(request, 'login.html', {'form': form})

def index(request):
    return render(request, 'index.html')

def oa(request,):
    return render(request, 'oa.html')

def error_404(request, exception):
    return render(request, '404.html', status=404)

def success(request):
    return render(request, 'success.html')





