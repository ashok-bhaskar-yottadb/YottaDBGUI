;################################################################
;								#
; Copyright (c) 2017,2018 YottaDB LLC. and/or its subsidiaries.	#
; All rights reserved.						#
;								#
;	This source code contains the intellectual property	#
;	of its copyright holder(s), and is made available	#
;	under a license.  If you do not know the terms of	#
;	the license, please stop and do not read further.	#
;								#
;################################################################

 zb listen^databallet
 zb serve^databallet
 zb sendresphdr^response
 zb send^response
 zb route^routing
 ; zb handle^getmap
 s $zstep="n o s o=$io u $p w $t(@$zpos) b  u o"
 d listen^databallet("http",1)
