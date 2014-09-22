# -*- coding: utf-8 -*-

from django.shortcuts import render_to_response,redirect
from django.http import HttpResponse, HttpResponseRedirect
from arrime.models import Recepcion
from despacho.models import Despacho
from general.models import Bascula
from django.core import serializers
from django.template import RequestContext, loader
from django.db.models import Count, Sum
import json
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from django.conf import settings
from django.core.urlresolvers import reverse_lazy

@login_required(redirect_field_name='next', login_url=reverse_lazy('logingeneral'))
def index(request):
#     latest_despacho_list = Despacho.objects.all()
    latest_recepcion_list = Recepcion.objects.order_by('-fecha')[0:10]
    template = loader.get_template('general/index.html')
    context = RequestContext(request, {
        'latest_recepcion_list': latest_recepcion_list,
#         'latest_despacho_list': latest_despacho_list,
        'GRAPPELLI_ADMIN_TITLE': settings.GRAPPELLI_ADMIN_TITLE
    })
    return HttpResponse(template.render(context))

def login_user(request):
    logout(request)
    username = password = ''
    if request.POST:
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                siguiente = request.POST.get('next', '/')
                return HttpResponseRedirect(siguiente)
    siguiente = request.GET.get('next', '')
    context = {'next':siguiente,
        'GRAPPELLI_ADMIN_TITLE': settings.GRAPPELLI_ADMIN_TITLE
        }
    return render_to_response('general/login.html', context, context_instance=RequestContext(request))

@login_required(redirect_field_name='next', login_url=reverse_lazy('logingeneral'))
def calendario(request):
#    latest_recepcion_list = Recepcion.objects.all()
    template = loader.get_template('general/calendario.html')
    context = RequestContext(request, {
#        'latest_recepcion_list': latest_recepcion_list,
    })
    return HttpResponse(template.render(context))

@login_required(redirect_field_name='next', login_url=reverse_lazy('logingeneral'))
def grafico(request):
#    latest_recepcion_list = Recepcion.objects.all()
    template = loader.get_template('general/grafico.html')
    context = RequestContext(request, {
        'GRAPPELLI_ADMIN_TITLE': settings.GRAPPELLI_ADMIN_TITLE
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
        recepciones = Recepcion.objects.filter(ubicacion__id=bascula.id).exclude(neto__isnull=True).extra(select=select_data).values('d').annotate(netosum = Sum('neto'),total = Count('id')).order_by("d")
        recepcionesp = []
        for item in recepciones:
            inicio=str(item['d'])
            neto = str(item['netosum'])
            recepcionesp.append([inicio, neto])
        categorias.append({'name': bascula.nombre, 'data': recepcionesp})
    data = json.dumps(categorias)
    return HttpResponse(data, content_type="application/json")
