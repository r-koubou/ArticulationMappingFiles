@echo off

rem You can download from https://github.com/r-koubou/XLS2ExpressionMap/releases
for %%i in (*.xlsx) do (
    XLS2Expressionmap.exe "%%i"
)

move /Y *.expressionmap ..\
