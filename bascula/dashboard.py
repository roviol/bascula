# -*- encoding: utf-8 -*-
"""
This file was generated with the customdashboard management command and
contains the class for the main dashboard.

To activate your index dashboard add the following to your settings.py::
    GRAPPELLI_INDEX_DASHBOARD = 'bascula.dashboard.CustomIndexDashboard'
"""

from django.utils.translation import ugettext_lazy as _
from django.core.urlresolvers import reverse

from grappelli.dashboard import modules, Dashboard
from grappelli.dashboard.utils import get_admin_site_name


class CustomIndexDashboard(Dashboard):
    """
    Custom index dashboard for www.
    """
    
    def init_with_context(self, context):
        
        site_name = get_admin_site_name(context)
        
        self.children.append(modules.AppList(
            title='Operadores',
            column=1,
            exclude=('arrime.*','general.*','despacho.*','produccion.*', 'django.contrib.*',)
        ))

        self.children.append(modules.Group(
            _('Supervisores'),
            column=1,
            collapsible=True,
            children = [
               modules.ModelList(
                    title='Arrime',
                    column=1,
                    collapsible=False,
                    models=('arrime.models.*',)
                ),
               modules.ModelList(
                    title='Despacho',
                    column=1,
                    css_classes=('collapse closed',),
                    models=('despacho.models.*',)
                ),
               modules.ModelList(
                    title=u'Producción',
                    column=1,
                    css_classes=('collapse closed',),
                    models=('produccion.models.*',)
                )
            ]
        ))
        

        self.children.append(modules.Group(
            _('General'),
            column=2,
            collapsible=True,
            children = [
               modules.ModelList(
                    title='Administrativo',
                    column=2,
                    css_classes=('grp-collapse grp-open',),
                    models=('general.models.Proveedor',
                        'general.models.Transportista',
                        'general.models.Cliente')
                ),
               modules.ModelList(
                    title='Parametros',
                    column=2,
                    css_classes=('grp-collapse grp-closed',),
                    models=('general.models.Bascula',
                        'general.models.Unidad',
                        'general.models.MateriaPrima',
                        'general.models.ProductoFinal',
                        'general.models.Proceso')
                )
            ]
        ))

        # append an app list module for "Administration"
        self.children.append(modules.ModelList(
            _('Seguridad'),
            column=2,
            css_classes=('grp-collapse grp-closed',),
            models=('django.contrib.*',),
        ))
        
        
        # append a recent actions module
        self.children.append(modules.RecentActions(
            _('Recent Actions'),
            limit=5,
            collapsible=False,
            column=3,
        ))



