@echo off
echo Creando un entorno virtual...
python -m venv venv

echo Activando entorno virtual...
call venv\Scripts\activate

echo Instalando dependencias...
pip install -r requirements.txt

echo Ejecutando el servidor de desarrollo...
python manage.py runserver

echo La aplicación está en funcionamiento.