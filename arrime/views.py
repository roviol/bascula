from django.http import HttpResponse
from django.core import serializers
from reportlab.pdfgen import canvas
from arrime.models import Recepcion
from reportlab.lib.pagesizes import letter
from reportlab.graphics.barcode import code39
from reportlab.graphics.barcode.qr import QrCodeWidget
from reportlab.graphics.shapes import Drawing 
from reportlab.lib.units import mm
from reportlab.graphics import renderPDF
from django.conf import settings

def export_as_json(request, arrime_id):
    queryset = Recepcion.objects.filter(pk=arrime_id)
    response = HttpResponse(content_type="application/json")
    serializers.serialize("json", queryset, stream=response)
    return response

def reportearrime(request, arrime_id):
    queryset = Recepcion.objects.filter(pk=arrime_id)
    response = HttpResponse(content_type='application/pdf')
    #response['Content-Disposition'] = 'attachment; filename="ticket.pdf"'
    response['Content-Disposition'] = 'inline; filename="ticket.pdf"'
    response['Cache-Control'] = 'no-cache'
    p = canvas.Canvas(response, pagesize=letter)
    #Encabezado
    p.setFont("Helvetica-Bold", 8)
    p.drawString(450,730, str(queryset[0].fecha))
    #Ticket
    p.setFont("Helvetica-Bold", 8)
    p.drawString(50,730, 'Ticket:')
    p.setFont("Helvetica-Bold", 8)
    p.drawString(150,730, str(queryset[0].id))
    #barcode=code39.Extended39(str(queryset[0].id),barWidth=0.5*mm,barHeight=5*mm)
    #barcode.drawOn(p,250,730)
    qrw = QrCodeWidget(str(queryset[0].id)+';'+
                       str(queryset[0].proveedor)+';'
                       +str(queryset[0].fecha)+';'
                       +str(queryset[0].neto)) 
    b = qrw.getBounds()

    w=b[2]-b[0] 
    h=b[3]-b[1] 

    #d = Drawing(45,45,transform=[45./w,0,0,45./h,0,0]) 
    d = Drawing(90,90,transform=[90./w,0,0,90./h,0,0])
    d.add(qrw)

    renderPDF.draw(d, p, 350, 680)
    #Empresa
    p.setFont("Helvetica-Bold", 24)
    p.drawString(50,700, settings.GRAPPELLI_ADMIN_TITLE)
    p.setFont("Helvetica-Bold", 15)
    p.drawString(200,684, str(queryset[0].ubicacion))
    #Productor y Transporte
    p.setFont("Helvetica-Bold", 12)
    p.drawString(50, 650, "Productor: ")
    p.drawString(140, 650, str(queryset[0].proveedor))
    p.drawString(50, 630, "Transportista: ")
    p.drawString(140, 630, str(queryset[0].transportista))
    #Cantidades
    #margen pesos
    margenpeso=70
    p.setFont("Helvetica-Bold", 18)
    p.drawString(29+margenpeso, 600, "Peso: ")
    p.setFont("Helvetica-Bold", 18)
    p.drawString(50+margenpeso, 580, "Bruto: ")
    p.drawString(140+margenpeso, 580, str(queryset[0].bruto))
    p.drawString(280+margenpeso, 580, "Tara: ")
    p.drawString(330+margenpeso, 580, str(queryset[0].tara))
    #Neto
    p.setFont("Helvetica-Bold", 24)
    p.drawString(300+margenpeso, 550, "Neto: ")
    p.drawString(380+margenpeso, 550, str(queryset[0].neto))
      
    p.showPage()
    p.save()
    return response
