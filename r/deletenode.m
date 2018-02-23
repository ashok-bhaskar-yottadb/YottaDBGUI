;################################################################
;								#
; Copyright (c) 2018 YottaDB LLC. and/or its subsidiaries.	#
; All rights reserved.						#
;								#
;	This source code contains the intellectual property	#
;	of its copyright holder(s), and is made available	#
;	under a license.  If you do not know the terms of	#
;	the license, please stop and do not read further.	#
;								#
;################################################################

deletenode ;;2018-01 AKB - delete this routine - no longer necessary
handle()
	;
	new payload,push,status,postid,i

	; Support POST method only
	quit:'$$methodis^request("POST",1)
	
	set status=$$decode^json(request("content"),"push")
  
  ; This is actually where you do processing, like creating a GDE file

  new testlocal,responseStr,responseStatusStr,regionStr
  set (responseStr,responseStatusStr,regionStr)=""
  set regionStr=push("region");
  if regionStr="mammals" set responseStatusStr="success"
  else  set responseStatusStr="failure"
  set testlocal("status")=responseStatusStr
  set responseStr=$$encode^json("testlocal")
  ;set ^ashokvar("data")=responseStr ;debug - remove this
  ;set ^ashokvar("time")=$zh ;debug - remove this

  ; This is a reply. You can just say 201 created in the status and be done.
	if status=0 do
	.	do addcontent^response(responseStr)
	else  do addcontent^response("Sorry... :(")

	; Set content-type here as nobody really care for the response anyway, I think...
	set response("headers","Content-Type")="application/json"

	; No cache for this.
	set response("headers","Cache-Control")="no-cache"

	; Get md5sum of the generated content.
	do md5sum^response()

	; Validate the cache
	do validatecache^request()

	quit
