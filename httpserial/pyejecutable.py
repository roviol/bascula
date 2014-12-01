# -*- coding: utf-8 -*-

from distutils.core import setup 
import py2exe 
 
setup(name="httpserial", 
 version="1.0", 
 description="Serial a HTTP", 
 author="", 
 author_email="", 
 url="", 
 license="GPL", 
 scripts=["basculalisten.py"], 
 console=["basculalisten.py"], 
 options={"py2exe": {"bundle_files": 1}}, 
 zipfile=None,
)