unit XMLTag_Const;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/XMLTag_Const.pas"
// �����: 09.06.2008 10:39
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Tag::Class>> Shared Delphi::Everest::Standard::evNative::XMLTag
//
// XML-���
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ��������� ��� �������� ���� XMLTag - "XML-���".
// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  k2Base {a}
  ;

const
 k2_idXMLTag = 123;

function k2_typXMLTag: Tk2Type;

implementation

uses
  evNative_Schema,
  k2Facade {a}
  ;
var
 g_XMLTag : Tk2Type = nil;


// start class XMLTagTag

function k2_typXMLTag: Tk2Type;
begin
 if (g_XMLTag = nil) then
 begin
  Assert(Tk2TypeTable.GetInstance Is TevNativeSchema);
  g_XMLTag := TevNativeSchema(Tk2TypeTable.GetInstance).t_XMLTag;
 end;//g_XMLTag = nil
 Result := g_XMLTag;
end;

end.