@echo off

rem You can download from https://github.com/r-koubou/XLS2ExpressionMap/releases
for %%i in (*.expressionmap) do (
    call ExpressionMap2Tsv.bat "%%i"
)
