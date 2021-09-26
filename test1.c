PROGRAM prog1

FUNCTION f1(e,g)
VARS INTEGER e,g;
		e=(1+g)*3;
RETURN e
END_FUNCTION


STARTMAIN
VARS INTEGER r;

r=f1(10,2);

PRINT("result=",r);


IF (r<0) THEN 
	PRINT("Not valid");
ENDIF



ENDMAIN

