unit AttrValue_Const;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/AttrValue_Const.pas"
// �����: 09.06.2008 10:39
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Tag::Class>> Shared Delphi::Everest::Standard::evNative::AttrValue
//
// �������� ��������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ��������� ��� �������� ���� AttrValue - "�������� ��������".
// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  k2Base {a}
  ;

const
 k2_idAttrValue = 127;

function k2_typAttrValue: Tk2Type;

implementation

uses
  evNative_Schema,
  k2Facade {a}
  ;
var
 g_AttrValue : Tk2Type = nil;


// start class AttrValueTag

function k2_typAttrValue: Tk2Type;
begin
 if (g_AttrValue = nil) then
 begin
  Assert(Tk2TypeTable.GetInstance Is TevNativeSchema);
  g_AttrValue := TevNativeSchema(Tk2TypeTable.GetInstance).t_AttrValue;
 end;//g_AttrValue = nil
 Result := g_AttrValue;
end;

end.