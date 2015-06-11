unit PrimPreview_utPrintPreview_UserType;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View$For F1 and Monitorings"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Search/Forms/PrimPreview_utPrintPreview_UserType.pas"
// �����: 15.09.2009 14:41
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UserType::Class>> F1 Common For Shell And Monitoring::Search::View$For F1 and Monitorings::Search$Presentation for F1 and Monitorings::PrimPreview::utPrintPreview
//
// ��������������� �������� ������
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
  vcmUserControls
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoScripts)}
  ,
  tfwInteger
  {$IfEnd} //not NoScripts
  
  ;

const
   { ��������� ��� ���� ����� utPrintPreview }
  utPrintPreviewName = 'utPrintPreview';
   { ��������� ������������� ����������������� ���� "��������������� �������� ������" }
  utPrintPreview = TvcmUserType(0);
   { ��������������� �������� ������ }

type
  Tkw_FormUserType_utPrintPreview = class(TtfwInteger)
   {* ����� ������� ��� ���� ����� utPrintPreview }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetInteger: Integer; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_FormUserType_utPrintPreview
{$IfEnd} //not Admin

implementation

{$If not defined(Admin)}
// start class Tkw_FormUserType_utPrintPreview

{$If not defined(NoScripts)}
function Tkw_FormUserType_utPrintPreview.GetInteger: Integer;
 {-}
begin
 Result := utPrintPreview;
end;//Tkw_FormUserType_utPrintPreview.GetInteger
{$IfEnd} //not NoScripts
{$IfEnd} //not Admin

initialization
{$If not defined(Admin)}
// ����������� Tkw_FormUserType_utPrintPreview
 Tkw_FormUserType_utPrintPreview.Register('���_�����::utPrintPreview');
{$IfEnd} //not Admin

end.