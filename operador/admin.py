from django.contrib import admin
from arrime.models import Recepcion
from despacho.models import Despacho
from bascula.admin import operador_site


class RecepcionAdminOper(admin.ModelAdmin):
    
    def linkreporte(self, obj):
        return u'<a href="/bascula/reportearrime/{1}">Imprimir</a>'.format(obj,obj.id)
    linkreporte.allow_tags = True
    linkreporte.verbose_name = 'Reporte'
    
    readonly_fields = ('fecha','neto','linkreporte')
    fieldsets = [
        (None, {'fields': ['ubicacion', 'producto', 'proveedor', 'transportista', 'fecha']}),
        ('Vehiculo', {'fields': ['placa', 'conductor', ]}),
        ('Arrime', {'fields': ['bruto', 'tara', 'neto' ]}),
    ]
    raw_id_fields = ('proveedor','transportista')
    autocomplete_lookup_fields = {
        'fk': ['proveedor','transportista'],
    }
    list_display = ('ubicacion', 'producto','proveedor','fecha','bruto','tara','neto','listo','linkreporte')
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

class DespachoAdminOper(admin.ModelAdmin):
    readonly_fields = ('fecha','neto')
    fieldsets = [
        (None, {'fields': ['ubicacion', 'producto', 'proveedor', 'transportista', 'fecha']}),
        ('Vehiculo', {'fields': ['placa', 'conductor', ]}),
        ('Arrime', {'fields': ['bruto', 'tara', 'neto' ]}),
    ]
    raw_id_fields = ('proveedor','transportista')
    autocomplete_lookup_fields = {
        'fk': ['proveedor','transportista'],
    }
    list_display = ('ubicacion', 'producto','proveedor','fecha','tara','bruto','neto','listo')
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


class Arrime(Recepcion):
    class Meta:
        proxy = True

class SalidaProducto(Despacho):
    class Meta:
        proxy = True


admin.site.register(SalidaProducto,DespachoAdminOper)
admin.site.register(Arrime,RecepcionAdminOper)
operador_site.register(SalidaProducto,DespachoAdminOper)
operador_site.register(Arrime,RecepcionAdminOper)

