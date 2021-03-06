Unit dt_DictImport;

{ $Id: dt_DictImport.pas,v 1.3 2010/09/24 12:11:14 voba Exp $ }

// $Log: dt_DictImport.pas,v $
// Revision 1.3  2010/09/24 12:11:14  voba
// - k : 235046326
//
// Revision 1.2  2009/04/09 09:46:36  narry
// - ������ � ������������� ������� ����������
//
// Revision 1.1  2009/04/02 15:17:19  narry
// - ������ ������������� ��������� ������
//

{$I DtDefine.inc}

interface
Uses
 dt_Types, l3Types, dt_AttrSchema;


function ImportDictLink(aFileName: String; aFamily: TFamilyID; aDictId: TDLType; aRenum, aClearDictionary,
    aNeedAddToDictionary: Boolean; aProgressProc: Tl3ProgressProc = nil): Boolean;

implementation
Uses
 ddKW_r,
 l3Base, l3Filer;

function ImportDictLink(aFileName: String; aFamily: TFamilyID; aDictId: TDLType; aRenum, aClearDictionary,
    aNeedAddToDictionary: Boolean; aProgressProc: Tl3ProgressProc = nil): Boolean;
begin
  with TddDictLinkPipe.Create() do
  try
   OnProgressProc:= aProgressProc;
   Result:= Execute(aFileName, aFamily, aDictID, aRenum, aClearDictionary, aNeedAddToDictionary);
  finally
   Free;
  end;
end;

end.
