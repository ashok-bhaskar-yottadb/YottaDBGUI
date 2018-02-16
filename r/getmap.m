getmap ;;2017-12-21
handle()
	;
	new payload,push,status,postid,i

	; Support POST method only
	quit:'$$methodis^request("POST",1)
	
	set status=$$decode^json(request("content"),"push")
  
  ; This is actually where you do processing, like creating a GDE file

  ;new testlocal,responseStr
  ;set responseStr=""
  ;set testlocal("nams","name1")="region1"
  ;set testlocal("nams","name2")="region2"
  ;set testlocal("nams","name3")="region1"
  ;set testlocal("regs","region1","DYNAMIC_SEGMENT")="segment1"
  ;set testlocal("regs","region1","ALLOCATION")=2048
  ;set testlocal("regs","region2","DYNAMIC_SEGMENT")="segment2"
  ;set testlocal("regs","region2","ALLOCATION")=4096
  ;set testlocal("segs","segment1","FILE_NAME")="file1.dat"
  ;set testlocal("segs","segment1","ALLOCATION")=5000
  ;set testlocal("segs","segment2","FILE_NAME")="file1.dat"
  ;set testlocal("segs","segment2","ALLOCATION")=7500
  ;;template data
  ;set testlocal("tmpacc")="BG"
  ;set testlocal("tmpreg","ALLOCATION")=2048
  ;set testlocal("tmpseg","BG","ALLOCATION")=5000
  ;set testlocal("tmpseg","MM","ALLOCATION")=5000

  ;there was an "XML not well-formed, getmap line 2 column 22" (or something) bug that cropped up a few times which I can't reproduce reliably (AKB 2018-02-05)
  ;"XML Parsing Error: not well-formed Location: http://localhost:8080/getmap Line Number 2, Column 22:"

  ;do ^sstep ;DEBUG -remove

  new responseObj,responseStr
  ;do ^sstep ;2018-02 debug code, can be removed
  ;do DUMP^GDE ;AKB 2018-02-05 hacky - storing GDE locals in globals and then immediately reading the globals
  ;merge responseObj("nams")=^nams
  ;merge responseObj("regs")=^regs
  ;merge responseObj("segs")=^segs
  ;merge responseObj("tmpacc")=^tmpacc
  ;merge responseObj("tmpreg")=^tmpreg
  ;merge responseObj("tmpseg")=^tmpseg
  ;merge responseObj("minreg")=^minreg
  ;merge responseObj("maxreg")=^maxreg
  ;merge responseObj("minseg")=^minseg
  ;merge responseObj("maxseg")=^maxseg
  if $ZJOBEXAM() ;DEBUG - remove
  do DUMP^GDE
  if $ZJOBEXAM() ;DEBUG - remove
  merge responseObj=getMapData
  set responseStr=$$encode^json("responseObj")
  
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
