%WINI001 ; ; 22-NOV-2013
 ;;0.2;MASH WEB SERVER;;NOV 22, 2013
 Q:'DIFQ(17.6001)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,999) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^DIC(17.6001,0,"GL")
 ;;=^%W(17.6001,
 ;;^DIC("B","WEB SERVICE URL HANDLER",17.6001)
 ;;=
 ;;^DD(17.6001,0)
 ;;=FIELD^^14^7
 ;;^DD(17.6001,0,"DT")
 ;;=3130507
 ;;^DD(17.6001,0,"NM","WEB SERVICE URL HANDLER")
 ;;=
 ;;^DD(17.6001,.01,0)
 ;;=HTTP VERB^RS^POST:POST;PUT:PUT;GET:GET;DELETE:DELETE;OPTIONS:OPTIONS;HEAD:HEAD;TRACE:TRACE;CONNECT:CONNECT;^0;1^Q
 ;;^DD(17.6001,.01,1,0)
 ;;=^.1^^0
 ;;^DD(17.6001,.01,3)
 ;;=
 ;;^DD(17.6001,.01,"DT")
 ;;=3130327
 ;;^DD(17.6001,1,0)
 ;;=URI^F^^1;E1,250^K:$L(X)>250!($L(X)<1) X
 ;;^DD(17.6001,1,3)
 ;;=
 ;;^DD(17.6001,1,"DT")
 ;;=3130327
 ;;^DD(17.6001,2,0)
 ;;=EXECUTION ENDPOINT^F^^2;E1,250^K:$L(X)>250!($L(X)<1) X
 ;;^DD(17.6001,2,3)
 ;;=
 ;;^DD(17.6001,2,"DT")
 ;;=3130327
 ;;^DD(17.6001,11,0)
 ;;=AUTHENTICATION REQUIRED?^S^1:YES;^AUTH;1^Q
 ;;^DD(17.6001,11,"DT")
 ;;=3130506
 ;;^DD(17.6001,12,0)
 ;;=KEY^P19.1'^DIC(19.1,^AUTH;2^Q
 ;;^DD(17.6001,12,"DT")
 ;;=3130506
 ;;^DD(17.6001,13,0)
 ;;=REVERSE KEY^P19.1'^DIC(19.1,^AUTH;3^Q
 ;;^DD(17.6001,13,"DT")
 ;;=3130507
 ;;^DD(17.6001,14,0)
 ;;=OPTION^P19'^DIC(19,^AUTH;4^Q
 ;;^DD(17.6001,14,"DT")
 ;;=3130506
 ;;^UTILITY("KX",$J,"IX",17.6001,17.6001,"B",0)
 ;;=17.6001^B^Uniqueness Index for Key 'A' of File #17.6001^R^^R^IR^I^17.6001^^^^^LS
 ;;^UTILITY("KX",$J,"IX",17.6001,17.6001,"B",1)
 ;;=S ^%W(17.6001,"B",X(1),X(2),X(3),DA)=""
 ;;^UTILITY("KX",$J,"IX",17.6001,17.6001,"B",2)
 ;;=K ^%W(17.6001,"B",X(1),X(2),X(3),DA)
 ;;^UTILITY("KX",$J,"IX",17.6001,17.6001,"B",2.5)
 ;;=K ^%W(17.6001,"B")
 ;;^UTILITY("KX",$J,"IX",17.6001,17.6001,"B",11.1,0)
 ;;=^.114IA^3^3
 ;;^UTILITY("KX",$J,"IX",17.6001,17.6001,"B",11.1,1,0)
 ;;=1^F^17.6001^.01^^1
 ;;^UTILITY("KX",$J,"IX",17.6001,17.6001,"B",11.1,2,0)
 ;;=2^F^17.6001^1^^2
 ;;^UTILITY("KX",$J,"IX",17.6001,17.6001,"B",11.1,3,0)
 ;;=3^F^17.6001^2^^3
 ;;^UTILITY("KX",$J,"KEY",17.6001,17.6001,"A",0)
 ;;=17.6001^A^P^897
 ;;^UTILITY("KX",$J,"KEY",17.6001,17.6001,"A",2,0)
 ;;=^.312IA^3^3
 ;;^UTILITY("KX",$J,"KEY",17.6001,17.6001,"A",2,1,0)
 ;;=.01^17.6001^1
 ;;^UTILITY("KX",$J,"KEY",17.6001,17.6001,"A",2,2,0)
 ;;=1^17.6001^2
 ;;^UTILITY("KX",$J,"KEY",17.6001,17.6001,"A",2,3,0)
 ;;=2^17.6001^3
 ;;^UTILITY("KX",$J,"KEYPTR",17.6001,17.6001,"A")
 ;;=176.801^SID
