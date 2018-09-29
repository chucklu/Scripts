import os
leeladir="leela-zero-0.15-win64"
path=os.getcwd()
print ("Current working dir : %s" % path)
print ("list files in dir: %s" % path)
for entry in os.scandir(path):
        print(entry.name)
    
import shutil
shutil.rmtree(leeladir)
    
from io import BytesIO
from zipfile import ZipFile
from urllib.request import urlopen
# or: requests.get(url).content

resp = urlopen("https://github.com/gcp/leela-zero/releases/download/v0.15/leela-zero-0.15-win64.zip")
zipfile = ZipFile(BytesIO(resp.read()))
file = zipfile.namelist()
print(file)
zipfile.extractall()
zipfile.close()
for entry in os.scandir(path):
        print(entry.name)