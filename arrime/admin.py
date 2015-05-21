from django.contrib import admin
from arrime.models import Recepcion
from django.core.urlresolvers import reverse
from django.utils.timezone import utc
import datetime

class RecepcionAdmin(admin.ModelAdmin):

    def linkreporte(self, obj):
        return u'<a href="'+reverse('reportearrime', args=[obj.id])+'">Imprimir</a>'
    linkreporte.allow_tags = True
    linkreporte.verbose_name = 'Reporte'
    linkreporte.short_description = ' '

    def linkbruto(self, obj):
        funciontxt =  """<script>
        function refrescabruto"""+str(obj.id)+"""(){
        if (confirm('Actualizar peso bruto?')) {
            grp.jQuery.get('"""+reverse('bruto', args=[obj.id])+"""',  function( data ) {location.reload();});
          }             
        }
        </script>"""
        if (obj.bruto==None):
            texto="...<-"
        else:
            texto=str(obj.bruto)
        txtbruto = funciontxt+u'<a onclick="refrescabruto'+str(obj.id)+'()" href="#">'+texto+'</a>'
        ahora=datetime.datetime.utcnow().replace(tzinfo=utc)
        tiempo=ahora-obj.fecha
        tiemposegundos=tiempo.total_seconds()
        if (tiemposegundos/60/60/24)>1:
            txtbruto=texto
        return txtbruto
    linkbruto.allow_tags = True
    linkbruto.verbose_name = 'Peso Bruto'
    linkbruto.short_description = 'Peso Bruto'
    linkbruto.admin_order_field = 'bruto'


    def linktara(self, obj):
        funciontxt =  """<script>
        function refrescatara"""+str(obj.id)+"""(){
        if (confirm('Actualizar peso tara?')) {
            grp.jQuery.get('"""+reverse('tara', args=[obj.id])+"""',  function( data ) {location.reload();});
          }
        }
        </script>"""
        if (obj.tara==None):
            texto="...<-"
        else:
            texto=str(obj.tara)
        txttara = funciontxt+u'<a onclick="refrescatara'+str(obj.id)+'()" href="#">'+texto+'</a>'
        ahora=datetime.datetime.utcnow().replace(tzinfo=utc)
        tiempo=ahora-obj.fecha
        tiemposegundos=tiempo.total_seconds()
        if (tiemposegundos/60/60/24)>1:
            txttara=texto
        return txttara
    linktara.allow_tags = True
    linktara.verbose_name = 'Peso Tara'
    linktara.short_description = 'Peso Tara'
    linktara.admin_order_field = 'tara'

    fieldsets = [
        (None, {'fields': ['ubicacion', 'producto', 'proveedor', 'transportista', 'fecha']}),
        ('Vehiculo', {'fields': ['placa', 'conductor', ]}),
        ('Arrime', {'fields': ['bruto', 'tara', 'neto' ]}),
        ('Observacion', {'fields': ['observacion', ]}),
    ]
    raw_id_fields = ('proveedor','transportista')
    readonly_fields = ('linkreporte','neto','bruto','tara','linkbruto','linktara')
    autocomplete_lookup_fields = {
        'fk': ['proveedor','transportista'],
    }
    list_display = ('ubicacion', 'producto','proveedor','fecha','linkbruto','linktara', 'neto',
                    'listo', 'linkreporte')
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
       try:
           obj.neto = obj.bruto-obj.tara
       except:
           obj.neto = None
       obj.save()
 
admin.site.register(Recepcion,RecepcionAdmin)
