# Generated by Django 5.0.7 on 2024-08-05 06:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('my_app', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='alumno',
            name='dni',
            field=models.IntegerField(unique=True),
        ),
    ]
