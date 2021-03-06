unit PrimeTestRes;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/PrimeTestRes.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMTestApplication::Class>> F1 ���������� ����� �����::Prime::PrimeTest
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\GbaNemesis\nsDefine.inc}

interface

{$If defined(InsiderTest) AND defined(Monitorings) AND defined(nsTest)}
uses
  Classes
  {$If defined(Monitorings) AND not defined(Admin)}
  ,
  MonitoringsRes
  {$IfEnd} //Monitorings AND not Admin
  ,
  GUITestRunner
  {$If defined(InsiderTest) AND defined(nsTest) AND not defined(NoScripts) AND not defined(NotTunedDUnit)}
  ,
  tfwScriptDebugger
  {$IfEnd} //InsiderTest AND nsTest AND not NoScripts AND not NotTunedDUnit
  ,
  vcmInterfaces {a},
  vcmExternalInterfaces {a}
  ;
{$IfEnd} //InsiderTest AND Monitorings AND nsTest

{$If defined(InsiderTest) AND defined(Monitorings) AND defined(nsTest)}
type
 _F1LikeAppTester_Parent_ = TMonitoringsRes;
 {$Include w:\common\components\gui\Garant\VCM\AppTesting\F1LikeAppTester.imp.pas}
 TPrimeTestRes = {final} class(_F1LikeAppTester_)
 protected
 // realized methods
   class function CalcBatchMode: Boolean; override;
 end;//TPrimeTestRes
 TvcmApplicationRef = TPrimeTestRes;
  {* ������ �� ���������� ��� DesignTime ���������� }

{$IfEnd} //InsiderTest AND Monitorings AND nsTest

implementation

{$If defined(InsiderTest) AND defined(Monitorings) AND defined(nsTest)}
uses
  toKPrime,
  toKTPrime,
  Forms
  {$If defined(nsTest) AND not defined(NotTunedDUnit)}
  ,
  KTestRunner
  {$IfEnd} //nsTest AND not NotTunedDUnit
  ,
  l3Base
  {$If not defined(NoVCM)}
  ,
  l3ComponentNameHelper
  {$IfEnd} //not NoVCM
  ,
  afwAnswer,
  TestFrameWork
  {$If not defined(NoScripts)}
  ,
  tfwScriptEngineEX
  {$IfEnd} //not NoScripts
  
  ;
{$IfEnd} //InsiderTest AND Monitorings AND nsTest

{$If defined(InsiderTest) AND defined(Monitorings) AND defined(nsTest)}

{$Include w:\common\components\gui\Garant\VCM\AppTesting\F1LikeAppTester.imp.pas}

// start class TPrimeTestRes

class function TPrimeTestRes.CalcBatchMode: Boolean;
//#UC START# *4F79BCC902C5_5123800A0080_var*
//#UC END# *4F79BCC902C5_5123800A0080_var*
begin
//#UC START# *4F79BCC902C5_5123800A0080_impl*
 Result := KTestRunner.NeedKTestRunner([TtoKPrime, TtoKTPrime]);
//#UC END# *4F79BCC902C5_5123800A0080_impl*
end;//TPrimeTestRes.CalcBatchMode

{$IfEnd} //InsiderTest AND Monitorings AND nsTest

end.