import csv
import re
import sys

print "hi importing went ok!"

from sys import argv

datafile = csv.DictReader(open("A0E.csv", 'r'))
data = dict([ (record['Session'], (record['Child Code'], record['OT Code'], record['Matlab Time in Seconds (half second interval)'], record['Child EDA Foot 1'], record['Child EDA Foot 2'], record['OT EDA Foot 1'], record['OT EDA Foot 2'], record['Activity Code'], ), ) for record in datafile ])

#print(diagcode)

print "hi I made it this far!"

outfile = open("A0E.js", 'w')
outfile.write('eventID = [ ' + ','.join([ data[x][0] for x in sorted(data.keys(), key=int) ]) + ']\n\n')

print "wrote the first one"
outfile.write('session = [ ' + ','.join([ data[x][1] for x in sorted(data.keys(), key=int) ]) + ']\n\n')
outfile.write('childCode = [ ' + ','.join([ data[x][2] for x in sorted(data.keys(), key=int) ]) + ']\n\n')
outfile.write('matlabTime = [ ' + ','.join([ data[x][3] for x in sorted(data.keys(), key=int) ]) + ']\n\n')
outfile.write('childEdaF1 = [ ' + ','.join([ data[x][4] for x in sorted(data.keys(), key=int) ]) + ']\n\n')
outfile.write('childEdaF2 = [ ' + ','.join([ data[x][5] for x in sorted(data.keys(), key=int) ]) + ']\n\n')
outfile.write('otEdaF1 = [ ' + ','.join([ data[x][6] for x in sorted(data.keys(), key=int) ]) + ']\n\n')
outfile.write('otEdaF2 = [ ' + ','.join([ data[x][7] for x in sorted(data.keys(), key=int) ]) + ']\n\n')
outfile.write('activityCode = [ ' + ','.join([ data[x][8] for x in sorted(data.keys(), key=int) ]) + ']\n\n')
outfile.close()
