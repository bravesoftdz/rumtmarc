unit nsIntegrationModelPart;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Integration"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Integration/Implementation/nsIntegrationModelPart.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> F1 �������� ��� �����������::F1 Without Usecases::Integration::Implementation::nsIntegrationModelPart
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  Types,
  SysUtils,
  Classes,
  Windows
  ;

const
  { Integration Constants }
 CDefaultIniValue = 'ApplicationAdapterOptions';
 CDefaultIniParamName = '-GCMConfigFile';
 CLauncher = 'garant.exe';
 CMainWindowClass = 'TnsMainWindow';
 CPrimeWindowClass = 'TnsEmptyMainForm';
 CStartupSupportClass = 'TnsStartupSupport:{65591D5E-77E5-4699-BF40-E7B1FB186037}';
 CDefaultRootKey = HKEY_CURRENT_USER;
 CDefaultPathKey = 'SOFTWARE\GARANT.F1';
 CDefaultLocaleIDValueName = 'Locale';
 c_SomeError = 1;
 c_AnotherInstanceRunning = 2;

type
 TLongArrayRange = 0..2147483646;

 TLongArray = array [TLongArrayRange] of Byte;

 ELauncherError = class(Exception)
 end;//ELauncherError

 TRunWaitFunc = procedure  of object;

 PLongArray = ^TLongArray;

var g_QueueLock : TRTLCriticalSection;

var g_Message : THandle;

var g_LastMainWindowMessage : THandle;
function GarantShowLink(aRef: PAnsiChar;
  aOpenInNewWindow: Boolean;
  aTimeOut: DWORD): Integer; stdcall;
function AquireGarant(var aWnd: HWND;
  aTimeOut: DWORD;
  out aLaunched: Boolean;
  const aLauncherPath: AnsiString = ''): Integer;
function BuildLink(aRef: PAnsiChar;
  aOpenInNewWindow: Boolean;
  out aSize: Integer): Pointer;
function TrySend(aWnd: HWND;
  aData: Pointer;
  aDataSize: Integer): Integer;
function AquireLauncher: AnsiString;
function RunProcess(const aApplication: AnsiString;
  const aCommandLine: AnsiString;
  const aCurrentDirectory: AnsiString;
  aWaitForExit: Boolean = True;
  aWaitFunc: TRunWaitFunc = nil): DWORD;
procedure FillFixCommaText(aList: TStrings;
  const aValue: AnsiString;
  aSeparator: AnsiChar);
function QuoteStringIfNeed(const aString: AnsiString): AnsiString;
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  nsIntegrationSupport,
  l3Base,
  Messages,
  Registry,
  LocaleMessages
  ;

// unit methods

function GarantShowLink(aRef: PAnsiChar;
  aOpenInNewWindow: Boolean;
  aTimeOut: DWORD): Integer;
//#UC START# *51371BFC01BD_51371A9402FA_var*
var
 l_Wnd: HWND;
 l_Data: Pointer;
 l_Size: Integer;
 l_Launched: Boolean;
 l_Handle: THandle;
//#UC END# *51371BFC01BD_51371A9402FA_var*
begin
//#UC START# *51371BFC01BD_51371A9402FA_impl*
  l_Handle := CreateMutex(nil,False,c_IntergationMutexName);
  try
   Result := AquireGarant(l_Wnd, aTimeOut, l_Launched);
   if Result = GI_OK then
   begin
    EnterCriticalSection(g_QueueLock);
    try
     l_Data := BuildLink(aRef, aOpenInNewWindow and not l_Launched, l_Size);
     try
      Result := TrySend(l_Wnd, l_Data, l_Size);
     finally
      FreeMem(l_Data, l_Size);
     end;
    finally
     LeaveCriticalSection(g_QueueLock);
    end;
   end;
  finally
   CloseHandle(l_Handle);
  end;
//#UC END# *51371BFC01BD_51371A9402FA_impl*
end;//GarantShowLink

function AquireGarant(var aWnd: HWND;
  aTimeOut: DWORD;
  out aLaunched: Boolean;
  const aLauncherPath: AnsiString = ''): Integer;
//#UC START# *51371F1602E9_51371A9402FA_var*
var
 l_Tick: DWORD;
 l_Launcher: AnsiString;
 l_CheckCounter: Integer;
 l_HasSupportWindow: Boolean;
//#UC END# *51371F1602E9_51371A9402FA_var*
begin
//#UC START# *51371F1602E9_51371A9402FA_impl*
 Result := GI_OK;
 l_Tick := GetTickCount;
 aLaunched := FindWindow(CStartupSupportClass,nil) <> 0;
 l_HasSupportWindow := aLaunched;
 l_CheckCounter := 0;
 repeat
  aWnd := FindWindow(CMainWindowClass,nil);
  if (aWnd = 0) and (FindWindow(CPrimeWindowClass,nil)<>0) then
  begin
   Result := GI_BUSY;
   Exit;
  end;
  if (aWnd = 0) and not aLaunched then
  begin
   if aLauncherPath = '' then
    l_Launcher := AquireLauncher
   else
   begin
    l_Launcher := aLauncherPath;
    if l_Launcher[Length(aLauncherPath)] <> '\' then
     l_Launcher := l_Launcher + '\';
    l_Launcher := l_Launcher + CLauncher;
    if not FileExists(l_Launcher) then
     l_Launcher := '';
   end;
   if l_Launcher = '' then
   begin
    Result := GI_NOTFOUND;
    Exit;
   end;
   try
    if RunProcess(ExtractFileName(l_Launcher), '', ExtractFilePath(l_Launcher), True) <> 0 then
    begin
     Result := GI_NOTFOUND;
     Exit;
    end;
   except
    Result := GI_NOTFOUND;
    Exit;
   end;
   aLaunched := True;
  end;
  Sleep(100);
  if aLaunched then
  begin
   if l_HasSupportWindow then
   begin
    if FindWindow(CStartupSupportClass,nil) <> 0 then
     l_CheckCounter := 0
    else
     Inc(l_CheckCounter);
    if l_CheckCounter >= 5 then
    begin
     Result := GI_USERDENYLOGIN;
     Exit;
    end;
   end
   else
    l_HasSupportWindow := FindWindow(CStartupSupportClass,nil) <> 0;
  end;
 until ((aWnd <> 0) and IsWindowVisible(aWnd)) or (aTimeOut < (GetTickCount - l_Tick));
 if aWnd = 0 then
  Result := GI_TIMEOUT;
//#UC END# *51371F1602E9_51371A9402FA_impl*
end;//AquireGarant

function BuildLink(aRef: PAnsiChar;
  aOpenInNewWindow: Boolean;
  out aSize: Integer): Pointer;
//#UC START# *513720A3039A_51371A9402FA_var*
//#UC END# *513720A3039A_51371A9402FA_var*
begin
//#UC START# *513720A3039A_51371A9402FA_impl*
 aSize := SizeOf(TIntegrationData)+StrLen(aRef)+1;
 GetMem(Result, aSize);
 with TIntegrationData(Result^) do
 begin
  Kind := idkLink;
  LinkLength := StrLen(aRef);
  l3Move(aRef^,Link, LinkLength);
  PLongArray(@Link)^[LinkLength] := 0;
  OpenInNewWindow := aOpenInNewWindow;
 end;
//#UC END# *513720A3039A_51371A9402FA_impl*
end;//BuildLink

function TrySend(aWnd: HWND;
  aData: Pointer;
  aDataSize: Integer): Integer;
//#UC START# *51373C010355_51371A9402FA_var*
var
 l_Result: LRESULT;
 l_Data: TCopyDataStruct;
//#UC END# *51373C010355_51371A9402FA_var*
begin
//#UC START# *51373C010355_51371A9402FA_impl*
 Result := GI_BUSY;
 l_Data.dwData := g_LastMainWindowMessage;
 l_Data.cbData := 0;
 l_Data.lpData := nil;
 l_Result := SendMessage(aWnd, WM_COPYDATA, 0, LPARAM(@l_Data));
 if l_Result <> 0 then
 begin
  SetForegroundWindow(HWND(l_Result));
  l_Data.dwData := g_Message;
  l_Data.cbData := aDataSize;
  l_Data.lpData := aData;
  l_Result := SendMessage(aWnd, WM_COPYDATA, 0, LPARAM(@l_Data));
  if UINT(l_Result) = g_Message then
   Result := GI_OK
  else
   Result := l_Result;
 end;
//#UC END# *51373C010355_51371A9402FA_impl*
end;//TrySend

function AquireLauncher: AnsiString;
//#UC START# *5137406E02B6_51371A9402FA_var*
var
 l_Reg: TRegistry;
 l_Path: AnsiString;
 l_List: TStringList;
 l_Idx: Integer;
//#UC END# *5137406E02B6_51371A9402FA_var*
begin
//#UC START# *5137406E02B6_51371A9402FA_impl*
 Result := '';
 l_Reg := TRegistry.Create;
 try
  l_Reg.RootKey := CDefaultRootKey;
  if l_Reg.OpenKeyReadOnly(CDefaultPathKey) then
  begin
   l_Path := l_Reg.ReadString(CDefaultIniValue);
   if l_Path <> '' then
   begin
    l_List := TStringList.Create;
    try
     FillFixCommaText(l_List,l_Path,' ');
     l_Idx := l_List.IndexOf(CDefaultIniParamName);
     if (l_Idx<>-1) and (l_Idx < l_List.Count-2) then
     begin
      l_Path := l_List[l_Idx+1];
      if FileExists(ExtractFilePath(l_Path)+CLauncher) then
       Result := ExtractFilePath(l_Path)+CLauncher;
     end;
    finally
     l_List.Free;
    end;
   end;
  end;
 finally
  l_Reg.Free;
 end;
//#UC END# *5137406E02B6_51371A9402FA_impl*
end;//AquireLauncher

function RunProcess(const aApplication: AnsiString;
  const aCommandLine: AnsiString;
  const aCurrentDirectory: AnsiString;
  aWaitForExit: Boolean = True;
  aWaitFunc: TRunWaitFunc = nil): DWORD;
//#UC START# *5137451100D9_51371A9402FA_var*
 function GetCreationFlags: DWORD;
 begin
  Result := DWORD(CREATE_DEFAULT_ERROR_MODE or DETACHED_PROCESS or NORMAL_PRIORITY_CLASS);
 end;
 //
const
 c_WaitTime: DWORD = 250; // 0.25 of second
var
 l_Application: AnsiString;
 l_Commandline: AnsiString;
 l_ProcessInformation: TProcessInformation;
 l_StartupInfo: {$IfDef XE}TStartupInfoA{$Else}TStartupInfo{$EndIf};
//#UC END# *5137451100D9_51371A9402FA_var*
begin
//#UC START# *5137451100D9_51371A9402FA_impl*
 l_Application := Format('%s\%s', [aCurrentDirectory, aApplication]);
 //
 if FileExists(l_Application) then
 begin
  Result := DWORD(STILL_ACTIVE);
  //
  l3FillChar(l_StartupInfo, SizeOf(l_StartupInfo), $00);
  with l_StartupInfo do
  begin
   cb := DWORD(SizeOf(l_StartupInfo));
   dwFlags := STARTF_USESTDHANDLES;
  end;
  //
  l_CommandLine := QuoteStringIfNeed(l_Application);
  if (aCommandLine <> '') then
   l_CommandLine := Format('%s %s', [l_CommandLine, aCommandLine]);
  //
  if CreateProcessA(nil, PAnsiChar(l_CommandLine), nil, nil, False, GetCreationFlags, nil, PAnsiChar(aCurrentDirectory), l_StartupInfo, l_ProcessInformation) then
  begin
   with l_ProcessInformation do
   begin
    CloseHandle(hThread);
    try
     if aWaitForExit then
      repeat
       if (WaitForSingleObject(hProcess, c_WaitTime) = WAIT_FAILED) then
        TerminateProcess(hProcess, WAIT_FAILED);
       //
       if Assigned(aWaitFunc) then
        aWaitFunc;
       Win32Check(GetExitCodeProcess(hProcess, Result));
      until (Result <> DWORD(STILL_ACTIVE))
     else
      Result := 0;
    finally
     CloseHandle(hProcess);
    end;
   end;
  end
  else
   raise ELauncherError.Create(Format(GetCurrentLocaleMessage(c_CommonUnableStartProcess), [l_Application]));
 end
 else
  raise ELauncherError.Create(Format(GetCurrentLocaleMessage(c_CommonFileNotFound), [l_Application]));
//#UC END# *5137451100D9_51371A9402FA_impl*
end;//RunProcess

procedure FillFixCommaText(aList: TStrings;
  const aValue: AnsiString;
  aSeparator: AnsiChar);
//#UC START# *5137495300DB_51371A9402FA_var*
var
  P, P1: PAnsiChar;
  S: AnsiString;
  QUoteCnt: Integer;
//#UC END# *5137495300DB_51371A9402FA_var*
begin
//#UC START# *5137495300DB_51371A9402FA_impl*
 AList.BeginUpdate;
 try
  AList.Clear;
  P := PAnsiChar(aValue);
  while P^ in [#1..#31] do
   P := CharNextA(P);
  while P^ <> #0 do
  begin
   if P^ = '"' then
   begin
    QUoteCnt:=1;
    P1 := P;
    repeat
     P:=CharNextA(P);
     if P^ = '"' then
      Inc(QUoteCnt);
    until (((QUoteCnt mod 2) = 0) and (P^ = aSeparator)) or (P^ = #0);
    Inc(P1);
    SetString(S, P1, P - P1 - 1);
   end else
   begin
    P1 := P;
    while (P^ > ' ') and (P^ <> aSeparator) do
     P := CharNextA(P);
    SetString(S, P1, P - P1);
   end;
   AList.Add(S);
   while P^ in [#1..#31] do
    P := CharNextA(P);
   if P^ = aSeparator then
   repeat
    P := CharNextA(P);
   until not (P^ in [#1..#31]);
  end;
 finally
  AList.EndUpdate;
  Finalize(S);
 end;
//#UC END# *5137495300DB_51371A9402FA_impl*
end;//FillFixCommaText

function QuoteStringIfNeed(const aString: AnsiString): AnsiString;
//#UC START# *513744E00069_51371A9402FA_var*
//#UC END# *513744E00069_51371A9402FA_var*
begin
//#UC START# *513744E00069_51371A9402FA_impl*
 if ((Pos(' ', aString) <> 0) or (Pos('''', aString) <> 0)) then
  Result := Format('"%s"', [aString])
 else
  Result := aString;
//#UC END# *513744E00069_51371A9402FA_impl*
end;//QuoteStringIfNeed
{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
//#UC START# *5137215D0134*
 g_Message := RegisterWindowMessage(c_IntegrationMessageName);
 g_LastMainWindowMessage := RegisterWindowMessage(c_LastMainWindowMessageName);
 //
 InitializeCriticalSection(g_QueueLock);
//#UC END# *5137215D0134*
{$IfEnd} //not Admin AND not Monitorings

finalization
{$If not defined(Admin) AND not defined(Monitorings)}
//#UC START# *5137217100C6*
 DeleteCriticalSection(g_QueueLock);
//#UC END# *5137217100C6*
{$IfEnd} //not Admin AND not Monitorings

end.