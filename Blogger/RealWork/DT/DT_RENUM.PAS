Unit Dt_ReNum;

{ $Id: DT_RENUM.PAS,v 1.70 2012/09/20 13:15:20 narry Exp $ }

// $Log: DT_RENUM.PAS,v $
// Revision 1.70  2012/09/20 13:15:20  narry
// ����� � ��� ��������� � ���������� ������� ������
//
// Revision 1.69  2012/03/07 08:55:51  narry
// ������ ������� � ��������������� ���������� (342862487)
//
// Revision 1.68  2011/06/10 12:49:03  voba
// - DocumentServer ������ �������� function DocumentServer(aFamily : TFamilyID), ��� �� �������� Family �� �����������
//
// Revision 1.67  2011/01/28 11:28:07  voba
// - k : 251343383
//
// Revision 1.66  2010/09/24 12:11:14  voba
// - k : 235046326
//
// Revision 1.65  2010/08/03 13:16:38  voba
// - k: 229672814
//
// Revision 1.64  2010/06/18 16:21:10  lulin
// {RequestLink:182452717}.
// - ���������������� ����� ��������� �� �������� �� ����������.
//
// Revision 1.63  2009/07/27 09:09:03  voba
// - bug fix
//
// Revision 1.62  2009/07/20 12:38:48  voba
// - ������� renum � ��������
//
// Revision 1.61  2009/06/23 07:32:59  voba
// - �������������� ������� � ���������
//
// Revision 1.60  2009/05/19 12:15:49  voba
// - ������� �� ISab
//
// Revision 1.59  2009/05/08 11:10:08  voba
// - ������� TblH �� Handle
//
// Revision 1.58  2009/05/06 12:00:13  voba
// - add debug code
//
// Revision 1.57  2009/03/02 08:15:39  voba
// - ������� ������ ���������� � constructor TPrometTbl.Create
//
// Revision 1.56  2008/05/07 15:46:21  voba
// - Refact. function .GetRelImportNum � GetINumber ����, ������ ��� ������������ GetExtDocID
//
// Revision 1.55  2008/04/30 10:14:54  voba
// - add  procedure ChangeHLAddr
//
// Revision 1.54  2008/04/04 15:16:32  fireton
// - ������� ������ ���������� �� ���������
//
// Revision 1.53  2008/03/28 10:00:56  voba
// - ren GetRecordByUniq -> GetRecordIDByUniq
// - ren HasRecordsWith -> HasRecord
//
// Revision 1.52  2008/03/20 09:48:36  lulin
// - cleanup.
//
// Revision 1.51  2008/02/13 14:02:20  voba
// - add   procedure ConvertToInternalNumbers(aExternalIDs : ISab);
//
// Revision 1.50  2008/02/07 14:44:41  lulin
// - ����� _Tl3LongintList �������� � ����������� ������.
//
// Revision 1.49  2008/01/31 13:04:19  narry
// - ������������� �������� ������ ��������
//
// Revision 1.48  2007/11/15 14:22:02  voba
// - use function TdtTable.DeleteRecByUniq
//
// Revision 1.47  2007/11/12 16:42:12  voba
// - bug fix
//
// Revision 1.46  2007/11/06 12:38:30  voba
// - refact
//
// Revision 1.45  2007/08/14 14:30:08  lulin
// - ������������ ����������� ������ ������.
//
// Revision 1.44  2007/06/28 11:16:25  voba
// - refact. ����� �� function TAbstractList.GetItem ������ ��������
//
// Revision 1.43  2007/05/25 15:20:24  voba
// - DeleteRecsByKeys ������ ���������� ���������� ��������� � ��������� exception � ������ ������
//
// Revision 1.42  2007/04/27 14:29:23  voba
// - cc
//
// Revision 1.41  2007/04/25 07:52:37  fireton
// - �����������. ������ �� ������ ���������� ���� ������ � ������ ������������ ����� � DT_Types
//
// Revision 1.40  2007/03/23 08:49:52  voba
// - merge with b_archi_BigDictID (��������)
//
// Revision 1.39.4.1  2007/03/21 08:15:05  voba
// - cc
//
// Revision 1.39  2007/02/27 12:29:47  voba
// - ��������� ����� htGetDiffLength
//
// Revision 1.38  2007/02/22 09:24:29  voba
// - ren DelRecsOnKeys -> DeleteRecsByKeys, _move this to TdtTable
//
// Revision 1.37  2007/02/12 16:11:00  voba
// - ������� ������������� htModifyRecs �� ����� TAbsHtTbl.ModifyRecs
// - ������� TdtTable � ������ dt_Table (������� ������ ������� HyTech �� ������ � �������� �������)
// - ������� ������� HyTech �� ������ � Sab � dt_Sab, ����� ������ ������
//
// Revision 1.36  2006/10/04 08:36:42  voba
// - add comments
//
// Revision 1.35.2.1  2006/09/19 14:05:22  voba
// - cc
//
// Revision 1.35  2006/06/28 08:36:35  narry
// - �����������: ������ �������������� ������ ������������� ���������
//
// Revision 1.34  2006/04/18 12:32:48  voba
// - ����������� �� ������ RefreshSrchList
//
// Revision 1.33.2.1  2006/04/18 12:29:30  voba
// no message
//
// Revision 1.33  2006/03/27 13:54:26  narry
// - �����������: ������ � ���������������� �������������� ������
//
// Revision 1.32  2005/06/06 12:46:23  step
// ����� ������� ��������� ����������� �� ������� DestDoc
//
// Revision 1.31  2005/02/25 14:24:31  step
// � TReNumTbl.GetBufferedImportNumber �������� �������� aForced
//
// Revision 1.30  2005/01/19 09:34:51  step
// � TReNumTbl.GetINumber ��������� ���������� ������ �������
//
// Revision 1.29  2005/01/18 18:35:26  step
// TReNumTbl.GetINumber ����������� � ��������� ����������
//
// Revision 1.28  2004/11/10 12:40:56  step
// �������������� ������
//
// Revision 1.27  2004/11/09 09:35:26  step
// �������� ������ TReNumTbl.GetRelImportNum
//
// Revision 1.26  2004/09/21 12:04:20  lulin
// - Release ������� �� Cleanup.
//
// Revision 1.25  2004/08/03 08:52:49  step
// ������ dt_def.pas �� DtDefine.inc
//
// Revision 1.24  2004/07/23 16:41:32  step
// � TReNumTbl.GetINumber �������� �������� aForced
//
// Revision 1.23  2004/07/13 08:02:34  step
// ������� � ������ b_import_filter_optimization2
//
// Revision 1.22.4.4  2004/07/09 17:08:21  step
// ����� ���������� ���
//
// Revision 1.22.4.3  2004/07/09 17:05:54  step
// ���������� ��������
//
// Revision 1.22.4.2  2004/07/09 16:58:54  step
// ����� ����� TImportIdToRealIdMap; ���������� TReNumTbl.GetRNumber
//
// Revision 1.22.4.1  2004/07/08 17:16:31  step
// ��������� ������� ��������� FreeNum
//
// Revision 1.22  2004/07/01 14:14:27  voba
// - merge newCashe
//
// Revision 1.21.2.1  2004/06/17 18:03:49  step
// � ������� TAbsHtTbl.AddRec � TAbsHtTbl.UpdRec ����� �������� AbsNum.
//
// Revision 1.21  2004/06/02 16:42:35  law
// - ������ ����� Tl3VList.
//
// Revision 1.20  2004/05/20 14:48:20  step
// ������ fFreeTbl �� GlobalHtServer.FreeTbl[fFamily]
//
// Revision 1.19  2004/05/13 16:32:18  step
// ������: "TFreeTbl.Create ..." --> "GlobalHtServer.FreeTbl[...]"
//
// Revision 1.18  2004/05/06 09:16:07  voba
// merge with adding_diapasons_table_free2
//
// Revision 1.17.34.1  2004/04/09 16:57:56  step
// ��������� ����� TFreeTbl (������ �������� � �����������)
//
// Revision 1.17  2003/01/27 11:44:29  demon
// - bug fix: ��������� ��������� � ������� PureUpdateImportNumber
//
// Revision 1.16  2003/01/22 15:26:44  demon
// - new behavior: � ��������� PureUpdateImportNumber �������� ���� withCheck
// ��� �������� ������������� ���������� update.
//
// Revision 1.15  2001/08/06 08:30:42  demon
// no message
//
// Revision 1.14.2.1  2001/07/10 12:50:18  demon
// - bug fix
//
// Revision 1.14  2001/02/01 14:10:16  demon
// - fixed freeing of FreeNumList if exception
//
// Revision 1.13  2000/12/15 15:36:16  law
// - ��������� ��������� Log.
//

{$I DtDefine.inc}

Interface

Uses
 Contnrs,
 HT_Const,
 Dt_Types,
 DT_aTbl, DT_Sab,
 DT_Free,
 Dt_Link,
 l3Base, l3LongintList, l3FieldSortRecList,
 evdInterfaces
 ;

Const
 cNormalRelIndent : LongInt = 100000;

 rnRealID_fld   = 1;
 rnImportID_fld = 2;
Type
 PRenumRec = ^TReNumRec;
 TRenumRec = Record
              RealID,
              ImportID : TDocID;
             end;

 TdtLongintList = class(Tl3LongintList)
 end;

 TReNumTbl = Class({TPrometTbl} TDocAttrTbl, IevdExternalDocNumberToInternal)
  protected
   fBufferedList  : Tl3LongintList;

   function    GetBufferedImportNumber(aID : TDocID) : TDocID;

   procedure   GetBufferedList;
   procedure   FreeBufferedList;
   function    GetBuffered : Boolean;
   procedure   SetBuffered(aVal : Boolean);

   procedure   BeforeRelease; override;
   procedure   AddRecord(aInternalID, aExternalID : TDocID);
  public
   constructor Create(aFamily : TFamilyID {;WithGetFreeNum : Boolean; aSharing: Boolean}); Reintroduce;

   //procedure   UpdateTbl; override;

   //procedure   AddRecord(aInternalID, aExternalID : TDocID);

   function    ConvertToRealNumber(aImpID : LongInt) : LongInt;

   function    ConvertToRealNumbers(Imp_IDs : Sab) : Sab;
   function    ConvertToImportNumbers(Real_IDs : Sab) : Sab;
   procedure   ConvertToInternalNumbers(aExternalIDs : ISab);

   function ConvertExternalDocNumberToInternal(aDocID: Integer): Integer;
   procedure ConvertToExternalNumbers(aInternalIDs: ISab);
   procedure   GetRNumber(Var aID : LongInt);
   function    GetExtDocID(aID : TDocID) : TDocID;

   function    UpdateImportNumber(aRealID,aImpID : LongInt) : Boolean;
   procedure   PureUpdateImportNumber(aRealID,aImpID : LongInt;
                                     withCheck : Boolean = False);

   function  DelAllLinkItems(const aDocIDs: ISab) : integer;  overload;
    {* - ������� ��� ����� �� ����� ����������, ���������� ���������� ���������}
   procedure DelAllLinkItems(aDocID : TDocID); overload;
    {* - ������� ��� ����� ��� ���������}

   property    Buffered : Boolean read GetBuffered write SetBuffered;
 end;

 TImportIdToRealIdMap = class(Tl3base)
 private
  f_Map: Tl3FieldSortRecList;
 protected
  procedure Cleanup; override;
 public
  constructor Create(aReNumTbl: TReNumTbl);
  function Find(const aImportID: LongWord; out aRealId: LongWord): Boolean;
 end;

//function GetFreeExtDocID(aFamily : TFamilyID): TDocID;

Implementation
Uses
 HT_Dll,
 SysUtils,
 Dt_Const,
 dt_AttrSchema,
 Dt_Serv, Dt_Doc, Dt_Err,
 Dt_List, Dt_Hyper,
 dt_LinkServ;

(**************************** TReNumTbl ********************************)

Constructor TReNumTbl.Create(aFamily : TFamilyID);
Begin
 Assert(aFamily <> MainTblsFamily);
 inherited Create(aFamily, atRenum);
end;

Procedure TReNumTbl.BeforeRelease;
Begin
 if fBufferedList <> Nil then FreeBufferedList;
 //GlobalHtServer.FreeTbl[TblFamily].ExclusiveUse := False;
 (*
 RefreshSrchList;
 If fUpdInt > 0 then
 Begin
  DiffLength := htGetDiffLength(fSrchList);
  If DiffLength > 32 then UpdateTbl;
 end;
 *)
 Inherited;
end;

{Procedure TReNumTbl.UpdateTbl;
Begin
 Try
  Inherited UpdateTbl;
 except
 end;
end;}

procedure TReNumTbl.GetBufferedList;
Var
 MaxNum   : LongInt;
 ReNumRec : PReNumRec;
 NumList  : TAbstractList;
 tmpMode  : TOpenMode;
 I        : LongInt;
begin
 with Table do
 begin
  l3Free(fBufferedList);
  fBufferedList:= TdtLongintList.Make; //Tl3LongintList.Make;
  try
   RefreshSrchList;
   MaxNum:=0;
   htKeyMaximum(fSrchList,rnRealID_fld,@MaxNum);
   Inc(MaxNum);
   fBufferedList.Count := MaxNum+1;
   tmpMode.openMode := ROPEN_BODY;
   tmpMode.Count:=0;
   tmpMode.FldArr:=Nil;
   NumList:=TAbstractList.Create(@fSrchList,tmpMode);
   try
    NumList.ReadForvard:=True;
    for I:=0 to NumList.Count-1 do
    begin
     ReNumRec := NumList.GetItem(I);
     fBufferedList.Items[RenumRec^.RealID]:=RenumRec^.ImportID;
    end;
  finally
   l3Free(NumList);
  end;
  except
   l3Free(fBufferedList);
   l3System.Msg2log('�� ������� �������� ����� ��� %d ���������', [MaxNum]);
   raise;
  end;
 end; //with Table do
end;

procedure TReNumTbl.FreeBufferedList;
begin
 l3Free(fBufferedList);
end;

function TReNumTbl.GetBuffered : Boolean;
begin
 Result:=fBufferedList<>nil;
end;

procedure TReNumTbl.SetBuffered(aVal : Boolean);
begin
 if (fBufferedList<>nil) and not aVal then FreeBufferedList;
 if (fBufferedList=nil) and aVal then GetBufferedList;
end;

Function TReNumTbl.ConvertToRealNumber(aImpID : LongInt) : LongInt;
Var
 lAbsNum : Longint;
 lRecH   : RHANDLE;
Begin
 Result := cUndefDocID;
 if aImpID = 0 then exit;
 lAbsNum := Ht(htRecordByUniq(nil, Table.Handle, rnImportID_fld, @aImpID, @lRecH));
 if lAbsNum <> 0 then
 begin
  Table.GetFullRec(lAbsNum, False);
  Table.GetFromFullRec(rnRealID_fld, Result);
 end;
end;

(*
Function TReNumTbl.ConvertToImportNumber(Real_ID : LongInt) : LongInt;
Var
 AbsNum : LongInt;
 RecH   : RHANDLE;
Begin
 Result:= cUndefDocID;
 If Real_ID=0 then exit;
 AbsNum:=Ht(htRecordByUniq(nil,Handle,rnRealID_fld,@Real_ID,@RecH));
 If AbsNum<>0
  then
   Begin
    GetFullRec(AbsNum,False);
    GetFromFullRec(rnImportID_fld,Result);
   end;
end;
*)

function TReNumTbl.ConvertToRealNumbers(Imp_IDs : Sab) : Sab;
var
 TmpSab  : SAB;
begin
 with Table do
 begin
  RefreshSrchList;

  htTransferToPhoto(Imp_IDs, fSrchList, rnImportID_fld);
  if Imp_IDs.nRetCode = 0 then
  Begin
   htRecordsByKey(TmpSab, Imp_IDs);
   try
    htValuesOfkey(Result, rnRealID_fld, TmpSab);
   finally
    htClearResults(TmpSab);
   end;
  end;
 end; //with Table
end;

procedure TReNumTbl.ConvertToInternalNumbers(aExternalIDs : ISab);
begin
 aExternalIDs.TransferToPhoto(rnImportID_fld, Self);
 aExternalIDs.RecordsByKey;
 aExternalIDs.ValuesOfKey(rnRealID_fld);
end;

Function TReNumTbl.ConvertToImportNumbers(Real_IDs : Sab) : Sab;
var
 TmpSab  : SAB;
begin
 with Table do
 begin
  RefreshSrchList;

  htTransferToPhoto(Real_IDs,fSrchList,rnRealID_fld);
  if Real_IDs.nRetCode = 0 then
  Begin
   htRecordsByKey(TmpSab,Real_IDs);
   try
    htValuesOfkey(Result,rnImportID_fld,TmpSab);
   finally
    htClearResults(TmpSab);
   end;
  end;
 end; //with Table
end;

procedure TReNumTbl.AddRecord(aInternalID, aExternalID : TDocID);
begin
 with Table do
 begin
  ClearFullRec;
  PutToFullRec(rnRealID_fld, aInternalID);
  PutToFullRec(rnImportID_fld, aExternalID);
  AddFRec;
 end; //with Table
end;

procedure TReNumTbl.GetRNumber(Var aID : LongInt);
var
 lID    : TDocID;
begin
 if aID = 0 then exit;
 lID := ConvertToRealNumber(aID);
 if lID < 0 then
 begin
  lID := DocumentServer(Table.TblFamily).FileTbl.GetFreeNum;
  if lID <= 0 then
  begin
   l3System.Msg2Log(format('TReNumTbl.GetRNumber: IntID = %d ExtID = %d', [lID, aID]));
   lID := DocumentServer(Table.TblFamily).FileTbl.GetFreeNum;
   Assert(lID > 0, format('try another one TReNumTbl.GetRNumber: IntID = %d ExtID = %d', [lID, aID]));
   l3System.Msg2Log('Recover!!');
  end;
  AddRecord(lID, aID);
 end;
 aID := lID;
end;

function TReNumTbl.ConvertExternalDocNumberToInternal(aDocID: Integer): Integer;
begin
 Result := aDocID;
 GetRNumber(Result);
end;

procedure TReNumTbl.ConvertToExternalNumbers(aInternalIDs: ISab);
begin
 aInternalIDs.TransferToPhoto(rnRealID_fld, Self);
 aInternalIDs.RecordsByKey;
 aInternalIDs.ValuesOfKey(rnImportID_fld);
end;

function  TReNumTbl.GetBufferedImportNumber(aID : TDocID) : TDocID;
begin
 try
  Result := fBufferedList.Items[aID];
  if Result = 0 then
   Result := cUndefDocID;
 except
  Result := cUndefDocID;
 end;
end;

function TReNumTbl.GetExtDocID(aID : TDocID) : TDocID;
var
 lAbsNum : LongInt;
 lRecH   : RHANDLE;
begin
 with Table do
 begin
  Assert(aID > 0,'TReNumTbl.GetExtDocID: aID = 0');

  if Buffered then
   Result := GetBufferedImportNumber(aID)
  else
  begin
   lAbsNum := Ht(htRecordByUniq(nil, Handle, rnRealID_fld, @aID, @lRecH));
   if lAbsNum > 0 then
   begin
    GetFullRec(lAbsNum, False);
    GetFromFullRec(rnImportID_fld, Result);
   end
   else
    Result := cUndefDocID;
  end; // if-else
 end; // with Table
end;

Function TReNumTbl.UpdateImportNumber(aRealID,aImpID : LongInt) : Boolean;
Var
 AbsNum     : LongInt;
 RecH       : RHANDLE;

 TmpRID     : LongInt;
 RelFlag    : Boolean;
 FakeRecNum : LongInt;
Begin
 with Table do
 begin
 if aRealID = 0 then
  raise Exception.Create('����� TReNumTbl.UpdateImportNumber � ���������� aRealID = 0.');

 Result := False;
 FakeRecNum := 0;
 AbsNum:=Ht(htRecordByUniq(nil,Handle,rnImportID_fld,@aImpID,@RecH));
 If AbsNum<>0 then
  begin
   TmpRID:=0;
   GetFullRec(AbsNum,False);
   GetFromFullRec(rnRealID_fld,TmpRID);
   If TmpRID = aRealID then
    begin
     Result:=True;
     exit;
    end;
   If Not DocumentServer(TblFamily).CheckDoc(TmpRID,True,RelFlag) then
    begin
     DocumentServer(TblFamily).ChangeHLAddr(TmpRID, AllSubs, aRealID, AllSubs);
     //���� aImpID ��� ����� ��������� �� ������ ���������� �������,
     // �� ����� ��������� ��� ������, ������� ��������� �� ���� ���������� �����

     //GlobalHtServer.FreeTbl[TblFamily].PutFree(DocPrefName+IntToHex(TblFamily,3),TmpRID);
     FakeRecNum:=AbsNum;
    end
   else
    exit;
  end;
 AbsNum:=Ht(htRecordByUniq(nil,Handle,rnRealID_fld,@aRealID,@RecH));
 If AbsNum<>0 then
  Begin
   If FakeRecNum<>0 then
    DelRec(FakeRecNum);
   GetFullRec(AbsNum,True);
   Try
    PutToFullRec(rnImportID_fld,aImpID);
    UpdFRec(AbsNum);
    Result:=True;
   finally
    FreeRec(AbsNum);
   end;
  end
 else
  if AbsNum = 0 then
   if FakeRecNum = 0 then
   begin
    AddRecord(aRealID, aImpID);
    Result := True;
   end
   else
   begin
    GetFullRec(FakeRecNum, True);
    try
     PutToFullRec(rnRealID_fld, aRealID);
     UpdFRec(FakeRecNum);
     Result := True;
    finally
     FreeRec(FakeRecNum);
    end;
   end;
 end; //with Table
end;

procedure TReNumTbl.PureUpdateImportNumber(aRealID,aImpID : LongInt;
                                           withCheck : Boolean);
var
 AbsNum     : LongInt;
 RecH       : RHANDLE;
 tmpID      : LongInt;
begin
 with Table do
 begin
 AbsNum:=Ht(htRecordByUniq(nil,Handle,rnImportID_fld,@aImpID,@RecH));
 if AbsNum > 0 then
  if withCheck then
  begin
   GetFullRec(AbsNum,False);
   GetFromFullRec(rnRealID_fld,tmpID);
   if tmpID=aRealID then
    exit
   else
    raise EHtErrors.CreateInt(ecNotUniqID);
  end
  else
   raise EHtErrors.CreateInt(ecNotUniqID);
 AbsNum:=Ht(htRecordByUniq(nil,Handle,rnRealID_fld,@aRealID,@RecH));
 if AbsNum > 0 then
 begin
  GetFullRec(AbsNum,True);
  try
   if withCheck then
   begin
    GetFromFullRec(rnImportID_fld,tmpID);
    if tmpID<>aImpID then
    begin
     PutToFullRec(rnImportID_fld,aImpID);
     UpdFRec(AbsNum);
    end;
   end
   else
   begin
    PutToFullRec(rnImportID_fld,aImpID);
    UpdFRec(AbsNum);
   end;
  finally
   FreeRec(AbsNum);
  end;
 end
 else
  if AbsNum = 0 then
   AddRecord(aRealID, aImpID);
 end; //with Table
end;

procedure TReNumTbl.DelAllLinkItems(aDocID : TDocID);
begin
 Table.DeleteRecByUniq(rnRealID_fld, aDocID);
end;

function TReNumTbl.DelAllLinkItems(const aDocIDs: ISab) : integer;
begin
 Result := 1;
 Table.DeleteRecsByKeys(aDocIDs, rnRealID_fld);
end;

{ TImportIdToRealIdMap }

constructor TImportIdToRealIdMap.Create(aReNumTbl: TReNumTbl);
var
 lSab : ISab;

begin
 if aReNumTbl = nil then
  raise Exception.Create('�� ������ �������� ��� ������ ������� TImportIdToRealIdMap.Create.');

 lSab := MakeSab(aReNumTbl);
 lSab.SelectAll;
 lSab.Sort([rnImportID_fld]);
 f_Map := dtMakeRecListBySab(lSab,
                             [], // ��� ����
                             [rnImportID_fld] // ���������� �� ������� ���� (������� �����)
                             );
end;

function TImportIdToRealIdMap.Find(const aImportID: LongWord;
                                  out aRealId: LongWord): Boolean;
var
 lIndexExists : Integer;
 lRenumRec : record
  rIntNum : TDocID;
  rExtNum : TDocID;
 end;

begin
 lRenumRec.rExtNum := aImportID;
 Result := f_Map.Find(lRenumRec, lIndexExists);
 if Result then
  aRealId := PDocID(f_Map.ItemSlot(lIndexExists))^ //������ ������ ����
end;

procedure TImportIdToRealIdMap.Cleanup;
begin
 l3Free(f_Map);
 inherited;
end;

end.

