from django.db import models
import general

class Recepcion(general.models.Transaccion):
    producto =  models.ForeignKey('general.MateriaPrima')
    class Meta:
        verbose_name = "Recepcion"
        verbose_name_plural = "Recepciones"

