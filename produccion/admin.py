from django.contrib import admin
from produccion.models import Produccion
from produccion.models import Entrada
from produccion.models import Salida

class EntradaInline(admin.TabularInline):
    model = Entrada
    extra = 0

class SalidaInline(admin.TabularInline):
    model = Salida
    extra = 0

class ProduccionAdmin(admin.ModelAdmin):
    inlines = [EntradaInline, SalidaInline]

# admin.site.register(Produccion,ProduccionAdmin)

