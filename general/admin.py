from django.contrib import admin
from general.models import Proveedor
from general.models import Transportista
from general.models import Cliente
from general.models import Bascula
from general.models import MateriaPrima
from general.models import ProductoFinal
from general.models import Proceso
from general.models import Unidad
from general.models import ProporcionEntrada
from general.models import ProporcionSalida
from bascula.admin import operador_site

class ProporcionEntradaInline(admin.TabularInline):
    model = ProporcionEntrada
    extra = 0

class ProporcionSalidaInline(admin.TabularInline):
    model = ProporcionSalida
    extra = 0

class ProcesoAdmin(admin.ModelAdmin):
    inlines = [ProporcionEntradaInline, ProporcionSalidaInline]

class EmpresaAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['nombre', 'rif', 'direccion', 'telefono', 'email']}),
    ]
    list_display = ('nombre', 'rif','telefono')
    search_fields = ['nombre','rif']

class UnidadAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['nombre', 'abreviatura']}),
    ]
    list_display = ('nombre', 'abreviatura')
    search_fields = ['nombre','abreviatura']

admin.site.register(Bascula)
admin.site.register(MateriaPrima)
admin.site.register(ProductoFinal)
admin.site.register(Proveedor,EmpresaAdmin)
admin.site.register(Unidad,UnidadAdmin)
admin.site.register(Transportista,EmpresaAdmin)
admin.site.register(Cliente,EmpresaAdmin)
# admin.site.register(Proceso,ProcesoAdmin)

operador_site.register(Proveedor,EmpresaAdmin)
operador_site.register(Transportista,EmpresaAdmin)
# operador_site.register(Cliente,EmpresaAdmin)
