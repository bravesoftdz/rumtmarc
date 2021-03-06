Unit Dt_Prior;

{ $Id: Dt_Prior.pas,v 1.42 2013/04/19 13:07:39 lulin Exp $ }

// $Log: Dt_Prior.pas,v $
// Revision 1.42  2013/04/19 13:07:39  lulin
// - ���������.
//
// Revision 1.41  2013/01/17 10:11:56  voba
// - ������� ���������� � ��������� ������
//
// Revision 1.40  2010/09/28 13:06:09  fireton
// - ������������ ������ ��� PAnsiChar ������ ����������
//
// Revision 1.39  2010/09/24 12:11:14  voba
// - k : 235046326
//
// Revision 1.38  2010/09/21 11:06:54  fireton
// - ��������� ������� � PAnsiChar �� Tl3WString
//
// Revision 1.37  2010/03/10 14:09:47  narry
// - �� ����������
//
// Revision 1.36  2009/10/14 11:03:17  voba
// - ����������� �� ���������� mg
//
// Revision 1.35  2009/07/22 11:27:27  narry
// - ��������� ������� � DictServer
//
// Revision 1.34  2009/05/08 11:10:07  voba
// - ������� TblH �� Handle
//
// Revision 1.33  2009/03/02 08:15:39  voba
// - ������� ������ ���������� � constructor TPrometTbl.Create
//
// Revision 1.32  2008/04/04 14:49:23  narry
// - �� ����������
//
// Revision 1.31  2008/03/20 09:48:36  lulin
// - cleanup.
//
// Revision 1.30  2008/03/14 13:59:44  voba
// - bug fix
//
// Revision 1.28  2008/03/13 12:52:00  voba
// - add  class TPriorityCash
//
// Revision 1.27  2008/02/07 14:44:41  lulin
// - ����� _Tl3LongintList �������� � ����������� ������.
//
// Revision 1.26  2008/02/01 16:41:34  lulin
// - ���������� �������� ������.
//
// Revision 1.25  2007/12/19 12:59:32  fireton
// - Ok ������ ��������� ���������� (l_Ok)
//
// Revision 1.24  2007/08/14 20:25:14  lulin
// - bug fix: �� ���������� ����������.
//
// Revision 1.23  2007/08/14 19:31:56  lulin
// - ������������ ������� ������.
//
// Revision 1.22  2007/04/25 07:52:37  fireton
// - �����������. ������ �� ������ ���������� ���� ������ � ������ ������������ ����� � DT_Types
//
// Revision 1.21  2007/02/12 16:11:00  voba
// - ������� ������������� htModifyRecs �� ����� TAbsHtTbl.ModifyRecs
// - ������� TdtTable � ������ dt_Table (������� ������ ������� HyTech �� ������ � �������� �������)
// - ������� ������� HyTech �� ������ � Sab � dt_Sab, ����� ������ ������
//
// Revision 1.20  2005/04/05 10:51:02  step
// new: TPriorTbl.CalcPriorityBy
//
// Revision 1.19  2004/08/03 08:52:50  step
// ������ dt_def.pas �� DtDefine.inc
//
// Revision 1.18  2004/07/14 15:27:14  step
// ������ Buffering �� StartCaching/StopCaching
//
// Revision 1.17  2004/07/01 14:14:27  voba
// - merge newCashe
//
// Revision 1.16.38.1  2004/06/17 18:03:49  step
// � ������� TAbsHtTbl.AddRec � TAbsHtTbl.UpdRec ����� �������� AbsNum.
//
// Revision 1.16  2003/02/11 10:04:38  voba
// - rename proc: l3NodeActionL2FA -> l3L2IA.
//
// Revision 1.15  2002/12/24 13:02:00  law
// - change: ��������� Int64_Seek c �������� ������.
//
// Revision 1.14.4.1  2002/12/24 11:56:43  law
// - new behavior: ���������� 64-������ Seek ������ 32-�������.
//
// Revision 1.14  2002/02/08 17:09:56  voba
// no message
//
// Revision 1.13  2001/07/06 14:38:15  demon
// - new behavior: add transactions to all massive operation of Add, Modify and Delete of tbl records
//
// Revision 1.12  2000/12/15 15:36:17  law
// - ��������� ��������� Log.
//

{$I DtDefine.inc}

Interface

Uses
  SysUtils,
  HT_Const,
  l3Types, l3Base, l3LongintList, l3FieldSortRecList,
  Dt_Const, Dt_Types,
  dt_AttrSchema,
  DT_ATbl
  ;

Const
 prSour_fld   = 1;
 prType_fld   = 2;
 prResult_fld = 3;
 prBoth_key   = 4;

 MinPriority  = 999;
 MaxPriority  = 0;
Type
  TPriorTbl = Class(TPrometTbl)
   public
    Constructor Create(aFamily : TFamilyID); Reintroduce;

    function    GetPriorityOnList(SourSab,TypeSab : Sab;WithRefresh : Boolean) : Word;
    function    CalcPriorityBy(const aSourIds, aTypeIds: Tl3LongintList;
                               aWithRefresh: Boolean): Word;
    function    GetPriorityOnValue(aSour,aType : TDictID;WithRefresh : Boolean) : Word;

    Procedure   ImportPriorityFromFile(aFile : TFileName;ConvertFromOEM : Boolean;
                                       WithDropData : Boolean);
    Procedure   ExportPriorityToFile(aFile : TFileName;aProgress : Tl3ProgressProc);

    procedure   DeletePriorityOnDictID(aID : TDictID; aType : TDLType);
  end;

  TPriorityCash = class(Tl3Base)
  private
   fRecList : Tl3FieldSortRecList;
   procedure Cleanup; override;
  public
   constructor Create(aFamily : TFamilyID); Reintroduce;
   function CalcPriorityBy(const aSourceIDs, aTypeIDs: Tl3LongintList): Word;
  end;

(*
��� �������
�� GDK
"����������� ����������� � ������� ������ ������ � ������� ������� (� "������" Source � � "������" Type),
�� ����������� ������� ����������� ������ ������ �����-������ �����, ���������� ����������� ����������� ����
� ����������� ����������, ��������, 999. ��� �������� ��������� �� ��, ��� ������(�) ��������(�) ����������
(��������, ������ ������ �������� ��� ������ ������, �� ������������� � �������). � ���� ������ ��� �����������
���� ������ ��������, ���������� �� ����������� ������������ ������ (������� ������) � ���������� ����.
���� ����� �������� �� �������, ������ ��������, ������� �� ����������� ������ ������ � ������� �������."
������ "������" Source � "������" Type �������� �� �� ����������� � ���������
*)

Implementation
uses
     vtDebug,
     WinTypes, Classes,
     l3Tree_Tlb,
     l3Nodes, l3MinMax,
     HT_Dll,
     Dt_Err, dt_Sab, Dt_Dict,
     dt_DictIntf,
     m2xltlib,
     //MGExFStr,MGBufStr,
     l3Stream,
     l3String,
     m0Const, l3Interfaces;

Constructor TPriorTbl.Create(aFamily : TFamilyID);
begin
  Assert(aFamily <> MainTblsFamily);
  inherited Create(aFamily, ord(ftPriority));
end;

function TPriorTbl.GetPriorityOnList(SourSab,TypeSab : Sab;WithRefresh : Boolean) : Word;
Var
 TmpSab1,
 TmpSab2,
 TmpSab3  : Sab;
begin
 Result:=MinPriority;
 if WithRefresh
  then
   begin
    RefreshSrchList;
    htTransferToPhoto(SourSab,fSrchList,prSour_fld);
    htTransferToPhoto(TypeSab,fSrchList,prType_fld);
   end;
 l3FillChar(TmpSab1,SizeOf(Sab));
 l3FillChar(TmpSab2,SizeOf(Sab));
 l3FillChar(TmpSab2,SizeOf(Sab));

 htRecordsByKey(TmpSab1,SourSab);
 htRecordsByKey(TmpSab2,TypeSab);
 try
  htAndResults(TmpSab3,TmpSab1,TmpSab2);
  try
   if TmpSab3.gFoundCnt<>0
    then
     htKeyMinimum(TmpSab3,prResult_fld,@Result);
  finally
   htClearResults(TmpSab3);
  end;
 finally
  htClearResults(TmpSab1);
  htClearResults(TmpSab2);
 end;
end;

function TPriorTbl.GetPriorityOnValue(aSour,aType : TDictID;
                                      WithRefresh : Boolean) : Word;
Var
 AbsN : LongInt;
 RecH : RHANDLE;
begin
 if WithRefresh then RefreshSrchList;
 ClearFullRec;
 PutToFullRec(prSour_fld,aSour);
 PutToFullRec(prType_fld,aType);
 AbsN:=Ht(htRecordByUniq(@fSrchList,Handle,prBoth_key,fFullRecord,@RecH));
 if AbsN<>0
  then
   begin
    GetFullRec(AbsN,False);
    GetFromFullRec(prResult_fld,Result);
   end
  else
   Result:=MinPriority;
end;

Const
 MaxNameSize = 4000;

Procedure TPriorTbl.ImportPriorityFromFile(aFile : TFileName;ConvertFromOEM : Boolean;
                                           WithDropData : Boolean);
Const
 cErrorID = High(TDictID) - 1;
Var
 TmpPChar,
 TypeArr   : PAnsiChar;
 TblFl     : Tl3FileStream;
 CtrlChar  : Char;
 CurSour   : TDictID;
 I,
 StartPos,
 CurLength,
 TypeCount,
 Prior,
 FullSize  : LongInt;
 TmpNode   : Il3Node;

 TypeRoot,
 SourRoot  : TDictRootNode;
begin
 TypeRoot:=DictServer(TblFamily).DictRootNode[dlTypes].Use;
 try
  SourRoot:=DictServer(TblFamily).DictRootNode[dlSources].Use;
  try
   TblFl := Tl3FileStream.Create(aFile,l3_fmRead);
   try
    FullSize:=TblFl.Size;
    CtrlChar:=#00;
    if WithDropData then DropTblData;
    { ������ ���������� ����� }
    TypeCount:=0;
    Repeat
     TblFl.ReadBuffer(CtrlChar,1);
     if CtrlChar=#9 then
      Inc(TypeCount);
    until CtrlChar=#13;
    TypeArr := l3StrAlloc(SizeOf(TDictID)*TypeCount);
    l3FillChar(TypeArr^,SizeOf(TDictID)*TypeCount);
    TmpPChar := l3StrAlloc(MaxNameSize);
    StartCaching;
    try
     { ���������� ������� ����� }
     TblFl.Seek(1,soBeginning);
     I:=0;
     StartPos:=1;
     CtrlChar:=#00;
     Repeat
      TblFl.ReadBuffer(CtrlChar,1);
      if (CtrlChar=#9) or
         (CtrlChar=#13) then
       begin
        CurLength:=TblFl.Position-1-StartPos;
        if CurLength > 0 then
         begin
          l3FillChar(TmpPChar^,MaxNameSize);
          TblFl.Seek(-(CurLength+1),soCurrent);
          TblFl.ReadBuffer(TmpPChar^,CurLength);
          if ConvertFromOEM then m2XLTConvertBuff(TmpPChar,CurLength,Cm2XLTOEM2ANSI);
          TmpNode:=l3SearchByPath(TypeRoot,l3PCharLen(TmpPChar));
          if TmpNode<>Nil then
           PDictIDArr(TypeArr)^[I]:=TDictID((TmpNode as IDictItem).Handle)
          else
           PDictIDArr(TypeArr)^[I] := cErrorID;
          Inc(I);
          TblFl.Seek(1,soCurrent);
         end;
        StartPos:=TblFl.Position;
       end;
     until CtrlChar=#13;
     TblFl.Seek(1,soCurrent);
     { ��������� ��������� ����� ������� }
     try
      Repeat
       StartPos:=TblFl.Position;
       CurSour:=0;
       Repeat
        TblFl.ReadBuffer(CtrlChar,1);
        if CtrlChar=#9 then
         begin
          CurLength:=TblFl.Position-1-StartPos;
          if CurLength>0 then
           begin
            l3FillChar(TmpPChar^,MaxNameSize);
            TblFl.Seek(-(CurLength+1),soCurrent);
            TblFl.ReadBuffer(TmpPChar^,CurLength);
            if ConvertFromOEM then m2XLTConvertBuff(TmpPChar,CurLength,Cm2XLTOEM2ANSI);
            TmpNode:=l3SearchByPath(SourRoot, l3PCharLen(TmpPChar));
            if TmpNode<>Nil then
             CurSour:=TDictID((TmpNode as IDictItem).Handle)
            else
             CurSour := cErrorID;
            TblFl.Seek(1,soCurrent);
           end
          else
           CurSour:=0;
         end
       until CtrlChar=#9;

       StartPos:=TblFl.Position;
       I:=0;
       Repeat
        TblFl.ReadBuffer(CtrlChar,1);
        if (CurSour <> cErrorID) and
           ((CtrlChar=#9) or (CtrlChar=#13)) then
         begin
          CurLength:=TblFl.Position-1-StartPos;
          if CurLength > 0 then
           begin
            l3FillChar(TmpPChar^,MaxNameSize);
            TblFl.Seek(-(CurLength+1),soCurrent);
            TblFl.ReadBuffer(TmpPChar^,CurLength);
            Prior:=StrToIntDef(StrPas(TmpPChar),0);
            TblFl.Seek(1,soCurrent);
           end
          else
           Prior:=MinPriority;
          if PDictIDArr(TypeArr)^[I] <> cErrorID then
           begin
            ClearFullRec;
            PutToFullRec(prSour_fld,CurSour);
            PutToFullRec(prType_fld,PDictIDArr(TypeArr)^[I]);
            PutToFullRec(prResult_fld,Prior);
            try
             AddFRec;
            except
            end;
           end;
          Inc(I);
          StartPos := TblFl.Position;
         end;
       until CtrlChar=#13;
       TblFl.Seek(1,soCurrent);
      until TblFl.Position = FullSize;
     except
     end;
    finally
     l3StrDispose(TypeArr);
     l3StrDispose(TmpPChar);
     StopCaching;
     UpdateTbl;
    end;
   finally
    l3Free(TblFl);
   end;
  finally
   l3Free(SourRoot);
  end;
 finally
  l3Free(TypeRoot);
 end;
end;

Procedure TPriorTbl.ExportPriorityToFile(aFile : TFileName;aProgress : Tl3ProgressProc);
Const
 Suffix   : Array [1..2] of Char = #13#10;
 Perforat : Char = #9;
Var
 TblFl    : Tl3FileStream;
 J,I      : LongInt;
 CurSour,
 CurType  : TDictID;
 CurPrior : Word;
 PrStr    : ShortString;

 tmpLen   : LongInt;
 tmpStr   : AnsiString;

 TypeRoot,
 SourRoot : TDictRootNode;


 function IterHandler1(CurNode : Il3Node) : Boolean; far;
 begin
  if not CurNode.HasChild
   then
    begin
     TblFl.WriteBuffer(Perforat,1);
     tmpStr:=l3GetFullPathStr(TypeRoot,CurNode);
     tmpLen:=Length(tmpStr);
     m2XLTConvertBuff(PAnsiChar(tmpStr),tmpLen,Cm2XLTANSI2OEM);
     TblFl.WriteBuffer(PAnsiChar(tmpStr)^,tmpLen);
    end;
  Result:=False;
 end;

 function IterHandler3(CurNode : Il3Node) : Boolean; far;
 begin
  if not CurNode.HasChild
   then
    begin
     if Assigned(aProgress)
      then
       aProgress(piCurrent,I*(DictServer(TblFamily).DictList[dlTypes].Count)+J+1,'');

     TblFl.WriteBuffer(Perforat,1);
     CurType:=(CurNode as IDictItem).Handle;
     CurPrior:=GetPriorityOnValue(CurSour,CurType,False);
     if CurPrior<>MinPriority
      then
       begin
        PrStr:=IntToStr(CurPrior);
        TblFl.WriteBuffer(PrStr[1],Length(PrStr));
       end;
    end;
  Result:=False;
 end;

 function IterHandler2(CurNode : Il3Node) : Boolean; far;

  function IterHandler4(CurNode : Il3Node) : Boolean; far;
  begin
   IterHandler3(CurNode);
  end;

 begin
  if not CurNode.HasChild
   then
    begin
     tmpStr:=l3GetFullPathStr(SourRoot,CurNode);
     tmpLen:=Length(tmpStr);
     m2XLTConvertBuff(PAnsiChar(TmpStr),tmpLen,Cm2XLTANSI2OEM);
     TblFl.WriteBuffer(PAnsiChar(TmpStr)^,tmpLen);
     CurSour:=(CurNode as IDictItem).Handle;
     J:=0;

     CurType:=0;                       // ����� �������� ������ � 0 �����
     TblFl.WriteBuffer(Perforat,1);
     CurPrior:=GetPriorityOnValue(CurSour,CurType,False);
     if CurPrior<>MinPriority then
      begin
       PrStr:=IntToStr(CurPrior);
       TblFl.WriteBuffer(PrStr[1],Length(PrStr));
      end;

     l3IterateSubTreeF(TypeRoot,l3L2NA(@IterHandler4),0);
     TblFl.WriteBuffer(Suffix,2);
    end;
  Result:=False;
 end;


begin
 TypeRoot:=DictServer(TblFamily).DictRootNode[dlTypes].Use;
 try
  SourRoot:=DictServer(TblFamily).DictRootNode[dlSources].Use;
  try
   TblFl:=Tl3FileStream.Create(aFile,l3_fmWrite);
   try
    if Assigned(aProgress) then
     aProgress(piStart,DictServer(TblFamily).DictList[dlSources].Count*DictServer(TblFamily).DictList[dlTypes].Count,
               '������� ������� �����������');

    RefreshSrchList;
    if fSrchList.gFoundCnt=0
     then
      exit;

    { ����� ������� ����� }

    TblFl.WriteBuffer(Perforat,1); // ����� ������ ��� �������� ����
    l3IterateSubTreeF(TypeRoot,l3L2NA(@IterHandler1),0);
    TblFl.WriteBuffer(Suffix,2);
    { ����� ����� ���������� }

    J:=0;                           // ������ ������ ������� ��� �������� ������
    CurSour:=0;
    CurType:=0;
    TblFl.WriteBuffer(Perforat,1);
    CurPrior:=GetPriorityOnValue(CurSour,CurType,False);  // ����������� ���������
    PrStr:=IntToStr(CurPrior);
    TblFl.WriteBuffer(PrStr[1],Length(PrStr));

    l3IterateSubTreeF(TypeRoot,l3L2NA(@IterHandler3),0);
    TblFl.WriteBuffer(Suffix,2);   // ����� ������ ������� ��� �������� ������

    I:=0;
    l3IterateSubTreeF(SourRoot,l3L2NA(@IterHandler2),0);
   finally
    if Assigned(aProgress) then aProgress(piEnd,0,'');
    l3Free(TblFl);
   end;
  finally
   l3Free(SourRoot);
  end;
 finally
  l3Free(TypeRoot);
 end;
end;

procedure TPriorTbl.DeletePriorityOnDictID(aID : TDictID; aType : TDLType);
var
 lField : ThtField;
begin
 Case aType of
  dlTypes   : lField := prType_fld;
  dlSources : lField := prSour_fld;
  else exit;
 end;

 with MakeSab(Self) do
 begin
  Select(lField, aID);
  DeleteFromTable;
 end;
end;

function TPriorTbl.CalcPriorityBy(const aSourIds, aTypeIds: Tl3LongintList;
                                  aWithRefresh: Boolean): Word;
var
 l_SourIds,
 l_TypeIds: Sab;
 l_List: Tl3LongintList;
 l_ListIndex: Longint;
 l_FillBufferProc: TFillBufferProc;

 function fn_CopyListToBuffer(aBuffer: Pointer; aBufSize: Longint): Longint;
 var
  l_WrittenAmount: Longint;
 begin
  l_WrittenAmount := 0;
  while (l_ListIndex < l_List.Count)
    and (l_WrittenAmount < aBufSize div SizeOf(TDictID)) do
  begin
   PDictID(PAnsiChar(aBuffer) + l_WrittenAmount * SizeOf(TDictID))^ := l_List.Items[l_ListIndex];
   Inc(l_ListIndex);
   Inc(l_WrittenAmount);
  end;
  Result := l_WrittenAmount * SizeOf(TDictID);
 end;

begin
 l_FillBufferProc := L2FillBufferProc(@fn_CopyListToBuffer);
 try
  l_List := aSourIds;
  l_ListIndex := 0;
  l_SourIds := BuildSab(l_FillBufferProc, Self, prSour_fld);
  try
   l_List := aTypeIds;
   l_ListIndex := 0;
   l_TypeIds := BuildSab(l_FillBufferProc, Self, prType_fld);
   try
    Result := GetPriorityOnList(l_SourIds, l_TypeIds, aWithRefresh);
   finally
    htClearResults(l_TypeIds);
   end;
  finally
   htClearResults(l_SourIds);
  end;
 finally
  FreeFillBufferProc(l_FillBufferProc);
 end;
end;

{TPriorityCash}
Type
 PPriorRec = ^TPriorRec;
 TPriorRec = record
  rSID : TDictID;
  rTID : TDictID;
  rPriority : word;
 end;

constructor TPriorityCash.Create(aFamily : TFamilyID);
var
 aTbl : TPriorTbl;
 I : Integer;
begin
 aTbl := TPriorTbl.Create(aFamily);
 try
  fRecList := dtMakeRecListBySab(MakeAllRecords(aTbl), [], [1, 2]);
 finally
  l3Free(aTbl);
 end;
end;

procedure TPriorityCash.Cleanup;
begin
 l3Free(fRecList);
 inherited;
end;

function TPriorityCash.CalcPriorityBy(const aSourceIDs, aTypeIDs: Tl3LongintList): Word;
var
 lTIdx  : Integer;
 lSIdx  : Integer;
 lIndex : Integer;
 lRec   : TPriorRec;
begin
 Result := MinPriority;

 for lSIdx := 0 to Pred(aSourceIds.Count) do
  for lTIdx := 0 to Pred(aTypeIds.Count) do
  begin
   lRec.rSID := aSourceIds[lSIdx];
   lRec.rTID := aTypeIds[lTIdx];

   if fRecList.FindRecord(lRec, lIndex) then
    Result := Min(Result, PPriorRec(fRecList.ItemSlot(lIndex))^.rPriority);
  end;
end;

end.
