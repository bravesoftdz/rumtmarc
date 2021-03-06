unit PrimF1Common_Module;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Common/PrimF1Common_Module.pas"
// �����: 24.08.2009 20:35
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMFormsPack::Class>> F1 Core::Common::View::Common::PrimF1Common
//
// "�����" ������ ��� F1
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
  BaseTypesUnit,
  DocumentUnit,
  DynamicTreeUnit,
  UnderControlUnit,
  l3Interfaces
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3Tree_TLB,
  Classes,
  ExtCtrls,
  SearchInterfaces,
  PresentationInterfaces,
  ConfigInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  ,
  PrimRememberPassword_Form,
  PrimProgressIndicator_Form,
  ProgressIndicator_Form,
  PrimEULA_Form,
  EULA_Form,
  About_Form,
  AdapterFacade,
  vtGroupBox,
  vtLabel,
  PrimTasksPanel_Form,
  l3StringIDEx,
  Common_FormDefinitions_Controls,
  PrimCommonDictionOptions_Form,
  PrimNavigatorOptions_Form,
  PrimTurnOffTimeMachineOptions_Form
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  ,
  eeButton
  {$If not defined(NoScripts)}
  ,
  tfwInteger
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts)}
  ,
  kwBynameControlPush
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts)}
  ,
  tfwControlString
  {$IfEnd} //not NoScripts
  ,
  PrimCompInfo_Form,
  RememberPassword_Form,
  CompInfo_Form,
  Registration_Form,
  TasksPanel_Form,
  CommonDiction_Form,
  Navigator_Form,
  TurnOffTimeMachine_Form,
  vcmModule {a},
  vcmBase {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TPrimF1CommonModule = {abstract formspack} class(TvcmModule)
  {* "�����" ������ ��� F1 }
 protected
  procedure Loaded; override;
  class procedure GetEntityForms(aList : TvcmClassList); override;
 protected
 // protected methods
   procedure opComplectInfoTest(const aParams: IvcmTestParamsPrim);
     {* ���������� � ��������� }
   procedure opComplectInfo(const aParams: IvcmExecuteParamsPrim);
     {* ���������� � ��������� }
   procedure opPageSetup(const aParams: IvcmExecuteParamsPrim);
     {* ��������� ��������... }
   procedure opShowEULA(const aParams: IvcmExecuteParamsPrim);
     {* ������� ������������� }
   class function GetMenuTypedItem(aType: TNavigatorMenuItemType): INodeBase;
   class procedure SetParamsForNavigatorElements(const aParams: IvcmTestParamsPrim;
     aType: TNavigatorMenuItemType);
   procedure opOpenMainMenuByButton(const aParams: IvcmExecuteParamsPrim);
     {* �������� ���� ������� ������ }
   procedure opOpenMainMenuNewTest(const aParams: IvcmTestParamsPrim);
     {* �������� ���� }
   procedure opOpenMainMenuNew(const aParams: IvcmExecuteParamsPrim);
     {* �������� ���� }
   procedure opTasksPanel(const aParams: IvcmExecuteParamsPrim);
     {* ������ ����� }
   procedure opLetterToDevelopers(const aParams: IvcmExecuteParamsPrim);
     {* ������ ������������� }
   procedure opOpenRubricatorTest(const aParams: IvcmTestParamsPrim);
     {* �������� ��������� }
   procedure opOpenRubricator(const aParams: IvcmExecuteParamsPrim);
     {* �������� ��������� }
   procedure opOpenInformationTest(const aParams: IvcmTestParamsPrim);
     {* ���������� ���������� }
   procedure opOpenInformation(const aParams: IvcmExecuteParamsPrim);
     {* ���������� ���������� }
   procedure opget_navigator(const aParams: IvcmExecuteParamsPrim);
     {* ���� (�������) }
   procedure opOpenIntranetTest(const aParams: IvcmTestParamsPrim);
   procedure opOpenIntranet(const aParams: IvcmExecuteParamsPrim);
 public
 // public methods
   class function MakeProgressIndicator(const aProgress: InsProgressIndicator;
     const aCaption: Il3CString;
     aMaxCount: Integer): IvcmEntityForm;
   class procedure CloseNavigator(const aContainer: IvcmContainer);
   class procedure CloseTasksPanel(const aContainer: IvcmContainer);
   class procedure FromPrinterSettings(const aPrinter: Il3Printer);
     {* ������� ��������� �� �������� }
   class procedure ToPrinterSettings(const aPrinter: Il3Printer);
     {* �������� ��������� � ������� }
   class procedure About;
     {* ������� ������ "� ���������" }
   class procedure ApplicationActivate;
   class procedure OpenRubricatorOnStart(const aContainer: IvcmContainer);
   class procedure OpenNewDocs(const aContainer: IvcmContainer);
   class procedure GetNavigator(const anAggregate: IvcmAggregate;
     const aContainer: IvcmContainer);
     {* ���� (�������) }
   class procedure OpenTasksPanel(const aContainer: IvcmContainer);
   class procedure AddDocumentToControl(const aDocument: IDocument);
     {* ��������� �������� �� �������� }
   class procedure AddToControl(const aControllable: IControllable);
     {* ��������� ������ �� �������� }
   class procedure DeleteDocumentFromControl(const aDocument: IDocument);
     {* ����� �������� � �������� }
   class procedure DeleteFromControl(const aControllable: IControllable);
     {* ����� ������ � �������� }
   class function IsUnderControl(const aDoc: IDocument): Boolean;
     {* ��������� �� �������� �� �������� }
   class function IsCurEditionActual(const aState: IDocumentState): Boolean; overload; 
   class function IsCurEditionActual(const aDocument: IDocument): Boolean; overload; 
   class function GetCurEditionDate(const aDocument: IDocument): AdapterDate;
   class function OpenTurnOffTimeMachine(const anIntf: InsTurnOffTimeMachine): IvcmEntityForm;
 end;//TPrimF1CommonModule
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  l3MessageID
  {$If not defined(NoScripts)}
  ,
  tfwScriptEngine
  {$IfEnd} //not NoScripts
  ,
  nsPageSetup,
  StdRes,
  StartUnit,
  l3String,
  vtVerInf,
  DataAdapter,
  ComplectUnit,
  IOUnit,
  nsTypes,
  nsUtils,
  l3MinMax,
  vtDialogsRes,
  Controls,
  Forms,
  SecurityUnit,
  vcmEntityForm {a},
  nsNewCachableNode,
  nsNodes,
  SysUtils,
  nsExternalObject,
  bsUtils,
  nsNavigatorTreeStruct,
  l3Base,
  nsConst,
  Search_Strange_Controls,
  Common_Rubricator_Controls,
  PrimTasksPanel_tpMain_UserType,
  kw_Common_ComplectInfo,
  kw_Common_PageSetup,
  kw_Common_ShowEULA,
  kw_Common_OpenMainMenuByButton,
  kw_Common_OpenMainMenuNew,
  kw_Common_TasksPanel,
  kw_Common_LetterToDevelopers,
  kw_Common_OpenRubricator,
  kw_Common_OpenInformation,
  kw_Common_get_navigator,
  kw_Common_OpenIntranet,
  vcmFormSetFactory {a},
  vcmModuleDef {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

type
  Tkw_Form_RememberPassword = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� RememberPassword
----
*������ �������������*:
[code]
'aControl' �����::RememberPassword TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_RememberPassword

// start class Tkw_Form_RememberPassword

{$If not defined(NoScripts)}
function Tkw_Form_RememberPassword.GetString: AnsiString;
 {-}
begin
 Result := 'RememberPasswordForm';
end;//Tkw_Form_RememberPassword.GetString
{$IfEnd} //not NoScripts

type
  Tkw_Form_RegistrationForm = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� RegistrationForm
----
*������ �������������*:
[code]
'aControl' �����::RegistrationForm TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_RegistrationForm

// start class Tkw_Form_RegistrationForm

{$If not defined(NoScripts)}
function Tkw_Form_RegistrationForm.GetString: AnsiString;
 {-}
begin
 Result := 'nsRegistrationForm';
end;//Tkw_Form_RegistrationForm.GetString
{$IfEnd} //not NoScripts

type
  Tkw_Form_Navigator = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� Navigator
----
*������ �������������*:
[code]
'aControl' �����::Navigator TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_Navigator

// start class Tkw_Form_Navigator

{$If not defined(NoScripts)}
function Tkw_Form_Navigator.GetString: AnsiString;
 {-}
begin
 Result := 'en_Navigator';
end;//Tkw_Form_Navigator.GetString
{$IfEnd} //not NoScripts

type
  Tkw_Navigator_NavigatorTree_ControlInstance = class(TtfwWord)
   {* ����� ������� ��� ������� � ���������� �������� NavigatorTree ����� Navigator }
  protected
  // realized methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Navigator_NavigatorTree_ControlInstance

// start class Tkw_Navigator_NavigatorTree_ControlInstance

{$If not defined(NoScripts)}
procedure Tkw_Navigator_NavigatorTree_ControlInstance.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((aCtx.rEngine.PopObj As Ten_Navigator).NavigatorTree);
end;//Tkw_Navigator_NavigatorTree_ControlInstance.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_Form_TurnOffTimeMachine = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� TurnOffTimeMachine
----
*������ �������������*:
[code]
'aControl' �����::TurnOffTimeMachine TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_TurnOffTimeMachine

// start class Tkw_Form_TurnOffTimeMachine

{$If not defined(NoScripts)}
function Tkw_Form_TurnOffTimeMachine.GetString: AnsiString;
 {-}
begin
 Result := 'en_TurnOffTimeMachine';
end;//Tkw_Form_TurnOffTimeMachine.GetString
{$IfEnd} //not NoScripts

type
  Tkw_TurnOffTimeMachine_rb_totmChangeDate_ControlInstance = class(TtfwWord)
   {* ����� ������� ��� ������� � ���������� �������� rb_totmChangeDate ����� TurnOffTimeMachine }
  protected
  // realized methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_TurnOffTimeMachine_rb_totmChangeDate_ControlInstance

// start class Tkw_TurnOffTimeMachine_rb_totmChangeDate_ControlInstance

{$If not defined(NoScripts)}
procedure Tkw_TurnOffTimeMachine_rb_totmChangeDate_ControlInstance.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((aCtx.rEngine.PopObj As Ten_TurnOffTimeMachine).rb_totmChangeDate);
end;//Tkw_TurnOffTimeMachine_rb_totmChangeDate_ControlInstance.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_TurnOffTimeMachine_rb_totmStayInCurrentRedaction_ControlInstance = class(TtfwWord)
   {* ����� ������� ��� ������� � ���������� �������� rb_totmStayInCurrentRedaction ����� TurnOffTimeMachine }
  protected
  // realized methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_TurnOffTimeMachine_rb_totmStayInCurrentRedaction_ControlInstance

// start class Tkw_TurnOffTimeMachine_rb_totmStayInCurrentRedaction_ControlInstance

{$If not defined(NoScripts)}
procedure Tkw_TurnOffTimeMachine_rb_totmStayInCurrentRedaction_ControlInstance.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((aCtx.rEngine.PopObj As Ten_TurnOffTimeMachine).rb_totmStayInCurrentRedaction);
end;//Tkw_TurnOffTimeMachine_rb_totmStayInCurrentRedaction_ControlInstance.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_TurnOffTimeMachine_rb_totmGotoActualRedaction_ControlInstance = class(TtfwWord)
   {* ����� ������� ��� ������� � ���������� �������� rb_totmGotoActualRedaction ����� TurnOffTimeMachine }
  protected
  // realized methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_TurnOffTimeMachine_rb_totmGotoActualRedaction_ControlInstance

// start class Tkw_TurnOffTimeMachine_rb_totmGotoActualRedaction_ControlInstance

{$If not defined(NoScripts)}
procedure Tkw_TurnOffTimeMachine_rb_totmGotoActualRedaction_ControlInstance.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((aCtx.rEngine.PopObj As Ten_TurnOffTimeMachine).rb_totmGotoActualRedaction);
end;//Tkw_TurnOffTimeMachine_rb_totmGotoActualRedaction_ControlInstance.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_TurnOffTimeMachine_deChangeDate_ControlInstance = class(TtfwWord)
   {* ����� ������� ��� ������� � ���������� �������� deChangeDate ����� TurnOffTimeMachine }
  protected
  // realized methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_TurnOffTimeMachine_deChangeDate_ControlInstance

// start class Tkw_TurnOffTimeMachine_deChangeDate_ControlInstance

{$If not defined(NoScripts)}
procedure Tkw_TurnOffTimeMachine_deChangeDate_ControlInstance.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((aCtx.rEngine.PopObj As Ten_TurnOffTimeMachine).deChangeDate);
end;//Tkw_TurnOffTimeMachine_deChangeDate_ControlInstance.DoDoIt
{$IfEnd} //not NoScripts

class function TPrimF1CommonModule.MakeProgressIndicator(const aProgress: InsProgressIndicator;
  const aCaption: Il3CString;
  aMaxCount: Integer): IvcmEntityForm;
var
 __WasEnter : Boolean;
//#UC START# *4A93F1F200B0_4A92C1380380_var*
//#UC END# *4A93F1F200B0_4A92C1380380_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4A93F1F200B0_4A92C1380380_impl*
 Result := TefProgressIndicator.Make(aProgress, aCaption, aMaxCount);
 try
  Assert((Result <> nil) AND (Result.VCLWinControl <> nil));
  Result.VCLWinControl.Repaint;
  // ����� �� �������������� ������ �� ����� �������� ����
  {$IfDef InsiderTest}
  Inc((Result.VCLWinControl As TvcmEntityForm).g_AllowModal);
  try
  {$EndIf InsiderTest}
   Result.ShowModal;
  {$IfDef InsiderTest}
  finally
   Dec((Result.VCLWinControl As TvcmEntityForm).g_AllowModal);
  end;//try..finally
  {$EndIf InsiderTest}
 except
  Result := nil;
 end;//try..except
//#UC END# *4A93F1F200B0_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.MakeProgressIndicator

class procedure TPrimF1CommonModule.CloseNavigator(const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4AAFCA2D03D0_4A92C1380380_var*
//#UC END# *4AAFCA2D03D0_4A92C1380380_var*
var
 l_Form : IvcmEntityForm;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AAFCA2D03D0_4A92C1380380_impl*
 Assert(aContainer <> nil);
 aContainer.HasForm(fm_en_Navigator.rFormID, vcm_ztNavigator, true, @l_Form);
 if (l_Form <> nil) then
  l_Form.SafeClose;
//#UC END# *4AAFCA2D03D0_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.CloseNavigator

class procedure TPrimF1CommonModule.CloseTasksPanel(const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4AAFCCD00301_4A92C1380380_var*
//#UC END# *4AAFCCD00301_4A92C1380380_var*
var
 l_Form : IvcmEntityForm;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AAFCCD00301_4A92C1380380_impl*
 Assert(aContainer <> nil);
 aContainer.HasForm(fm_en_TasksPanel.rFormID, vcm_ztNavigator, true, @l_Form);
 if (l_Form <> nil) then
  l_Form.SafeClose;
//#UC END# *4AAFCCD00301_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.CloseTasksPanel

class procedure TPrimF1CommonModule.FromPrinterSettings(const aPrinter: Il3Printer);
var
 __WasEnter : Boolean;
//#UC START# *4ABB68C603CE_4A92C1380380_var*
//#UC END# *4ABB68C603CE_4A92C1380380_var*
var
 l_PageSetup : InsPageSettingsInfo;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABB68C603CE_4A92C1380380_impl*
 l_PageSetup := TnsPageSetup.Make(nil, aPrinter);
 try
  if l_PageSetup.LoadPageFormatFromPrinter then
   if l_PageSetup.Modified then
    l_PageSetup.SavePageFormatToSettings;
 finally
  l_PageSetup := nil;
 end;//try..finally
//#UC END# *4ABB68C603CE_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.FromPrinterSettings

class procedure TPrimF1CommonModule.ToPrinterSettings(const aPrinter: Il3Printer);
var
 __WasEnter : Boolean;
//#UC START# *4ABB691803C2_4A92C1380380_var*
//#UC END# *4ABB691803C2_4A92C1380380_var*
var
 l_PageSetup : InsPageSettingsInfo;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABB691803C2_4A92C1380380_impl*
 l_PageSetup := TnsPageSetup.Make(nil, aPrinter);
 try
  l_PageSetup.SaveToPrinter;
 finally
  l_PageSetup := nil;
 end;//try..finally
//#UC END# *4ABB691803C2_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.ToPrinterSettings

class procedure TPrimF1CommonModule.About;
var
 __WasEnter : Boolean;
//#UC START# *4ABB6F5D0397_4A92C1380380_var*
//#UC END# *4ABB6F5D0397_4A92C1380380_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABB6F5D0397_4A92C1380380_impl*
 TefAbout.Make(vcmMakeParams);
//#UC END# *4ABB6F5D0397_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.About

class procedure TPrimF1CommonModule.ApplicationActivate;
var
 __WasEnter : Boolean;
//#UC START# *4ABB74D80287_4A92C1380380_var*
//#UC END# *4ABB74D80287_4A92C1380380_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABB74D80287_4A92C1380380_impl*
 op_PrintParams_UpdatePrinter.Broadcast;
//#UC END# *4ABB74D80287_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.ApplicationActivate

procedure TPrimF1CommonModule.opComplectInfoTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4ABB7615007A_4A92C1380380test_var*
//#UC END# *4ABB7615007A_4A92C1380380test_var*
begin
//#UC START# *4ABB7615007A_4A92C1380380test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := not CheckContainer(nil).
  NativeMainForm.HasForm(fm_enCompInfo.rFormID, vcm_ztParent, True, nil);
//#UC END# *4ABB7615007A_4A92C1380380test_impl*
end;//TPrimF1CommonModule.opComplectInfoTest

procedure TPrimF1CommonModule.opComplectInfo(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABB7615007A_4A92C1380380exec_var*
//#UC END# *4ABB7615007A_4A92C1380380exec_var*
begin
//#UC START# *4ABB7615007A_4A92C1380380exec_impl*
 TenCompInfo.Make(vcmMakeParams(nil, CheckContainer(nil)));
//#UC END# *4ABB7615007A_4A92C1380380exec_impl*
end;//TPrimF1CommonModule.opComplectInfo

procedure TPrimF1CommonModule.opPageSetup(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABB76520183_4A92C1380380exec_var*
//#UC END# *4ABB76520183_4A92C1380380exec_var*
begin
//#UC START# *4ABB76520183_4A92C1380380exec_impl*
 TdmStdRes.MakePageSetup(nil);
//#UC END# *4ABB76520183_4A92C1380380exec_impl*
end;//TPrimF1CommonModule.opPageSetup

procedure TPrimF1CommonModule.opShowEULA(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABB792C0164_4A92C1380380exec_var*
//#UC END# *4ABB792C0164_4A92C1380380exec_var*
begin
//#UC START# *4ABB792C0164_4A92C1380380exec_impl*
 TefEULA.Make(vcmMakeParams);
//#UC END# *4ABB792C0164_4A92C1380380exec_impl*
end;//TPrimF1CommonModule.opShowEULA

class function TPrimF1CommonModule.GetMenuTypedItem(aType: TNavigatorMenuItemType): INodeBase;
//#UC START# *4ABB884103D3_4A92C1380380_var*
//#UC END# *4ABB884103D3_4A92C1380380_var*
var
 l_Root : INodeBase;
 l_Child : INodeBase;
 l_Node : INodeBase;
begin
//#UC START# *4ABB884103D3_4A92C1380380_impl*
 Result := nil;
 l_Root := DefDataAdapter.NativeAdapter.MakeNodeBase(nsAStr(c_MainMenu_NodeClass));
 try
  l_Root.GetFirstChild(l_Child);
  while l_Child <> nil do
  begin
   if TNavigatorMenuItemType(l_Child.GetType) = aType then
   begin
    Result := l_Child;
    break;
   end;

   l_Child.GetNext(l_Node);
   l_Child := l_Node;
  end;

 finally
  l_Root := nil;
 end;
//#UC END# *4ABB884103D3_4A92C1380380_impl*
end;//TPrimF1CommonModule.GetMenuTypedItem

class procedure TPrimF1CommonModule.SetParamsForNavigatorElements(const aParams: IvcmTestParamsPrim;
  aType: TNavigatorMenuItemType);
//#UC START# *4ABB8A470126_4A92C1380380_var*
//#UC END# *4ABB8A470126_4A92C1380380_var*
var
 l_List : IvcmNodes;
 l_Node : Il3Node;
 l_AdapterNode : INodeBase;
begin
//#UC START# *4ABB8A470126_4A92C1380380_impl*
 if not (aType in defDataAdapter.MenuTypeCache) then
  with aParams do
  begin
   Op.Flag[vcm_ofEnabled] := true;
   defDataAdapter.MenuTypeCache := defDataAdapter.MenuTypeCache + [aType];
   l_List := Op.SubNodes;
   if (l_List <> nil) then
    with l_List do
    begin
     ShowRoot := False;
     l_List.Clear;
     l_AdapterNode := GetMenuTypedItem(aType);
     if (l_AdapterNode = nil) then
      Op.Flag[vcm_ofEnabled] := False
     else
     begin
      l_Node := TnsNewCachableNode.Make(l_AdapterNode);
      if l_Node <> nil then
       try
        nsMakeTreeLevel(l_Node, l_AdapterNode);
        Add(l_Node);
       finally
        l_Node := nil;
       end;//try..finally
     end;//l_AdapterNode = nil
    end;//with l_List
  end;//with aParams
//#UC END# *4ABB8A470126_4A92C1380380_impl*
end;//TPrimF1CommonModule.SetParamsForNavigatorElements

class procedure TPrimF1CommonModule.OpenRubricatorOnStart(const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4ABB8D6B0041_4A92C1380380_var*
//#UC END# *4ABB8D6B0041_4A92C1380380_var*
var
 l_Node : INodeBase;
 l_Child : INodeBase;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABB8D6B0041_4A92C1380380_impl*
 l_Node := GetMenuTypedItem(NM_LAW_NAVIGATOR_FOLDER);
 if (l_Node <> nil) then
 begin
  l_Node.GetFirstChild(l_Child);
  if l_Child <> nil then
   TdmStdRes.OpenRubricator(TnsNewCachableNode.Make(l_Child),
                            l_Node,
                            nil,
                            true,
                            nil,
                            CheckContainer(aContainer));
 end;//l_Node <> nil
//#UC END# *4ABB8D6B0041_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.OpenRubricatorOnStart

class procedure TPrimF1CommonModule.OpenNewDocs(const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4ABBA74F03DA_4A92C1380380_var*
//#UC END# *4ABBA74F03DA_4A92C1380380_var*
var
 l_Node : INodeBase;
 l_Child : INodeBase;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABBA74F03DA_4A92C1380380_impl*
 l_Node := GetMenuTypedItem(NM_BUSINESS_INFO_FOLDER);
 if (l_Node <> nil) then
 begin
  l_Node.GetFirstChild(l_Child);
  while (l_Child <> nil) do
  begin
   if (TNavigatorMenuItemType(l_Child.GetType) = NM_NEW_DOCS) then
    break;
   l_Child.GetNext(l_Node);
   l_Child := l_Node;
  end;//l_Child <> nil
  if (l_Child <> nil) then
   TdmStdRes.OpenRubricator(TnsNewCachableNode.Make(l_Child),
                            l_Node,
                            nil,
                            true,
                            nil,
                            CheckContainer(aContainer));
 end;//l_Node <> nil
//#UC END# *4ABBA74F03DA_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.OpenNewDocs

procedure TPrimF1CommonModule.opOpenMainMenuByButton(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABBAAE40176_4A92C1380380exec_var*
//#UC END# *4ABBAAE40176_4A92C1380380exec_var*
begin
//#UC START# *4ABBAAE40176_4A92C1380380exec_impl*
 TdmStdRes.OpenMainMenuIfNeeded(nil);
//#UC END# *4ABBAAE40176_4A92C1380380exec_impl*
end;//TPrimF1CommonModule.opOpenMainMenuByButton

procedure TPrimF1CommonModule.opOpenMainMenuNewTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4ABBAB14034B_4A92C1380380test_var*
//#UC END# *4ABBAB14034B_4A92C1380380test_var*
begin
//#UC START# *4ABBAB14034B_4A92C1380380test_impl*
 with aParams.Op.SubItems do
 begin
  Clear;
  if defDataAdapter.IsInpharmExists then
  begin
   AddOp(TdmStdRes.mod_opcode_Common_OpenMainMenuByButton, vcmCStr(str_MainMenuButtonItem));
   AddOp(TdmStdRes.mod_opcode_Inpharm_MedicMainMenu, vcmCStr(str_InPharmMenuButtonItem));
  end;
 end;
//#UC END# *4ABBAB14034B_4A92C1380380test_impl*
end;//TPrimF1CommonModule.opOpenMainMenuNewTest

procedure TPrimF1CommonModule.opOpenMainMenuNew(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABBAB14034B_4A92C1380380exec_var*
//#UC END# *4ABBAB14034B_4A92C1380380exec_var*
begin
//#UC START# *4ABBAB14034B_4A92C1380380exec_impl*
 TdmStdRes.OpenMainMenuIfNeeded(nil);
//#UC END# *4ABBAB14034B_4A92C1380380exec_impl*
end;//TPrimF1CommonModule.opOpenMainMenuNew

procedure TPrimF1CommonModule.opTasksPanel(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABBAC7D003B_4A92C1380380exec_var*
//#UC END# *4ABBAC7D003B_4A92C1380380exec_var*
begin
//#UC START# *4ABBAC7D003B_4A92C1380380exec_impl*
 OpenTasksPanel(nil);
//#UC END# *4ABBAC7D003B_4A92C1380380exec_impl*
end;//TPrimF1CommonModule.opTasksPanel

procedure TPrimF1CommonModule.opLetterToDevelopers(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABBB19B030A_4A92C1380380exec_var*
//#UC END# *4ABBB19B030A_4A92C1380380exec_var*
begin
//#UC START# *4ABBB19B030A_4A92C1380380exec_impl*
 nsDoShellExecute(nsPrepareTextForMailto(vcmFmt(str_illMailTemlate,
  [bsComplectOwner, bsComplectName, FormatDateTime('dd/mm/yyyy',
   bsBaseDate)])));
//#UC END# *4ABBB19B030A_4A92C1380380exec_impl*
end;//TPrimF1CommonModule.opLetterToDevelopers

procedure TPrimF1CommonModule.opOpenRubricatorTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4ABC827B010F_4A92C1380380test_var*
//#UC END# *4ABC827B010F_4A92C1380380test_var*
begin
//#UC START# *4ABC827B010F_4A92C1380380test_impl*
 SetParamsForNavigatorElements(aParams, NM_LAW_NAVIGATOR_FOLDER);
//#UC END# *4ABC827B010F_4A92C1380380test_impl*
end;//TPrimF1CommonModule.opOpenRubricatorTest

procedure TPrimF1CommonModule.opOpenRubricator(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABC827B010F_4A92C1380380exec_var*
//#UC END# *4ABC827B010F_4A92C1380380exec_var*
begin
//#UC START# *4ABC827B010F_4A92C1380380exec_impl*
{$If not (defined(Monitorings) or defined(Admin))}
 ExecuteNavigatorItem(aParams.CurrentNode, nil, CheckContainer(nil));
{$IfEnd not (defined(Monitorings) or defined(Admin))}
//#UC END# *4ABC827B010F_4A92C1380380exec_impl*
end;//TPrimF1CommonModule.opOpenRubricator

procedure TPrimF1CommonModule.opOpenInformationTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4ABC82A70238_4A92C1380380test_var*
//#UC END# *4ABC82A70238_4A92C1380380test_var*
begin
//#UC START# *4ABC82A70238_4A92C1380380test_impl*
 SetParamsForNavigatorElements(aParams, NM_BUSINESS_INFO_FOLDER);
//#UC END# *4ABC82A70238_4A92C1380380test_impl*
end;//TPrimF1CommonModule.opOpenInformationTest

procedure TPrimF1CommonModule.opOpenInformation(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABC82A70238_4A92C1380380exec_var*
//#UC END# *4ABC82A70238_4A92C1380380exec_var*
begin
//#UC START# *4ABC82A70238_4A92C1380380exec_impl*
{$If not (defined(Monitorings) or defined(Admin))}
 ExecuteNavigatorItem(aParams.CurrentNode, nil, CheckContainer(nil));
{$IfEnd not (defined(Monitorings) or defined(Admin))}
//#UC END# *4ABC82A70238_4A92C1380380exec_impl*
end;//TPrimF1CommonModule.opOpenInformation

class procedure TPrimF1CommonModule.GetNavigator(const anAggregate: IvcmAggregate;
  const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4ABCA68B0155_4A92C1380380_var*
//#UC END# *4ABCA68B0155_4A92C1380380_var*
var
 l_Navigator : IvcmEntityForm;
 l_RubList : IvcmEntityForm;
 l_Aggregate : IvcmAggregate;
 l_Params : IvcmMakeParams;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABCA68B0155_4A92C1380380_impl*
 vcmDispatcher.FormDispatcher.Lock;
 try
  if CheckContainer(aContainer).NativeMainForm.HasForm(fm_efRubricator.rFormID,
                                                       vcm_ztParent,
                                                       True,
                                                       @l_RubList) then
  begin
   l_Aggregate := l_RubList.Aggregate;
   if (l_Aggregate = nil) then
   begin
    l_RubList.MakeAggregate;
    l_Aggregate := l_RubList.Aggregate;
   end;//l_Aggregate = nil
   l_Params := vcmSetAggregate(l_Aggregate,
                               vcmMakeParams(l_Aggregate,
                                         CheckContainer(aContainer)));   
  end//CheckContainer(aContainer).NativeMainForm.HasForm..
  else
   l_Params := vcmCheckAggregate(vcmMakeParams(anAggregate,
                                           CheckContainer(aContainer)));
  l_Navigator := Ten_Navigator.MakeSingleChild(l_Params.Container.NativeMainForm,
                                               l_Params,
                                               vcm_ztNavigator);
  l_Navigator.SetActiveInParent;
 finally
  vcmDispatcher.FormDispatcher.UnLock;
 end;//try..finally
 op_Rubricator_Synchronize.Call(l_RubList);
//#UC END# *4ABCA68B0155_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.GetNavigator

procedure TPrimF1CommonModule.opget_navigator(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AC0FBFE0095_4A92C1380380exec_var*
//#UC END# *4AC0FBFE0095_4A92C1380380exec_var*
begin
//#UC START# *4AC0FBFE0095_4A92C1380380exec_impl*
 GetNavigator(nil, nil);
//#UC END# *4AC0FBFE0095_4A92C1380380exec_impl*
end;//TPrimF1CommonModule.opget_navigator

class procedure TPrimF1CommonModule.OpenTasksPanel(const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4AC1000A0176_4A92C1380380_var*
//#UC END# *4AC1000A0176_4A92C1380380_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC1000A0176_4A92C1380380_impl*
 {$If not (defined(Monitorings) or defined(Admin))}
 // �������� Make --> MakeSingleChild
 // http://mdp.garant.ru/pages/viewpage.action?pageId=342864296&focusedCommentId=342868675#comment-342868675
 Ten_TasksPanel.MakeSingleChild(CheckContainer(aContainer), vcmMakeParams(nil,
                               CheckContainer(aContainer)),
                     vcm_ztNavigator,
                     Ord(tpMain));
 {$IfEnd not (defined(Monitorings) or defined(Admin))}
//#UC END# *4AC1000A0176_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.OpenTasksPanel

class procedure TPrimF1CommonModule.AddDocumentToControl(const aDocument: IDocument);
var
 __WasEnter : Boolean;
//#UC START# *4AC1F3770062_4A92C1380380_var*
//#UC END# *4AC1F3770062_4A92C1380380_var*
var
 l_Controllable : IControllable;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC1F3770062_4A92C1380380_impl*
 Assert(IsCurEditionActual(aDocument),'Can''t flag unactual redation');
 if Supports(aDocument, IControllable, l_Controllable) then
 try
  AddToControl(l_Controllable);
 finally
  l_Controllable := nil;
 end;//Supports(aDoc, IControllable, l_Controllable)
//#UC END# *4AC1F3770062_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.AddDocumentToControl

class procedure TPrimF1CommonModule.AddToControl(const aControllable: IControllable);
var
 __WasEnter : Boolean;
//#UC START# *4AC1F3A700BE_4A92C1380380_var*
//#UC END# *4AC1F3A700BE_4A92C1380380_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC1F3A700BE_4A92C1380380_impl*
 if Assigned(aControllable) and aControllable.GetCanSetToControl then
 begin
  aControllable.SetControlled(True);
  TdmStdRes.AddControlledObject(aControllable);
 end;//Assigned(aControllable) and aControllable.GetCanSetToControl
//#UC END# *4AC1F3A700BE_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.AddToControl

class procedure TPrimF1CommonModule.DeleteDocumentFromControl(const aDocument: IDocument);
var
 __WasEnter : Boolean;
//#UC START# *4AC1F3D702D2_4A92C1380380_var*
//#UC END# *4AC1F3D702D2_4A92C1380380_var*
var
 l_Controllable : IControllable;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC1F3D702D2_4A92C1380380_impl*
 if Supports(aDocument, IControllable, l_Controllable) then
 try
  DeleteFromControl(l_Controllable);
 finally
  l_Controllable := nil;
 end;//Supports(aDoc, IControllable, l_Controllable)
//#UC END# *4AC1F3D702D2_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.DeleteDocumentFromControl

class procedure TPrimF1CommonModule.DeleteFromControl(const aControllable: IControllable);
var
 __WasEnter : Boolean;
//#UC START# *4AC1F40900DE_4A92C1380380_var*
//#UC END# *4AC1F40900DE_4A92C1380380_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC1F40900DE_4A92C1380380_impl*
 if Assigned(aControllable) then
 begin
  aControllable.SetControlled(False);
  TdmStdRes.DeleteControlledObject(aControllable);
 end;//Assigned(aControllable)
//#UC END# *4AC1F40900DE_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.DeleteFromControl

class function TPrimF1CommonModule.IsUnderControl(const aDoc: IDocument): Boolean;
var
 __WasEnter : Boolean;
//#UC START# *4AC1F483035F_4A92C1380380_var*
//#UC END# *4AC1F483035F_4A92C1380380_var*
var
 l_Controllable : IControllable;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC1F483035F_4A92C1380380_impl*
 Result := False;
 if Supports(aDoc, IControllable, l_Controllable) then
 try
  Result := l_Controllable.GetControlled;
 finally
  l_Controllable := nil;
 end;
//#UC END# *4AC1F483035F_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.IsUnderControl

class function TPrimF1CommonModule.IsCurEditionActual(const aState: IDocumentState): Boolean;
var
 __WasEnter : Boolean;
//#UC START# *4AC1F6E802E5_4A92C1380380_var*
//#UC END# *4AC1F6E802E5_4A92C1380380_var*
var
 l_Info : TRedactionInfo;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC1F6E802E5_4A92C1380380_impl*
  Result := True;
  // http://mdp.garant.ru/pages/viewpage.action?pageId=296096137&focusedCommentId=326777595#comment-326777595 
  if (aState <> nil) and (not DefDataAdapter.InTerminateProcess) then
    Result := aState.IsActual;
//#UC END# *4AC1F6E802E5_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.IsCurEditionActual

class function TPrimF1CommonModule.IsCurEditionActual(const aDocument: IDocument): Boolean;
var
 __WasEnter : Boolean;
//#UC START# *4AC1F71B0366_4A92C1380380_var*
//#UC END# *4AC1F71B0366_4A92C1380380_var*
var
 l_State : IDocumentState;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC1F71B0366_4A92C1380380_impl*
 Result := True;
 if (aDocument <> nil) then
 begin
  aDocument.GetCurrentState(l_State);
  try
   Result := IsCurEditionActual(l_State);
  finally
   l_State := nil;
  end;//try..finally
 end;//aDocument <> nil
//#UC END# *4AC1F71B0366_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.IsCurEditionActual

class function TPrimF1CommonModule.GetCurEditionDate(const aDocument: IDocument): AdapterDate;
var
 __WasEnter : Boolean;
//#UC START# *4AC203EB01AE_4A92C1380380_var*
//#UC END# *4AC203EB01AE_4A92C1380380_var*
var
 l_State : IDocumentState;
 l_Info : TRedactionInfo;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC203EB01AE_4A92C1380380_impl*
 Result := cNullDate;
 if (aDocument <> nil) then
 begin
  aDocument.GetCurrentState(l_State);
  try
   if (l_State <> nil) then
   begin
    l3FillChar(l_Info, SizeOf(l_Info));
    l_State.GetCurrentRedaction(l_Info);
    Result := l_Info.rTimeMachineDate;
   end;//l_State <> nil
  finally
   l_State := nil;
  end;//try..finally
 end;//aDocument <> nil
//#UC END# *4AC203EB01AE_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.GetCurEditionDate

procedure TPrimF1CommonModule.opOpenIntranetTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4BD162890088_4A92C1380380test_var*
//#UC END# *4BD162890088_4A92C1380380test_var*
begin
//#UC START# *4BD162890088_4A92C1380380test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := defDataAdapter.RevisionCheckEnabled and
                                   (DefDataAdapter.CommonInterfaces.GetProductType = PT_SUPERMOBILE);
 aParams.Op.Flag[vcm_ofVisible] := aParams.Op.Flag[vcm_ofEnabled];
//#UC END# *4BD162890088_4A92C1380380test_impl*
end;//TPrimF1CommonModule.opOpenIntranetTest

procedure TPrimF1CommonModule.opOpenIntranet(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4BD162890088_4A92C1380380exec_var*
//#UC END# *4BD162890088_4A92C1380380exec_var*
begin
//#UC START# *4BD162890088_4A92C1380380exec_impl*
 defDataAdapter.OpenIntranet;
//#UC END# *4BD162890088_4A92C1380380exec_impl*
end;//TPrimF1CommonModule.opOpenIntranet

class function TPrimF1CommonModule.OpenTurnOffTimeMachine(const anIntf: InsTurnOffTimeMachine): IvcmEntityForm;
var
 __WasEnter : Boolean;
//#UC START# *4B2624ED010D_4A92C1380380_var*
//#UC END# *4B2624ED010D_4A92C1380380_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4B2624ED010D_4A92C1380380_impl*
 Result := Ten_TurnOffTimeMachine.Make(anIntf);
//#UC END# *4B2624ED010D_4A92C1380380_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimF1CommonModule.OpenTurnOffTimeMachine

procedure TPrimF1CommonModule.Loaded;
begin
 inherited;
 PublishOp('opComplectInfo', opComplectInfo, opComplectInfoTest);
 PublishOp('opPageSetup', opPageSetup, nil);
 PublishOp('opShowEULA', opShowEULA, nil);
 PublishOp('opOpenMainMenuByButton', opOpenMainMenuByButton, nil);
 PublishOp('OpenMainMenuNew', opOpenMainMenuNew, opOpenMainMenuNewTest);
 PublishOp('opTasksPanel', opTasksPanel, nil);
 PublishOp('LetterToDevelopers', opLetterToDevelopers, nil);
 PublishOp('opOpenRubricator', opOpenRubricator, opOpenRubricatorTest);
 PublishOp('opOpenInformation', opOpenInformation, opOpenInformationTest);
 PublishOp('get_navigator', opget_navigator, nil);
 PublishOp('opOpenIntranet', opOpenIntranet, opOpenIntranetTest);
end;

class procedure TPrimF1CommonModule.GetEntityForms(aList : TvcmClassList);
begin
 inherited;
 aList.Add(TRememberPasswordForm);
 aList.Add(TefProgressIndicator);
 aList.Add(TefEULA);
 aList.Add(TefAbout);
 aList.Add(TenCompInfo);
 aList.Add(TnsRegistrationForm);
 aList.Add(Ten_TasksPanel);
 aList.Add(Ten_CommonDiction);
 aList.Add(Ten_Navigator);
 aList.Add(Ten_TurnOffTimeMachine);
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Form_RememberPassword
 Tkw_Form_RememberPassword.Register('�����::RememberPassword', TRememberPasswordForm);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Form_RegistrationForm
 Tkw_Form_RegistrationForm.Register('�����::RegistrationForm', TnsRegistrationForm);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� ������� ����� Navigator
 fm_en_Navigator.SetFactory(Ten_Navigator.Make);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Form_Navigator
 Tkw_Form_Navigator.Register('�����::Navigator', Ten_Navigator);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Navigator_NavigatorTree_ControlInstance
 TtfwScriptEngine.GlobalAddWord('.Ten_Navigator.NavigatorTree', Tkw_Navigator_NavigatorTree_ControlInstance);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Form_TurnOffTimeMachine
 Tkw_Form_TurnOffTimeMachine.Register('�����::TurnOffTimeMachine', Ten_TurnOffTimeMachine);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_TurnOffTimeMachine_rb_totmChangeDate_ControlInstance
 TtfwScriptEngine.GlobalAddWord('.Ten_TurnOffTimeMachine.rb_totmChangeDate', Tkw_TurnOffTimeMachine_rb_totmChangeDate_ControlInstance);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_TurnOffTimeMachine_rb_totmStayInCurrentRedaction_ControlInstance
 TtfwScriptEngine.GlobalAddWord('.Ten_TurnOffTimeMachine.rb_totmStayInCurrentRedaction', Tkw_TurnOffTimeMachine_rb_totmStayInCurrentRedaction_ControlInstance);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_TurnOffTimeMachine_rb_totmGotoActualRedaction_ControlInstance
 TtfwScriptEngine.GlobalAddWord('.Ten_TurnOffTimeMachine.rb_totmGotoActualRedaction', Tkw_TurnOffTimeMachine_rb_totmGotoActualRedaction_ControlInstance);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_TurnOffTimeMachine_deChangeDate_ControlInstance
 TtfwScriptEngine.GlobalAddWord('.Ten_TurnOffTimeMachine.deChangeDate', Tkw_TurnOffTimeMachine_deChangeDate_ControlInstance);
{$IfEnd} //not Admin AND not Monitorings

end.