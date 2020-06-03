@echo off

rem You can download from https://github.com/r-koubou/XLS2ExpressionMap/releases
for %%i in (*.xlsx) do (
    call XLS2Expressionmap.bat "%%i"
)

move /Y *.expressionmap ..\
