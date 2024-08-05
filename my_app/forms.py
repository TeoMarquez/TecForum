from django import forms
from .models import Alumno
from django.contrib.auth.forms import AuthenticationForm

class AlumnoForm(forms.ModelForm):
    confirmar_contrasena = forms.CharField(widget=forms.PasswordInput(), label='Confirmar Contraseña')

    class Meta:
        model = Alumno
        fields = ['dni', 'nombre', 'apellido', 'correo', 'telefono', 'contraseña',]
        widgets = {
            'contraseña': forms.PasswordInput(),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
    
    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get("contraseña")
        confirmar_contrasena = cleaned_data.get("confirmar_contrasena")

        if password and confirmar_contrasena and password != confirmar_contrasena:
            self.add_error('confirmar_contrasena', 'Las contraseñas no coinciden')
        

class LoginForm(forms.Form):
    email = forms.EmailField(label='Correo Electrónico')
    password = forms.CharField(widget=forms.PasswordInput, label='Contraseña')

    def clean(self):
        cleaned_data = super().clean()
        email = cleaned_data.get("email")
        password = cleaned_data.get("password")

        if email and password:
            alumnos = Alumno.objects.filter(correo=email)
            if not alumnos.exists():
                self.add_error('email', 'Correo electrónico no encontrado')
            elif len(alumnos) > 1:
                self.add_error('email', 'Hay múltiples cuentas con este correo electrónico')
            else:
                alumno = alumnos.first()
                if alumno.contraseña != password:
                    self.add_error('password', 'Contraseña incorrecta')
        return cleaned_data