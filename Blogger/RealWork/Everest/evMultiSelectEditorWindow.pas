unit evMultiSelectEditorWindow;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evMultiSelectEditorWindow.pas"
// �����: 10.01.2004 17:35
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<GuiControl::Class>> Shared Delphi::Everest::Editors::TevMultiSelectEditorWindow
//
// �������� � ������������ �������������� ���������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  evCustomEditorWindowModelPart,
  evCustomEditorWindow
  ;

type
 TevMultiSelectEditorWindow = class(TevCustomEditorWindowModelPart)
  {* �������� � ������������ �������������� ��������� }
 private
 // private fields
   f_AllowMultiSelect : Boolean;
    {* ���� ��� �������� AllowMultiSelect}
 protected
 // property methods
   function pm_GetAllowMultiSelect: Boolean;
 protected
 // overridden protected methods
   function GetAllowMultiSelect: Boolean; override;
   function SelectionClass: RevSelection; override;
   function HotSpotClass: RevEditorWindowHotSpot; override;
 public
 // public properties
   property AllowMultiSelect: Boolean
     read pm_GetAllowMultiSelect
     write f_AllowMultiSelect
     default false;
 end;//TevMultiSelectEditorWindow

implementation

uses
  evMultiSelection,
  evMultiSelectEditorWindowHotSpot
  ;

// start class TevMultiSelectEditorWindow

function TevMultiSelectEditorWindow.pm_GetAllowMultiSelect: Boolean;
//#UC START# *48E4972B039C_4829D8C50010get_var*
//#UC END# *48E4972B039C_4829D8C50010get_var*
begin
//#UC START# *48E4972B039C_4829D8C50010get_impl*
 Result := inherited pm_GetAllowMultiSelect;
//#UC END# *48E4972B039C_4829D8C50010get_impl*
end;//TevMultiSelectEditorWindow.pm_GetAllowMultiSelect

function TevMultiSelectEditorWindow.GetAllowMultiSelect: Boolean;
//#UC START# *48E1F321030C_4829D8C50010_var*
//#UC END# *48E1F321030C_4829D8C50010_var*
begin
//#UC START# *48E1F321030C_4829D8C50010_impl*
 Result := f_AllowMultiSelect;
//#UC END# *48E1F321030C_4829D8C50010_impl*
end;//TevMultiSelectEditorWindow.GetAllowMultiSelect

function TevMultiSelectEditorWindow.SelectionClass: RevSelection;
//#UC START# *48E22866033A_4829D8C50010_var*
//#UC END# *48E22866033A_4829D8C50010_var*
begin
//#UC START# *48E22866033A_4829D8C50010_impl*
 Result := TevMultiSelection;
//#UC END# *48E22866033A_4829D8C50010_impl*
end;//TevMultiSelectEditorWindow.SelectionClass

function TevMultiSelectEditorWindow.HotSpotClass: RevEditorWindowHotSpot;
//#UC START# *48E2297000D3_4829D8C50010_var*
//#UC END# *48E2297000D3_4829D8C50010_var*
begin
//#UC START# *48E2297000D3_4829D8C50010_impl*
 if AllowMultiSelect then
  Result := TevMultiSelectEditorWindowHotSpot
 else
  Result := inherited HotSpotClass;
//#UC END# *48E2297000D3_4829D8C50010_impl*
end;//TevMultiSelectEditorWindow.HotSpotClass

end.