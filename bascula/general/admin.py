from django.contrib import admin
from general.models import Proveedor
from general.models import Transportista
from general.models import Bascula
from general.models import MateriaPrima
from general.models import Producto
from general.models import ProductoFinal
from general.models import Proceso
from general.models import ProporcionEntrada
from general.models import ProporcionSalida

admin.site.register(Bascula)
admin.site.register(MateriaPrima)
admin.site.register(ProductoFinal)
admin.site.register(Producto)
admin.site.register(Proveedor)
admin.site.register(Transportista)
admin.site.register(Proceso)
admin.site.register(ProporcionEntrada)
admin.site.register(ProporcionSalida)
