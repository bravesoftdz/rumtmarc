unit PrimPageSetup_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View$For F1 and Monitorings"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Search/Forms/PrimPageSetup_Form.pas"
// �����: 15.09.2009 16:19
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 Common For Shell And Monitoring::Search::View$For F1 and Monitorings::Search$Presentation for F1 and Monitorings::PrimPageSetup
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If not defined(Admin)}
uses
  Classes
  {$If not defined(NoVCM)}
  ,
  vcmEntityForm
  {$IfEnd} //not NoVCM
  ,
  ConfigInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  ,
  vtGroupBox
  {$If defined(Nemesis)}
  ,
  nscPageControl
  {$IfEnd} //Nemesis
  ,
  l3StringIDEx
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
  PrimPageSetup_pstNone_UserType,
  vcmExternalInterfaces {a},
  vcmInterfaces {a},
  vcmBase {a}
  ;
{$IfEnd} //not Admin

{$If not defined(Admin)}
type
 TPrimPageSetupForm = {form} class(TvcmEntityForm)
 private
 // private fields
   f_PreviewGroupBox : TvtGroupBox;
    {* ���� ��� �������� PreviewGroupBox}
   f_SettingsPageControl : TnscPageControl;
    {* ���� ��� �������� SettingsPageControl}
 protected
  procedure MakeControls; override;
 protected
 // property methods
   function pm_GetPreviewGroupBox: TvtGroupBox;
   function pm_GetSettingsPageControl: TnscPageControl;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
 protected
 // protected fields
   f_CurrentColontitul : Integer;
   f_PageSetup : InsPageSettingsInfo;
   f_DisableControls : Boolean;
 protected
 // protected methods
   procedure ReadPageFormats; virtual; abstract;
   procedure SetColontitulComboBoxItemIndex(aIndex: Integer); virtual; abstract;
   procedure ToGUIMargins; virtual; abstract;
 public
 // public methods
   class function Make(const aData: InsPageSettingsInfo;
    const aParams : IvcmMakeParams = nil;
    aZoneType     : TvcmZoneType = vcm_ztAny;
    aUserType     : TvcmEffectiveUserType = 0;
    aDataSource   : IvcmFormDataSource = nil): IvcmEntityForm; reintroduce;
 public
 // public properties
   property PreviewGroupBox: TvtGroupBox
     read pm_GetPreviewGroupBox;
   property SettingsPageControl: TnscPageControl
     read pm_GetSettingsPageControl;
 end;//TPrimPageSetupForm
{$IfEnd} //not Admin

implementation

{$If not defined(Admin)}
uses
  nsPageSetup
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  ,
  l3MessageID,
  StdRes {a},
  l3Base {a}
  ;
{$IfEnd} //not Admin

{$If not defined(Admin)}

var
   { ������������ ������ pstNoneLocalConstants }
  str_pstNoneCaption : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'pstNoneCaption'; rValue : '��������� ��������');
   { ��������� ����������������� ���� "��������� ��������" }

type
  Tkw_PrimPageSetup_Control_PreviewGroupBox = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� PreviewGroupBox
----
*������ �������������*:
[code]
�������::PreviewGroupBox TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimPageSetup_Control_PreviewGroupBox

// start class Tkw_PrimPageSetup_Control_PreviewGroupBox

{$If not defined(NoScripts)}
function Tkw_PrimPageSetup_Control_PreviewGroupBox.GetString: AnsiString;
 {-}
begin
 Result := 'PreviewGroupBox';
end;//Tkw_PrimPageSetup_Control_PreviewGroupBox.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimPageSetup_Control_PreviewGroupBox_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� PreviewGroupBox
----
*������ �������������*:
[code]
�������::PreviewGroupBox:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimPageSetup_Control_PreviewGroupBox_Push

// start class Tkw_PrimPageSetup_Control_PreviewGroupBox_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimPageSetup_Control_PreviewGroupBox_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('PreviewGroupBox');
 inherited;
end;//Tkw_PrimPageSetup_Control_PreviewGroupBox_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimPageSetup_Control_SettingsPageControl = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� SettingsPageControl
----
*������ �������������*:
[code]
�������::SettingsPageControl TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimPageSetup_Control_SettingsPageControl

// start class Tkw_PrimPageSetup_Control_SettingsPageControl

{$If not defined(NoScripts)}
function Tkw_PrimPageSetup_Control_SettingsPageControl.GetString: AnsiString;
 {-}
begin
 Result := 'SettingsPageControl';
end;//Tkw_PrimPageSetup_Control_SettingsPageControl.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimPageSetup_Control_SettingsPageControl_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� SettingsPageControl
----
*������ �������������*:
[code]
�������::SettingsPageControl:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimPageSetup_Control_SettingsPageControl_Push

// start class Tkw_PrimPageSetup_Control_SettingsPageControl_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimPageSetup_Control_SettingsPageControl_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('SettingsPageControl');
 inherited;
end;//Tkw_PrimPageSetup_Control_SettingsPageControl_Push.DoDoIt
{$IfEnd} //not NoScripts

function TPrimPageSetupForm.pm_GetPreviewGroupBox: TvtGroupBox;
begin
 if (f_PreviewGroupBox = nil) then
  f_PreviewGroupBox := FindComponent('PreviewGroupBox') As TvtGroupBox;
 Result := f_PreviewGroupBox;
end;

function TPrimPageSetupForm.pm_GetSettingsPageControl: TnscPageControl;
begin
 if (f_SettingsPageControl = nil) then
  f_SettingsPageControl := FindComponent('SettingsPageControl') As TnscPageControl;
 Result := f_SettingsPageControl;
end;

class function TPrimPageSetupForm.Make(const aData: InsPageSettingsInfo;
  const aParams : IvcmMakeParams = nil;
  aZoneType     : TvcmZoneType = vcm_ztAny;
  aUserType     : TvcmEffectiveUserType = 0;
  aDataSource   : IvcmFormDataSource = nil): IvcmEntityForm;

 procedure AfterCreate(aForm : TPrimPageSetupForm);
 begin
  with aForm do
  begin
//#UC START# *4AC607B7039E_4AAF8637036A_impl*
   f_CurrentColontitul := -1;
   // ������� ������������� ������������
   if (aData <> nil) then
    f_PageSetup := aData
   else
    f_PageSetup := TnsPageSetup.Make;
   // �������� ������������ �� ����� �������������
   Assert(Assigned(f_PageSetup));
   f_DisableControls := False;
   ReadPageFormats;
   PreviewGroupBox.Parent := SettingsPageControl.ActivePage;
   SetColontitulComboBoxItemIndex(0);
   ToGUIMargins;
//#UC END# *4AC607B7039E_4AAF8637036A_impl*
  end;//with aForm
 end;

var
 l_AC : TvcmInitProc;
 l_ACHack : Pointer absolute l_AC;
begin
 l_AC := l3LocalStub(@AfterCreate);
 try
  Result := inherited Make(aParams, aZoneType, aUserType, nil, aDataSource, vcm_utAny, l_AC);
 finally
  l3FreeLocalStub(l_ACHack);
 end;//try..finally
end;

procedure TPrimPageSetupForm.Cleanup;
//#UC START# *479731C50290_4AAF8637036A_var*
//#UC END# *479731C50290_4AAF8637036A_var*
begin
//#UC START# *479731C50290_4AAF8637036A_impl*
 f_PageSetup := nil;
 inherited;
//#UC END# *479731C50290_4AAF8637036A_impl*
end;//TPrimPageSetupForm.Cleanup

procedure TPrimPageSetupForm.MakeControls;
begin
 inherited;
 with AddUsertype(pstNoneName,
  str_pstNoneCaption,
  str_pstNoneCaption,
  true,
  -1,
  -1,
  '',
  nil,
  nil,
  nil,
  vcm_ccNone) do
 begin
 end;//with AddUsertype(pstNoneName
end;

{$IfEnd} //not Admin

initialization
{$If not defined(Admin)}
// ����������� Tkw_PrimPageSetup_Control_PreviewGroupBox
 Tkw_PrimPageSetup_Control_PreviewGroupBox.Register('�������::PreviewGroupBox', TvtGroupBox);
{$IfEnd} //not Admin
{$If not defined(Admin)}
// ����������� Tkw_PrimPageSetup_Control_PreviewGroupBox_Push
 Tkw_PrimPageSetup_Control_PreviewGroupBox_Push.Register('�������::PreviewGroupBox:push');
{$IfEnd} //not Admin
{$If not defined(Admin)}
// ����������� Tkw_PrimPageSetup_Control_SettingsPageControl
 Tkw_PrimPageSetup_Control_SettingsPageControl.Register('�������::SettingsPageControl', TnscPageControl);
{$IfEnd} //not Admin
{$If not defined(Admin)}
// ����������� Tkw_PrimPageSetup_Control_SettingsPageControl_Push
 Tkw_PrimPageSetup_Control_SettingsPageControl_Push.Register('�������::SettingsPageControl:push');
{$IfEnd} //not Admin
{$If not defined(Admin)}
// ������������� str_pstNoneCaption
 str_pstNoneCaption.Init;
{$IfEnd} //not Admin

end.