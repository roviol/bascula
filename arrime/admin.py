from django.contrib import admin
from arrime.models import Recepcion

class RecepcionAdmin(admin.ModelAdmin):

    def linkreporte(self, obj):
        return u'<a href="/reportearrime/{1}">Imprimir</a>'.format(obj,obj.id)
    linkreporte.allow_tags = True
    linkreporte.verbose_name = 'Reporte'

    fieldsets = [
        (None, {'fields': ['ubicacion', 'producto', 'proveedor', 'transportista', 'fecha']}),
        ('Vehiculo', {'fields': ['placa', 'conductor', ]}),
        ('Arrime', {'fields': ['bruto', 'tara', 'neto' ]}),
    ]
    raw_id_fields = ('proveedor','transportista')
    readonly_fields = ('linkreporte',)
    autocomplete_lookup_fields = {
        'fk': ['proveedor','transportista'],
    }
    list_display = ('ubicacion', 'producto','proveedor','fecha','bruto','tara','neto', 'linkreporte')
    list_filter = ('ubicacion__nombre','producto__nombre')
    search_fields = ['proveedor__nombre']

 
admin.site.register(Recepcion,RecepcionAdmin)
