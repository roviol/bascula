from django.conf.urls import patterns, url

from control import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^citas$', views.citas, name='citas')
)

