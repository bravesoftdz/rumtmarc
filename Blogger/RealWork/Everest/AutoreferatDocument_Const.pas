unit AutoreferatDocument_Const;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/AutoreferatDocument_Const.pas"
// �����: 09.06.2008 10:39
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Tag::Class>> Shared Delphi::Everest::Standard::evNative::AutoreferatDocument
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ��������� ��� �������� ���� AutoreferatDocument .
// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  k2Base {a}
  ;

const
 k2_idAutoreferatDocument = 135;

function k2_typAutoreferatDocument: Tk2Type;

implementation

uses
  evNative_Schema,
  k2Facade {a}
  ;
var
 g_AutoreferatDocument : Tk2Type = nil;


// start class AutoreferatDocumentTag

function k2_typAutoreferatDocument: Tk2Type;
begin
 if (g_AutoreferatDocument = nil) then
 begin
  Assert(Tk2TypeTable.GetInstance Is TevNativeSchema);
  g_AutoreferatDocument := TevNativeSchema(Tk2TypeTable.GetInstance).t_AutoreferatDocument;
 end;//g_AutoreferatDocument = nil
 Result := g_AutoreferatDocument;
end;

end.