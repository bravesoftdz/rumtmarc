unit evCursorTools;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evCursorTools.pas"
// �����: 30.08.2000 16:58
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi::Everest::ParaUtils::evCursorTools
//
// ��������������� ������� ��� ������ � ���������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  l3Types,
  nevBase,
  nevTools,
  evInternalInterfaces
  ;

type
 TevBool2FlagsAtEnd = array [Boolean] of TevInsertParaFlags;

const
  { FlagsConstant }
 AtEndFromBool : TevBool2FlagsAtEnd = ([], [ev_ipfAtEnd]);

function EvShrinkCursorChildren(const aCursor: InevBasePoint;
  const aTag: InevTag): Boolean;
   {* �������� �������� ������� �� aTag }
procedure EvIterateCursorsF(const aTag: InevTag;
  Action: Tl3IteratorAction);
   {* ���������� ��� ������� ��� ���� aTag, � ������������� �������� ��� Action }
function EvSelectTablePara(const aContext: InevSelection;
  const aPara: InevParaList): Boolean;
   {* �������� �������/������/������ }
function EvSelectTableColumn(const aContext: InevSelection;
  const aTable: InevParaList;
  aColumnIndex: Integer): Boolean;
   {* �������� ������� ������� }
function EvSelectBlock(const aContext: InevSelection;
  const aBlock: InevParaList): Boolean;
   {* �������� ���� ������� }
function EvInPara(const aCursor: InevBasePoint;
  aTypeID: Integer;
  out theParaCursor: InevBasePoint;
  anExcludeType: Integer = 0): Boolean; overload; 
   {* ������ � ��������� ������� ����������� �� ���� aTypeID? }
function EvInPara(const aCursor: InevBasePoint;
  aTypeID: Integer;
  anExcludeType: Integer = 0): Boolean; overload; 
   {* ������ � ��������� ������� ����������� �� ���� aTypeID? }
function EvMergeParaList(const aView: InevView;
  const aCursor: InevBasePoint;
  const aParaList: InevParaList;
  aType: TevMergeParaListType;
  const anOp: InevOp;
  aFrom: Integer;
  pListEnd: PIUnknown = nil;
  const anIndicator: InevProgress = nil): Boolean;
   {* ���������� ������ ���������� aCursor.Target � ���������� aParaList }
function EvDeletePara(const anOpPack: InevOp;
  const aCursor: InevBasePoint;
  aFlags: TevDeleteParaFlags = [ev_dpfAtEnd]): Boolean;
function EvInsertPara(const aProcessor: InevProcessor;
  const aCursor: InevBasePoint;
  const aPara: InevTag;
  aFlags: TevInsertParaFlags = [ev_ipfAtEnd]): Boolean; overload; 
function EvInsertPara(const anOpPack: InevOp;
  const aCursor: InevBasePoint;
  const aPara: InevTag;
  aFlags: TevInsertParaFlags = [ev_ipfAtEnd]): Boolean; overload; 
procedure EvSelectHyperlink(const aView: InevControlView;
  const aHyperlink: InevTag;
  const aOwnerPara: InevObject);
function EvCalcDiffInLines(const aView: InevView;
  const aFirstPoint: InevBasePoint;
  const aSecondPoint: InevBasePoint;
  aParentFI: TnevFormatInfoPrim): Integer;
function EvCalcDiffInLines4Block(const aView: InevView;
  const aTop: InevBasePoint;
  const aBottom: InevBasePoint;
  aParentFI: TnevFormatInfoPrim): Integer;
function EvCalcDiffInLines4MakePointVisible(const aView: InevView;
  const aTop: InevBasePoint;
  const aBottom: InevBasePoint;
  aParentFI: TnevFormatInfoPrim): Integer;

implementation

uses
  evSegLst,
  nevFacade,
  SysUtils,
  k2OpMisc,
  evMsgCode,
  l3Base,
  k2Interfaces,
  evOp,
  k2Tags,
  k2Const
  ;

// unit methods

function EvMergeParaList(const aView: InevView;
  const aCursor: InevBasePoint;
  const aParaList: InevParaList;
  aType: TevMergeParaListType;
  const anOp: InevOp;
  aFrom: Integer;
  pListEnd: PIUnknown = nil;
  const anIndicator: InevProgress = nil): Boolean;
//#UC START# *4F6AE7A70152_48453B7601F9_var*
var
 l_RowID        : Integer;
 l_List         : InevParas;
 l_PL           : InevParaList;
 l_PL2          : InevParaListModify;
 l_MI           : InevBasePoint;
 l_Cell         : InevTableCell;
 l_PrevCell     : InevTableCell;
 l_NewPoint     : InevBasePoint;
 l_HasIndicator : Boolean;
 l_FInsertFlags : TevInsertParaFlags;
 l_OpBottomCode : Integer;
//#UC END# *4F6AE7A70152_48453B7601F9_var*
begin
//#UC START# *4F6AE7A70152_48453B7601F9_impl*
 if aType = ev_mtlTables then
  l_OpBottomCode := ev_ocBottomRightIgnoreMergedCell
 else
  l_OpBottomCode := ev_ocBottomRight;
 aCursor.Move(aView, l_OpBottomCode, anOp);
 l_MI := aCursor.MostInner;
 if (l_MI.ParentPoint <> nil) and (l_MI.ParentPoint.Obj^.OverlapType = otUpper) then
 begin
  l_MI.ParentPoint.QT(InevTableCell, l_Cell);
  Assert(l_Cell <> nil);
  while l_Cell <> nil do
  begin
   l_PrevCell := l_Cell;
   l_Cell := l_PrevCell.GetContinueCell(True, fc_Down);
  end; // while l_Cell <> nil do
  l_NewPoint := l_PrevCell.OwnerPara.MakePoint;
  l_NewPoint.Inner := l_PrevCell.MakePoint;
  l_MI.ParentPoint.ParentPoint.ParentPoint.Inner := l_NewPoint;
 end; // if l_MI.ParentPoint.Obj^.OverlapType = ev_msHead then
 if (pListEnd <> nil) then
  pListEnd^ := aCursor.ClonePoint(aView);
 if (aFrom <= 0) then
  aFrom := 1;
 Dec(aFrom);
 // - C�������� �� ����� �������
 if aCursor.QT(InevParaList, l_PL, k2Proc(anOp)) then
  try
   l_PL2 := l_PL.Modify;
   l_List := aParaList.GetParas(aFrom);
   if (aType in [ev_mtlTables, ev_mtlCells]) or aParaList.SubRange(aView, Succ(aFrom), High(aFrom)).Modify.Delete(aView, anOp) then
   //if aParaList.DeleteParas(aView, anOp, aFrom) then
   begin
    if aType = ev_mtlTables then
     l_FInsertFlags := [ev_ipfNeedFire, ev_ipfForce]
    else
     l_FInsertFlags := [ev_ipfNeedFire];
    l_HasIndicator := anIndicator <> nil;
    if l_HasIndicator then
     if (pListEnd = nil) then
      anIndicator.Start(l_List.Count, l3CStr('��������� ������.'))
     else
      anIndicator.Start(l_List.Count, l3CStr('����������� ������.'));
    try
     for l_RowID := 0 to l_List.Count - 1 do
     begin
      l_PL2.InsertPara(aCursor.Position, l_List[l_RowID], anOp, l_FInsertFlags);
      aCursor.Move(aView, l_OpBottomCode, anOp);
      if l_HasIndicator then
       anIndicator.Progress(l_RowID);
     end;//for l_RowID
    finally
     if l_HasIndicator then
      anIndicator.Finish;
    end;
   end;//aParaList.DeleteParas(aFrom)
  finally
   l_PL2 := nil;
  end//try..finall
 else
  Assert(False, '�� �������������� ������ ����������');
 Result := True;
//#UC END# *4F6AE7A70152_48453B7601F9_impl*
end;//EvMergeParaList

function EvDeletePara(const anOpPack: InevOp;
  const aCursor: InevBasePoint;
  aFlags: TevDeleteParaFlags = [ev_dpfAtEnd]): Boolean;
//#UC START# *4F6B07C20045_48453B7601F9_var*
var
 l_Op : IevOpDeletePara;
//#UC END# *4F6B07C20045_48453B7601F9_var*
begin
//#UC START# *4F6B07C20045_48453B7601F9_impl*
 if Supports(aCursor, IevOpDeletePara, l_Op) then
  try
   Result := l_Op.DoIt(anOpPack, aFlags);
  finally
   l_Op := nil;
  end//try..finally
 else
  Result := false;
//#UC END# *4F6B07C20045_48453B7601F9_impl*
end;//EvDeletePara

function EvInsertPara(const aProcessor: InevProcessor;
  const aCursor: InevBasePoint;
  const aPara: InevTag;
  aFlags: TevInsertParaFlags = [ev_ipfAtEnd]): Boolean;
//#UC START# *4F6B0ECD019E_48453B7601F9_var*
//#UC END# *4F6B0ECD019E_48453B7601F9_var*
begin
//#UC START# *4F6B0ECD019E_48453B7601F9_impl*
 if (aCursor = nil) then
  Result := False
 else
  Result := evInsertPara(k2StartOp(aProcessor, ev_msgInsertPara), aCursor, aPara, aFlags);
//#UC END# *4F6B0ECD019E_48453B7601F9_impl*
end;//EvInsertPara

function EvInsertPara(const anOpPack: InevOp;
  const aCursor: InevBasePoint;
  const aPara: InevTag;
  aFlags: TevInsertParaFlags = [ev_ipfAtEnd]): Boolean;
//#UC START# *4F6B0F34012A_48453B7601F9_var*
var
 l_Op : IevOpInsertPara;
//#UC END# *4F6B0F34012A_48453B7601F9_var*
begin
//#UC START# *4F6B0F34012A_48453B7601F9_impl*
 if Supports(aCursor, IevOpInsertPara, l_Op) then
  try
   Result := l_Op.DoIt(anOpPack, aPara, aFlags);
  finally
   l_Op := nil;
  end//try..finally
 else
  Result := False;
//#UC END# *4F6B0F34012A_48453B7601F9_impl*
end;//EvInsertPara

procedure EvSelectHyperlink(const aView: InevControlView;
  const aHyperlink: InevTag;
  const aOwnerPara: InevObject);
//#UC START# *5063E9CC0008_48453B7601F9_var*
var
 l_Start          : InevBasePoint;
 l_Block          : InevRange;
 l_Finish         : InevBasePoint;
 l_IsHyperlinkOnly: Boolean;
//#UC END# *5063E9CC0008_48453B7601F9_var*
begin
//#UC START# *5063E9CC0008_48453B7601F9_impl*
 if aHyperlink <> nil then
 begin
  l_IsHyperlinkOnly := evIsParaHyperlink(aOwnerPara);
  l_Start := aOwnerPara.MakePoint;
  l_Start.SetEntryPoint(aHyperlink.IntA[k2_tiStart] - 1);
  if l_IsHyperlinkOnly then
   l_Start.SetAtStart(aView, True);
  l_Finish := aOwnerPara.MakePoint;
  l_Finish.SetEntryPoint(aHyperlink.IntA[k2_tiFinish]);
  if l_IsHyperlinkOnly then
   l_Finish.SetAtEnd(aView, True);
  l_Block := aOwnerPara.Range(l_Start, l_Finish);
  aView.Control.Selection.Select(l_Block, False);
 end; // if aHyperlink <> nil then
//#UC END# *5063E9CC0008_48453B7601F9_impl*
end;//EvSelectHyperlink

function EvCalcDiffInLines(const aView: InevView;
  const aFirstPoint: InevBasePoint;
  const aSecondPoint: InevBasePoint;
  aParentFI: TnevFormatInfoPrim): Integer;
//#UC START# *50C6F95E02D3_48453B7601F9_var*
var
 l_LinesCount : Integer absolute Result;
 l_Start      : Integer;
 l_Finish     : Integer;
 l_TopInner   : InevBasePoint;
 l_BottomInner: InevBasePoint;

 function lp_IncLines(const aTag: InevPara; anIndex: TnevParaIndex): Boolean;
 var
  l_FI : TnevFormatInfoPrim;
 begin//IncDelta
  l_FI := aParentFI.InfoForChild(aTag);
  if anIndex = l_Finish then
   Inc(l_LinesCount, l_BottomInner.VertPosition(aView, l_FI))
  else
   Inc(l_LinesCount, l_FI.MaxLinesCount);
  if anIndex = l_Start then
   Dec(l_LinesCount, l_TopInner.VertPosition(aView, l_FI));
  Result := True;
 end;//IncDelta

var
 l_Top    : InevBasePoint;
 l_Bottom : InevBasePoint;
 l_Line   : Integer;
//#UC END# *50C6F95E02D3_48453B7601F9_var*
begin
//#UC START# *50C6F95E02D3_48453B7601F9_impl*
 l_Top := aFirstPoint;
 l_Bottom := aSecondPoint;
 l_LinesCount := 0;
 l_TopInner := l_Top.Inner;
 l_BottomInner := l_Bottom.Inner;
 if not l_TopInner.Obj.IsList and l_TopInner.IsSame(l_BottomInner) then
  l_LinesCount := l_Bottom.Diff(aView, l_Top, aParentFI)
 else
 begin
  l_Start := l_Top.Inner.Obj.PID;
  if l_BottomInner = nil then Exit;
  l_Finish := l_BottomInner.Obj.PID;
  l_Top.Obj^.AsPara.AsList.IterateParaF(nevL2PIA(@lp_IncLines), l_Start, l_Finish);
 end;
//#UC END# *50C6F95E02D3_48453B7601F9_impl*
end;//EvCalcDiffInLines

function EvCalcDiffInLines4Block(const aView: InevView;
  const aTop: InevBasePoint;
  const aBottom: InevBasePoint;
  aParentFI: TnevFormatInfoPrim): Integer;
//#UC START# *50FF931D03C5_48453B7601F9_var*
var
 l_Line: Integer;
//#UC END# *50FF931D03C5_48453B7601F9_var*
begin
//#UC START# *50FF931D03C5_48453B7601F9_impl*
 Result := 0;
 while aBottom.Diff(aView, aTop, aParentFI) <> 0 do
 begin
  l_Line := 1;
  aTop.IncLine(aView, l_Line, True);
  if l_Line > 0 then Break;
  Inc(Result);
 end // while l_Bottom.Diff(aView, l_Top, aParentFI) <> 0 do
//#UC END# *50FF931D03C5_48453B7601F9_impl*
end;//EvCalcDiffInLines4Block

function EvCalcDiffInLines4MakePointVisible(const aView: InevView;
  const aTop: InevBasePoint;
  const aBottom: InevBasePoint;
  aParentFI: TnevFormatInfoPrim): Integer;
//#UC START# *50FF94E8029B_48453B7601F9_var*
const
 cnMaxLineCount = 10; // ���������������� ����� �����, ��� ������� ������� ������� ������� ��� ����������� �����������. 
var
 l_Line: Integer;
//#UC END# *50FF94E8029B_48453B7601F9_var*
begin
//#UC START# *50FF94E8029B_48453B7601F9_impl*
 Result := 0;
 while aBottom.Diff(aView, aTop, aParentFI) > 0 do
 begin
  l_Line := 1;
  aTop.IncLine(aView, l_Line, True);
  if l_Line > 0 then Break;
  Inc(Result);
  (*if Result > cnMaxLineCount then
  begin
   Result := -1;
   Break;
  end; //if Result > cnMaxLineCount then*)
 end // while l_Bottom.Diff(aView, l_Top, aParentFI) <> 0 do
//#UC END# *50FF94E8029B_48453B7601F9_impl*
end;//EvCalcDiffInLines4MakePointVisible

function EvShrinkCursorChildren(const aCursor: InevBasePoint;
  const aTag: InevTag): Boolean;
//#UC START# *48E50160015B_48453B7601F9_var*
var
 l_Cursor : InevBasePoint;  
//#UC END# *48E50160015B_48453B7601F9_var*
begin
//#UC START# *48E50160015B_48453B7601F9_impl*
 Result := False;
 if (aCursor <> nil) then
 begin
  l_Cursor := aCursor.MostInner;
  while (l_Cursor <> nil) do
  begin
   if l_Cursor.Obj.IsSame(aTag) then
   begin
    l_Cursor.Inner := nil;
    Result := True;
    Break;
   end;//l_Cursor.Obj.EQ(aTag)
   if (l_Cursor.ParentPoint <> nil) then
    l_Cursor := l_Cursor.ParentPoint
   else
    l_Cursor := nil; 
  end;//l_Cursor <> nil
 end;//aCursor <> nil
//#UC END# *48E50160015B_48453B7601F9_impl*
end;//EvShrinkCursorChildren

procedure EvIterateCursorsF(const aTag: InevTag;
  Action: Tl3IteratorAction);
//#UC START# *48E501750350_48453B7601F9_var*
var
 l_CursorCache : Ik2OldCursorCache;
//#UC END# *48E501750350_48453B7601F9_var*
begin
//#UC START# *48E501750350_48453B7601F9_impl*
 try
  if aTag.QT(Ik2OldCursorCache, l_CursorCache, nil) then
   try
    l_CursorCache.Iterate(aTag, Action);
   finally
    l_CursorCache := nil;
   end;//try..finally
 finally
  l3FreeIA(Action);
 end;{try..finally}
//#UC END# *48E501750350_48453B7601F9_impl*
end;//EvIterateCursorsF

function EvSelectTablePara(const aContext: InevSelection;
  const aPara: InevParaList): Boolean;
//#UC START# *48E5018C028D_48453B7601F9_var*
var
 l_Block  : InevRange;
 l_Start  : InevBasePoint;
 l_Finish : InevBasePoint;
 l_Para   : InevParaList;
//#UC END# *48E5018C028D_48453B7601F9_var*
begin
//#UC START# *48E5018C028D_48453B7601F9_impl*
 Result := False;
 if (aContext <> nil) then
 begin
  l_Start := aPara.Para[0].MakePoint;
  l_Start.SetEntryPoint(1);
  if l_Start.HasInner then
   l_Start.Inner.Move(aContext.View, ev_ocTopLeft);
  l_Start := l_Start.PointToParent(aPara);
  l_Para := aPara.Para[aPara.ParaCount - 1].AsList;
  l_Finish := l_Para.MakePoint;
  l_Finish.SetEntryPoint(l_Para.ParaCount);
  if l_Finish.HasInner then
   l_Finish.Inner.Move(aContext.View, ev_ocBottomRight);
  l_Finish := l_Finish.PointToParent(aPara);
  if (aPara.ChildrenCount <= 1) AND l_Finish.AtStart then
   l_Block := aPara.Range(l_Finish, l_Finish)
  else
   l_Block := aPara.Range(l_Start, l_Finish);
  aContext.Select(l_Block, false);
  Result := True;
 end;//if (aContext <> nil) then
//#UC END# *48E5018C028D_48453B7601F9_impl*
end;//EvSelectTablePara

function EvSelectTableColumn(const aContext: InevSelection;
  const aTable: InevParaList;
  aColumnIndex: Integer): Boolean;
//#UC START# *48E501A60222_48453B7601F9_var*
var
 l_Block         : InevRange;
 l_Start         : InevBasePoint;
 l_Finish        : InevBasePoint;
 l_RowIndex0     : Integer;
 l_ChildrenCount : Integer;
 l_OffsetX       : Integer;
 l_PID           : Integer;
 l_Table         : InevParaList;
 l_TableRow      : InevTableRow;
 l_CellWidth     : Integer;
//#UC END# *48E501A60222_48453B7601F9_var*
begin
//#UC START# *48E501A60222_48453B7601F9_impl*
 Result := False;
 if (aContext <> nil) then
 begin
  with aTable do
  begin
   l_ChildrenCount := ChildrenCount;
   if (l_ChildrenCount > 0) then
   begin
    try
     for l_RowIndex0 := 0 to l_ChildrenCount - 1 do  //����� �� ���� ��������.
     begin
      with Para[l_RowIndex0] do
      begin
       if (ChildrenCount > aColumnIndex) then 
       begin
        l_Start := MakePoint;
        try
         l_Start.SetEntryPoint(aColumnIndex + 1);         
         l_Start.Inner.Move(aContext.View, ev_ocTopLeft);
         l_CellWidth := l_Start.Inner.Obj.IntA[k2_tiWidth];
         l_OffsetX := l_Start.Inner.Obj.OffsetX;
         l_Start := l_Start.PointToParent(aTable);
         with aTable[l_ChildrenCount - 1] do
         begin
          l_TableRow := aTable[l_ChildrenCount - 1] as InevTableRow;
          l_PID := l_TableRow.FindCell(l_OffsetX, l_CellWidth);
          l_Finish := MakePoint;
          try
           l_Finish.SetEntryPoint(l_PID + 1);
           if l_Finish.Inner.HasInner then
            l_Finish.Inner.Move(aContext.View, ev_ocBottomRight);
           l_Finish := l_Finish.PointToParent(aTable);
           l_Block := aTable.Range(l_Start, l_Finish);
          finally
           l_Finish := nil;
          end;//try..finally
         end;//with aTable[l_ChildrenCount - 1] do
        finally
         l_Start := nil;
        end;//try..finally
        aContext.Select(l_Block, false);
        Result := True;
        Break;
       end;//ChildrenCount > aColumIndex
      end;//with Child[l_RowIndex0]
     end;//for l_RowIndex0
    finally
     l_Block := nil;
    end;//try..finally
   end;//ChildrenCount > 0
  end;//with aTable do
 end;//aContext <> nil
//#UC END# *48E501A60222_48453B7601F9_impl*
end;//EvSelectTableColumn

function EvSelectBlock(const aContext: InevSelection;
  const aBlock: InevParaList): Boolean;
//#UC START# *48E501BE009F_48453B7601F9_var*
var
 l_Block  : InevRange;
 l_Start  : InevPoint;
 l_Finish : InevPoint;
//#UC END# *48E501BE009F_48453B7601F9_var*
begin
//#UC START# *48E501BE009F_48453B7601F9_impl*
 Result := False;
 if (aContext <> nil) then
 begin
  l_Start := aBlock.MakePoint;
  l_Start.SetAtStart(aContext.View, True);
  l_Finish := aBlock.MakePoint;
  l_Finish.SetAtEnd(aContext.View, True);
  l_Block := aBlock.Range(l_Start, l_Finish);
  aContext.Select(l_Block, false);
  Result := True;
 end;//if (aContext <> nil) then
//#UC END# *48E501BE009F_48453B7601F9_impl*
end;//EvSelectBlock

function EvInPara(const aCursor: InevBasePoint;
  aTypeID: Integer;
  out theParaCursor: InevBasePoint;
  anExcludeType: Integer = 0): Boolean;
//#UC START# *48E501F60339_48453B7601F9_var*
var
 l_Cursor : InevBasePoint;
//#UC END# *48E501F60339_48453B7601F9_var*
begin
//#UC START# *48E501F60339_48453B7601F9_impl*
 Result := False;
 if (aCursor <> nil) then
 begin
  l_Cursor := aCursor.MostInner;
  while (l_Cursor <> nil) do
   if l_Cursor.Obj.InheritsFrom(aTypeID) then
   begin
    if (anExcludeType <> k2_idEmpty) AND
       l_Cursor.Obj.InheritsFrom(anExcludeType) then
     Result := False
    else
    begin
     Result := True;
     theParaCursor := l_Cursor;
    end;//anExcludeType <> k2_idEmpty
    break;
   end else
    l_Cursor := l_Cursor.ParentPoint;
 end;//aCursor <> nil
//#UC END# *48E501F60339_48453B7601F9_impl*
end;//EvInPara

function EvInPara(const aCursor: InevBasePoint;
  aTypeID: Integer;
  anExcludeType: Integer = 0): Boolean;
//#UC START# *48E5021F003F_48453B7601F9_var*
var
 l_FakeCursor : InevBasePoint;
//#UC END# *48E5021F003F_48453B7601F9_var*
begin
//#UC START# *48E5021F003F_48453B7601F9_impl*
 Result := evInPara(aCursor, aTypeID, l_FakeCursor, anExcludeType);
//#UC END# *48E5021F003F_48453B7601F9_impl*
end;//EvInPara

end.