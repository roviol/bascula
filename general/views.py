# -*- coding: utf-8 -*-

from django.shortcuts import render
from django.http import HttpResponse
from arrime.models import Recepcion
from general.models import Bascula
from django.core import serializers
from django.template import RequestContext, loader
from django.db.models import Count, Sum
import json

def index(request):
#    latest_recepcion_list = Recepcion.objects.all()
    template = loader.get_template('general/index.html')
    context = RequestContext(request, {
#        'latest_recepcion_list': latest_recepcion_list,
    })
    return HttpResponse(template.render(context))


def grafico(request):
#    latest_recepcion_list = Recepcion.objects.all()
    template = loader.get_template('general/grafico.html')
    context = RequestContext(request, {
#        'latest_recepcion_list': latest_recepcion_list,
    })
    return HttpResponse(template.render(context))


def recepciones(request):
    recepciones = Recepcion.objects.order_by('-fecha')
    recepcionesp = []
    for item in recepciones:
        inicio=item.fecha.strftime("%Y-%m-%dT%H:%M:%S")
        descripcion = item.proveedor.nombre + ": " + str(item.neto)
        recepcionesp.append({'title': descripcion,'start': inicio,'url': '../admin/arrime/recepcion/'+str(item.id)})
    data = json.dumps(recepcionesp)
    return HttpResponse(data, content_type="application/json")

def arrimeproveedor(request):
    recepciones = Recepcion.objects.values('proveedor__nombre','fecha').annotate(neto = Sum('neto'),total = Count('id')).order_by()
    recepcionesp = []
    for item in recepciones:
        inicio=item['fecha'].strftime("%Y-%m-%dT%H:%M:%S")
        descripcion = item['proveedor__nombre'] + ": " + str(item['neto'])
        recepcionesp.append({'title': descripcion,'start': inicio})
    data = json.dumps(recepcionesp)
    return HttpResponse(data, content_type="application/json")

def arrime(request):
    basculas = Bascula.objects.all()
    select_data = {"d": """DATE_FORMAT(fecha, '%%Y-%%m-%%d')"""}
    categorias=[]
    for bascula in basculas:
        recepciones = Recepcion.objects.filter(ubicacion__id=bascula.id).exclude(neto__isnull=True).extra(select=select_data).values('d').annotate(netosum = Sum('neto'),total = Count('id')).order_by()
        recepcionesp = []
        for item in recepciones:
            inicio=str(item['d'])
            neto = str(item['netosum'])
            recepcionesp.append([inicio, neto])
        categorias.append({'name': bascula.nombre, 'data': recepcionesp})
    data = json.dumps(categorias)
    return HttpResponse(data, content_type="application/json")
