unit nsFiltersTree;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Filters"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Filters/nsFiltersTree.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 Core::Common::Filters::Impl::TnsFiltersTree
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
  l3Tree_TLB,
  bsTypes,
  l3Tree,
  DocumentAndListInterfaces,
  nsFiltersInterfaces,
  l3TreeInterfaces,
  l3Interfaces,
  SysUtils
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TnsFiltersTree = class(Tl3Tree, InsFiltersTree, InsFiltersListener, Il3TreeWithLockRebuild)
 private
 // private fields
   f_DsList : IdsList;
   f_FilterType : TnsFiltersType;
   f_RebuildLockCount : Integer;
   f_NeedRebuild : Boolean;
 private
 // private methods
   procedure LoadChildren;
 protected
 // realized methods
   function pm_GetFiltersType: TbsListType;
   procedure FiltersChanged; stdcall;
   procedure FilterNameChanged; stdcall;
   procedure FilterPermanenceChanged; stdcall;
   procedure LockRebuild;
     {* ��������� ������ LockRebuild }
   procedure UnlockRebuild;
     {* ��������� ������ UnlockRebuild }
   function IsRebuildLocked: Boolean;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure ClearFields; override;
 public
 // public methods
   constructor Create(aFilterType: TnsFiltersType;
     const aDsList: IdsList); overload; 
   class function Make(aFilterType: TnsFiltersType;
     const aDsList: IdsList): Il3Tree; reintroduce; overload; 
     {* ��������� ������� TnsFiltersTree.Make$1 }
   constructor Create(aListType: TbsListType;
     const aDsList: IdsList); overload; 
   class function Make(aListType: TbsListType;
     const aDsList: IdsList): Il3Tree; reintroduce; overload; 
     {* ��������� ������� TnsFiltersTree.Make$2 }
 end;//TnsFiltersTree
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  l3Nodes,
  FiltersUnit,
  nsFiltersNode,
  DataAdapter,
  nsFiltersListenersDocManager,
  nsFiltersListenersDrugsManager,
  nsTreeUtils,
  nsFiltersRootNode
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

// start class TnsFiltersTree

procedure TnsFiltersTree.LoadChildren;
//#UC START# *4F9955200151_4CAEC809015D_var*
 procedure SetActiveFilter(const aNode: Il3Node);
 var
  l_FiltersNode : InsFilterNode;
 begin
  if (NodeFlags[aNode] and nfSelected = 0) and
     Supports(aNode, InsFilterNode, l_FiltersNode) then
   try
    SelectedNode[aNode] := True;
   finally
    l_FiltersNode := nil;
   end;
 end;

 procedure CheckPermanentFilters;

  function IndexOfFilter(const aList: IFiltersFromQuery; const aFilter: IFilterFromQuery): Integer;
  var
   l_Filter: IFilterFromQuery;
  begin
   for Result := 0 to aList.Count - 1 do
   begin
    aList.pm_GetItem(Result, l_Filter);
    if l_Filter = aFilter then // ��������, ���������� ���� ���-�� ��-������� ����������, �� � ���� � ��� ��������� ��������. � ������, ���� �� ���� ����� � ���� ��������� ��������
     Exit;
   end;
   Result := -1;
  end;

 var
  l_ActiveFilters: IFiltersFromQuery;

  function Check(const aNode: Il3Node): Boolean;
  var
   l_Filter: IFilterFromQuery;
  begin
   Result := false;
   if Supports(aNode, IFilterFromQuery, l_Filter) then
    if Assigned(l_ActiveFilters) then
     if IndexOfFilter(l_ActiveFilters, l_Filter) >= 0 then // �� ��� ����������� ������ ���������� �������� ������ ������������� �������� �������
      NodeFlags[aNode] := NodeFlags[aNode] or nfSelected
     else
    else
    if l_Filter.GetPermanent then // ���� ������ ���������� �� ��������, �� ���� �������� ��� ��������������� �������
     NodeFlags[aNode] := NodeFlags[aNode] or nfSelected;
  end;

 var
  l_dsDocList: IdsDocumentList;
 begin
  if Supports(f_dsList, IdsDocumentList, l_dsDocList)
   then l_ActiveFilters := l_dsDocList.ActiveFilters
   else l_ActiveFilters := nil;
  RootNode.IterateF(l3L2NA(@Check));
 end;

 procedure RestoreApplyedFilters;
 var
  l_Node: Il3Node;
  l_Filter: IFilterFromQuery;
  l_dsDocList: IdsDocumentList;
  I: Integer;
 begin
  if Supports(f_dsList, IdsDocumentList, l_dsDocList) then
   for I := 0 to l_dsDocList.ActiveFilters.Count - 1 do
   begin
    l_dsDocList.ActiveFilters.pm_GetItem(I, l_Filter);
    l_Node := FindOnFilter(RootNode, l_Filter);
    try
     if Assigned(l_Node) then
      SetActiveFilter(l_Node);
    finally
     l_Node := nil;
    end;
   end;
 end;

var
 l_Filters: IFiltersFromQuery;
 l_IDX: Integer;
 l_Filter: IFilterFromQuery;
//#UC END# *4F9955200151_4CAEC809015D_var*
begin
//#UC START# *4F9955200151_4CAEC809015D_impl*
 if IsRebuildLocked then
 begin
  f_NeedRebuild := True;
  Exit;
 end;

 Changing;
 try
  RootNode.ReleaseChilds;
  case f_FilterType of
   ftDocuments:
    DefDataAdapter.NativeAdapter.MakeFiltersManager.GetLegalFilters(l_Filters);
   ftDrugs:
    DefDataAdapter.NativeAdapter.MakeFiltersManager.GetPharmFilters(l_Filters);
  else
   Assert(False);
   Exit;
  end;//case f_FilterType
  Assert(l_Filters <> nil);
  if (l_Filters <> nil) then
  try
   for l_IDX := 0 to l_Filters.Count - 1 do
   begin
    l_Filters.pm_GetItem(l_IDX, l_Filter);
    RootNode.InsertChild(TnsFiltersNode.Make(l_Filter));
   end;//for l_IDX
  finally
   l_Filters := nil;
  end;//try..finally
  
  CheckPermanentFilters;
  RestoreApplyedFilters;
 finally
  Changed;
 end;//try..finally
//#UC END# *4F9955200151_4CAEC809015D_impl*
end;//TnsFiltersTree.LoadChildren

constructor TnsFiltersTree.Create(aFilterType: TnsFiltersType;
  const aDsList: IdsList);
//#UC START# *4F995492006C_4CAEC809015D_var*
//#UC END# *4F995492006C_4CAEC809015D_var*
begin
//#UC START# *4F995492006C_4CAEC809015D_impl*
 inherited Create;
 f_FilterType := aFilterType;
 f_NeedRebuild := False;
 f_RebuildLockCount := 0;
 f_dsList := aDsList;
 RootNode := TnsFiltersRootNode.Make(f_FilterType);
 LoadChildren;
 case f_FilterType of
  ftDocuments: TnsFiltersListenersDocManager.AddListener(Self);
  ftDrugs: TnsFiltersListenersDrugsManager.AddListener(Self);
 end;//case aFilterType
//#UC END# *4F995492006C_4CAEC809015D_impl*
end;//TnsFiltersTree.Create

class function TnsFiltersTree.Make(aFilterType: TnsFiltersType;
  const aDsList: IdsList): Il3Tree;
var
 l_Inst : TnsFiltersTree;
begin
 l_Inst := Create(aFilterType, aDsList);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

constructor TnsFiltersTree.Create(aListType: TbsListType;
  const aDsList: IdsList);
//#UC START# *4F9954DC015E_4CAEC809015D_var*
 function ListType2FilterType(aListType: TbsListType): TnsFiltersType;
 begin
  case aListType of
   bs_ltDocument: Result := ftDocuments;
   bs_ltDrug: Result := ftDrugs;
  else
   Assert(False);
   Result := ftDrugs;
  end;
 end;
//#UC END# *4F9954DC015E_4CAEC809015D_var*
begin
//#UC START# *4F9954DC015E_4CAEC809015D_impl*
 Create(ListType2FilterType(aListType), aDsList);
//#UC END# *4F9954DC015E_4CAEC809015D_impl*
end;//TnsFiltersTree.Create

class function TnsFiltersTree.Make(aListType: TbsListType;
  const aDsList: IdsList): Il3Tree;
var
 l_Inst : TnsFiltersTree;
begin
 l_Inst := Create(aListType, aDsList);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TnsFiltersTree.pm_GetFiltersType: TbsListType;
//#UC START# *499044F60208_4CAEC809015Dget_var*
const
 cMap: array [TnsFiltersType] of TbsListType = (
  bs_ltDocument, // ftDocuments
  bs_ltDrug // ftDrugs
 );
//#UC END# *499044F60208_4CAEC809015Dget_var*
begin
//#UC START# *499044F60208_4CAEC809015Dget_impl*
 Result := cMap[f_FilterType];
//#UC END# *499044F60208_4CAEC809015Dget_impl*
end;//TnsFiltersTree.pm_GetFiltersType

procedure TnsFiltersTree.FiltersChanged;
//#UC START# *4CB2B26B0365_4CAEC809015D_var*
//#UC END# *4CB2B26B0365_4CAEC809015D_var*
begin
//#UC START# *4CB2B26B0365_4CAEC809015D_impl*
 LoadChildren;
//#UC END# *4CB2B26B0365_4CAEC809015D_impl*
end;//TnsFiltersTree.FiltersChanged

procedure TnsFiltersTree.FilterNameChanged;
//#UC START# *4CB2B27F03C3_4CAEC809015D_var*

 function CheckNode(const anIntf: Il3Node): Boolean;
 var
  l_IterNode: InsFilterNode;
 begin//CheckNode
  if Supports(anIntf, InsFilterNode, l_IterNode) then
   try
    l_IterNode.ValidateName;
   finally
    l_IterNode := nil;
   end;
  Result := False;
 end;//CheckNode

//#UC END# *4CB2B27F03C3_4CAEC809015D_var*
begin
//#UC START# *4CB2B27F03C3_4CAEC809015D_impl*
 IterateF(l3L2NA(@CheckNode));
 Invalidate;
//#UC END# *4CB2B27F03C3_4CAEC809015D_impl*
end;//TnsFiltersTree.FilterNameChanged

procedure TnsFiltersTree.FilterPermanenceChanged;
//#UC START# *4CB2B2910052_4CAEC809015D_var*
//#UC END# *4CB2B2910052_4CAEC809015D_var*
begin
//#UC START# *4CB2B2910052_4CAEC809015D_impl*
 Invalidate;
//#UC END# *4CB2B2910052_4CAEC809015D_impl*
end;//TnsFiltersTree.FilterPermanenceChanged

procedure TnsFiltersTree.LockRebuild;
//#UC START# *51A4D1810053_4CAEC809015D_var*
//#UC END# *51A4D1810053_4CAEC809015D_var*
begin
//#UC START# *51A4D1810053_4CAEC809015D_impl*
 Inc(f_RebuildLockCount);
//#UC END# *51A4D1810053_4CAEC809015D_impl*
end;//TnsFiltersTree.LockRebuild

procedure TnsFiltersTree.UnlockRebuild;
//#UC START# *51A4D19100DD_4CAEC809015D_var*
//#UC END# *51A4D19100DD_4CAEC809015D_var*
begin
//#UC START# *51A4D19100DD_4CAEC809015D_impl*
 Assert(f_RebuildLockCount > 0);
 Dec(f_RebuildLockCount);

 if f_NeedRebuild then
  LoadChildren;
//#UC END# *51A4D19100DD_4CAEC809015D_impl*
end;//TnsFiltersTree.UnlockRebuild

function TnsFiltersTree.IsRebuildLocked: Boolean;
//#UC START# *51A4D19E0149_4CAEC809015D_var*
//#UC END# *51A4D19E0149_4CAEC809015D_var*
begin
//#UC START# *51A4D19E0149_4CAEC809015D_impl*
 Result := f_RebuildLockCount > 0;
//#UC END# *51A4D19E0149_4CAEC809015D_impl*
end;//TnsFiltersTree.IsRebuildLocked

procedure TnsFiltersTree.Cleanup;
//#UC START# *479731C50290_4CAEC809015D_var*
//#UC END# *479731C50290_4CAEC809015D_var*
begin
//#UC START# *479731C50290_4CAEC809015D_impl*
 case f_FilterType of
  ftDocuments: TnsFiltersListenersDocManager.RemoveListener(Self);
  ftDrugs: TnsFiltersListenersDrugsManager.RemoveListener(Self);
 end;//case f_FilterType
 f_dsList := nil;
 f_RebuildLockCount := 0;
 f_NeedRebuild := False;
 inherited;
//#UC END# *479731C50290_4CAEC809015D_impl*
end;//TnsFiltersTree.Cleanup

procedure TnsFiltersTree.ClearFields;
 {-}
begin
 f_DsList := nil;
 inherited;
end;//TnsFiltersTree.ClearFields

{$IfEnd} //not Admin AND not Monitorings

end.