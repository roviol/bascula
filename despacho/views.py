from django.http import HttpResponse
from django.core import serializers
from reportlab.pdfgen import canvas
from despacho.models import Despacho
from reportlab.lib.pagesizes import letter
from reportlab.graphics.barcode import code39
from reportlab.graphics.barcode.qr import QrCodeWidget
from reportlab.graphics.shapes import Drawing 
from reportlab.lib.units import mm
from reportlab.graphics import renderPDF
from django.conf import settings
import urllib
from decimal import Decimal

def export_as_json(request, despacho_id):
    queryset = Despacho.objects.filter(pk=despacho_id)
    response = HttpResponse(content_type="application/json")
    serializers.serialize("json", queryset, stream=response)
    return response

def netoact(pbruto, ptara):
    try:
        if pbruto != None and ptara != None:
            return Decimal(pbruto) - Decimal(ptara)
        else:
            return None
    except:
        return None

def bruto(request, despacho_id):
    queryset = Despacho.objects.get(pk=despacho_id)
    urlserial=queryset.ubicacion.urlserial
    valorserial=urllib.urlopen(urlserial)
    vserial=valorserial.read()
    queryset.bruto=vserial
    queryset.neto=netoact(queryset.bruto,queryset.tara)
    queryset.save()
    response = HttpResponse(queryset.neto)
    return response


def tara(request, despacho_id):
    queryset = Despacho.objects.get(pk=despacho_id)
    urlserial=queryset.ubicacion.urlserial
    valorserial=urllib.urlopen(urlserial)
    vserial=valorserial.read()
    queryset.tara=vserial
    queryset.neto=netoact(queryset.bruto,queryset.tara)
    queryset.save()
    response = HttpResponse(queryset.neto)
    return response

def reportedespacho(request, despacho_id):
    queryset = Despacho.objects.filter(pk=despacho_id)
    response = HttpResponse(content_type='application/pdf')
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
                       str(queryset[0].cliente)+';'
                       +str(queryset[0].fecha)+';'
                       +str(queryset[0].neto)) 
    b = qrw.getBounds()

    w=b[2]-b[0] 
    h=b[3]-b[1] 

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
    p.drawString(140, 650, str(queryset[0].cliente))
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
