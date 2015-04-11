from django.conf.urls import patterns, url

from general import views

urlpatterns = patterns('',
    url(r'^calendario$', views.calendario, name='calendario'),
    url(r'^recepciones$', views.recepciones, name='recepciones'),
    url(r'^arrime$', views.arrime, name='arrime'),
    url(r'^grafico$', views.grafico, name='grafico'),
    url(r'^diario$', views.diario, name='diario'),
    url(r'^diariorep$', views.diariorep, name='diariorep'),
    url(r'^resumen$', views.resumen, name='resumen'),
    url(r'^resumenrep$', views.resumenrep, name='resumenrep')
)

