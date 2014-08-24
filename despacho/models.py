from django.db import models
import general

class Despacho(general.models.Transaccion):
    producto =  models.ForeignKey('general.ProductoFinal')
