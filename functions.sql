
CREATE or replace FUNCTION geoloc_lon(text) RETURNS text AS '#!/bin/sh 
a=`/usr/bin/curl -s ipinfo.io/$1/loc 2>&1 |/bin/sed s/\"//g `;var1=$(echo $a| cut -f1 -d,) ; var2=$(echo $a| cut -f2 -d,); echo $var2
' LANGUAGE plsh;

CREATE or replace FUNCTION geoloc_lat(text) RETURNS text AS '#!/bin/sh 
a=`/usr/bin/curl -s ipinfo.io/$1/loc 2>&1 |/bin/sed s/\"//g `;var1=$(echo $a| cut -f1 -d,) ; var2=$(echo $a| cut -f2 -d,); echo $var1
' LANGUAGE plsh;

create or replace function geoloc_city (text) returns text AS '#!/bin/sh
a=`/usr/bin/curl -s ipinfo.io/$1/city 2>&1 |/bin/sed s/\"//g `;var1=$(echo $a| cut -f1 -d\ );echo $var1
' LANGUAGE plsh;

create or replace function geoloc_region (text) returns text AS '#!/bin/sh
a=`/usr/bin/curl -s ipinfo.io/$1/region 2>&1 |/bin/sed s/\"//g`;var1=$(echo $a| cut -f1 -d\ );echo $var1
' LANGUAGE plsh;

create or replace function geoloc_country (text) returns text AS '#!/bin/sh
a=`/usr/bin/curl -s ipinfo.io/$1/country 2>&1 |/bin/sed s/\"//g `;var1=$(echo $a| cut -f1 -d\ );echo $var1
' LANGUAGE plsh;
