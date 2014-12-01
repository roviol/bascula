from django.conf.urls import patterns, include, url
from django.contrib import admin
from bascula.admin import operador_site

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'bascula.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^grappelli/', include('grappelli.urls')), # grappelli URLS
    url(r'^admin/', include(admin.site.urls)),
    url(r'^operador/', include(operador_site.urls)),
    url(r'^export/(?P<arrime_id>\d+)', 'arrime.views.export_as_json', name='export'),
    url(r'^reportearrime/(?P<arrime_id>\d+)', 'arrime.views.reportearrime', name='reportearrime'),
    url(r'^bruto/(?P<arrime_id>\d+)', 'arrime.views.bruto', name='bruto'),
    url(r'^tara/(?P<arrime_id>\d+)', 'arrime.views.tara', name='tara'),
    url(r'^general/', include('general.urls')),
    url(r'^login/$', 'general.views.login_user', name='logingeneral'),
    url(r'^$', 'general.views.index', name='inicio')
 
)
