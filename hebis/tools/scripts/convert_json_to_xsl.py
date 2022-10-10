#!/usr/bin/python3
import json
import sys

with open(sys.argv[1]) as file:
    data = json.load(file)
    for i in data[list(data.keys())[0]]:
        print("<xsl:when test=\".='" + i['code'] + "'\">" + i['id'] + "</xsl:when>")
