##
CPP := MSBuild.exe

SLN := 

CXXFLAG := /p:configuration=debug /v:d #/v:diag

all:
	${CPP} /t:Rebuild ${CXXFLAG} 

clean:
	${CPP} /t:clean ${CXXFLAG}
