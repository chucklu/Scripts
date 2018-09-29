#! /usr/bin/env python
import urllib2
import StringIO
import gzip

baseURL = "https://www.kernel.org/pub/linux/docs/man-pages/"
filename = "man-pages-3.34.tar.gz"
outFilePath = "man-pages-3.34.tar"

response = urllib2.urlopen(baseURL + filename)
compressedFile = StringIO.StringIO()
compressedFile.write(response.read())
#
# Set the file's current position to the beginning
# of the file so that gzip.GzipFile can read
# its contents from the top.
#
compressedFile.seek(0)

decompressedFile = gzip.GzipFile(fileobj=compressedFile, mode='rb')

with open(outFilePath, 'w') as outfile:
    outfile.write(decompressedFile.read())