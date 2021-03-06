unit nevRangeListTools;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// ������: "w:/common/components/gui/Garant/Everest/new/nevRangeListTools.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi::Everest::nevUtils::nevRangeListTools
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
  nevTools,
  nevRangeList
  ;

function NevAddRangeToList(aList: TnevRangeList;
  const aRange: InevRange): Boolean;
   {* ��������� � ��������� Range � ������.
������������ ����������� � �����������.
���������� ������� ����, ��� Range ��� ������� �������� � ������ }

implementation

uses
  l3Types,
  evRangeTools,
  l3MinMax,
  l3Base
  ;

// unit methods

function NevAddRangeToList(aList: TnevRangeList;
  const aRange: InevRange): Boolean;
//#UC START# *4A23BB1700A7_4A23BAEF006A_var*
var
 l_From,
 l_To     : Long;

 function l_AddBlock(pBlock: PIUnknown; anIndex: Long): Boolean;
 var
  l_C : TevBlockCompareResult;
 begin//l_AddBlock
  Result := true;
  l_C := evCompareBlocks(aRange, InevRange(pBlock^));
  if (l_C = ev_bcrLeft) then
  begin
   if (l_From < 0) then
    l_From := anIndex
   else
   if (l_To >= 0) then
    l_To := anIndex - 1;
   Result := false;
  end//l_C = ev_bcrLeft
  else
  if (l_C = ev_bcrRight) then
   l_From := Max(l_From, anIndex + 1)
  else
  begin
   if (l_From < 0) then
    l_From := anIndex;
   l_To := anIndex;
  end;//l_C = ev_bcrRight
 end;//l_AddBlock

//#UC END# *4A23BB1700A7_4A23BAEF006A_var*
begin
//#UC START# *4A23BB1700A7_4A23BAEF006A_impl*
 if aList.Empty then
 begin
  aList.Add(aRange);
  Result := True;
 end
 else
 begin
  Result := False;
  l_From := -1;
  l_To := -1;
  aList.IterateAllF(l3L2IA(@l_AddBlock));
  if (l_From >= 0) then
  begin
   if (l_To >= l_From) then
   begin
    repeat
     aList.Delete(l_From);
     Dec(l_To);
    until l_To < l_From;
   end;//l_To >= l_From
   aList.Insert(l_From, aRange);
   Result := True;
  end;//l_From >= 0
 end;
//#UC END# *4A23BB1700A7_4A23BAEF006A_impl*
end;//NevAddRangeToList

end.