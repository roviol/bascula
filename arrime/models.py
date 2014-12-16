from django.db import models
import general

class Recepcion(general.models.Transaccion):
    producto =  models.ForeignKey('general.MateriaPrima')
    proveedor =  models.ForeignKey('general.Proveedor')
    class Meta:
        verbose_name = "Recepcion"
        verbose_name_plural = "Recepciones"
    def __unicode__(self):  
        return self.ubicacion.nombre + ' ' + self.proveedor.nombre + ' ' + self.fecha.strftime('%Y-%m-%d') + ' ' + str(self.neto)
