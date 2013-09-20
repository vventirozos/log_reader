#!/usr/bin/env python
import csv
import string
import sys
import re

reader = csv.reader(sys.stdin, delimiter=',')

cont = [ '' , 'SET' ]
for row in reader:
     if len(row[3]) < 1 or ( row[2] in cont ):
        continue
     else:
         print '%s-%s\t%s' % (row[2], string.join(string.split(row[4][:-6],'.')[:3] + ['0'], '.'), 1)
#        print '%s:00:00\t%s\t%s\t%s' % (row[0][:-14], row[2], row[4][:-6], 1)
#                print '%s\t%s' % (row[7], 1)               
#                string.join(string.split(variable,'.')[:3] + ['0'], '.')
    