@echo off

rem You can download from https://github.com/r-koubou/ArticulationUtility/releases
SpreadsheetToExpressionMap.exe *.xlsx

move /Y *.expressionmap ..\
