unit F1Test;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "F1Test"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/F1Test.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<TestLibrary::Category>> F1 ������� ����������� ���������� �������::F1Test
//
// ������� ������ ��� ��������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

implementation

{$If not defined(XE)}
uses
  EverestTest,
  VTTest,
  VCMTest
  {$If defined(Nemesis) AND not defined(XE)}
  ,
  NemesisTest
  {$IfEnd} //Nemesis AND not XE
  ,
  AFWTest,
  TestDocListUtils,
  MessageOnDesktop,
  TestStringUtils,
  nsDocumentsList_p,
  tc5OpenApp {a},
  tc6OpenApp {a}
  ;
{$IfEnd} //not XE

end.