# -*- coding: utf-8 -*-

from django.shortcuts import render
from django.http import HttpResponse
from arrime.models import Recepcion
from django.core import serializers
from django.template import RequestContext, loader
import json

# Create your views here.
def index(request):
    latest_recepcion_list = Recepcion.objects()
    template = loader.get_template('general/index.html')
    context = RequestContext(request, {
        'latest_recepcion_list': latest_recepcion_list,
    })
    return HttpResponse(template.render(context))

def recepciones(request):
    recepciones = Recepcion.objects.order_by('-fecha')
    recepcionesp = []
    for item in recepciones:
        inicio=item.fecha.strftime("%Y-%m-%dT%H:%M:%S")
        descripcion = item.ubicacion.nombre
        recepcionesp.append({'title': descripcion,'start': inicio,'url': '../admin/arrime/recepcion/'+str(item.id)})
    data = json.dumps(recepcionesp)
    return HttpResponse(data, content_type="application/json")
