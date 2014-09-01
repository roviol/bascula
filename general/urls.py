from django.conf.urls import patterns, url

from general import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^recepciones$', views.recepciones, name='recepciones')
)

