import sys
import BaseHTTPServer
from SimpleHTTPServer import SimpleHTTPRequestHandler
import urlparse
import serial
import thread
import time

class SerialHandler(BaseHTTPServer.BaseHTTPRequestHandler):
     def do_HEAD(s):
         s.send_response(200)
         s.send_header("Content-type", "text/plain")
         s.end_headers()
     def do_GET(s):
         """Respond to a GET request."""
         print s.path[2:]
         linea=urlparse.parse_qs(s.path[2:])
         s.send_response(200)
         s.send_header("Content-type", "text/plain")
         s.end_headers()
         puerto=0
         envio=""
         if (linea.has_key("puerto")):
             puerto=int(linea["puerto"][0]) 
         if (linea.has_key("envio")):
             envio=linea["envio"][0]
         lineaserial=""
         ser = None
         ser = serial.Serial()
         ser.port = puerto
         ser.timeout = 2
         try:
             ser.open()
             if (envio!=''):
                  ser.write(envio)
             lineaserial=ser.readline()
             if (lineaserial==""):
                  lineaserial=ser.readline()
             ser.close()
         except Exception as e:
             print e
             if ser.isOpen():
                 ser.close()
         s.wfile.write(lineaserial)
  
HandlerClass = SimpleHTTPRequestHandler
ServerClass  = BaseHTTPServer.HTTPServer
Protocol     = "HTTP/1.0"

if sys.argv[1:]:
    port = int(sys.argv[1])
else:
    port = 8001
server_address = ('0.0.0.0', port)

HandlerClass.protocol_version = Protocol
httpd = ServerClass(server_address, SerialHandler)

sa = httpd.socket.getsockname()
print "Serving HTTP on", sa[0], "port", sa[1], "..."
httpd.serve_forever()
