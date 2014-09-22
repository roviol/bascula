from django.contrib import admin
from arrime.models import Recepcion
from django.core.urlresolvers import reverse

class RecepcionAdmin(admin.ModelAdmin):

    def linkreporte(self, obj):
        return u'<a href="'+reverse('reportearrime', args=[obj.id])+'">Imprimir</a>'
    linkreporte.allow_tags = True
    linkreporte.verbose_name = 'Reporte'

    fieldsets = [
        (None, {'fields': ['ubicacion', 'producto', 'proveedor', 'transportista', 'fecha']}),
        ('Vehiculo', {'fields': ['placa', 'conductor', ]}),
        ('Arrime', {'fields': ['bruto', 'tara', 'neto' ]}),
    ]
    raw_id_fields = ('proveedor','transportista')
    readonly_fields = ('linkreporte','neto')
    autocomplete_lookup_fields = {
        'fk': ['proveedor','transportista'],
    }
    list_display = ('ubicacion', 'producto','proveedor','fecha','bruto','tara','neto','listo', 'linkreporte')
    list_filter = ('ubicacion__nombre','producto__nombre')
    search_fields = ['proveedor__nombre']
    def get_readonly_fields(self, request, obj=None):
        if (obj is None):
            return self.readonly_fields
        else:
            if (obj.neto is None):
                return self.readonly_fields
            else:
                return [f.name for f in self.model._meta.fields]
    def save_model(self, request, obj, form, change):
       obj.neto = obj.bruto-obj.tara
       obj.save()
 
admin.site.register(Recepcion,RecepcionAdmin)
