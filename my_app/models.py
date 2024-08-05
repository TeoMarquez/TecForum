from django.db import models

class PadresTutores(models.Model):
    dni = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=45, null=True, blank=True)
    apellido = models.CharField(max_length=45, null=True, blank=True)
    correo = models.EmailField(max_length=45, null=True, blank=True, unique=True)
    telefono1 = models.CharField(max_length=45, null=True, blank=True)
    telefono2 = models.CharField(max_length=45, null=True, blank=True)
    contraseña = models.CharField(max_length=45, null=True, blank=True)
    firma = models.BinaryField(null=True, blank=True)

    def __str__(self):
        return f'{self.nombre} {self.apellido}'

class Alumno(models.Model):
    dni = models.IntegerField(unique=True)
    nombre = models.CharField(max_length=45, null=True, blank=True)
    apellido = models.CharField(max_length=45, null=True, blank=True)
    correo = models.EmailField(max_length=45, null=True, blank=True, unique=True)
    telefono = models.CharField(max_length=45, null=True, blank=True, unique=True)
    contraseña = models.CharField(max_length=45, null=True, blank=True)
    padres_tutores = models.ForeignKey(PadresTutores, null=True, blank=True, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('dni', 'padres_tutores')

    def __str__(self):
        return f'{self.nombre} {self.apellido}'

class Docente(models.Model):
    dni = models.IntegerField(primary_key=True, unique=True)
    nombre = models.CharField(max_length=45, null=True, blank=True)
    apellido = models.CharField(max_length=45, null=True, blank=True)
    correo = models.EmailField(max_length=45, null=True, blank=True, unique=True)
    telefono = models.CharField(max_length=45, null=True, blank=True, unique=True)
    contraseña = models.CharField(max_length=45, null=True, blank=True)
    firma = models.BinaryField(null=True, blank=True)

    def __str__(self):
        return f'{self.nombre} {self.apellido}'


class Materia(models.Model):
    id = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=45, null=True, blank=True)
    docente = models.ForeignKey(Docente, on_delete=models.DO_NOTHING)

    class Meta:
        unique_together = ('id', 'docente')

    def __str__(self):
        return self.nombre


class MesaExamen(models.Model):
    permiso_mesa = models.IntegerField()
    num_mesa = models.IntegerField(null=True, blank=True)
    num_orden = models.IntegerField(null=True, blank=True)
    fecha = models.DateField(null=True, blank=True)
    nota = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)
    materia = models.ForeignKey(Materia, on_delete=models.DO_NOTHING)

    class Meta:
        unique_together = ('permiso_mesa', 'materia')

    def __str__(self):
        return f'Mesa {self.num_mesa} - {self.fecha}'


class Directivo(models.Model):
    dni = models.IntegerField(primary_key=True, unique=True)
    nombre = models.CharField(max_length=45, null=True, blank=True)
    apellido = models.CharField(max_length=45, null=True, blank=True)
    correo = models.EmailField(max_length=45, null=True, blank=True, unique=True)
    telefono = models.CharField(max_length=45, null=True, blank=True, unique=True)
    contraseña = models.CharField(max_length=45, null=True, blank=True)
    firma = models.BinaryField(null=True, blank=True)

    def __str__(self):
        return f'{self.nombre} {self.apellido}'


class Preceptor(models.Model):
    dni = models.IntegerField(primary_key=True, unique=True)
    nombre = models.CharField(max_length=45,blank=True)
    apellido = models.CharField(max_length=45, blank=True)
    correo = models.EmailField(max_length=45, blank=True, unique=True)
    telefono = models.CharField(max_length=45, blank=True, unique=True)
    contraseña = models.CharField(max_length=45, blank=True)
    firma = models.BinaryField(null=True, blank=True)
    directivo = models.ForeignKey(Directivo, on_delete=models.DO_NOTHING)

    class Meta:
        unique_together = ('dni', 'directivo')

    def __str__(self):
        return f'{self.nombre} {self.apellido}'


class Horario(models.Model):
    id = models.IntegerField(primary_key=True)
    dia = models.CharField(max_length=45, null=True, blank=True)
    hora_modulo = models.CharField(max_length=45, null=True, blank=True)
    turno = models.CharField(max_length=45, null=True, blank=True)
    materia = models.ForeignKey(Materia, on_delete=models.DO_NOTHING)

    class Meta:
        unique_together = ('id', 'materia')

    def __str__(self):
        return f'{self.dia} - {self.hora_modulo}'


class Curso(models.Model):
    num_curso = models.IntegerField()
    num_division = models.IntegerField(null=True, blank=True)
    turno = models.CharField(max_length=45, null=True, blank=True)
    ciclo = models.CharField(max_length=45, null=True, blank=True)
    comunicados = models.TextField(null=True, blank=True)
    alumno = models.ForeignKey(Alumno, on_delete=models.DO_NOTHING)
    horario = models.ForeignKey(Horario, on_delete=models.DO_NOTHING)
    preceptor = models.ForeignKey(Preceptor, on_delete=models.DO_NOTHING)

    class Meta:
        unique_together = ('num_curso', 'alumno', 'horario', 'preceptor')

    def __str__(self):
        return f'Curso {self.num_curso}'


class Nota(models.Model):
    id = models.IntegerField(primary_key=True)
    fecha = models.DateField(null=True, blank=True)
    tipo = models.CharField(max_length=45, null=True, blank=True)
    notas_timestre1 = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)
    promedio1 = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)
    notas_trimestre2 = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)
    promedio2 = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)
    notas_trimestre3 = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)
    promedio3 = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)
    notas_recuperacion = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)
    promedio_total = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)
    comentario = models.TextField(null=True, blank=True)
    curso = models.ForeignKey(Curso, on_delete=models.DO_NOTHING)

    class Meta:
        unique_together = ('id', 'curso')

    def __str__(self):
        return f'Nota {self.id}'


class Asistencia(models.Model):
    id = models.IntegerField(primary_key=True)
    fecha = models.DateField(null=True, blank=True)
    estado = models.CharField(max_length=45, null=True, blank=True)
    curso = models.ForeignKey(Curso, on_delete=models.DO_NOTHING)

    class Meta:
        unique_together = ('id', 'curso')

    def __str__(self):
        return f'Asistencia {self.id}'
