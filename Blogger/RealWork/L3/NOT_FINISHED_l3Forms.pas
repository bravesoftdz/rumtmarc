unit NOT_FINISHED_l3Forms;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "L3"
// ������: "w:/common/components/rtl/Garant/L3/NOT_FINISHED_l3Forms.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi Low Level::L3::VCL::l3Forms
//
// ������� ����� ����, �������������� ������� ������ � ��������� IUnknown
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ���� ���� ������������ ������ ��� �������������, � �� ��� ����������. !

{$Include ..\L3\l3Define.inc}

interface

uses
  Forms,
  l3Interfaces,
  l3IID
  ;

type
 _l3Unknown_Parent_ = TForm;
 {$Include ..\L3\l3Unknown.imp.pas}
 _l3COMQueryInterface_Parent_ = _l3Unknown_;
 {$Include ..\L3\l3COMQueryInterface.imp.pas}
 Tl3Form = class(_l3COMQueryInterface_)
  {* ������� ����� ����, �������������� ������� ������ � ��������� IUnknown }
 end;//Tl3Form

implementation

uses
  SysUtils,
  l3Base,
  l3Core,
  Windows,
  Classes,
  l3InterfacesMisc
  ;

{$Include ..\L3\l3Unknown.imp.pas}

{$Include ..\L3\l3COMQueryInterface.imp.pas}

end.