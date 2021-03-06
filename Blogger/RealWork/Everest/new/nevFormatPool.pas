unit nevFormatPool;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/new/nevFormatPool.pas"
// �����: 24.04.2008 23:04
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Rendering::TnevFormatPool
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
  nevBase,
  nevTools,
  nevRootFormatInfoListPrim,
  nevFormatPoolBase,
  l3Types
  ;

type
 TnevRootFormatInfoKey = record
   rLimitWidth : Integer;
   rView : InevViewMetrics;
 end;//TnevRootFormatInfoKey

 _FindDataType_ = TnevRootFormatInfoKey;
 _l3Searcher_Parent_ = TnevRootFormatInfoListPrim;
{$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}
 TnevRootFormatInfoList = class(_l3Searcher_)
 end;//TnevRootFormatInfoList

 _nevChildSpy_Parent_ = TnevFormatPoolBase;
 {$Include ..\new\nevChildSpy.imp.pas}
 TnevFormatPool = class(_nevChildSpy_, InevFormatPool)
 private
 // private fields
   f_Roots : TnevRootFormatInfoList;
 protected
 // realized methods
   function FormatInfoForView(const aView: InevView): TnevFormatInfoPrim;
   procedure ChildAdded(const aList: InevParaList;
    const aChild: InevPara); override;
   procedure ChildDeleted(const aList: InevParaList;
    const aChild: InevPara); override;
   procedure ClearFormatInfoForView(const aView: InevView);
 public
 // realized methods
   procedure InvalidateShape(const aShape: InevObject;
    aParts: TnevShapeParts);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
 public
 // public methods
   procedure AfterSectionBreakAdded;
   procedure Clear;
 end;//TnevFormatPool

function TnevRootFormatInfoKey_C(const aView: InevViewMetrics): TnevRootFormatInfoKey;

implementation

uses
  nevRootFormatInfo,
  SysUtils,
  nevPrintingRootFormatInfo
  ;

{$Include ..\new\nevChildSpy.imp.pas}

// start class TnevFormatPool

procedure TnevFormatPool.AfterSectionBreakAdded;
//#UC START# *4E15BC75016A_4810D8F702E0_var*
var
 l_Index : Integer;
 l_Root  : TnevRootFormatInfo;
//#UC END# *4E15BC75016A_4810D8F702E0_var*
begin
//#UC START# *4E15BC75016A_4810D8F702E0_impl*
 if (f_Roots <> nil) then
  for l_Index := f_Roots.Hi downto 0 do
  begin
   l_Root := f_Roots[l_Index];
   if not l_Root.Metrics.IsWebStyle then
   begin
    l_Root := nil;
    f_Roots.Delete(l_Index);
   end; // if not l_Root.Metrics.IsWebStyle then
  end; // for l_Index := 0 to f_Roots.Hi do
//#UC END# *4E15BC75016A_4810D8F702E0_impl*
end;//TnevFormatPool.AfterSectionBreakAdded
function TnevRootFormatInfoKey_C(const aView: InevViewMetrics): TnevRootFormatInfoKey;
//#UC START# *4815D47402E8_4815D4350242_var*
//#UC END# *4815D47402E8_4815D4350242_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4815D47402E8_4815D4350242_impl*
 Result.rLimitWidth := aView.LimitWidth;
 Result.rView := aView;
//#UC END# *4815D47402E8_4815D4350242_impl*
end;//TnevRootFormatInfoKey.C

// start class TnevRootFormatInfoList

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_4815D31A015C_var*
//#UC END# *47B9BAFD01F4_4815D31A015C_var*
begin
//#UC START# *47B9BAFD01F4_4815D31A015C_impl*
 Assert(aSortIndex = l3_siNative);
 Result := anItem.LimitWidth - aData.rLimitWidth;
 if (Result = 0) then
  Result := TnevRootFormatInfoListPrim.CompareViews(anItem.Metrics, aData.rView);
//#UC END# *47B9BAFD01F4_4815D31A015C_impl*
end;//CompareItemWithData

type _Instance_R_ = TnevRootFormatInfoList;

{$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}

// start class TnevFormatPool

procedure TnevFormatPool.Clear;
//#UC START# *4817202301B6_4810D8F702E0_var*
//#UC END# *4817202301B6_4810D8F702E0_var*
begin
//#UC START# *4817202301B6_4810D8F702E0_impl*
 if (f_Roots <> nil) then
  f_Roots.Clear;
//#UC END# *4817202301B6_4810D8F702E0_impl*
end;//TnevFormatPool.Clear

function TnevFormatPool.FormatInfoForView(const aView: InevView): TnevFormatInfoPrim;
//#UC START# *4815B5C600D9_4810D8F702E0_var*
var
 l_Root  : TnevRootFormatInfo;
 l_Index : Integer;
 l_Found : TnevRootFormatInfo;
//#UC END# *4815B5C600D9_4810D8F702E0_var*
begin
//#UC START# *4815B5C600D9_4810D8F702E0_impl*
 if (Obj = nil) then
  // http://mdp.garant.ru/pages/viewpage.action?pageId=120722324
  raise EnevMaybePreviewCancelled.Create('�������� �������� ���������� Preview');
 {$IfDef Nemesis}
 if (aView.Data = nil) then
  raise EnevMaybeBaseSwitched.Create('�������� ����������� ����. <K>: 121160862');
 if not Obj.IsSame(aView.Data) then
  raise EnevMaybeBaseSwitched.Create('�������� ����������� ����. <K>: 200085315');
 {$Else  Nemesis}
 Assert(aView.Data <> nil);
 Assert(Obj.IsSame(aView.Data));
 {$EndIf Nemesis}
 if (f_Roots = nil) then
  f_Roots := TnevRootFormatInfoList.MakeSorted;
 if f_Roots.FindData(TnevRootFormatInfoKey_C(aView.Metrics), l_Index) then
  l_Found := f_Roots[l_Index]
 else
 begin
  if (aView <> nil) AND
     (aView.Metrics <> nil) AND
     (aView.Metrics.InfoCanvas <> nil) AND
     aView.Metrics.InfoCanvas.Printing then
  // http://mdp.garant.ru/pages/viewpage.action?pageId=321986755
   l_Root := TnevPrintingRootFormatInfo.Create(aView, Self)
  else
   l_Root := TnevRootFormatInfo.Create(aView, Self);
  try
   f_Roots.Insert(l_Index, l_Root);
   l_Found := l_Root;
  finally
   FreeAndNil(l_Root);
  end;//try..finally
 end;//f_Roots.FindData(TnevRootFormatInfoKey_C(aView.Metrics), l_Index)
 Result := l_Found;
//#UC END# *4815B5C600D9_4810D8F702E0_impl*
end;//TnevFormatPool.FormatInfoForView

procedure TnevFormatPool.InvalidateShape(const aShape: InevObject;
  aParts: TnevShapeParts);
//#UC START# *4816E2B2004E_4810D8F702E0_var*
var
 l_Index : Integer;
//#UC END# *4816E2B2004E_4810D8F702E0_var*
begin
//#UC START# *4816E2B2004E_4810D8F702E0_impl*
 if (aParts <> []) then
 begin
  if (f_Roots <> nil) then
   for l_Index := 0 to f_Roots.Hi do
    f_Roots[l_Index].InvalidateShape(aShape, aParts);
 end//aNeedRecalcExtent
 else
  Container.ViewArea.InvalidateShape(aShape, aParts);
//#UC END# *4816E2B2004E_4810D8F702E0_impl*
end;//TnevFormatPool.InvalidateShape

procedure TnevFormatPool.ChildAdded(const aList: InevParaList;
  const aChild: InevPara);
//#UC START# *481710BB0076_4810D8F702E0_var*
var
 l_Index : Integer;
//#UC END# *481710BB0076_4810D8F702E0_var*
begin
//#UC START# *481710BB0076_4810D8F702E0_impl*
 if (f_Roots <> nil) then
  for l_Index := 0 to f_Roots.Hi do
   f_Roots[l_Index].ChildAdded(aList, aChild);
//#UC END# *481710BB0076_4810D8F702E0_impl*
end;//TnevFormatPool.ChildAdded

procedure TnevFormatPool.ChildDeleted(const aList: InevParaList;
  const aChild: InevPara);
//#UC START# *481710C100FB_4810D8F702E0_var*
var
 l_Index : Integer;
//#UC END# *481710C100FB_4810D8F702E0_var*
begin
//#UC START# *481710C100FB_4810D8F702E0_impl*
 if (f_Roots <> nil) then
  for l_Index := 0 to f_Roots.Hi do
   f_Roots[l_Index].ChildDeleted(aList, aChild);
//#UC END# *481710C100FB_4810D8F702E0_impl*
end;//TnevFormatPool.ChildDeleted

procedure TnevFormatPool.ClearFormatInfoForView(const aView: InevView);
//#UC START# *4CB5EFC802AE_4810D8F702E0_var*
var
 l_Index : Integer;
//#UC END# *4CB5EFC802AE_4810D8F702E0_var*
begin
//#UC START# *4CB5EFC802AE_4810D8F702E0_impl*
 if (f_Roots <> nil) then
  if f_Roots.FindData(TnevRootFormatInfoKey_C(aView.Metrics), l_Index) then
   f_Roots.Delete(l_Index);
//#UC END# *4CB5EFC802AE_4810D8F702E0_impl*
end;//TnevFormatPool.ClearFormatInfoForView

procedure TnevFormatPool.Cleanup;
//#UC START# *479731C50290_4810D8F702E0_var*
//#UC END# *479731C50290_4810D8F702E0_var*
begin
//#UC START# *479731C50290_4810D8F702E0_impl*
 FreeAndNil(f_Roots);
 inherited;
//#UC END# *479731C50290_4810D8F702E0_impl*
end;//TnevFormatPool.Cleanup

end.