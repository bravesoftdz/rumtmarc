unit StartupTips_ut_StartupTips_UserType;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/DayTips/Forms/StartupTips_ut_StartupTips_UserType.pas"
// �����: 04.09.2009 12:52
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UserType::Class>> F1 ������������ ��������::DayTips::View::DayTips::DayTips::StartupTips::ut_StartupTips
//
// StartupTips
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
  vcmUserControls
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoScripts)}
  ,
  tfwInteger
  {$IfEnd} //not NoScripts
  
  ;

const
    { ��������� ��� ���� ����� ut_StartupTips }
   ut_StartupTipsName = 'ut_StartupTips';
    { ��������� ������������� ����������������� ���� "StartupTips" }
   ut_StartupTips = TvcmUserType(0);
    { StartupTips }

type
   Tkw_FormUserType_ut_StartupTips = class(TtfwInteger)
    {* ����� ������� ��� ���� ����� ut_StartupTips }
   protected
   // overridden protected methods
    {$If not defined(NoScripts)}
   function GetInteger: Integer; override;
    {$IfEnd} //not NoScripts
   end;//Tkw_FormUserType_ut_StartupTips
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
// start class Tkw_FormUserType_ut_StartupTips

{$If not defined(NoScripts)}
function Tkw_FormUserType_ut_StartupTips.GetInteger: Integer;
 {-}
begin
 Result := ut_StartupTips;
end;//Tkw_FormUserType_ut_StartupTips.GetInteger
{$IfEnd} //not NoScripts
{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_FormUserType_ut_StartupTips
 Tkw_FormUserType_ut_StartupTips.Register('���_�����::ut_StartupTips');
{$IfEnd} //not Admin AND not Monitorings

end.