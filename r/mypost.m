;This is a demo file Sam Habiel made; it isn't needed in the final product
;I've used this code as the basis for several POST routines

mypost ;;2017-12-20  3:08 PM
handle()
	;
	new payload,push,status,postid,i

	; Support POST method only
	quit:'$$methodis^request("POST",1)
	
	set status=$$decode^json(request("content"),"push")
  
  ; This is actually where you do processing, like creating a GDE file

  if $ZJOBEXAM()

  ;merge ^sam=push

  ; This is a reply. You can just say 201 created in the status and be done.
	if status=0 do
	.	do addcontent^response("Thanks! :)")
	else  do addcontent^response("Sorry... :(")

	; Set content-type, plain text here as nobody really care for the response anyway, I think...
	set response("headers","Content-Type")="text/plain"

	; No cache for this.
	set response("headers","Cache-Control")="no-cache"

	; Get md5sum of the generated content.
	do md5sum^response()

	; Validate the cache
	do validatecache^request()

	quit
