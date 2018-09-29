import os
leeladir="leela-zero-0.15-win64"

#check the files under current folder
path=os.getcwd()
print ("Current working dir : %s" % path)
print ("list files in dir: %s" % path)
for entry in os.scandir(path):
        print(entry.name)
  
#remove the previous folder  
import shutil
shutil.rmtree(leeladir)
    
#download the zip file of release and unpack it
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
		

#download the weight file
