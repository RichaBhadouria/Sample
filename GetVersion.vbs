﻿' 
' Dim objShell,strLogonServer,strDNSdomain
' 
' strLogonServer = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{0B6BDD27-3097-4FE1-BDE6-1D5EC7399563}\DisplayVersion"
' 'strDNSdomain = "HKEY_CURRENT_USER\Volatile Environment\USERDNSDOMAIN"
' 
' Set objShell = WScript.CreateObject("WScript.Shell")
' str=objShell.RegRead(strLogonServer) 
' MsgBox "Logon server: " & str
' 'MsgBox "DNS domain: " objShell.RegRead(strDNSdomain) 
'richa
'comment



Dim objNetwork, objShell, objFileSys, objEnv, objReg, objWMIService,objItem, colItems, objShellApp, objLocator, objCtx, objStdRegProv, objServices 
Dim strComputer, strCurrDir, vDecision, strCmd, strRC, strPFpath, strUninstallPath, strSWpath, strOSver, strOSname, intOSType  
Dim blnInstalled, blnChkInstall, bln64BitOS, bln64BitApp, blnXenApp, blnExecute, blnSrv, blnMan, blnElev, blnAdmin, blnSP1Installed 
Dim strAlreadyInst_Msg, strCancel_Msg, strSuccess_Msg, strNoReboot_Msg, strFailed_Msg, strWrongOS_Msg, strNonAdmin_Msg 
Dim objOpSys, colOpSys, strProdCode 		
Dim strKeyPath, strValueName, strValue, strSuffix, strUserName
Dim objLogFile, strLogName, strLogText, strLogPath	
Dim OpSys, OpSysSet, delFile

Set objNetwork = WScript.CreateObject("WScript.Network")
Set objShellApp = CreateObject("Shell.Application")
Set objShell = WScript.CreateObject("Wscript.Shell")
Set objFileSys = CreateObject("Scripting.FileSystemObject")
Set objEnv = objShell.Environment("PROCESS")

strComputer = objNetwork.ComputerName

Set objReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\default:StdRegProv")
Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

strCurrDir = objFileSys.GetParentFolderName(WScript.ScriptFullName)
str="""" & strCurrDir & "\setup\setup.exe "" /s /f1""" & strCurrDir & "\setup\installSP7.0.iss""" 
MsgBox str 
