unit VCMBaseTest;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "DUnitTuning"
// �����: ����� �.�.
// ������: "w:/common/components/rtl/Garant/DUnitTuning/VCMBaseTest.pas"
// �����: 23.12.209 18:30
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi TFW::DUnitTuning::VCM_TFW::VCMBaseTest
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\DUnitTuning\tfwDefine.inc}

interface

{$If defined(nsTest) AND not defined(NoScripts) AND not defined(NotTunedDUnit)}
uses
  BaseTest
  ;

type
 TVCMBaseTest = {abstract} class(TBaseTest)
  {* ������� ���� ��� ������������ �������� VCM }
 protected
 // overridden protected methods
   procedure InitFields; override;
 end;//TVCMBaseTest
{$IfEnd} //nsTest AND not NoScripts AND not NotTunedDUnit

implementation

{$If defined(nsTest) AND not defined(NoScripts) AND not defined(NotTunedDUnit)}
uses
  Classes
  {$If not defined(NoVCM)}
  ,
  vcmBaseMenuManager
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmMenuManager
  {$IfEnd} //not NoVCM
  ,
  l3Base,
  SysUtils
  ;

// unit methods

procedure FreeMM;
//#UC START# *4B323587024D_4B3235370235_var*
//#UC END# *4B323587024D_4B3235370235_var*
begin
//#UC START# *4B323587024D_4B3235370235_impl*
 FreeAndNil(g_MenuManager);
//#UC END# *4B323587024D_4B3235370235_impl*
end;//FreeMM
// start class TVCMBaseTest

procedure TVCMBaseTest.InitFields;
//#UC START# *4B30EEA10210_4B30EEEB01EF_var*
//#UC END# *4B30EEA10210_4B30EEEB01EF_var*
begin
//#UC START# *4B30EEA10210_4B30EEEB01EF_impl*
 inherited;
 if (g_MenuManager = nil) then
 begin
  l3System.AddExitProc(FreeMM);
  TvcmMenuManager.Create(nil);
 end;//g_MenuManager = nil
//#UC END# *4B30EEA10210_4B30EEEB01EF_impl*
end;//TVCMBaseTest.InitFields
{$IfEnd} //nsTest AND not NoScripts AND not NotTunedDUnit

end.