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
    def get_readonly_fields(self, request, obj=None):
        if (obj is None):
            return self.readonly_fields
        else:
            if (obj.neto is None):
                return self.readonly_fields
            else:
                return [f.name for f in self.model._meta.fields]
    def save_model(self, request, obj, form, change):
        if (not (obj.bruto is None) and not (obj.tara is None)):
            obj.neto = obj.bruto-obj.tara
        obj.save()


admin.site.register(Despacho,DespachoAdmin)

