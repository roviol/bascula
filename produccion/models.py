from django.db import models
import general
import datetime

class Produccion(models.Model):
    proceso =  models.ForeignKey('general.Proceso')
    fecha = models.DateField()
    observacion = models.CharField(max_length=2000)
    class Meta:
        verbose_name_plural = "Producciones"
    def __unicode__(self):  
        return self.proceso.nombre+' '+self.fecha.strftime('%Y-%m-%d')

class Entrada(models.Model):
    produccion = models.ForeignKey('Produccion')
    producto = models.ForeignKey('general.Producto')
    cantidad = models.DecimalField(max_digits=8, decimal_places=2)

class Salida(models.Model):
    produccion = models.ForeignKey('Produccion')
    producto =  models.ForeignKey('general.Producto')
    cantidad = models.DecimalField(max_digits=8, decimal_places=2)
