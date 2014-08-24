from django.contrib import admin
from despacho.models import Despacho

class DespachoAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['ubicacion', 'producto', 'proveedor', 'transportista', 'fecha']}),
        ('Vehiculo', {'fields': ['placa', 'conductor', ]}),
        ('Arrime', {'fields': ['bruto', 'tara', 'neto' ]}),
    ]
    raw_id_fields = ('proveedor','transportista')
    autocomplete_lookup_fields = {
        'fk': ['proveedor','transportista'],
    }
    list_display = ('ubicacion', 'producto','proveedor','fecha','bruto','tara','neto')
    list_filter = ('ubicacion__nombre','producto__nombre')
    search_fields = ['proveedor__nombre']


admin.site.register(Despacho,DespachoAdmin)

