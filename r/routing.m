	; This file is part of DataBallet.
	; Copyright (C) 2012 Laurent Parenteau <laurent.parenteau@gmail.com>
	;								
	; Copyright (c) 2017-2018 YottaDB LLC. and/or its subsidiaries.	
	; All rights reserved.						
	;								
	;	This source code contains the intellectual property	
	;	of its copyright holder(s), and is made available	
	;	under a license.  If you do not know the terms of	
	;	the license, please stop and do not read further.	
	;	
	; DataBallet is free software: you can redistribute it and/or modify
	; it under the terms of the GNU Affero General Public License as published by
	; the Free Software Foundation, either version 3 of the License, or
	; (at your option) any later version.
	;
	; DataBallet is distributed in the hope that it will be useful,
	; but WITHOUT ANY WARRANTY; without even the implied warranty of
	; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	; GNU Affero General Public License for more details.
	;
	; You should have received a copy of the GNU Affero General Public License
	; along with DataBallet. If not, see <http://www.gnu.org/licenses/>.
	;

route()	;
	; Route the current request and populate the response
	;
	; If no route can be found, a "403 Forbidden" error will be sent.
	;

        ;if $ZJOBEXAM() ;DEBUG - remove

	; First, check in the cache
	quit:$$serve^caching()

	; Find the correct route and handle the request
	new uri,host,handler,len,i
	set uri=request("uri")
	set host=$zpiece($get(request("headers","HOST"),"*"),":",1)
	set:'$data(conf("routing",host)) host="*"
	; Try to locate a handler for the requested URI on the requested host.
	for i=$zlength(uri,"/"):-1:1 do  quit:$get(handler)]""
  . new shorturi set shorturi=$zpiece(uri,"/",1,i)
  . if $data(conf("routing",host,shorturi)) set handler=conf("routing",host,shorturi) quit
  . set shorturi=shorturi_"/"
  . if $data(conf("routing",host,shorturi)) set handler=conf("routing",host,shorturi) quit
	; Otherwise, try that URI on the default host (ie. '*').
	if $get(handler)="" do
	.	set host="*"
	.	for i=$zlength(uri,"/"):-1:1 do  quit:$data(conf("routing",host,uri))
	.	.	set uri=$zpiece(uri,"/",1,i)
	.	.	set:uri="" uri="/"
	.	set handler=$get(conf("routing",host,uri),"do senderr^response(""403"")")

	xecute handler

	; Cache the response
	do update^caching()

	quit 
