unit ShellAndMonitoringsMain_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View$For F1 and Monitorings"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/ShellAndMonitoringsMain_Form.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMMainForm::Class>> F1 Common For Shell And Monitoring::Search::View$For F1 and Monitorings::ShellAndMonitorings::ShellAndMonitoringsMain
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
  PrimMainOptions_Form,
  vcmExternalInterfaces {a},
  vcmInterfaces {a},
  vcmEntityForm {a}
  ;
{$IfEnd} //not Admin

{$If not defined(Admin)}
type
 TShellAndMonitoringsMainForm = {form} class(TPrimMainOptionsForm)
 end;//TShellAndMonitoringsMainForm

 TvcmMainFormRef = TShellAndMonitoringsMainForm;
{$IfEnd} //not Admin

implementation

{$If not defined(Admin)}
uses
  StdRes {a}
  ;
{$IfEnd} //not Admin

end.