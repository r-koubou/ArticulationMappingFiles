@echo off

rem You can download from https://github.com/r-koubou/XLS2ExpressionMap/releases
XLS2Expressionmap.exe VHG.xlsx

move /Y *.expressionmap ..\
