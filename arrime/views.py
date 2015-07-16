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
from reportlab.platypus import Image
from django.conf import settings
import urllib
from decimal import Decimal

def export_as_json(request, arrime_id):
    queryset = Recepcion.objects.filter(pk=arrime_id)
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

def bruto(request, arrime_id):
    queryset = Recepcion.objects.get(pk=arrime_id)
    urlserial=queryset.ubicacion.urlserial
    valorserial=urllib.urlopen(urlserial)
    vserial=valorserial.read()
    queryset.bruto=vserial
    queryset.sale=datetime.now()
    queryset.neto=netoact(queryset.bruto,queryset.tara)
    queryset.save()
    response = HttpResponse(queryset.neto)
    return response


def tara(request, arrime_id):
    queryset = Recepcion.objects.get(pk=arrime_id)
    urlserial=queryset.ubicacion.urlserial
    valorserial=urllib.urlopen(urlserial)
    vserial=valorserial.read()
    queryset.tara=vserial
    queryset.llega=datetime.now()
    queryset.neto=netoact(queryset.bruto,queryset.tara)
    queryset.save()
    response = HttpResponse(queryset.neto)
    return response

def reportearrime(request, arrime_id):    
    #logo = Image("/home/roland/Documentos/bascula/general/static/imagenes/logo.jpg")
    logo = settings.STATIC_ROOT+"/imagenes/logo.jpg"
    print(logo)
    inicia=70;
    queryset = Recepcion.objects.filter(pk=arrime_id)
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'inline; filename="ticket.pdf"'
    response['Cache-Control'] = 'no-cache'
    p = canvas.Canvas(response, pagesize=letter)
    while (inicia<500):
        #Encabezado
        p.setFont("Helvetica-Bold", 8)
        #p.drawString(450,730-inicia, str(queryset[0].fecha))
        #Ticket
        p.setFont("Helvetica-Bold", 14)
        p.drawString(350,730-inicia, 'Ticket:')
        p.setFont("Helvetica-Bold", 14)
        p.drawString(450,730-inicia, str(queryset[0].id))
        #barcode=code39.Extended39(str(queryset[0].id),barWidth=0.5*mm,barHeight=5*mm)
        #barcode.drawOn(p,250,730)
        qrw = QrCodeWidget(str(queryset[0].id)+';'+
                           str(queryset[0].proveedor)+';'
                           +str(queryset[0].fecha)+';'
                           +str(queryset[0].neto)) 
        b = qrw.getBounds()

        w=b[2]-b[0] 
        h=b[3]-b[1] 

        d = Drawing(90,90-inicia,transform=[90./w,0,0,90./h,0,0])
        #d.add(qrw)

        renderPDF.draw(d, p, 350, 680-inicia)
        #Empresa
        p.drawImage(logo,50,720-inicia)
        p.setFont("Helvetica-Bold", 24)
        p.drawString(50,700-inicia, settings.GRAPPELLI_ADMIN_TITLE)
        p.setFont("Helvetica-Bold", 15)
        p.drawString(400,784-inicia, queryset[0].fecha.strftime("%d/%m/%Y %I:%M %p"))
        p.setFont("Helvetica-Bold", 15)
        p.drawString(200,684-inicia, str(queryset[0].ubicacion))
        #Productor y Transporte
        p.setFont("Helvetica-Bold", 12)
        p.drawString(50, 650-inicia, "Productor: ")
        p.drawString(140, 650-inicia, str(queryset[0].proveedor))
        p.drawString(50, 630-inicia, "Transportista: ")
        p.drawString(140, 630-inicia, str(queryset[0].transportista))
        p.drawString(50, 610-inicia, "Observacion: ")
        p.drawString(140, 610-inicia, str(queryset[0].observacion))
        p.drawString(50, 590-inicia, "Placa: ")
        p.drawString(140, 590-inicia, str(queryset[0].placa))
        #Cantidades
        #margen pesos
        margenpeso=70
        p.setFont("Helvetica-Bold", 18)
        p.drawString(29+margenpeso, 550-inicia, "Peso: ")
        p.setFont("Helvetica-Bold", 18)
        p.drawString(50+margenpeso, 530-inicia, "Bruto: ")
        p.drawString(140+margenpeso, 530-inicia, str(queryset[0].bruto))
        p.drawString(280+margenpeso, 530-inicia, "Tara: ")
        p.drawString(330+margenpeso, 530-inicia, str(queryset[0].tara))
        #Neto
        p.setFont("Helvetica-Bold", 24)
        p.drawString(300+margenpeso, 500-inicia, "Neto: ")
        p.drawString(380+margenpeso, 500-inicia, str(queryset[0].neto))
        inicia=inicia+400

      
    p.showPage()
    p.save()
    return response
