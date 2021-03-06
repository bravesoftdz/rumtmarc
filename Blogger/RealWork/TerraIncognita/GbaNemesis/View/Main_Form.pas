unit Main_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Main_Form.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMMainForm::Class>> F1 �������� ��� �����������::F1 Without Usecases::View::PrimNemesis::Main
//
// ������� �����
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
  l3Interfaces,
  Messages,
  F1_Without_Usecases_System_Controls,
  BaseSearchInterfaces,
  MainOptions_Form,
  PrimBaseSearchInterfaces,
  Classes,
  l3IID,
  Windows
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  ,
  nsIntegrationSupport,
  vcmExternalInterfaces {a},
  vcmEntityForm {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TMainForm = {form} class(TMainOptionsForm, Il3ItemNotifyRecipient, InsBaseSearchResultProcessor, InsBaseSearchDataReadyChecker, InsBaseSearchWindowOpener, InsBaseSearchQueryDataProcessor, Il3MouseWheelListener, InsIntegrationProcessor)
  {* ������� ����� }
 protected
  procedure InitEntities; override;
 private
 // private methods
   procedure WMActivate(var Message: TWMActivate); message WM_ACTIVATE;
   procedure WMActivateApp(var Message: TWMActivateApp); message WM_ACTIVATEAPP;
   procedure WMCopyData(var aMessage: TWMCopyData); message WM_COPYDATA;
   procedure WMDisplayChange(var aMessage: TWMDisplayChange); message WM_DISPLAYCHANGE;
   procedure WMWindowPosChanging(var aMessage: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
 protected
 // realized methods
   procedure Notify(const aNotifier: Il3ChangeNotifier;
    aOperation: Integer;
    aIndex: Integer);
     {* ������ ��������. }
   procedure CheckLocalDataReady;
   procedure SearchResultEmpty(TryFullList: Boolean);
   procedure SearchResultExists;
   procedure AnotherSearchSuccessed;
   procedure OpenWindow(OpenKind: TnsBaseSearchOpenKind);
   procedure SetDataFromQuery(const aQuery: IUnknown);
   procedure RequestFind;
   procedure RequestCheckFragmentsCount;
   procedure RequestCheckFindBack;
   procedure Result_Cancel_Test(const aParams: IvcmTestParamsPrim);
     {* ������ }
   procedure Result_Cancel_GetState(var State: TvcmOperationStateIndex);
     {* ������ }
   procedure Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������ }
   procedure AnotherSearchCancelled;
   procedure MouseWheelListenerNotify(Msg: PMsg;
     var theResult: Tl3HookProcResult);
   function ProcessCommand(aCommand: Integer;
      InNewWindow: Boolean;
      const aContainer: IvcmContainer): Boolean;
   function ProcessLink(aLink: PnsLinkDataArray): Boolean;
   function CheckKey(aKey: PnsLinkDataArray): Boolean;
   procedure CheckInconic;
   procedure Common_MemUsage_Execute(const aParams: IvcmExecuteParamsPrim);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure FinishDataUpdate; override;
   procedure SettingsReplaceFinish; override;
   procedure UserSettingsChanged; override;
     {* ���������� ��������� ������������ }
   procedure StartSettingsEdit; override;
   {$If not defined(NoVCM)}
   procedure DoInit(aFromHistory: Boolean); override;
     {* ������������� �����. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
     {* ���������� ������� ���������� }
   procedure ClearFields; override;
 public
 // overridden public methods
   constructor Create(AOwner: TComponent); override;
 protected
 // protected fields
   f_BaseSearcher : InsBaseSearcher;
   f_NeedShowAdvertising : Boolean;
   f_NeedAskNewSettings : Boolean;
   f_LastWMActivateTickCount : Cardinal;
   f_ActivatesCount : Cardinal;
 protected
 // protected methods
   procedure UpdateUnreadConsultations;
   procedure InitForm;
   procedure PrepareChildZoneBeforeResize(aNewHeight: Integer);
   function BaseSearcher: InsBaseSearcher;
   procedure FillOldBaseWarning; virtual; abstract;
   procedure ShowStartupAdvertising;
   function CheckStartupAdvertisingEnabled: Boolean;
   procedure CheckFirstLoginActivity;
   function CanFirstLoginActivity: Boolean;
   function CheckInstallDefaultSettings: Boolean;
   function IntegrationInProcess: Boolean;
   procedure VcmMainFormShow(Sender: TObject);
 end;//TMainForm
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  afwFacade,
  nsConst,
  lgTypes,
  IOUnit,
  l3String,
  DataAdapter,
  nsOpenUtils,
  SysUtils,
  Forms,
  BaseTypesUnit,
  bsTypes,
  nsManagers,
  Controls,
  nsBaseSearcher,
  nsQueryUtils,
  nsContextHistory,
  MemoryUsage_Form,
  OfficeLike_Result_Controls,
  l3AsincMessageWindow,
  MainWithReminders_Form,
  l3SysUtils
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  IntegrationProjectUnit
  {$If not defined(NoVCM)}
  ,
  vcmMenuManager
  {$IfEnd} //not NoVCM
  ,
  l3ListenersManager,
  HelpIntfs,
  vtVerInf,
  SettingsUnit,
  nsWindowsList,
  nsConfiguration,
  nsValueMaps,
  resWarnImages,
  nsValueMapsIDs,
  nsSettingsUtils,
  StdRes {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

var
   g_IntegrationMessage : Cardinal;
var
   g_LastMainWindowMessage : Cardinal;

// start class TMainForm

procedure TMainForm.UpdateUnreadConsultations;
//#UC START# *4F88013F007B_4A952BA3006D_var*
//#UC END# *4F88013F007B_4A952BA3006D_var*
begin
//#UC START# *4F88013F007B_4A952BA3006D_impl*
 remUnreadConsultations.Visible := ConsultationManager.HasUnread;
 CheckConsultationConnection;
//#UC END# *4F88013F007B_4A952BA3006D_impl*
end;//TMainForm.UpdateUnreadConsultations

procedure TMainForm.InitForm;
//#UC START# *4F8813D6026A_4A952BA3006D_var*
//#UC END# *4F8813D6026A_4A952BA3006D_var*
begin
//#UC START# *4F8813D6026A_4A952BA3006D_impl*
 { ������ ������� ������ ����������� �� �������� }
 if not defDataAdapter.AdministratorLogin then
 begin
  // ������������
  if afw.Settings.LoadBoolean(pi_Sheets_Config, dv_Sheets_Config) then
   TdmStdRes.OpenConfList(Self)
  else
   TdmStdRes.CloseConfList(Self);
  // �������� ����(���������)
  if afw.Settings.LoadBoolean(pi_Sheets_MainMenu, dv_Sheets_MainMenu) then
   TdmStdRes.GetNavigator(nil, Self)
  else
   TdmStdRes.CloseNavigator(Self);
  // ��� ���������
  if afw.Settings.LoadBoolean(pi_Sheets_MyDocuments, dv_Sheets_MyDocuments) then
   TdmStdRes.OpenFolders(Self, true)
  else
   TdmStdRes.CloseFolders(Self);
  // �� ��������
  if afw.Settings.LoadBoolean(piSheetsDocUnderControl, dvSheetsDocUnderControl) then
   TdmStdRes.OpenUnderControl(Self)
  else
   TdmStdRes.CloseUnderControl(Self);
  if afw.Settings.LoadBoolean(piSheetsTaskPanel, dvSheetsTaskPanel) then
  begin
   TdmStdRes.CloseTasksPanel(Self); // http://mdp.garant.ru/pages/viewpage.action?pageId=342864296
   TdmStdRes.OpenTasksPanel(Self);
  end
  else
   TdmStdRes.CloseTasksPanel(Self);
 end;//not defDataAdapter.AdministratorLogin
 LoadSettings;
//#UC END# *4F8813D6026A_4A952BA3006D_impl*
end;//TMainForm.InitForm

procedure TMainForm.PrepareChildZoneBeforeResize(aNewHeight: Integer);
//#UC START# *4F881735018D_4A952BA3006D_var*

 function lp_UsedHeight: Integer;
  {* ������ ������������ ������� ������������, ������� ��������� � �������
     "�����������". }
 begin//lp_UsedHeight
  Result := Height - (ChildZonePanel.Height + ParentZonePanel.Height) +
   ParentZonePanel.Constraints.MinHeight;
 end;//lp_UsedHeight

var
 l_AvailableHeight: Integer;
//#UC END# *4F881735018D_4A952BA3006D_var*
begin
//#UC START# *4F881735018D_4A952BA3006D_impl*
 if (ChildZonePanel <> nil) then
 // http://mdp.garant.ru/pages/viewpage.action?pageId=365840014
  if ChildZonePanel.Visible then
  begin
   l_AvailableHeight := aNewHeight - lp_UsedHeight;
   // ��� ���������� ������� ������� ����� ��������� ������ �������� ����, �����
   // ����� ��������� ����� ������:
   if (ChildZonePanel.Height > l_AvailableHeight) and
     (l_AvailableHeight >= ChildZonePanel.Constraints.MinHeight) then
    ChildZonePanel.Height := l_AvailableHeight;
  end;//if ChildZonePanel.Visible then
//#UC END# *4F881735018D_4A952BA3006D_impl*
end;//TMainForm.PrepareChildZoneBeforeResize

function TMainForm.BaseSearcher: InsBaseSearcher;
//#UC START# *4F881C2E0175_4A952BA3006D_var*
//#UC END# *4F881C2E0175_4A952BA3006D_var*
begin
//#UC START# *4F881C2E0175_4A952BA3006D_impl*
 if (f_BaseSearcher = nil) then
  f_BaseSearcher := TnsBaseSearcher.Make(Self, nsGetContextHistory(ns_chkDocument));
 Result := f_BaseSearcher;
//#UC END# *4F881C2E0175_4A952BA3006D_impl*
end;//TMainForm.BaseSearcher

procedure TMainForm.ShowStartupAdvertising;
//#UC START# *4F8BF3940103_4A952BA3006D_var*
const
 c_HelpWhatsNewPage ='page-main.htm';
 {$I nsBuildVersion.inc}
var
 l_SettingsVersion: Il3CString;
 l_ShellVersion: Il3CString;
 l_ShowCounter: Integer;

 procedure lp_ShowHelp;
 const
  c_MaxWhatNewAutoFlash = 3;
 var
  l_HelpFile: string;
 begin//lp_ShowHelp
  if defDataAdapter.CommonInterfaces.AutoShowHelp then
  begin
   l_SettingsVersion := afw.PermanentSettings.LoadString(pi_ActiveShelVersion);
   if l3Same(l_SettingsVersion, l_ShellVersion) then
   begin
    l_ShowCounter := afw.PermanentSettings.LoadInteger(pi_ShowHelpCounter);
    // ���� ������ ��������� � ��� ���������� ������ ����� ��� - ������� � ������ �� ������
    if l_ShowCounter >= c_MaxWhatNewAutoFlash then
     Exit;
    Inc(l_ShowCounter);
   end//l3Same(l_SettingsVersion, l_ShellVersion)
   else
    l_ShowCounter := 1;

   // ������� ������������ �� ������ chm-�����
   l_HelpFile := Application.HelpFile;
   try
    Application.HelpFile := 'F1WhatsNew.chm';
    try
     Application.HelpSystem.ShowTopicHelp(c_HelpWhatsNewPage, '');
    except
     on EHelpSystemException do
      Say(war_HelpNotFound);
    end;//try..except
   finally
    Application.HelpFile := l_HelpFile;
   end;//try..finally
  end//defDataAdapter.CommonInterfaces.AutoShowHelp
  else
   l_ShowCounter := c_MaxWhatNewAutoFlash;
  afw.PermanentSettings.SaveInteger(pi_ShowHelpCounter, l_ShowCounter);
  afw.PermanentSettings.SaveString(pi_ActiveShelVersion, l_ShellVersion);
 end;//lp_ShowHelp

//#UC END# *4F8BF3940103_4A952BA3006D_var*
begin
//#UC START# *4F8BF3940103_4A952BA3006D_impl*
 if CheckStartupAdvertisingEnabled then
 begin
  if (c_BuildVersion <> 'X.XX.X.XXX') then
  begin
   l_ShellVersion := l3Fmt('%s', [Copy(c_BuildVersion, 1, 6)]);
  end
  else
   with TVersionInfo.Create, FileLongVersion do
   try
    l_ShellVersion := l3Fmt('%d.%d.%d', [All[2], All[1], All[4]]);
   finally
    Free;
   end;//try..finally
  //
  if not afw.Settings.LoadBoolean(pi_DayTips_DontShowAtStart, dv_DayTips_DontShowAtStart) then
  begin
   if not TdmStdRes.ShowDayTipsAtStartup then
    lp_ShowHelp;
  end//not afw.Settings.LoadBoolean(pi_DayTips_DontShowAtStart, dv_DayTips_DontShowAtStart)
  else
   lp_ShowHelp;
 end;//CheckStartupAdvertisingEnabled
//#UC END# *4F8BF3940103_4A952BA3006D_impl*
end;//TMainForm.ShowStartupAdvertising

function TMainForm.CheckStartupAdvertisingEnabled: Boolean;
//#UC START# *4F8BF3B5012A_4A952BA3006D_var*
//#UC END# *4F8BF3B5012A_4A952BA3006D_var*
begin
//#UC START# *4F8BF3B5012A_4A952BA3006D_impl*
 Result := (g_Dispatcher.FormDispatcher.MainFormsCount = 1) and
  not defDataAdapter.AdministratorLogin;
//#UC END# *4F8BF3B5012A_4A952BA3006D_impl*
end;//TMainForm.CheckStartupAdvertisingEnabled

procedure TMainForm.CheckFirstLoginActivity;
//#UC START# *4F8BF3CC02A6_4A952BA3006D_var*
var
 l_FirstLogin: Boolean;
//#UC END# *4F8BF3CC02A6_4A952BA3006D_var*
begin
//#UC START# *4F8BF3CC02A6_4A952BA3006D_impl*
 if CanFirstLoginActivity then
 begin
  l_FirstLogin := afw.PermanentSettings.LoadBoolean(pi_FirstLogin, True);
  if l_FirstLogin then
   defDataAdapter.ConsultationManager.CreateQueryWithNoticeUser;
  afw.PermanentSettings.SaveBoolean(pi_FirstLogin, false);
 end;//CanFirstLoginActivity
//#UC END# *4F8BF3CC02A6_4A952BA3006D_impl*
end;//TMainForm.CheckFirstLoginActivity

function TMainForm.CanFirstLoginActivity: Boolean;
//#UC START# *4F8BF3ED02D0_4A952BA3006D_var*
//#UC END# *4F8BF3ED02D0_4A952BA3006D_var*
begin
//#UC START# *4F8BF3ED02D0_4A952BA3006D_impl*
 Result := (g_Dispatcher.FormDispatcher.MainFormsCount = 1) and
  not defDataAdapter.AdministratorLogin;
//#UC END# *4F8BF3ED02D0_4A952BA3006D_impl*
end;//TMainForm.CanFirstLoginActivity

function TMainForm.CheckInstallDefaultSettings: Boolean;
//#UC START# *4F8BF4060008_4A952BA3006D_var*
//#UC END# *4F8BF4060008_4A952BA3006D_var*
begin
//#UC START# *4F8BF4060008_4A952BA3006D_impl*
 Result := False;
 with DefDataAdapter do
 begin
  // ���� ����������� ����� ��������, �� InstallDefaultSettingsInfo ����� ���
  // ������, ��. ����. � ����� ���������.
  //
  // � ������� ���� ����������� ��������� �� ���������:
  if Assigned(InstallDefaultSettingsInfo) and
   (InstallDefaultSettingsInfo.GetState <> NO_CHANGES) then
   Result := True;
 end;//with DefDataAdapter.InstallDefaultSettingsInfo do
 // �������� ���������, �� ��� ������ �� �����, �� ��������� �������������,
 // �� ������� �������� ��������� �� ������������� ������������:
 DefDataAdapter.InstallDefaultSettingsInfo := nil;
//#UC END# *4F8BF4060008_4A952BA3006D_impl*
end;//TMainForm.CheckInstallDefaultSettings

function TMainForm.IntegrationInProcess: Boolean;
//#UC START# *4F8BF41E00D8_4A952BA3006D_var*
var
 l_Handle: THandle;
//#UC END# *4F8BF41E00D8_4A952BA3006D_var*
begin
//#UC START# *4F8BF41E00D8_4A952BA3006D_impl*
 l_Handle := OpenMutex(SYNCHRONIZE,False,c_IntergationMutexName);
 try
  Result := l_Handle <> 0;
 finally
  CloseHandle(l_Handle);
 end;//try..finally 
//#UC END# *4F8BF41E00D8_4A952BA3006D_impl*
end;//TMainForm.IntegrationInProcess

procedure TMainForm.VcmMainFormShow(Sender: TObject);
//#UC START# *4F8BF5C602C3_4A952BA3006D_var*
//#UC END# *4F8BF5C602C3_4A952BA3006D_var*
begin
//#UC START# *4F8BF5C602C3_4A952BA3006D_impl*
 if f_NeedAskNewSettings then
 begin
  Ask(inf_DefaultSetttingsWereChanged);
  f_NeedAskNewSettings := False;
 end;//f_NeedAskNewSettings
 if f_NeedShowAdvertising then
 begin
  ShowStartupAdvertising;
  f_NeedShowAdvertising := False;
 end;//f_NeedShowAdvertising
 TdmStdRes.MakeChatDispatcher.StartProcessing;
//#UC END# *4F8BF5C602C3_4A952BA3006D_impl*
end;//TMainForm.VcmMainFormShow

procedure TMainForm.WMActivate(var Message: TWMActivate);
//#UC START# *4F882B3402EB_4A952BA3006D_var*
var
 l_p: TPoint;
//#UC END# *4F882B3402EB_4A952BA3006D_var*
begin
//#UC START# *4F882B3402EB_4A952BA3006D_impl*
 inherited;
 // http://mdp.garant.ru/pages/viewpage.action?pageId=346763353
 // PS1: ������� ���������� � SetActiveWindow, WM_ACTIVATE + Result �� �������...
 // PS2: ����� inherited ������� ����������
 if Message.Active = WA_ACTIVE then
 begin
  if not l3IsTimeElapsed(f_LastWMActivateTickCount, 100) then
  begin
   // ���� ��������� ����� �������, ����� �� ��������� � ������� ������ ������
   // ����� ����, ������ ���� ������� �������� ���� (������� ������)
   Inc(f_ActivatesCount);
   if f_ActivatesCount > 2 then
   begin
    f_ActivatesCount := 0;

    SetForegroundWindow(Handle);

    GetCursorPos(l_p);
    SetCursorPos(Left + Width div 2, Top + 2);
    Mouse_Event(MOUSEEVENTF_MIDDLEDOWN, 0, 0, 0, 0);
    Mouse_Event(MOUSEEVENTF_MIDDLEUP, 0, 0, 0, 0);
    SetCursorPos(l_p.x, l_p.y);
   end;//f_ActivatesCount > 2
  end//not l3IsTimeElapsed(f_LastWMActivateTickCount, 100)
  else
   f_ActivatesCount := 0;
  f_LastWMActivateTickCount := GetTickCount;   
 end;//Message.Active = WA_ACTIVE 
//#UC END# *4F882B3402EB_4A952BA3006D_impl*
end;//TMainForm.WMActivate

procedure TMainForm.WMActivateApp(var Message: TWMActivateApp);
//#UC START# *4F882B6101CA_4A952BA3006D_var*
var
 l_Flash: InsFlashingWindow;
 l_IDX: Integer;
//#UC END# *4F882B6101CA_4A952BA3006D_var*
begin
//#UC START# *4F882B6101CA_4A952BA3006D_impl*
 ActivateAllAsyncWindows(Message.Active);
 if Message.Active then
  for l_IDX := 0 to Dispatcher.FormDispatcher.MainFormsCount - 1 do
   if Supports(Dispatcher.FormDispatcher.MainForm[l_IDX], InsFlashingWindow, l_Flash) then
    l_Flash.StopFlashing;
 inherited;
//#UC END# *4F882B6101CA_4A952BA3006D_impl*
end;//TMainForm.WMActivateApp

procedure TMainForm.WMCopyData(var aMessage: TWMCopyData);
//#UC START# *4F882BA300FD_4A952BA3006D_var*
var
 l_Processor: InsIntegrationProcessor;
//#UC END# *4F882BA300FD_4A952BA3006D_var*
begin
//#UC START# *4F882BA300FD_4A952BA3006D_impl*
 if aMessage.CopyDataStruct^.dwData = g_IntegrationMessage then
 begin
  if not IsWindowEnabled(Handle) then
   aMessage.Result := GI_BUSY
  else
   if aMessage.CopyDataStruct^.cbData<SizeOf(TIntegrationData) then
    aMessage.Result := GI_INVALIDLINKFORMAT
   else
    with PIntegrationData(aMessage.CopyDataStruct^.lpData)^ do
    begin
     if OpenInNewWindow then
      MakeClone;
     if Supports(Self.Dispatcher.FormDispatcher.MainForm[Self.Dispatcher.FormDispatcher.MainFormsCount-1],
      InsIntegrationProcessor, l_Processor) then
      begin
       l_Processor.CheckInconic;
       aMessage.Result := aMessage.CopyDataStruct^.dwData;
       case Kind of
        idkCommand:
         if aMessage.CopyDataStruct^.cbData<>SizeOf(TIntegrationData) then
          aMessage.Result := GI_INVALIDLINKFORMAT
         else
          if not l_Processor.ProcessCommand(Command, OpenInNewWindow, nil) then
           aMessage.Result := GI_INVALIDLINKFORMAT;
        idkLink:
         if (aMessage.CopyDataStruct^.cbData < SizeOf(TIntegrationData)) or
          (Integer(StrLen(PAnsiChar(@Link)))<>LinkLength) then
          aMessage.Result := GI_INVALIDLINKFORMAT
         else
         begin
          try
           if not l_Processor.ProcessLink(@Link) then
            aMessage.Result := GI_INVALIDLINKFORMAT;
          except
           on ECanNotFindData do aMessage.Result := GI_SYSTEMERROR;
           on EInvalidXMLType do aMessage.Result := GI_INVALIDLINKFORMAT;
           on ECantCreateObject do aMessage.Result := GI_QUERYPARAMSHASABSENTVALUES;
           //http://mdp.garant.ru/pages/viewpage.action?pageId=462553651
           on ETryToFindEmptyContext do aMessage.Result := GI_TRYTOFINDEMPTYCONTEXT;
          end;
         end;
        idkCheckIntegrationKey:
         if (aMessage.CopyDataStruct^.cbData < SizeOf(TIntegrationData)) or
          (Integer(StrLen(PAnsiChar(@Key)))<>KeyLength) then
          aMessage.Result := GI_SYSTEMERROR
         else
          if not l_Processor.CheckKey(@Key) then
           aMessage.Result := GI_ALREADYRUNNING;
       end;
       if (aMessage.Result <> LongInt(aMessage.CopyDataStruct^.dwData)) and
        (OpenInNewWindow or not f_WindowInitialized) then
        l_Processor.ProcessCommand(GC_ACTIVATE, True, nil);
      end
     else
      aMessage.Result := GI_NOTFOUND;
   end;//aMessage.CopyDataStruct^.cbData<SizeOf(TIntegrationData)
 end//aMessage.CopyDataStruct^.dwData = g_IntegrationMessage
 else
  if aMessage.CopyDataStruct^.dwData = g_LastMainWindowMessage then
   aMessage.Result := Self.Dispatcher.FormDispatcher.MainForm[Self.Dispatcher.FormDispatcher.MainFormsCount-1].VCLWinControl.Handle;
//#UC END# *4F882BA300FD_4A952BA3006D_impl*
end;//TMainForm.WMCopyData

procedure TMainForm.WMDisplayChange(var aMessage: TWMDisplayChange);
//#UC START# *4F882BCD02ED_4A952BA3006D_var*
//#UC END# *4F882BCD02ED_4A952BA3006D_var*
begin
//#UC START# *4F882BCD02ED_4A952BA3006D_impl*
 MenuManager.BeginOp;
 try
  (MenuManager as TvcmCustomMenuManager).GlyphColordepth := (MenuManager as TvcmCustomMenuManager).GlyphColordepth;
 finally
  MenuManager.EndOp;
 end;//try..finally
//#UC END# *4F882BCD02ED_4A952BA3006D_impl*
end;//TMainForm.WMDisplayChange

procedure TMainForm.WMWindowPosChanging(var aMessage: TWMWindowPosChanging);
//#UC START# *4F882C0000BA_4A952BA3006D_var*
//#UC END# *4F882C0000BA_4A952BA3006D_var*
begin
//#UC START# *4F882C0000BA_4A952BA3006D_impl*
 with aMessage.WindowPos^ do
  if cy > Constraints.MinHeight then
   PrepareChildZoneBeforeResize(cy);
 inherited;
//#UC END# *4F882C0000BA_4A952BA3006D_impl*
end;//TMainForm.WMWindowPosChanging

procedure TMainForm.Notify(const aNotifier: Il3ChangeNotifier;
  aOperation: Integer;
  aIndex: Integer);
//#UC START# *46A4504B03C4_4A952BA3006D_var*
//#UC END# *46A4504B03C4_4A952BA3006D_var*
begin
//#UC START# *46A4504B03C4_4A952BA3006D_impl*
 case TbsNotification(aOperation) of
  nConsultation:
   case TbsConsultationOperation(aIndex) of
    coUnreadChanged:
     UpdateUnreadConsultations;
    coNoConnection:
     Say(war_NoConnectionOnSend, [defDataAdapter.GetDealerInfo]);
    coNoSubscription:
     Say(war_NoSubscription, [defDataAdapter.GetDealerInfo]);
    coInternetConnected:
     CheckConsultationConnection;
    coInternetDisConnected:
     CheckInternetConnection;
   end;//case TbsConsultationOperation(aIndex) of
 end;//case TbsNotification(aOperation) of
//#UC END# *46A4504B03C4_4A952BA3006D_impl*
end;//TMainForm.Notify

procedure TMainForm.CheckLocalDataReady;
//#UC START# *496B4F6D02B5_4A952BA3006D_var*
var
 l_Notifier: InsBaseSearchDataReadyChecker;
//#UC END# *496B4F6D02B5_4A952BA3006D_var*
begin
//#UC START# *496B4F6D02B5_4A952BA3006D_impl*
 if Supports(BaseSearcher, InsBaseSearchDataReadyChecker, l_Notifier) then
  l_Notifier.CheckLocalDataReady;
//#UC END# *496B4F6D02B5_4A952BA3006D_impl*
end;//TMainForm.CheckLocalDataReady

procedure TMainForm.SearchResultEmpty(TryFullList: Boolean);
//#UC START# *496B4FAA02FA_4A952BA3006D_var*
var
 l_Processor: InsBaseSearchResultProcessor;
//#UC END# *496B4FAA02FA_4A952BA3006D_var*
begin
//#UC START# *496B4FAA02FA_4A952BA3006D_impl*
 if Supports(BaseSearcher, InsBaseSearchResultProcessor, l_Processor) then
  l_Processor.SearchResultEmpty(TryFullList);
//#UC END# *496B4FAA02FA_4A952BA3006D_impl*
end;//TMainForm.SearchResultEmpty

procedure TMainForm.SearchResultExists;
//#UC START# *496B4FC70065_4A952BA3006D_var*
var
 l_Processor: InsBaseSearchResultProcessor;
//#UC END# *496B4FC70065_4A952BA3006D_var*
begin
//#UC START# *496B4FC70065_4A952BA3006D_impl*
 if Supports(BaseSearcher, InsBaseSearchResultProcessor, l_Processor) then
  l_Processor.SearchResultExists;
//#UC END# *496B4FC70065_4A952BA3006D_impl*
end;//TMainForm.SearchResultExists

procedure TMainForm.AnotherSearchSuccessed;
//#UC START# *496B4FD20320_4A952BA3006D_var*
var
 l_Processor: InsBaseSearchResultProcessor;
//#UC END# *496B4FD20320_4A952BA3006D_var*
begin
//#UC START# *496B4FD20320_4A952BA3006D_impl*
 if Supports(BaseSearcher, InsBaseSearchResultProcessor, l_Processor) then
  l_Processor.AnotherSearchSuccessed;
//#UC END# *496B4FD20320_4A952BA3006D_impl*
end;//TMainForm.AnotherSearchSuccessed

procedure TMainForm.OpenWindow(OpenKind: TnsBaseSearchOpenKind);
//#UC START# *496B52D602EE_4A952BA3006D_var*
//#UC END# *496B52D602EE_4A952BA3006D_var*
begin
//#UC START# *496B52D602EE_4A952BA3006D_impl*
 BaseSearcher.ShowWindowByUser(OpenKind);
//#UC END# *496B52D602EE_4A952BA3006D_impl*
end;//TMainForm.OpenWindow

procedure TMainForm.SetDataFromQuery(const aQuery: IUnknown);
//#UC START# *496B534B0098_4A952BA3006D_var*
var
 l_QueryLoader: InsBaseSearchQueryDataProcessor;
//#UC END# *496B534B0098_4A952BA3006D_var*
begin
//#UC START# *496B534B0098_4A952BA3006D_impl*
 if Supports(BaseSearcher, InsBaseSearchQueryDataProcessor, l_QueryLoader) then
  l_QueryLoader.SetDataFromQuery(aQuery);
//#UC END# *496B534B0098_4A952BA3006D_impl*
end;//TMainForm.SetDataFromQuery

procedure TMainForm.RequestFind;
//#UC START# *496B5356008C_4A952BA3006D_var*
var
 l_QueryLoader: InsBaseSearchQueryDataProcessor;
//#UC END# *496B5356008C_4A952BA3006D_var*
begin
//#UC START# *496B5356008C_4A952BA3006D_impl*
 if Supports(BaseSearcher, InsBaseSearchQueryDataProcessor, l_QueryLoader) then
  try
   l_QueryLoader.RequestFind;
  except
   on ETryToFindEmptyContext do
    Ask(inf_SimpleMainMenuSearchCondition);
  end;//try..except
//#UC END# *496B5356008C_4A952BA3006D_impl*
end;//TMainForm.RequestFind

procedure TMainForm.RequestCheckFragmentsCount;
//#UC START# *49FFFE5B033A_4A952BA3006D_var*
var
 l_QueryLoader: InsBaseSearchQueryDataProcessor;
//#UC END# *49FFFE5B033A_4A952BA3006D_var*
begin
//#UC START# *49FFFE5B033A_4A952BA3006D_impl*
 if Supports(BaseSearcher, InsBaseSearchQueryDataProcessor, l_QueryLoader) then
  l_QueryLoader.RequestCheckFragmentsCount;
//#UC END# *49FFFE5B033A_4A952BA3006D_impl*
end;//TMainForm.RequestCheckFragmentsCount

procedure TMainForm.RequestCheckFindBack;
//#UC START# *4A13A97F0211_4A952BA3006D_var*
var
 l_QueryLoader: InsBaseSearchQueryDataProcessor;
//#UC END# *4A13A97F0211_4A952BA3006D_var*
begin
//#UC START# *4A13A97F0211_4A952BA3006D_impl*
 if Supports(BaseSearcher, InsBaseSearchQueryDataProcessor, l_QueryLoader) then
  l_QueryLoader.RequestCheckFindBack;
//#UC END# *4A13A97F0211_4A952BA3006D_impl*
end;//TMainForm.RequestCheckFindBack

procedure TMainForm.Result_Cancel_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AC5D61E0284_4A952BA3006Dtest_var*
//#UC END# *4AC5D61E0284_4A952BA3006Dtest_var*
begin
//#UC START# *4AC5D61E0284_4A952BA3006Dtest_impl*
 aParams.Op.Flag[vcm_ofVisible] := False;
//#UC END# *4AC5D61E0284_4A952BA3006Dtest_impl*
end;//TMainForm.Result_Cancel_Test

procedure TMainForm.Result_Cancel_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4AC5D61E0284_4A952BA3006Dgetstate_var*
//#UC END# *4AC5D61E0284_4A952BA3006Dgetstate_var*
begin
//#UC START# *4AC5D61E0284_4A952BA3006Dgetstate_impl*
 // - ������ �� ������
//#UC END# *4AC5D61E0284_4A952BA3006Dgetstate_impl*
end;//TMainForm.Result_Cancel_GetState

procedure TMainForm.Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AC5D61E0284_4A952BA3006Dexec_var*
//#UC END# *4AC5D61E0284_4A952BA3006Dexec_var*
begin
//#UC START# *4AC5D61E0284_4A952BA3006Dexec_impl*
 Dispatcher.History.Back;
//#UC END# *4AC5D61E0284_4A952BA3006Dexec_impl*
end;//TMainForm.Result_Cancel_Execute

procedure TMainForm.AnotherSearchCancelled;
//#UC START# *4C04AFC8015D_4A952BA3006D_var*
var
 l_Processor: InsBaseSearchResultProcessor;
//#UC END# *4C04AFC8015D_4A952BA3006D_var*
begin
//#UC START# *4C04AFC8015D_4A952BA3006D_impl*
 if Supports(BaseSearcher, InsBaseSearchResultProcessor, l_Processor) then
  l_Processor.AnotherSearchCancelled;
//#UC END# *4C04AFC8015D_4A952BA3006D_impl*
end;//TMainForm.AnotherSearchCancelled

procedure TMainForm.MouseWheelListenerNotify(Msg: PMsg;
  var theResult: Tl3HookProcResult);
//#UC START# *4F79D08A02C7_4A952BA3006D_var*
var
 l_Rect: TRect;
//#UC END# *4F79D08A02C7_4A952BA3006D_var*
begin
//#UC START# *4F79D08A02C7_4A952BA3006D_impl*
 if HandleAllocated and (Msg^.Message = WM_MOUSEWHEEL) and
   (KeysToShiftState(LoWord(Msg^.wParam)) = [ssCtrl]) and IsWindowEnabled(Handle) then
 begin
  GetWindowRect(Handle, l_Rect);
  if PtInRect(l_Rect, SmallPointToPoint(TSmallPoint(Msg^.LParam))) then
  begin
   if CanChangeDefaultFontSize(Msg^.wParam > 0) then
    ChangeDefaultFontSize(Msg^.wParam > 0);
   Msg^.Message := WM_NULL;
  end;//PtInRect(l_Rect, SmallPointToPoint(TSmallPoint(Msg^.LParam)))
 end;//HandleAllocated and (Msg^.Message = WM_MOUSEWHEEL)..
//#UC END# *4F79D08A02C7_4A952BA3006D_impl*
end;//TMainForm.MouseWheelListenerNotify

function TMainForm.ProcessCommand(aCommand: Integer;
  InNewWindow: Boolean;
  const aContainer: IvcmContainer): Boolean;
//#UC START# *4F86BF5F0198_4A952BA3006D_var*
//#UC END# *4F86BF5F0198_4A952BA3006D_var*
begin
//#UC START# *4F86BF5F0198_4A952BA3006D_impl*
 f_WindowInitialized := True;
 Result := (aCommand>=GC_FIRST) and (aCommand<=GC_LAST);
 if Result then
 begin
  SetForegroundWindow(Handle);
  case aCommand of
   GC_ACTIVATE:
    if InNewWindow then
     ProcessCommand(ConvertOpenOnStartSetting, false, aContainer);
   GC_MAIN_MENU:
    TdmStdRes.OpenMainMenuIfNeeded(aContainer);
   GC_NAVIGATOR:
    TdmStdRes.OpenRubricatorOnStart(Self);
   GC_SITUATION_SEARCH:
    TdmStdRes.OpenQuery(lg_qtKeyWord, nil);
   GC_ATTRIBUTES_SEARCH:
    TdmStdRes.OpenQuery(lg_qtAttribute, nil);
   GC_PUBLISH_SOURCE_SEARCH:
    TdmStdRes.OpenQuery(lg_qtPublishedSource, nil);
   GC_REVIEW:
    TdmStdRes.OpenQuery(lg_qtLegislationReview, nil);
   GC_DICTION:
    Dispatcher.ModuleOperation(TdmStdRes.mod_opcode_Diction_OpenDict);
   GC_NEW_DOCS:
    TdmStdRes.OpenNewDocs(aContainer);
   GC_INPHARM_SEARCH:
    if defDataAdapter.IsInpharmExists then
     TdmStdRes.OpenQuery(lg_qtInpharmSearch, nil)
    else
     TdmStdRes.OpenMainMenuIfNeeded(aContainer);
   GC_DRUG_LIST:
    if defDataAdapter.IsInpharmExists then
     Dispatcher.ModuleOperation(TdmStdRes.mod_opcode_Inpharm_DrugList)
    else
     TdmStdRes.OpenMainMenuIfNeeded(aContainer);
   GC_INPHARM_MAIN_MENU:
    if defDataAdapter.IsInpharmExists then
     Dispatcher.ModuleOperation(TdmStdRes.mod_opcode_Inpharm_MedicMainMenu)
    else
     TdmStdRes.OpenMainMenuIfNeeded(aContainer);
   GC_IMPHARM_DICTION:
    if defDataAdapter.IsInpharmExists then
     Dispatcher.ModuleOperation(TdmStdRes.mod_opcode_Inpharm_MedicDiction)
    else
     TdmStdRes.OpenMainMenuIfNeeded(aContainer);
   GC_INTERNET_AGENT:
    if defDataAdapter.IsInternetAgentEnabled then
     Dispatcher.ModuleOperation(TdmStdRes.mod_opcode_InternetAgent_InternetAgent)
    else
     TdmStdRes.OpenMainMenuIfNeeded(aContainer);
   GC_OPEN_CONSULT:
    Dispatcher.ModuleOperation(TdmStdRes.mod_opcode_Search_OpenConsult);
   GC_PRIME:
    Dispatcher.ModuleOperation(TdmStdRes.mod_opcode_Monitorings_OpenNewsLine);
   else
    TdmStdRes.OpenMainMenuIfNeeded(aContainer);
  end;//case aCommand
 end;//Result
//#UC END# *4F86BF5F0198_4A952BA3006D_impl*
end;//TMainForm.ProcessCommand

function TMainForm.ProcessLink(aLink: PnsLinkDataArray): Boolean;
//#UC START# *4F86BF850173_4A952BA3006D_var*
//#UC END# *4F86BF850173_4A952BA3006D_var*
begin
//#UC START# *4F86BF850173_4A952BA3006D_impl*
 try
  SetForegroundWindow(Handle);
  Result := nsIntergationOpenLink(PAnsiChar(aLink), Self);
 except
  if not HasForm(vcm_ztParent) then
   ProcessCommand(ConvertOpenOnStartSetting, False, Self);
  raise;
 end;//try..except
//#UC END# *4F86BF850173_4A952BA3006D_impl*
end;//TMainForm.ProcessLink

function TMainForm.CheckKey(aKey: PnsLinkDataArray): Boolean;
//#UC START# *4F86BFA3034E_4A952BA3006D_var*
var
 l_Str: IString;
//#UC END# *4F86BFA3034E_4A952BA3006D_var*
begin
//#UC START# *4F86BFA3034E_4A952BA3006D_impl*
 try
  DefDataAdapter.Integration.GetIntegrationComplectId(l_Str);
  Result := StrComp(PAnsiChar(aKey),l_Str.GetData) = 0;
 except
  on ECanNotFindData do
   Result := False;
 end;//try..except
//#UC END# *4F86BFA3034E_4A952BA3006D_impl*
end;//TMainForm.CheckKey

procedure TMainForm.CheckInconic;
//#UC START# *4F86BFBF01AE_4A952BA3006D_var*
var
 l_Placement: TWindowPlacement;
//#UC END# *4F86BFBF01AE_4A952BA3006D_var*
begin
//#UC START# *4F86BFBF01AE_4A952BA3006D_impl*
 if IsIconic(Handle) then
 begin
  l_Placement.length := SizeOf(TWindowPlacement);
  GetWindowPlacement(Handle, @l_Placement);
  if (l_Placement.flags and WPF_RESTORETOMAXIMIZED) <> 0 then
   WindowState := wsMaximized
  else
   WindowState := wsNormal;
 end;//IsIconic(Handle)
//#UC END# *4F86BFBF01AE_4A952BA3006D_impl*
end;//TMainForm.CheckInconic

procedure TMainForm.Common_MemUsage_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4F88213001DE_4A952BA3006Dexec_var*
//#UC END# *4F88213001DE_4A952BA3006Dexec_var*
begin
//#UC START# *4F88213001DE_4A952BA3006Dexec_impl*
 {$IfOpt D+}
  MemoryUsageDlg;
 {$EndIf}
//#UC END# *4F88213001DE_4A952BA3006Dexec_impl*
end;//TMainForm.Common_MemUsage_Execute

procedure TMainForm.Cleanup;
//#UC START# *479731C50290_4A952BA3006D_var*
//#UC END# *479731C50290_4A952BA3006D_var*
begin
//#UC START# *479731C50290_4A952BA3006D_impl*
 if (ConsultationManager <> nil) then
  ConsultationManager.As_Il3ChangeNotifier.Unsubscribe(Il3ItemNotifyRecipient(Self));
 // ������ ����� �� ������ �������� ����
 Tl3ListenersManager.RemoveMouseWheelListener(Self);
 inherited;
//#UC END# *479731C50290_4A952BA3006D_impl*
end;//TMainForm.Cleanup

constructor TMainForm.Create(AOwner: TComponent);
//#UC START# *47D1602000C6_4A952BA3006D_var*
//#UC END# *47D1602000C6_4A952BA3006D_var*
begin
//#UC START# *47D1602000C6_4A952BA3006D_impl*
 Self.OnShow := Self.VcmMainFormShow;
 inherited;
//#UC END# *47D1602000C6_4A952BA3006D_impl*
end;//TMainForm.Create

procedure TMainForm.FinishDataUpdate;
//#UC START# *47EA4E9002C6_4A952BA3006D_var*
//#UC END# *47EA4E9002C6_4A952BA3006D_var*
begin
//#UC START# *47EA4E9002C6_4A952BA3006D_impl*
 inherited;
 UpdateMainCaptionPrefix;
 FillOldBaseWarning;
//#UC END# *47EA4E9002C6_4A952BA3006D_impl*
end;//TMainForm.FinishDataUpdate

procedure TMainForm.SettingsReplaceFinish;
//#UC START# *47EA8B9601FE_4A952BA3006D_var*
//#UC END# *47EA8B9601FE_4A952BA3006D_var*
begin
//#UC START# *47EA8B9601FE_4A952BA3006D_impl*
 inherited;
 TasksPanel.Refresh;
  // - ���������� �������� ������ �����;
 InitForm;
//#UC END# *47EA8B9601FE_4A952BA3006D_impl*
end;//TMainForm.SettingsReplaceFinish

procedure TMainForm.UserSettingsChanged;
//#UC START# *4958BE910345_4A952BA3006D_var*
//#UC END# *4958BE910345_4A952BA3006D_var*
begin
//#UC START# *4958BE910345_4A952BA3006D_impl*
 inherited;
 LoadSettings;
//#UC END# *4958BE910345_4A952BA3006D_impl*
end;//TMainForm.UserSettingsChanged

procedure TMainForm.StartSettingsEdit;
//#UC START# *4958F46C003B_4A952BA3006D_var*
//#UC END# *4958F46C003B_4A952BA3006D_var*
begin
//#UC START# *4958F46C003B_4A952BA3006D_impl*
 inherited;
 DoSaveInSettings;
//#UC END# *4958F46C003B_4A952BA3006D_impl*
end;//TMainForm.StartSettingsEdit

{$If not defined(NoVCM)}
procedure TMainForm.DoInit(aFromHistory: Boolean);
//#UC START# *49803F5503AA_4A952BA3006D_var*
//#UC END# *49803F5503AA_4A952BA3006D_var*
begin
//#UC START# *49803F5503AA_4A952BA3006D_impl*
 Constraints.MinHeight := 600;
 Constraints.MinWidth := 800;
 inherited;
 Tl3ListenersManager.AddMouseWheelListener(Self);
 if (ConsultationManager <> nil) then
  ConsultationManager.As_Il3ChangeNotifier.Subscribe(Il3ItemNotifyRecipient(Self));
 // ���������� ��� ��� �-132222088.
 // ����� �������� �������� � ��������� ������ (��������) ������� ������
 // ���� ����� ����� ���� ������ !!
 //UserFoldersTree.AsyncTree;
 // http://mdp.garant.ru/pages/viewpage.action?pageId=271753603
 nsWarnImages;
 with Dispatcher do
 begin
  if (FormDispatcher.MainFormsCount = 1) then
  begin
   InitialLoadStyleTableFromSettings;
   LogSystemInfo;
  end;//if (FormDispatcher.MainFormsCount = 1) then
  FormDispatcher.Lock;
  try
   // ������� ��������������� ��������:
   ChildZonePanel.Hide;
   InitForm;
   if (Dispatcher.FormDispatcher.MainFormsCount = 1) and
       not IntegrationInProcess then
    LoadStartState(vcmMakeParams(nil, Self));
  finally
   FormDispatcher.UnLock;
  end;//try..finally
 end;//with Dispatcher
 if (Dispatcher.FormDispatcher.MainFormsCount = 1) then
  defDataAdapter.ControlMgr.UpdateStatus(False);
 FillOldBaseWarning;
 // ��������� ����� �����, ���������� ������ �������� ����
 TnsWindowsList.Instance.Reload;
 f_InternetMap := nsStringMapManager.Map[smap_InternetCaptions];

 UpdateUnreadConsultations;

 // ������� ������������ ���� ���� ����������� ��������� �� ���������:
 f_NeedAskNewSettings := CheckInstallDefaultSettings;

 f_NeedShowAdvertising := CheckStartupAdvertisingEnabled;

 CheckFirstLoginActivity;
//#UC END# *49803F5503AA_4A952BA3006D_impl*
end;//TMainForm.DoInit
{$IfEnd} //not NoVCM

function TMainForm.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *4A60B23E00C3_4A952BA3006D_var*
//#UC END# *4A60B23E00C3_4A952BA3006D_var*
begin
//#UC START# *4A60B23E00C3_4A952BA3006D_impl*
 if IID.EQ(InsBaseSearcher) then
 begin
  InsBaseSearcher(Obj) := BaseSearcher;
  Result.SetOK;
 end//IID.EQ(InsBaseSearcher)
 // - http://mdp.garant.ru/pages/viewpage.action?pageId=330139744
 else
  Result := inherited COMQueryInterface(IID, Obj);
(* if Result.Fail then
 begin
  if IID.EQ(InsBaseSearcher) then
  begin
   InsBaseSearcher(Obj) := BaseSearcher;
   Result.SetOK;
  end;//IID.EQ(InsBaseSearcher)
 end;//Result.Fail*)
 // - http://mdp.garant.ru/pages/viewpage.action?pageId=330139744
//#UC END# *4A60B23E00C3_4A952BA3006D_impl*
end;//TMainForm.COMQueryInterface

procedure TMainForm.ClearFields;
 {-}
begin
 f_BaseSearcher := nil;
 inherited;
end;//TMainForm.ClearFields

procedure TMainForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Common, nil);
  PublishOp(en_Result, op_Cancel, Result_Cancel_Execute, Result_Cancel_Test, Result_Cancel_GetState);
  PublishOp(en_Common, op_MemUsage, Common_MemUsage_Execute, nil, nil);
 end;//with Entities.Entities
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
//#UC START# *4F882E1B0358*
 g_IntegrationMessage := RegisterWindowMessage(c_IntegrationMessageName);
 g_LastMainWindowMessage := RegisterWindowMessage(c_LastMainWindowMessageName);
//#UC END# *4F882E1B0358*
{$IfEnd} //not Admin AND not Monitorings

end.