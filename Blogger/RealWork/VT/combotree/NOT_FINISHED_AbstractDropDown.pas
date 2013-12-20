unit NOT_FINISHED_AbstractDropDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "VT"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/VT/ComboTree/NOT_FINISHED_AbstractDropDown.pas"
// �����: 15.05.2008 22:29
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<GuiControl::Class>> Shared Delphi::VT::ComboTree::TAbstractDropDown
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ���� ���� ������������ ������ ��� �������������, � �� ��� ����������. !

{$Include w:\common\components\gui\Garant\VT\vtDefine.inc}

interface

uses
  Classes
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  ,
  ctAbstractEdit
  ;

type
 TAbstractDropDown = class(TctAbstractEdit {$If not defined(NoVCM)}, IvcmPopupIgnoresAction{$IfEnd} //not NoVCM
 )
 protected
 // realized methods
   {$If not defined(NoVCM)}
   function pm_GetPopupIgnoresAction: Boolean;
   {$IfEnd} //not NoVCM
 end;//TAbstractDropDown

implementation

// start class TAbstractDropDown

{$If not defined(NoVCM)}
function TAbstractDropDown.pm_GetPopupIgnoresAction: Boolean;
//#UC START# *476964B602C3_482C80EA0131get_var*
//#UC END# *476964B602C3_482C80EA0131get_var*
begin
//#UC START# *476964B602C3_482C80EA0131get_impl*
 Result := FComboStyle = cbEdit;
//#UC END# *476964B602C3_482C80EA0131get_impl*
end;//TAbstractDropDown.pm_GetPopupIgnoresAction
{$IfEnd} //not NoVCM

end.