unit DT_DSour;

{ $Id: DT_DSOUR.PAS,v 1.8 2007/02/22 14:33:53 narry Exp $ }

// $Log: DT_DSOUR.PAS,v $
// Revision 1.8  2007/02/22 14:33:53  narry
// - ������� � 64 �����
//
// Revision 1.7  2004/08/03 08:52:51  step
// ������ dt_def.pas �� DtDefine.inc
//
// Revision 1.6  2003/05/29 15:21:04  voba
// - bug fix
//
// Revision 1.5  2003/05/19 15:39:52  demon
// - new behavior: ������ ����� ���������� ������� �� ������ �� ����������� ������� ������� ���������,
// �� � �� ������ ������� (��� �������, ��� � ������ ���������)
//
// Revision 1.4  2000/12/15 15:36:15  law
// - ��������� ��������� Log.
//

{$I DtDefine.inc}

interface
uses Dt_ATbl,Dt_Types,Dt_Const;
const
 dsFamID   = 1;
 dsDictID  = 2;
 dsSFamID  = 3;
 dsSDictID = 4;
 dsFamKey  = 5;
type
 TDictSourceTbl = Class(TPrometTbl)
  constructor Create; {$IfDef Win32}reintroduce;{$endIf Win32}

  procedure   GetSourDict(aFamily : TFamilyID;aDict : TDLType;
                          var newFamily : TFamilyID;var newDict : TDLType);
 end;
implementation
uses HT_Const,HT_Dll,Dt_Err;

(************************** TDictSourceTbl *******************************)

constructor TDictSourceTbl.Create;
begin
 inherited Create(MainTblsFamily, TblPassW[MainPassIndex[mtDictSrc]], MainTblNames[mtDictSrc],True);
end;

procedure TDictSourceTbl.GetSourDict(aFamily : TFamilyID;aDict : TDLType;
                                     var newFamily : TFamilyID;var newDict : TDLType);
var
 AbsNum  : LongInt;
 RecH    : RHANDLE;
 CurDict : Word;
begin
 RefreshSrchList;
 newFamily:=aFamily;
 newDict:=aDict;
 ClearFullRec;
 PutToFullRec(dsFamID,aFamily);
 curDict:=Word(aDict);
 PutToFullRec(dsDictID,curDict);
 AbsNum:=Ht(htRecordByUniq(@fSrchList,TblH,dsFamKey,fFullRecord,@RecH));
 if AbsNum > 0 then
 begin
  GetFullRec(AbsNum,False);
  GetFromFullRec(dsSFamId,newFamily);
  GetFromFullRec(dsSDictID,curDict);
  newDict:=TDLType(CurDict);
 end;
end;
end.
