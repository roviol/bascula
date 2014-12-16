from django.db import models
import datetime

class Empresa(models.Model):
    nombre = models.CharField(max_length=150)
    rif = models.CharField(max_length=20, blank=True)
    telefono = models.CharField(max_length=50, blank=True)
    direccion = models.CharField(max_length=200, blank=True)
    email = models.EmailField(max_length=100, blank=True)
    def __unicode__(self):  
        return self.nombre
    @staticmethod
    def autocomplete_search_fields():
        return ("id__iexact", "nombre__icontains",)

class Proveedor(Empresa):
    class Meta:
        verbose_name_plural = "Proveedores"

class Transportista(Empresa):
    pass

class Cliente(Empresa):
    pass

class Producto(models.Model):
    nombre = models.CharField(max_length=150)
    unidad =  models.ForeignKey('general.Unidad')
    def __unicode__(self):
        return self.nombre + ' (' +self.unidad.abreviatura + ')'

class Bascula(models.Model):
    nombre = models.CharField(max_length=150)
    urlserial = models.CharField(max_length=500)
    def __unicode__(self):  
        return self.nombre

class ProductoFinal(Producto):
    pass
    class Meta:
        verbose_name = "Producto Final"
        verbose_name_plural = "Productos Finales"

class MateriaPrima(Producto):
    pass
    class Meta:
        verbose_name = "Materia Prima"
        verbose_name_plural = "Materias Primas"

class Transaccion(models.Model):
    ubicacion = models.ForeignKey('general.Bascula')
    transportista =  models.ForeignKey('general.Transportista')
    fecha = models.DateTimeField(null=True, blank=True, default=datetime.datetime.now)
    bruto = models.DecimalField(max_digits=8,  blank=True, decimal_places=2, null=True, verbose_name='Peso Bruto')
    tara = models.DecimalField(max_digits=8,  blank=True, decimal_places=2, null=True, verbose_name='Tara')
    neto = models.DecimalField(max_digits=8,  blank=True, decimal_places=2, null=True, verbose_name='Peso Neto')
    placa = models.CharField(max_length=20)
    conductor = models.CharField(max_length=50)
    def __unicode__(self):  
        return self.ubicacion.nombre + ' ' + self.fecha.strftime('%Y-%m-%d') + ' ' + str(self.neto)
    def listo(self):
        return not (self.neto is None)
    listo.admin_order_field = 'neto'
    listo.boolean = True
    listo.short_description = 'Completa?'

class Proceso(models.Model):
    nombre = models.CharField(max_length=100)
    def __unicode__(self):  
        return self.nombre

class ProporcionEntrada(models.Model):
    proceso = models.ForeignKey('Proceso')
    producto = models.ForeignKey('general.Producto')
    proporcion = models.DecimalField(max_digits=8, decimal_places=2, null=True)
    def __unicode__(self):  
        return self.producto  
    class Meta:
        verbose_name = "Proporcion de Entrada"
        verbose_name_plural = "Proporciones de Entrada"

class ProporcionSalida(models.Model):
    proceso = models.ForeignKey('Proceso')
    producto = models.ForeignKey('general.Producto')
    proporcion = models.DecimalField(max_digits=8, decimal_places=2, null=True)
    def __unicode__(self):  
        return self.producto
    class Meta:
        verbose_name = "Proporcion de Salida"
        verbose_name_plural = "Proporciones de Salida"


class Unidad(models.Model):
    nombre = models.CharField(max_length=100)
    abreviatura = models.CharField(max_length=10)
    def __unicode__(self):  
        return self.abreviatura
    class Meta:
        verbose_name_plural = "Unidades"

