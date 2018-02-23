	;								
	; Copyright (c) 2017-2018 YottaDB LLC. and/or its subsidiaries.	
	; All rights reserved.						
	;								
	;	This source code contains the intellectual property	
	;	of its copyright holder(s), and is made available	
	;	under a license.  If you do not know the terms of	
	;	the license, please stop and do not read further.	
	;	

sstep;
        kill %sstep set $zstep="set %sstep($incr(%sstep))=$j($zpos,20)_"" : ""_$text(@$zpos) zstep into"
        zb sstep+3^sstep:"zstep into"
        quit
