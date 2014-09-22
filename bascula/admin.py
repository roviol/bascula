from django.contrib.admin.sites import AdminSite

class OperadorSite(AdminSite):
    pass

operador_site = OperadorSite(name='supervisor')
