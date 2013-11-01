@echo off
rem Adapted from http://sfalla.wordpress.com/2008/10/06/tortoise-svn-client-side-hook-scripts/
rem
rem TortoiseSVN Client Side pre-commit hook script
rem Put this into a Hooks folder on your workstation
rem with the accompanying node script
rem
rem Tortoise SVN will call this script with the following parameters
rem before the commit action
rem
rem script <Path> <Depth> <MessageFile> <Cwd>

rem setlocal

set tsvnPath=%1
set tsvnDepth=%2
set tsvnMsgFile=%3
set tsvnCwd=%4

rem This gets the path of the script being called so that the node script
rem can be referenced correctly, as the script is run from a different working folder
set tsvnHookScriptPath=%~dp0
set tsvnPostCommitScript=ProEsvnPrep.js

rem echo Path %tsvnPath% >> c:\tsvnLog.txt
rem echo Depth %tsvnDepth% >> c:\tsvnLog.txt
rem echo MsgFile %tsvnMsgFile% >> c:\tsvnLog.txt
rem echo Cwd %tsvnCwd% >> c:\tsvnLog.txt

rem Here we are useing a node.js script. http://nodejs.org
rem We make sure output is directed to the console with >CON
node "%tsvnHookScriptPath%\%tsvnPostCommitScript%" %tsvnPath% %tsvnCwd% >CON

rem endlocal