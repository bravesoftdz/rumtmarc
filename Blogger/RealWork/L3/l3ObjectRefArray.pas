unit l3ObjectRefArray;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "L3"
// �����: ����� �.�.
// ������: "w:/common/components/rtl/Garant/L3/l3ObjectRefArray.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Low Level::L3::l3CoreObjects::Tl3ObjectRefArray
//
// "�������� ������". ������, ������� ������������� ����������� ��� ���������� �������� �� ��������
// ���������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\L3\l3Define.inc}

interface

uses
  l3ObjectRefList1
  ;

type
 _l3OpenArray_Parent_ = Tl3ObjectRefList1;
 {$Include ..\L3\l3OpenArray.imp.pas}
 Tl3ObjectRefArray = class(_l3OpenArray_)
  {* "�������� ������". ������, ������� ������������� ����������� ��� ���������� �������� �� �������� ��������� }
 end;//Tl3ObjectRefArray

implementation

uses
  l3Base
  ;

type _Instance_R_ = Tl3ObjectRefArray;

{$Include ..\L3\l3OpenArray.imp.pas}

end.