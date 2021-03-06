unit nsFindIteratorNewForDiction;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/nsFindIteratorNewForDiction.pas"
// �����: 09.12.2010 17:40
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 Core::Base Operations::View::ContextSearchInEVDDocument::TnsFindIteratorNewForDiction
//
// ���������� IFindIterator ��� ������ ������������� ���������� �������. [$245760208]
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  DynamicTreeUnit,
  nevBase,
  l3ProtoObjectForTie,
  nsFindPositionListList
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
const
  { Constants }
 cFirstLangOffset = 101;
  { �������� ������� ����� }

type
//#UC START# *4D00EA5A02CFci*
//#UC END# *4D00EA5A02CFci*
 TnsFindIteratorNewForDiction = class(Tl3ProtoObjectForTie, IFindIterator, IFindPositionList)
  {* ���������� IFindIterator ��� ������ ������������� ���������� �������. [$245760208] }
 private
 // private fields
   f_AdapterFindPositionList : IFindPositionList;
   f_Current : Integer;
   f_List : TnsFindPositionListList;
 protected
 // realized methods
   procedure Next; stdcall;
     {* ����������� ��������� �� ��������� �������. }
   procedure Prev; stdcall;
     {* ����������� ��������� �� ���������� �������. }
   function IsGood: ByteBool; stdcall;
     {* ���������� true, ���� �� ��������� ����� �������� ������, �.�. position. ����� �������� �� ������, �.�. ����� end ��� ������ ���� }
   procedure GetPosition(out aRet {: IFindPositionList}); stdcall;
   function IsFirst: ByteBool; stdcall;
     {* ���������� true, ���� ������ ������� �� ���������� �������� }
   function GetCount: Cardinal; stdcall;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure ClearFields; override;
 public
 // public methods
   constructor Create(const anAdapterIterator: IFindIterator;
     const aBlock: InevTag); reintroduce;
   class function Make(const anAdapterIterator: IFindIterator;
     const aBlock: InevTag): IFindIterator; reintroduce;
     {* ��������� ������� TnsFindIteratorNewForDiction.Make }
//#UC START# *4D00EA5A02CFpubl*
 private
   // IFindPositionList
    function  pm_GetCount: Integer; stdcall;
    procedure pm_SetCount(aValue: Integer); stdcall;
      { - ������ ��� ������� � �������� Count. }
    procedure Clear; stdcall;
      {* �������� ������. }
    procedure Delete(anIndex: Integer); stdcall;
      {* ������� ������� �� ������� Index. }
    procedure  pm_GetItem(anIndex: Integer; out aRet: TFindPosition); stdcall;
      {-}
    procedure pm_SetItem(anIndex: Integer; const anItem: TFindPosition); stdcall;
      {-}
    function  Add(const anItem: TFindPosition): Integer; stdcall;
      {* - ��������� ������� Item � �����. }
    procedure Insert(anIndex: Integer; const anItem: TFindPosition); stdcall;
      {* - ��������� ������� Item �� ������� Index. }
//#UC END# *4D00EA5A02CFpubl*
 end;//TnsFindIteratorNewForDiction
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  DataAdapter,
  k2Tags,
  SysUtils,
  DictEntry_Const
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

// start class TnsFindIteratorNewForDiction

constructor TnsFindIteratorNewForDiction.Create(const anAdapterIterator: IFindIterator;
  const aBlock: InevTag);
//#UC START# *4D00EB96015B_4D00EA5A02CF_var*
var
 l_AdapterFindPositionList : IFindPositionList;
 l_Pos : TFindPosition;
 l_Index : Integer;
 l_NeedAdd : Boolean;
 l_Offset : Integer;
 l_Tag    : Integer;
//#UC END# *4D00EB96015B_4D00EA5A02CF_var*
begin
//#UC START# *4D00EB96015B_4D00EA5A02CF_impl*
 Assert(anAdapterIterator <> nil);
 Assert(aBlock <> nil);
 inherited Create;
 f_List := TnsFindPositionListList.Create;
 while true do
 begin
  anAdapterIterator.Next;
  if not anAdapterIterator.IsGood then
   break;
  anAdapterIterator.GetPosition(l_AdapterFindPositionList);
  if (l_AdapterFindPositionList = nil) then
   continue;
  if (l_AdapterFindPositionList.Count <= 0) then
   continue;
  l_NeedAdd := true;
  if aBlock.Owner.InheritsFrom(k2_idDictEntry) then
  begin
   l_Offset := cFirstLangOffset;
   l_Tag := k2_tiHandle;
  end//aBlock.Owner.InheritsFrom(k2_idDictEntry)
  else
  begin
   l_Offset := 0;
   l_Tag := k2_tiExternalHandle;
  end;//aBlock.Owner.InheritsFrom(k2_idDictEntry)
  for l_Index := 0 to Pred(l_AdapterFindPositionList.Count) do
  begin
   l_AdapterFindPositionList.pm_GetItem(l_Index, l_Pos);
   Assert(l_Pos.rNode.Count > 0);
   if (l_Pos.rNode[0] <> aBlock.IntA[l_Tag] - l_Offset) then
   // - ��� �� ��� ����
   begin
    l_NeedAdd := false;
    break;
   end;//l_Pos.rNode[0] <> aBlock.IntA[k2_tiHandle] - cFirstLangOffset
  end;//for l_Index
  if l_NeedAdd then
   f_List.Add(l_AdapterFindPositionList);
 end;//while true
 f_Current := -1;
//#UC END# *4D00EB96015B_4D00EA5A02CF_impl*
end;//TnsFindIteratorNewForDiction.Create

class function TnsFindIteratorNewForDiction.Make(const anAdapterIterator: IFindIterator;
  const aBlock: InevTag): IFindIterator;
var
 l_Inst : TnsFindIteratorNewForDiction;
begin
 l_Inst := Create(anAdapterIterator, aBlock);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TnsFindIteratorNewForDiction.Next;
//#UC START# *45EEC28202A0_4D00EA5A02CF_var*
//#UC END# *45EEC28202A0_4D00EA5A02CF_var*
begin
//#UC START# *45EEC28202A0_4D00EA5A02CF_impl*
// Assert(f_Current <= Pred(GetCount));
 //Assert(GetCount > 0);
 Assert(f_Current < GetCount);

 Inc(f_Current);
//#UC END# *45EEC28202A0_4D00EA5A02CF_impl*
end;//TnsFindIteratorNewForDiction.Next

procedure TnsFindIteratorNewForDiction.Prev;
//#UC START# *45EEC28202A1_4D00EA5A02CF_var*
//#UC END# *45EEC28202A1_4D00EA5A02CF_var*
begin
//#UC START# *45EEC28202A1_4D00EA5A02CF_impl*
 Assert(f_Current >= 0);
 Dec(f_Current);
//#UC END# *45EEC28202A1_4D00EA5A02CF_impl*
end;//TnsFindIteratorNewForDiction.Prev

function TnsFindIteratorNewForDiction.IsGood: ByteBool;
//#UC START# *45EEC28202A2_4D00EA5A02CF_var*
//#UC END# *45EEC28202A2_4D00EA5A02CF_var*
begin
//#UC START# *45EEC28202A2_4D00EA5A02CF_impl*
 Result := (GetCount > 0) AND
           (f_Current >= 0) AND (f_Current <= Pred(GetCount));
//#UC END# *45EEC28202A2_4D00EA5A02CF_impl*
end;//TnsFindIteratorNewForDiction.IsGood

procedure TnsFindIteratorNewForDiction.GetPosition(out aRet {: IFindPositionList});
//#UC START# *461D00B9005D_4D00EA5A02CF_var*
//#UC END# *461D00B9005D_4D00EA5A02CF_var*
begin
//#UC START# *461D00B9005D_4D00EA5A02CF_impl*
 Assert(IsGood);
 f_AdapterFindPositionList := f_List[f_Current];
 IFindPositionList(aRet) := Self;
//#UC END# *461D00B9005D_4D00EA5A02CF_impl*
end;//TnsFindIteratorNewForDiction.GetPosition

function TnsFindIteratorNewForDiction.IsFirst: ByteBool;
//#UC START# *49FEC51501D8_4D00EA5A02CF_var*
//#UC END# *49FEC51501D8_4D00EA5A02CF_var*
begin
//#UC START# *49FEC51501D8_4D00EA5A02CF_impl*
 Result := (f_Current <= 0);
//#UC END# *49FEC51501D8_4D00EA5A02CF_impl*
end;//TnsFindIteratorNewForDiction.IsFirst

function TnsFindIteratorNewForDiction.GetCount: Cardinal;
//#UC START# *49FFDC8B015D_4D00EA5A02CFget_var*
//#UC END# *49FFDC8B015D_4D00EA5A02CFget_var*
begin
//#UC START# *49FFDC8B015D_4D00EA5A02CFget_impl*
 Assert(f_List <> nil);
 if (f_List = nil) then
  Result := 0
 else
  Result := f_List.Count;
//#UC END# *49FFDC8B015D_4D00EA5A02CFget_impl*
end;//TnsFindIteratorNewForDiction.GetCount

procedure TnsFindIteratorNewForDiction.Cleanup;
//#UC START# *479731C50290_4D00EA5A02CF_var*
//#UC END# *479731C50290_4D00EA5A02CF_var*
begin
//#UC START# *479731C50290_4D00EA5A02CF_impl*
 FreeAndNil(f_List);
 inherited;
//#UC END# *479731C50290_4D00EA5A02CF_impl*
end;//TnsFindIteratorNewForDiction.Cleanup

procedure TnsFindIteratorNewForDiction.ClearFields;
 {-}
begin
 f_AdapterFindPositionList := nil;
 inherited;
end;//TnsFindIteratorNewForDiction.ClearFields

//#UC START# *4D00EA5A02CFimpl*
function TnsFindIteratorNewForDiction.pm_GetCount: Integer;
begin
 Result := f_AdapterFindPositionList.Count;
end;

procedure TnsFindIteratorNewForDiction.pm_SetCount(aValue: Integer);
begin
 Assert(false);
end;

procedure TnsFindIteratorNewForDiction.Clear;
begin
 Assert(false);
end;

procedure TnsFindIteratorNewForDiction.Delete(anIndex: Integer);
begin
 Assert(false);
end;

procedure TnsFindIteratorNewForDiction.pm_GetItem(anIndex: Integer; out aRet: TFindPosition);
var
 l_Path  : INodeIndexPath;
 l_Index : Integer;
begin
 Assert(f_AdapterFindPositionList <> nil);
 f_AdapterFindPositionList.pm_GetItem(anIndex, aRet);
 Assert(aRet.rNode.Count > 0);
 l_Path := DefDataAdapter.NativeAdapter.MakeNodeIndexPath;
 l_Path.Add(0);
 // - ��� ���� ������ �������
 for l_Index := 1 to Pred(aRet.rNode.Count) do
  l_Path.Add(aRet.rNode[l_Index]);
 aRet.rNode := l_Path;
end;

procedure TnsFindIteratorNewForDiction.pm_SetItem(anIndex: Integer; const anItem: TFindPosition);
begin
 Assert(false);
end;

function TnsFindIteratorNewForDiction.Add(const anItem: TFindPosition): Integer;
begin
 Result := -1;
 Assert(false);
end;

procedure TnsFindIteratorNewForDiction.Insert(anIndex: Integer; const anItem: TFindPosition);
begin
 Assert(false);
end;
//#UC END# *4D00EA5A02CFimpl*

{$IfEnd} //not Admin AND not Monitorings

end.