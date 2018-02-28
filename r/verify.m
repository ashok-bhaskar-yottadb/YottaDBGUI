	;								
	; Copyright (c) 2017-2018 YottaDB LLC. and/or its subsidiaries.	
	; All rights reserved.						
	;								
	;	This source code contains the intellectual property	
	;	of its copyright holder(s), and is made available	
	;	under a license.  If you do not know the terms of	
	;	the license, please stop and do not read further.	
	;	

verify ;;verify the GDE locals sent from the client as valid/invalid
handle()
	;
	new payload,push,status,postid,i

	; Support POST method only
	quit:'$$methodis^request("POST",1)
	
	set status=$$decode^json(request("content"),"push")
  
  ; This is actually where you do processing, like creating a GDE file

  ;new clientVars,responseObj,responseStr,responseStatusStr
  ;set (responseStr,responseStatusStr)=""
  ;merge clientVars=push ;NOTE: the object sent from the client doesn't contain the nams/regs/segs count component stored in the unsubscripted spot
                        ;i.e. while GDE has locals like nams=2, regs=2, segs=1 storing the num of names/regions/segments, the client doesn't send that data back
                        ;after changes on the client side which may change those numbers
  ;if nameStr'="err" set responseStatusStr="success"
  ;else  set responseStatusStr="failure"
  ;set responseObj("status")=responseStatusStr
  ;set responseStr=$$encode^json("responseObj")

  ;2012-02-27 AKB - why is the verify response XML with a stringified JSON object among other lines, while the getmap response is just a JSON object?

  new responseObj,responseStr,verifyStatus
  set (responseStr,verifyStatus)=""
  new nams,regs,segs,tmpacc,tmpreg,tmpseg,minreg,maxreg,minseg,maxseg
  merge nams=push("nams") ;NOTE: the object sent from the client doesn't contain the nams/regs/segs count component stored in the unsubscripted spot
                          ;i.e. while GDE has locals like nams=2, regs=2, segs=1 storing the num of names/regions/segments, the client doesn't send that data back
                          ;after changes on the client side which may change those numbers
  merge regs=push("regs")
  merge segs=push("segs")
  merge tmpacc=push("tmpacc")
  merge tmpreg=push("tmpreg")
  merge tmpseg=push("tmpseg")
  do GDEINIT^GDEINIT
  do GDEMSGIN^GDEMSGIN
  i $$ALL^GDEVERIF s verifyStatus="success"
  e  s verifyStatus="failure"
  set responseObj("verifyStatus")=verifyStatus
  set responseStr=$$encode^json("responseObj")
  ;if $ZJOBEXAM() ;DEBUG -remove

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

  ;if $ZJOBEXAM() ;DEBUG -remove

	quit
