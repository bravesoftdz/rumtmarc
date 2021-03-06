unit Settings_Module;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Settings/Settings_Module.pas"
// �����: 09.09.2009 16:29
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMFormsPack::Class>> F1 �������� ����������::Settings::View::Settings::Settings
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
  Classes
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  ,
  ConfigInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  ,
  PrimSettings_Form,
  PrimStyleEditorFont_Form,
  PrimStyleEditorNavigator_Form,
  PrimStyleEditorExample_Form,
  l3StringIDEx,
  PrimSelfInfo_Form,
  PrimConfigurationList_Form,
  Common_FormDefinitions_Controls,
  PrimStyleEditorContainerOptions_Form
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts)}
  ,
  tfwInteger
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts)}
  ,
  tfwControlString
  {$IfEnd} //not NoScripts
  ,
  StyleEditorContainer_Form,
  StyleEditorFont_Form,
  StyleEditorNavigator_Form,
  ConfigurationList_Form,
  Settings_Form,
  StyleEditorExample_Form,
  SelfInfo_Form,
  vcmExternalInterfaces {a},
  vcmModule {a},
  vcmBase {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TSettingsModule = {formspack} class(TvcmModule)
 protected
  procedure Loaded; override;
  class procedure GetEntityForms(aList : TvcmClassList); override;
 protected
 // protected methods
   procedure opOpenStyleEditorAsModal(const aParams: IvcmExecuteParamsPrim);
     {* �������� ������... }
   procedure opAutoLoginTest(const aParams: IvcmTestParamsPrim);
     {* �������������� ���� � ������� }
   procedure opAutoLogin(const aParams: IvcmExecuteParamsPrim);
     {* �������������� ���� � ������� }
   procedure opSelectConfigTest(const aParams: IvcmTestParamsPrim);
     {* ����� ������������ }
   procedure opSelectConfig(const aParams: IvcmExecuteParamsPrim);
     {* ����� ������������ }
   procedure opOpenConfList(const aParams: IvcmExecuteParamsPrim);
     {* ������ ������������ }
   procedure opLoadActiveSettings(const aParams: IvcmExecuteParamsPrim);
     {* ��������� ������������... }
   procedure opUserPropertiesTest(const aParams: IvcmTestParamsPrim);
     {* �������� ��� ��������������� ������... }
   procedure opUserProperties(const aParams: IvcmExecuteParamsPrim);
     {* �������� ��� ��������������� ������... }
 public
 // public methods
   class function OpenStyleEditorAsModal(const aData: InsStyleTableSettingsInfo): Integer;
   class procedure CloseConfList(const aContainer: IvcmContainer);
     {* ������� ������ ������������ }
   class function LoadSettings(const anAggregate: IvcmAggregate;
     const aData: InsConfigSettingsInfo): IvcmEntityForm;
     {* ������� ��������� }
   class procedure OpenConfList(const aContainer: IvcmContainer);
 end;//TSettingsModule
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  nsStyleEditor,
  evStyleInterface,
  Controls,
  nsSettingsUtils,
  l3MessageID,
  OfficeLike_Result_Controls
  {$If not defined(NoScripts)}
  ,
  tfwScriptEngine
  {$IfEnd} //not NoScripts
  ,
  nsAppConfig,
  DataAdapter,
  SysUtils,
  nsConfigurationList
  {$If not defined(NoVCM)}
  ,
  vcmEntityForm
  {$IfEnd} //not NoVCM
  ,
  PrimStyleEditorExample_utStyleEditorExample_UserType,
  kw_Settings_OpenStyleEditorAsModal,
  kw_Settings_AutoLogin,
  kw_Settings_SelectConfig,
  kw_Settings_OpenConfList,
  kw_Settings_LoadActiveSettings,
  kw_Settings_UserProperties,
  vcmFormSetFactory {a},
  StdRes {a},
  vcmModuleDef {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

type
  Tkw_Form_StyleEditorContainer = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� StyleEditorContainer
----
*������ �������������*:
[code]
'aControl' �����::StyleEditorContainer TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_StyleEditorContainer

// start class Tkw_Form_StyleEditorContainer

{$If not defined(NoScripts)}
function Tkw_Form_StyleEditorContainer.GetString: AnsiString;
 {-}
begin
 Result := 'StyleEditorContainerForm';
end;//Tkw_Form_StyleEditorContainer.GetString
{$IfEnd} //not NoScripts

type
  Tkw_Form_StyleEditorFont = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� StyleEditorFont
----
*������ �������������*:
[code]
'aControl' �����::StyleEditorFont TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_StyleEditorFont

// start class Tkw_Form_StyleEditorFont

{$If not defined(NoScripts)}
function Tkw_Form_StyleEditorFont.GetString: AnsiString;
 {-}
begin
 Result := 'StyleEditorFontForm';
end;//Tkw_Form_StyleEditorFont.GetString
{$IfEnd} //not NoScripts

type
  Tkw_Form_StyleEditorNavigator = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� StyleEditorNavigator
----
*������ �������������*:
[code]
'aControl' �����::StyleEditorNavigator TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_StyleEditorNavigator

// start class Tkw_Form_StyleEditorNavigator

{$If not defined(NoScripts)}
function Tkw_Form_StyleEditorNavigator.GetString: AnsiString;
 {-}
begin
 Result := 'StyleEditorNavigatorForm';
end;//Tkw_Form_StyleEditorNavigator.GetString
{$IfEnd} //not NoScripts

type
  Tkw_StyleEditorNavigator_f_StyleTreeView_ControlInstance = class(TtfwWord)
   {* ����� ������� ��� ������� � ���������� �������� f_StyleTreeView ����� StyleEditorNavigator }
  protected
  // realized methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_StyleEditorNavigator_f_StyleTreeView_ControlInstance

// start class Tkw_StyleEditorNavigator_f_StyleTreeView_ControlInstance

{$If not defined(NoScripts)}
procedure Tkw_StyleEditorNavigator_f_StyleTreeView_ControlInstance.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((aCtx.rEngine.PopObj As TStyleEditorNavigatorForm).f_StyleTreeView);
end;//Tkw_StyleEditorNavigator_f_StyleTreeView_ControlInstance.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_Form_Settings = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� Settings
----
*������ �������������*:
[code]
'aControl' �����::Settings TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_Settings

// start class Tkw_Form_Settings

{$If not defined(NoScripts)}
function Tkw_Form_Settings.GetString: AnsiString;
 {-}
begin
 Result := 'cf_Settings';
end;//Tkw_Form_Settings.GetString
{$IfEnd} //not NoScripts

type
  Tkw_Form_StyleEditorExample = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� StyleEditorExample
----
*������ �������������*:
[code]
'aControl' �����::StyleEditorExample TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_StyleEditorExample

// start class Tkw_Form_StyleEditorExample

{$If not defined(NoScripts)}
function Tkw_Form_StyleEditorExample.GetString: AnsiString;
 {-}
begin
 Result := 'StyleEditorExampleForm';
end;//Tkw_Form_StyleEditorExample.GetString
{$IfEnd} //not NoScripts

type
  Tkw_StyleEditorExample_f_TextSource_ControlInstance = class(TtfwWord)
   {* ����� ������� ��� ������� � ���������� �������� f_TextSource ����� StyleEditorExample }
  protected
  // realized methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_StyleEditorExample_f_TextSource_ControlInstance

// start class Tkw_StyleEditorExample_f_TextSource_ControlInstance

{$If not defined(NoScripts)}
procedure Tkw_StyleEditorExample_f_TextSource_ControlInstance.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((aCtx.rEngine.PopObj As TStyleEditorExampleForm).f_TextSource);
end;//Tkw_StyleEditorExample_f_TextSource_ControlInstance.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_Form_SelfInfo = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� SelfInfo
----
*������ �������������*:
[code]
'aControl' �����::SelfInfo TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_SelfInfo

// start class Tkw_Form_SelfInfo

{$If not defined(NoScripts)}
function Tkw_Form_SelfInfo.GetString: AnsiString;
 {-}
begin
 Result := 'SelfInfoForm';
end;//Tkw_Form_SelfInfo.GetString
{$IfEnd} //not NoScripts

class function TSettingsModule.OpenStyleEditorAsModal(const aData: InsStyleTableSettingsInfo): Integer;
var
 __WasEnter : Boolean;
//#UC START# *4ABA122E00AE_4AA79F72010A_var*
//#UC END# *4ABA122E00AE_4AA79F72010A_var*
var
 l_SettingsData : InsStyleTableSettingsInfo;
 l_Container : IvcmEntityForm;
 l_Params : IvcmMakeParams;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABA122E00AE_4AA79F72010A_impl*
 Result := mrNone;
 if (aData = nil) then
  l_SettingsData := TnsStyleTableSettingsInfo.Make
 else
  l_SettingsData := aData;
 try
  l_Params := vcmCheckAggregate(vcmMakeParams);
  try
   with TevStyleInterface.Make do
    try
     Changing;
     try
      l_Container := TStyleEditorContainerForm.Make(l_SettingsData, l_Params);
      try
       l_Params := vcmMakeParams(l_Params.Aggregate, l_Container.AsContainer, l_Params.Owner);
       TStyleEditorExampleForm.Make(l_Params, vcm_ztChild,
        Ord(utStyleEditorExample));
       TStyleEditorFontForm.Make(l_SettingsData, l_Params);
       TStyleEditorNavigatorForm.Make(l_Params);
       Result := l_Container.ShowModal;
       if (Result <> mrOk) or not l_SettingsData.IsActive then
        LoadStyleTableFromSettings;
      finally
       l_Container := nil;
      end;//try..finally
     finally
      ChangedEx((Result = mrOk) and not l_SettingsData.IsActive);
     end;//try..finally
    finally
     Free;
    end;//try..finally
  finally
   l_Params := nil;
  end;//try..finally
 finally
  l_SettingsData := nil;
 end;//try..finally
//#UC END# *4ABA122E00AE_4AA79F72010A_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TSettingsModule.OpenStyleEditorAsModal

procedure TSettingsModule.opOpenStyleEditorAsModal(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABB46310087_4AA79F72010Aexec_var*
//#UC END# *4ABB46310087_4AA79F72010Aexec_var*
begin
//#UC START# *4ABB46310087_4AA79F72010Aexec_impl*
 Assert(((aParams As IvcmExecuteParams).Data = nil),
        '����������� ���������');
 OpenStyleEditorAsModal(nil);
//#UC END# *4ABB46310087_4AA79F72010Aexec_impl*
end;//TSettingsModule.opOpenStyleEditorAsModal

procedure TSettingsModule.opAutoLoginTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4ABB49400064_4AA79F72010Atest_var*
//#UC END# *4ABB49400064_4AA79F72010Atest_var*
begin
//#UC START# *4ABB49400064_4AA79F72010Atest_impl*
{$IfDef nsAutoLoginDisable}
 aParams.Op.Flag[vcm_ofEnabled] := False;
{$Else}
 aParams.Op.Flag[vcm_ofChecked] := DefDataAdapter.RegistryIsAutoLogin;
{$EndIf}
//#UC END# *4ABB49400064_4AA79F72010Atest_impl*
end;//TSettingsModule.opAutoLoginTest

procedure TSettingsModule.opAutoLogin(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABB49400064_4AA79F72010Aexec_var*
//#UC END# *4ABB49400064_4AA79F72010Aexec_var*
begin
//#UC START# *4ABB49400064_4AA79F72010Aexec_impl*
  with DefDataAdapter do
   RegistryIsAutoLogin := not(RegistryIsAutoLogin);
//#UC END# *4ABB49400064_4AA79F72010Aexec_impl*
end;//TSettingsModule.opAutoLogin

procedure TSettingsModule.opSelectConfigTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4ABB4BB100C0_4AA79F72010Atest_var*
var
 l_List : IvcmNodes;
//#UC END# *4ABB4BB100C0_4AA79F72010Atest_var*
begin
//#UC START# *4ABB4BB100C0_4AA79F72010Atest_impl*
 with aParams do
 begin
  Op.Flag[vcm_ofEnabled] := True;

  l_List := Op.SubNodes;
  if (l_List <> nil) then
  begin
   l_List.ShowRoot := false;
   if (l_List.Count = 0) then
   begin
    l_List.Clear;
    l_List.Add(ConfigurationList.MenuTree);
   end;//l_List.Count = 0
   l_List.Current := ConfigurationList.ActiveMenuNode;
  end;//l_List <> nil
 end;//with aParams
//#UC END# *4ABB4BB100C0_4AA79F72010Atest_impl*
end;//TSettingsModule.opSelectConfigTest

procedure TSettingsModule.opSelectConfig(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABB4BB100C0_4AA79F72010Aexec_var*
var
 l_Node: InsConfigNode;
//#UC END# *4ABB4BB100C0_4AA79F72010Aexec_var*
begin
//#UC START# *4ABB4BB100C0_4AA79F72010Aexec_impl*
 if Supports(aParams.CurrentNode, InsConfigNode, l_Node) then
 try
  ConfigurationList.ActivateConfig(l_Node);
 finally
  l_Node := nil;
 end;
//#UC END# *4ABB4BB100C0_4AA79F72010Aexec_impl*
end;//TSettingsModule.opSelectConfig

procedure TSettingsModule.opOpenConfList(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABB4E9A0064_4AA79F72010Aexec_var*
//#UC END# *4ABB4E9A0064_4AA79F72010Aexec_var*
begin
//#UC START# *4ABB4E9A0064_4AA79F72010Aexec_impl*
 Assert(((aParams As IvcmExecuteParams).Data = nil),
        '����������� ���������');
 OpenConfList(nil);
//#UC END# *4ABB4E9A0064_4AA79F72010Aexec_impl*
end;//TSettingsModule.opOpenConfList

class procedure TSettingsModule.CloseConfList(const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4ABB51300045_4AA79F72010A_var*
var
 l_Form: IvcmEntityForm;
//#UC END# *4ABB51300045_4AA79F72010A_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABB51300045_4AA79F72010A_impl*
 Assert(aContainer <> nil);
 aContainer.HasForm(fm_en_ConfigurationList.rFormID,
                    vcm_ztNavigator,
                    True,
                    @l_Form);
 if l_Form <> nil then
  l_Form.SafeClose;
//#UC END# *4ABB51300045_4AA79F72010A_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TSettingsModule.CloseConfList

class function TSettingsModule.LoadSettings(const anAggregate: IvcmAggregate;
  const aData: InsConfigSettingsInfo): IvcmEntityForm;
var
 __WasEnter : Boolean;
//#UC START# *4ABB5496029E_4AA79F72010A_var*
//#UC END# *4ABB5496029E_4AA79F72010A_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABB5496029E_4AA79F72010A_impl*
 (* aParams �������� ������������� ������������ (IConfiguration), ���������� ��
  enConfigurationList *)
 Result := Tcf_Settings.Make(aData, vcmMakeParams(anAggregate), vcm_ztModal);
//#UC END# *4ABB5496029E_4AA79F72010A_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TSettingsModule.LoadSettings

procedure TSettingsModule.opLoadActiveSettings(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4ABB5926039A_4AA79F72010Aexec_var*
var
 l_Form       : IvcmEntityForm;
 l_Params     : IvcmMakeParams;
//#UC END# *4ABB5926039A_4AA79F72010Aexec_var*
begin
//#UC START# *4ABB5926039A_4AA79F72010Aexec_impl*
 (* ��������� �� ���������� *)
 if CheckContainer(nil).NativeMainForm.
  HasForm(fm_en_ConfigurationList.rFormID, vcm_ztNavigator, True, @l_Form) then
 try
  (* � ����� "������ ������������" ��������� �� ���������� *)
  if not Assigned(l_Form.Aggregate) then
  begin
   l_Params := vcmCheckAggregate(vcmMakeParams(nil, CheckContainer(nil)));
   (l_Form.VCLWinControl As TvcmEntityForm).Aggregate := l_Params.Aggregate;
  end//not Assigned(l_Form.Aggregate)
  (* ��������� ���������� ��������� ����� *)
  else
   l_Params := vcmSetAggregate(l_Form.Aggregate, vcmMakeParams(nil, CheckContainer(nil)));
 finally
  l_Form := nil;
 end//try..finally
 else
  l_Params := vcmMakeParams(nil, CheckContainer(nil));
 Tcf_Settings.Make(ConfigurationList.ActiveConfig, l_Params, vcm_ztModal);
//#UC END# *4ABB5926039A_4AA79F72010Aexec_impl*
end;//TSettingsModule.opLoadActiveSettings

class procedure TSettingsModule.OpenConfList(const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4AC0FF9D0332_4AA79F72010A_var*
var
 l_Form : IvcmEntityForm;
//#UC END# *4AC0FF9D0332_4AA79F72010A_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC0FF9D0332_4AA79F72010A_impl*
 l_Form := Ten_ConfigurationList.MakeSingleChild(CheckContainer(aContainer),
                             vcmCheckAggregate(
                              vcmMakeParams(nil,
                                        CheckContainer(aContainer))),
                             vcm_ztNavigator);

 if (l_Form <> nil) then
  l_Form.SetActiveInParent;
//#UC END# *4AC0FF9D0332_4AA79F72010A_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TSettingsModule.OpenConfList

procedure TSettingsModule.opUserPropertiesTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4B506F0902B5_4AA79F72010Atest_var*
//#UC END# *4B506F0902B5_4AA79F72010Atest_var*
begin
//#UC START# *4B506F0902B5_4AA79F72010Atest_impl*
// Do nothing;
//#UC END# *4B506F0902B5_4AA79F72010Atest_impl*
end;//TSettingsModule.opUserPropertiesTest

procedure TSettingsModule.opUserProperties(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4B506F0902B5_4AA79F72010Aexec_var*
//#UC END# *4B506F0902B5_4AA79F72010Aexec_var*
begin
//#UC START# *4B506F0902B5_4AA79F72010Aexec_impl*
 TSelfInfoForm.Make(vcmMakeParams);
//#UC END# *4B506F0902B5_4AA79F72010Aexec_impl*
end;//TSettingsModule.opUserProperties

procedure TSettingsModule.Loaded;
begin
 inherited;
 PublishOp('opOpenStyleEditorAsModal', opOpenStyleEditorAsModal, nil);
 PublishOp('opAutoLogin', opAutoLogin, opAutoLoginTest);
 PublishOp('opSelectConfig', opSelectConfig, opSelectConfigTest);
 PublishOp('opOpenConfList', opOpenConfList, nil);
 PublishOp('opLoadActiveSettings', opLoadActiveSettings, nil);
 PublishOp('opUserProperties', opUserProperties, opUserPropertiesTest);
end;

class procedure TSettingsModule.GetEntityForms(aList : TvcmClassList);
begin
 inherited;
 aList.Add(TStyleEditorContainerForm);
 aList.Add(TStyleEditorFontForm);
 aList.Add(TStyleEditorNavigatorForm);
 aList.Add(Ten_ConfigurationList);
 aList.Add(Tcf_Settings);
 aList.Add(TStyleEditorExampleForm);
 aList.Add(TSelfInfoForm);
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Form_StyleEditorContainer
 Tkw_Form_StyleEditorContainer.Register('�����::StyleEditorContainer', TStyleEditorContainerForm);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Form_StyleEditorFont
 Tkw_Form_StyleEditorFont.Register('�����::StyleEditorFont', TStyleEditorFontForm);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Form_StyleEditorNavigator
 Tkw_Form_StyleEditorNavigator.Register('�����::StyleEditorNavigator', TStyleEditorNavigatorForm);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_StyleEditorNavigator_f_StyleTreeView_ControlInstance
 TtfwScriptEngine.GlobalAddWord('.TStyleEditorNavigatorForm.f_StyleTreeView', Tkw_StyleEditorNavigator_f_StyleTreeView_ControlInstance);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Form_Settings
 Tkw_Form_Settings.Register('�����::Settings', Tcf_Settings);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Form_StyleEditorExample
 Tkw_Form_StyleEditorExample.Register('�����::StyleEditorExample', TStyleEditorExampleForm);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_StyleEditorExample_f_TextSource_ControlInstance
 TtfwScriptEngine.GlobalAddWord('.TStyleEditorExampleForm.f_TextSource', Tkw_StyleEditorExample_f_TextSource_ControlInstance);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Form_SelfInfo
 Tkw_Form_SelfInfo.Register('�����::SelfInfo', TSelfInfoForm);
{$IfEnd} //not Admin AND not Monitorings

end.