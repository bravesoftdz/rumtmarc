unit PrimTasksPanelMenu_Module;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/VCM/View/TasksPanel/PrimTasksPanelMenu_Module.pas"
// �����: 13.09.2010 11:55
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMFormsPack::Class>> Shared Delphi Operations::VCMCustomization::View::TasksPanel::PrimTasksPanelMenu
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

interface

uses
  Menus
  {$If not defined(NoVCM)}
  ,
  vcmTaskPanelInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  ,
  l3StringIDEx
  {$If not defined(NoVCM)}
  ,
  vcmPopupMenuPrim
  {$IfEnd} //not NoVCM
  ,
  PrimCustomizeTasksPanel_Form
  {$If not defined(NoScripts)}
  ,
  tfwInteger
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts)}
  ,
  tfwControlString
  {$IfEnd} //not NoScripts
  ,
  CustomizeTasksPanel_Form,
  Classes,
  vcmExternalInterfaces {a},
  vcmInterfaces {a},
  vcmModule {a},
  vcmBase {a}
  ;

type
 TPrimTasksPanelMenuModule = {abstract formspack} class(TvcmModule)
 private
 // private fields
   f_PopupMenu : TvcmPopupMenuPrim;
    {* ���� ��� �������� PopupMenu}
 protected
  procedure Loaded; override;
  class procedure GetEntityForms(aList : TvcmClassList); override;
 private
 // private methods
   procedure opCustomize(const aParams: IvcmExecuteParamsPrim);
     {* ���������... }
 protected
 // property methods
   function pm_GetPopupMenu: TvcmPopupMenuPrim;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
 public
 // overridden public methods
   constructor Create(AOwner: TComponent); override;
 public
 // public methods
   class procedure CustomizePanel(const aPanel: IvcmCustOps);
     {* ��������� ������ ����������� }
   class function TasksPanelPopupMenu: TPopupMenu;
 protected
 // protected properties
   property PopupMenu: TvcmPopupMenuPrim
     read pm_GetPopupMenu;
 end;//TPrimTasksPanelMenuModule

implementation

uses
  l3MessageID,
  SysUtils
  {$If not defined(NoVCM)}
  ,
  vcmMenus
  {$IfEnd} //not NoVCM
  ,
  Forms,
  kw_TasksPanelMenu_Customize,
  vcmFormSetFactory {a},
  StdRes {a},
  vcmModuleDef {a}
  ;

var
   g_dmTasksPanelMenu : TPrimTasksPanelMenuModule = nil;

type
  Tkw_Form_CustomizeTasksPanel = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� CustomizeTasksPanel
----
*������ �������������*:
[code]
'aControl' �����::CustomizeTasksPanel TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_CustomizeTasksPanel

// start class Tkw_Form_CustomizeTasksPanel

{$If not defined(NoScripts)}
function Tkw_Form_CustomizeTasksPanel.GetString: AnsiString;
 {-}
begin
 Result := 'CustomizeTasksPanelForm';
end;//Tkw_Form_CustomizeTasksPanel.GetString
{$IfEnd} //not NoScripts

procedure TPrimTasksPanelMenuModule.opCustomize(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C8DD91901C8_4C8DD8C602D3exec_var*
var
 l_MainForm: IvcmMainForm;
//#UC END# *4C8DD91901C8_4C8DD8C602D3exec_var*
begin
//#UC START# *4C8DD91901C8_4C8DD8C602D3exec_impl*
 if Supports((aParams As IvcmExecuteParams).Container.NativeMainForm, IvcmMainForm, l_MainForm) then
  CustomizePanel(l_MainForm.TasksPanel)
 else
  Assert(False);
//#UC END# *4C8DD91901C8_4C8DD8C602D3exec_impl*
end;//TPrimTasksPanelMenuModule.opCustomize

class procedure TPrimTasksPanelMenuModule.CustomizePanel(const aPanel: IvcmCustOps);
var
 __WasEnter : Boolean;
//#UC START# *4C8E59B80380_4C8DD8C602D3_var*
//#UC END# *4C8E59B80380_4C8DD8C602D3_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4C8E59B80380_4C8DD8C602D3_impl*
  (TCustomizeTasksPanelForm.Make(aPanel, vcmMakeParams, vcm_ztAny).
    VCLWinControl As TCustomForm).ShowModal;
//#UC END# *4C8E59B80380_4C8DD8C602D3_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimTasksPanelMenuModule.CustomizePanel

class function TPrimTasksPanelMenuModule.TasksPanelPopupMenu: TPopupMenu;
var
 __WasEnter : Boolean;
//#UC START# *4C8F777E02AD_4C8DD8C602D3_var*
//#UC END# *4C8F777E02AD_4C8DD8C602D3_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4C8F777E02AD_4C8DD8C602D3_impl*
 Result := g_dmTasksPanelMenu.PopupMenu;
//#UC END# *4C8F777E02AD_4C8DD8C602D3_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TPrimTasksPanelMenuModule.TasksPanelPopupMenu

function TPrimTasksPanelMenuModule.pm_GetPopupMenu: TvcmPopupMenuPrim;
//#UC START# *4C8F78BC0331_4C8DD8C602D3get_var*
//#UC END# *4C8F78BC0331_4C8DD8C602D3get_var*
begin
//#UC START# *4C8F78BC0331_4C8DD8C602D3get_impl*
 if not Assigned(f_PopupMenu) then
 begin
  f_PopupMenu := TvcmPopupMenuPrim.Create(Self);
  // ��� ����� ����� ��� ������ ������������ �������
  f_PopupMenu.Items.Caption := vcmStr(ModuleDef.ModuleDef.Caption);
  // ����������� �������� ������
  vcmMakeModuleMenu(f_PopupMenu.Items,
                    ModuleDef.ModuleDef,
                    [{vcm_ooShowInContextMenu}],
                    False);
 end;//if not Assigned(f_PopupMenu) then
 Result := f_PopupMenu;
//#UC END# *4C8F78BC0331_4C8DD8C602D3get_impl*
end;//TPrimTasksPanelMenuModule.pm_GetPopupMenu

procedure TPrimTasksPanelMenuModule.Cleanup;
//#UC START# *479731C50290_4C8DD8C602D3_var*
//#UC END# *479731C50290_4C8DD8C602D3_var*
begin
//#UC START# *479731C50290_4C8DD8C602D3_impl*
 g_dmTasksPanelMenu := nil;
 inherited;
//#UC END# *479731C50290_4C8DD8C602D3_impl*
end;//TPrimTasksPanelMenuModule.Cleanup

constructor TPrimTasksPanelMenuModule.Create(AOwner: TComponent);
//#UC START# *47D1602000C6_4C8DD8C602D3_var*
//#UC END# *47D1602000C6_4C8DD8C602D3_var*
begin
//#UC START# *47D1602000C6_4C8DD8C602D3_impl*
 inherited;
 //Name := 'vcm_dmTasksPanelMenu';
 Assert(not Assigned(g_dmTasksPanelMenu));
 g_dmTasksPanelMenu := Self;
//#UC END# *47D1602000C6_4C8DD8C602D3_impl*
end;//TPrimTasksPanelMenuModule.Create

procedure TPrimTasksPanelMenuModule.Loaded;
begin
 inherited;
 PublishOp('opCustomize', opCustomize, nil);
 ShowInToolbar('opCustomize', false);
end;

class procedure TPrimTasksPanelMenuModule.GetEntityForms(aList : TvcmClassList);
begin
 inherited;
 aList.Add(TCustomizeTasksPanelForm);
end;

initialization
// ����������� Tkw_Form_CustomizeTasksPanel
 Tkw_Form_CustomizeTasksPanel.Register('�����::CustomizeTasksPanel', TCustomizeTasksPanelForm);

end.