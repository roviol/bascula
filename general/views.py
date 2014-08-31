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

#def recepciones(request):
#    citas = Cita.objects.order_by('-planinicio')
#    citasp = []
#    for item in citas:
#        inicio=item.planinicio.strftime("%Y-%m-%dT%H:%M:%S")
#        fin=item.planfin.strftime("%Y-%m-%dT%H:%M:%S")
#        descripcion = item.descripcion+"\n"+item.cliente.nombre+ "\n"+ item.participan()
#        citasp.append({'title': descripcion,'start': inicio,'end': fin, 'url': '../admin/control/cita/'+str(item.id)})
#    data = json.dumps(citasp)
#    return HttpResponse(data, content_type="application/json")

