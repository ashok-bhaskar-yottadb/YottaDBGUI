userconf;
	; Server string.
	;  Use "min" for "DataBallet", or "full" for "DataBallet-<version> (<>)" (ex. : "DataBallet-20120606 (GT.M V5.5-000 Linux x86)").
	;  Any other string will default to "min".
	set conf("serverstring")="full"
	; Listening port
	set conf("listenon","http")=8080
	set conf("listenon","https")=8081
	; Default document name
	set conf("index")="index.html"
	; Error log file
	set conf("errorlog")="/tmp/fis-gtm/V6.3-002_x86_64/databallet_error.log"
	; Common Log Format file
	set conf("log")="/tmp/fis-gtm/V6.3-002_x86_64/databallet_access.log"
	; Extended Log Format file
	set conf("extlog")="/tmp/fis-gtm/V6.3-002_x86_64/databallet_extended.log"
	;
	; Globals configuration
	;
	set TMP="TMPLOCAL" ;2018-02-09 AKB changed TMP, CACHE, and SESSION to locals by removing the ^s; 02-13 appended "LOCAL" to avoid self-reference 
	set CACHE="CACHELOCAL"
	set SESSION="SESSIONLOCAL"
	;
	; Routing configuration
	;
	; Default document root, with static file serving.
	set conf("routing","*","/")="do handle^static(""/home/gtmuser/DataBallet-master/web/"")"
        set conf("routing","*","/post")="do handle^mypost()"
        set conf("routing","*","/getmap")="do handle^getmap()"
        set conf("routing","*","/verify")="do handle^verify()"
        set conf("routing","*","/save")="do handle^save()"
	; Example: Disabling default host
	; set conf("routing","*","/")="do handle^static(""/dev/null"")"
	; Example: Adding a virtual host
	; set conf("routing","EXAMPLE.COM","/")="do handle^static(""/var/www/localhost/example/"")"
	; set conf("routing","WWW.EXAMPLE.COM","/")=conf("routing","EXAMPLE.COM","/")
	; Example: Map a url root to a different doc root
	; set conf("routing","*","/blog")="do handle^static(""/var/www/localhost/other/"",""/blog/"")"
