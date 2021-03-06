unit PrimProgressIndicator_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Common/Forms/PrimProgressIndicator_Form.pas"
// �����: 25.08.2009 18:14
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 Core::Common::View::Common::PrimProgressIndicator
//
// ��������� ���������
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
  SearchInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmEntityForm
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  ,
  ComCtrls,
  l3StringIDEx
  {$If not defined(NoVGScene)}
  ,
  vg_scene
  {$IfEnd} //not NoVGScene
  
  {$If not defined(NoVGScene)}
  ,
  vtVGButton
  {$IfEnd} //not NoVGScene
  
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
  PrimProgressIndicator_utProgressIndicator_UserType,
  vcmExternalInterfaces {a},
  vcmInterfaces {a},
  vcmBase {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
const
  { ProgressIndicatorConstants }
 WM_USER_SET_CURRENT = WM_USER + $0101;
 WM_USER_FINISH_PROCESS = WM_USER + $0102;

type
 TPrimProgressIndicatorForm = {form} class(TvcmEntityForm)
  {* ��������� ��������� }
 private
 // private fields
   f_CancelButton : TvtVGButton;
   f_Scene : TvgScene;
   f_Background : TvgBackground;
   f_ProgressBar : TProgressBar;
    {* ���� ��� �������� ProgressBar}
 protected
  procedure MakeControls; override;
 private
 // private methods
   procedure VcmEntityFormRefCloseQuery(Sender: TObject;
     var CanClose: Boolean);
   procedure WMUserSetCurrent(var Message: TMessage); message WM_USER_SET_CURRENT;
   procedure WMUserFinishProcess(var Message: TMessage); message WM_USER_FINISH_PROCESS;
 protected
 // property methods
   function pm_GetProgressBar: TProgressBar;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   {$If not defined(NoVCM)}
   procedure BecomeActive; override;
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   procedure InitControls; override;
     {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
 protected
 // protected fields
   f_Owner : InsProgressIndicator;
   f_Caption : Il3CString;
   f_SearchStarted : Boolean;
   f_SearchFinished : Boolean;
   f_SearchFinishing : Boolean;
 public
 // public methods
   class function Make(const aProgress: InsProgressIndicator;
    const aCaption: Il3CString;
    aMaxCount: Integer;
    const aParams : IvcmMakeParams = nil;
    aZoneType     : TvcmZoneType = vcm_ztAny;
    aUserType     : TvcmEffectiveUserType = 0;
    aDataSource   : IvcmFormDataSource = nil): IvcmEntityForm; reintroduce;
 public
 // public properties
   property ProgressBar: TProgressBar
     read pm_GetProgressBar;
 end;//TPrimProgressIndicatorForm

 TvcmEntityFormRef = TPrimProgressIndicatorForm;
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  l3Defaults,
  StdRes,
  vtDialogsResEx,
  l3String,
  l3Math,
  Controls,
  Forms,
  Dialogs,
  Graphics
  {$If not defined(NoVGScene)}
  ,
  vtVGSceneRes
  {$IfEnd} //not NoVGScene
  
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  ,
  l3MessageID,
  l3Base {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

var
   { ������������ ������ utProgressIndicatorLocalConstants }
  str_utProgressIndicatorCaption : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'utProgressIndicatorCaption'; rValue : '');
   { ��������� ����������������� ���� "" }
  str_utProgressIndicatorSettingsCaption : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'utProgressIndicatorSettingsCaption'; rValue : '��� ����������');
   { ��������� ����������������� ���� "" ��� ��������� ������� ������������ }

var
   { ������������ ������ ProgressIndicatorLocalConst }
  str_CancelButtonCaption : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'CancelButtonCaption'; rValue : '&������');
   { '&������' }

type
  Tkw_PrimProgressIndicator_Control_ProgressBar = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� ProgressBar
----
*������ �������������*:
[code]
�������::ProgressBar TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimProgressIndicator_Control_ProgressBar

// start class Tkw_PrimProgressIndicator_Control_ProgressBar

{$If not defined(NoScripts)}
function Tkw_PrimProgressIndicator_Control_ProgressBar.GetString: AnsiString;
 {-}
begin
 Result := 'ProgressBar';
end;//Tkw_PrimProgressIndicator_Control_ProgressBar.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimProgressIndicator_Control_ProgressBar_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� ProgressBar
----
*������ �������������*:
[code]
�������::ProgressBar:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimProgressIndicator_Control_ProgressBar_Push

// start class Tkw_PrimProgressIndicator_Control_ProgressBar_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimProgressIndicator_Control_ProgressBar_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('ProgressBar');
 inherited;
end;//Tkw_PrimProgressIndicator_Control_ProgressBar_Push.DoDoIt
{$IfEnd} //not NoScripts

procedure TPrimProgressIndicatorForm.VcmEntityFormRefCloseQuery(Sender: TObject;
  var CanClose: Boolean);
//#UC START# *50F98967031E_4A93F1980324_var*
//#UC END# *50F98967031E_4A93F1980324_var*
begin
//#UC START# *50F98967031E_4A93F1980324_impl*
 if Assigned(f_Owner) and not f_SearchFinished then
 begin
  CanClose := False;
  if not f_SearchFinishing then
  begin
   f_Owner.StopProcess;
   f_SearchFinishing := True;
  end;
 end;
//#UC END# *50F98967031E_4A93F1980324_impl*
end;//TPrimProgressIndicatorForm.VcmEntityFormRefCloseQuery

function TPrimProgressIndicatorForm.pm_GetProgressBar: TProgressBar;
begin
 if (f_ProgressBar = nil) then
  f_ProgressBar := FindComponent('ProgressBar') As TProgressBar;
 Result := f_ProgressBar;
end;

class function TPrimProgressIndicatorForm.Make(const aProgress: InsProgressIndicator;
  const aCaption: Il3CString;
  aMaxCount: Integer;
  const aParams : IvcmMakeParams = nil;
  aZoneType     : TvcmZoneType = vcm_ztAny;
  aUserType     : TvcmEffectiveUserType = 0;
  aDataSource   : IvcmFormDataSource = nil): IvcmEntityForm;

 procedure AfterCreate(aForm : TPrimProgressIndicatorForm);
 begin
  with aForm do
  begin
//#UC START# *4AC6270C00E2_4A93F1980324_impl*
   f_Owner := aProgress;
   if (aCaption <> nil) then
   begin
    f_Caption := aCaption;
    CCaption := f_Caption;
   end//aCaption <> nil
   else
    f_Caption := CCaption;
   ProgressBar.Max := aMaxCount;
   f_SearchStarted := False;
//#UC END# *4AC6270C00E2_4A93F1980324_impl*
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

procedure TPrimProgressIndicatorForm.WMUserSetCurrent(var Message: TMessage);
//#UC START# *50F98780007B_4A93F1980324_var*
var
 l_Percentage: LongInt;
//#UC END# *50F98780007B_4A93F1980324_var*
begin
//#UC START# *50F98780007B_4A93F1980324_impl*
 ProgressBar.Position := Message.WParam;
 if (Message.WParam > 0) then
 begin
  l_Percentage := l3MulDiv(ProgressBar.Position,100,ProgressBar.Max);
  CCaption := l3Cat([f_Caption, vcmFmt(str_ProgressSuffix, [l_Percentage])])
 end
 else
 begin
  CCaption := f_Caption;
  l_Percentage := 0;
 end;
 f_CancelButton.Enabled := l_Percentage < 100;
 f_CancelButton.Repaint;
 Message.Result := 0;
//#UC END# *50F98780007B_4A93F1980324_impl*
end;//TPrimProgressIndicatorForm.WMUserSetCurrent

procedure TPrimProgressIndicatorForm.WMUserFinishProcess(var Message: TMessage);
//#UC START# *50F987AA03D9_4A93F1980324_var*
//#UC END# *50F987AA03D9_4A93F1980324_var*
begin
//#UC START# *50F987AA03D9_4A93F1980324_impl*
 Message.Result := 0;
 f_CancelButton.Repaint;
 f_SearchFinished := True;
 ModalResult := mrCancel;
//#UC END# *50F987AA03D9_4A93F1980324_impl*
end;//TPrimProgressIndicatorForm.WMUserFinishProcess

procedure TPrimProgressIndicatorForm.Cleanup;
//#UC START# *479731C50290_4A93F1980324_var*
//#UC END# *479731C50290_4A93F1980324_var*
begin
//#UC START# *479731C50290_4A93F1980324_impl*
 f_Owner := nil;
 f_Caption := nil;
 inherited;
//#UC END# *479731C50290_4A93F1980324_impl*
end;//TPrimProgressIndicatorForm.Cleanup

{$If not defined(NoVCM)}
procedure TPrimProgressIndicatorForm.BecomeActive;
//#UC START# *4A8AE0FA03B2_4A93F1980324_var*
//#UC END# *4A8AE0FA03B2_4A93F1980324_var*
begin
//#UC START# *4A8AE0FA03B2_4A93F1980324_impl*
 inherited;
 if Assigned(f_Owner) and not f_SearchStarted then
 begin
  f_SearchStarted := True;
  f_Owner.StartProcess(self.Entity);
 end;//Assigned(f_Owner) and not f_SearchStarted
//#UC END# *4A8AE0FA03B2_4A93F1980324_impl*
end;//TPrimProgressIndicatorForm.BecomeActive
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimProgressIndicatorForm.InitControls;
//#UC START# *4A8E8F2E0195_4A93F1980324_var*
var
 l_Top : Integer;
//#UC END# *4A8E8F2E0195_4A93F1980324_var*
begin
//#UC START# *4A8E8F2E0195_4A93F1980324_impl*
 inherited;

 OnCloseQuery := VcmEntityFormRefCloseQuery;

 Self.Color := cGarant2011BackColor;
 Self.ClientHeight := 71;
 Self.ClientWidth := 425;
 Self.BorderIcons := [];
 Self.BorderStyle := bsSingle;
 Self.Position := poScreenCenter;

 with ProgressBar do
 begin
  SetBounds(8, 8, 409, 25);
 end;
 
 f_BackGround := TvgBackGround.Create(Self);
 with f_BackGround do
 begin
  Fill.Style := vgBrushSolid;
  Fill.Color := vgColorToStr($FF000000 OR Cardinal(ColorToRGB(Self.Color)));
 end;

 f_Scene := TvgScene.Create(Self);
 with f_Scene do
 begin
  Parent := Self;
  AddObject(f_BackGround);
  l_Top := ProgressBar.BoundsRect.Bottom;
  SetBounds(0, l_Top, Self.Width, Self.Height - l_Top);
  Style := vtVGSceneResources.vgResources;
 end;
 f_CancelButton := TvtVGButton.Create(Self);
 with f_CancelButton do
 begin
  Name := 'CancelButton';
  Parent := TvgObject(f_Scene.Root);
  SetBounds(l3MulDiv(Self.Width - Round(Width), 1, 2),
            l3MulDiv(Round(Height), 1, 3),
            Round(Width),
            Round(Height));
  Resource := cButtonStyleLayoutName;
  Font.Assign(Self.Font);
  Cancel := True;
  Caption := str_CancelButtonCaption.AsStr;
  Default := True;
  ModalResult := mrCancel;
  Text := l3WideString(vtGetDlgBtnCaption(mbCancel));
  TabOrder := 0;
 end;
 Self.ActiveControl := f_Scene;
 f_Scene.ActiveControl := f_CancelButton;
//#UC END# *4A8E8F2E0195_4A93F1980324_impl*
end;//TPrimProgressIndicatorForm.InitControls
{$IfEnd} //not NoVCM

procedure TPrimProgressIndicatorForm.MakeControls;
begin
 inherited;
 with AddUsertype(utProgressIndicatorName,
  str_utProgressIndicatorCaption,
  str_utProgressIndicatorSettingsCaption,
  true,
  -1,
  -1,
  '',
  nil,
  nil,
  nil,
  vcm_ccNone) do
 begin
 end;//with AddUsertype(utProgressIndicatorName
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimProgressIndicator_Control_ProgressBar
 Tkw_PrimProgressIndicator_Control_ProgressBar.Register('�������::ProgressBar', TProgressBar);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimProgressIndicator_Control_ProgressBar_Push
 Tkw_PrimProgressIndicator_Control_ProgressBar_Push.Register('�������::ProgressBar:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_utProgressIndicatorCaption
 str_utProgressIndicatorCaption.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_utProgressIndicatorSettingsCaption
 str_utProgressIndicatorSettingsCaption.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_CancelButtonCaption
 str_CancelButtonCaption.Init;
{$IfEnd} //not Admin AND not Monitorings

end.