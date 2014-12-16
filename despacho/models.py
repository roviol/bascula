from django.db import models
import general

class Despacho(general.models.Transaccion):
    producto =  models.ForeignKey('general.ProductoFinal')
    cliente =  models.ForeignKey('general.Cliente')
    class Meta:
        verbose_name = "Despacho"
        verbose_name_plural = "Despachos"
    def __unicode__(self):  
        return self.ubicacion.nombre + ' ' + self.cliente.nombre + ' ' + self.fecha.strftime('%Y-%m-%d') + ' ' + str(self.neto)
