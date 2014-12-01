from django.db import models


class Empresa(models.Model):
    nombre = models.CharField(max_length=150)
    rif = models.CharField(max_length=20, blank=True)
    telefono = models.CharField(max_length=50, blank=True)
    direccion = models.CharField(max_length=200, blank=True)
    email = models.EmailField(max_length=100, blank=True)
    def __unicode__(self):  
        return self.nombre

class Proveedor(Empresa):
    pass
    class Meta:
        verbose_name_plural = "Proveedores"

class Transportista(Empresa):
    pass

class Cliente(Empresa):
    pass

class Producto(models.Model):
    nombre = models.CharField(max_length=150)
    def __unicode__(self):  
        return self.nombre

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
    proveedor =  models.ForeignKey('general.Proveedor')
    transportista =  models.ForeignKey('general.Transportista')
    fecha = models.DateField(blank=True)
    bruto = models.DecimalField(max_digits=8, decimal_places=2, blank=True)
    taro = models.DecimalField(max_digits=8, decimal_places=2, blank=True)
    neto = models.DecimalField(max_digits=8, decimal_places=2, blank=True)
    placa = models.CharField(max_length=20)
    conductor = models.CharField(max_length=50)
    def __unicode__(self):  
        return self.ubicacion + ' ' + self.proveedor + ' ' + self.fecha + ' ' + self.neto

class Proceso(models.Model):
    nombre = models.CharField(max_length=100)
    def __unicode__(self):  
        return self.nombre

class ProporcionEntrada(models.Model):
    proceso = models.ForeignKey('Proceso')
    producto = models.ForeignKey('general.Producto')
    proporcion = models.DecimalField(max_digits=8, decimal_places=2, blank=True)
    def __unicode__(self):  
        return self.producto + ' ' + self.proporcion 
    class Meta:
        verbose_name = "Proporcion de Entrada"
        verbose_name_plural = "Proporciones de Entrada"

class ProporcionSalida(models.Model):
    proceso = models.ForeignKey('Proceso')
    producto = models.ForeignKey('general.Producto')
    proporcion = models.DecimalField(max_digits=8, decimal_places=2, blank=True)
    def __unicode__(self):  
        return self.producto + ' ' + self.proporcion 
    class Meta:
        verbose_name = "Proporcion de Salida"
        verbose_name_plural = "Proporciones de Salida"

