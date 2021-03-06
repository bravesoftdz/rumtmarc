unit dsUserList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Admin"
// �����: ������ �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Admin/dsUserList.pas"
// �����: 15.08.2005 20.30
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<ViewAreaControllerImp::Class>> F1 �������������::Admin::Admin::Admin::TdsUserList
//
// ������ ������ ����� efUserList
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If defined(Admin)}
uses
  DynamicTreeUnit,
  l3Interfaces,
  l3TreeInterfaces,
  AdminInterfaces,
  l3InternalInterfaces,
  bsInterfaces,
  ExtCtrls,
  TreeInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmLocalInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3ProtoObjectWithCOMQI,
  l3NotifyPtrList
  {$If defined(Nemesis)}
  ,
  nscNewInterfaces
  {$IfEnd} //Nemesis
  ,
  bsTypes,
  vcmControllers {a}
  ;
{$IfEnd} //Admin

{$If defined(Admin)}
type
 _FormDataSourceType_ = IdsUserList;
 _InitDataType_ = IdeNode;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\Tree\dsSimpleTree.imp.pas}
 _nsContextFilter_Parent_ = _dsSimpleTree_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\Tree\nsContextFilter.imp.pas}
 TdsUserList = {final vac} class(_nsContextFilter_, IdsUserList)
  {* ������ ������ ����� efUserList }
 private
 // private fields
   f_Root : INodeBase;
   SDS : IsdsAdmin;
    {* ��������� �����������������}
   f_CurrentFlagFilter : TUserListFilterTypes;
    {* ���� ��� �������� CurrentFlagFilter}
   f_CurrentGroupFilter : Integer;
    {* ���� ��� �������� CurrentGroupFilter}
 protected

  procedure InitRefs(const aDS: IvcmUseCaseController); override;
  procedure ClearRefs; override;
 private
 // private methods
   function MakeSelectedList(const aTree: Il3SimpleTree): Il3InterfaceList;
 protected
 // realized methods
   function MakeSimpleTree: Il3SimpleTree; override;
     {* ������� ������ ������ }
   function UserListNodeType(const aNode: Il3SimpleNode): TbsUserNodeType;
   function GetFrosenNode(const aNode: Il3SimpleNode): IdeNode;
   function FindFrosenNode(const aNode: IdeNode;
    aShowRootFlag: Boolean): Integer;
   procedure DeleteUser(const aNode: Il3SimpleNode);
   procedure DeleteUsers(const aUserTree: Il3SimpleTree;
    out aFailed: Il3InterfaceList);
     {* ������� ���������� �� ������ �������������, ������� ������ ��� ������� �� ������� ������� }
   procedure CreateNewUser;
   function GetUserState(const aNode: Il3SimpleNode): TUserStates;
   procedure LogoutUser(const aNode: Il3SimpleNode);
   procedure LogoutUsers(const aUserTree: Il3SimpleTree);
     {* ��������� ���������� �� ������ ������������� }
   function FiltrateByType(const aTreeSource: Il3SimpleTree;
    const aCurrentNode: Il3SimpleNode;
    aFilter: TUserListFilterTypes;
    out aCurrent: Integer): Il3SimpleTree;
   procedure SetConsultingPaymentForAll(IsAllowed: Boolean);
   procedure SetConsultingPayment(const aUserTree: Il3SimpleTree;
    IsAllowed: Boolean);
     {* �������� ����������� ����������� ��� ���������� �� ������ ������������� }
   procedure SetIsPrivileged(const aNode: Il3SimpleNode;
    IsPrivileged: Boolean);
   procedure SetPrivelegedRights(const aUserTree: Il3SimpleTree;
    IsPrivileged: Boolean);
     {* �������� ������������������� ��� ���������� �� ������ ������������� }
   procedure SelectNodes(const aUserTree: Il3SimpleTree;
    const aList: Il3InterfaceList);
     {* �������� ���� �� ������ (Il3SimpleNode) }
   function pm_GetCurrentFlagFilter: TUserListFilterTypes;
   function pm_GetConsultingPaymentForNewbies: Boolean;
   procedure pm_SetConsultingPaymentForNewbies(aValue: Boolean);
   procedure NotifyCreateUserFinished(Successfull: Boolean);
     {* ����������� �� ������ �������� ������������ }
   procedure NotifyGroupChanged(aGroupUID: Integer);
     {* ��������� ������ }
   function FiltrateByGroup(const aTreeSource: Il3SimpleTree;
    const aCurrentNode: Il3SimpleNode;
    aFilter: Integer;
    out aCurrent: Integer): Il3SimpleTree;
   procedure CheckUnsavedUserProperty;
     {* ���� �������� �� ��������� - �������� �� ���� }
   procedure RequestUpdateCureent;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure DoCurrentChanged(const aNode: Il3SimpleNode); override;
     {* �������� �������. }
   function MakeImageList: Il3ImageList; override;
     {* - ������� ������ ������. }
   {$If not defined(NoVCM)}
   procedure GotData; override;
     {* - ������ ����������. }
   {$IfEnd} //not NoVCM
 protected
 // protected properties
   property CurrentFlagFilter: TUserListFilterTypes
     read f_CurrentFlagFilter;
   property CurrentGroupFilter: Integer
     read f_CurrentGroupFilter;
 end;//TdsUserList
{$IfEnd} //Admin

implementation

{$If defined(Admin)}
uses
  SysUtils,
  SecurityUnit,
  vtUtils,
  AdminRes,
  l3InterfacedInterfaceList,
  l3Nodes,
  deNode,
  nsUserFlagsFilter,
  BaseTypesUnit,
  nsUserTreeStructWithDrag,
  nsGroupFilter,
  nsConst,
  deProfile,
  l3Base,
  vtStdRes,
  nsNewCachableNode,
  Windows,
  l3InterfacesMisc
  {$If defined(Nemesis)}
  ,
  nscContextFilterState
  {$IfEnd} //Nemesis
  
  ;
{$IfEnd} //Admin

{$If defined(Admin)}

type _Instance_R_ = TdsUserList;

{$Include w:\garant6x\implementation\Garant\GbaNemesis\Tree\dsSimpleTree.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\Tree\nsContextFilter.imp.pas}

// start class TdsUserList

function TdsUserList.MakeSelectedList(const aTree: Il3SimpleTree): Il3InterfaceList;
//#UC START# *49246C70028F_49246742002B_var*
var
 l_ResultList: Il3InterfaceList absolute Result;

 function lpIterator(const aNode: Il3SimpleNode): Boolean;
 begin
  Result := False;
  l_ResultList.Add(aNode);
 end;

var
 l_Tree: Il3ExpandedSimpleTree;
//#UC END# *49246C70028F_49246742002B_var*
begin
//#UC START# *49246C70028F_49246742002B_impl*
 Result := Tl3InterfacedInterfaceList.MakeI;
 Supports(aTree, Il3ExpandedSimpleTree, l_Tree);
 Assert(Assigned(l_Tree));
  l_Tree.FlagIterateF(l3L2SNA(@lpIterator), FM_SELECTION);
//#UC END# *49246C70028F_49246742002B_impl*
end;//TdsUserList.MakeSelectedList

function TdsUserList.MakeSimpleTree: Il3SimpleTree;
//#UC START# *47F4C2B9014A_49246742002B_var*
//#UC END# *47F4C2B9014A_49246742002B_var*
begin
//#UC START# *47F4C2B9014A_49246742002B_impl*
 if Assigned(f_Root) then
  Result := TnsUserTreeStructWithDrag.Make(f_Root, False)
 else
  Result := nil;
//#UC END# *47F4C2B9014A_49246742002B_impl*
end;//TdsUserList.MakeSimpleTree

function TdsUserList.UserListNodeType(const aNode: Il3SimpleNode): TbsUserNodeType;
//#UC START# *49245EB103E1_49246742002B_var*
var
 l_Node: INodeBase;
 l_Type: TNodeType;
//#UC END# *49245EB103E1_49246742002B_var*
begin
//#UC START# *49245EB103E1_49246742002B_impl*
 if Supports(aNode, INodeBase, l_Node) then
 begin
  l_Type := l_Node.GetType;
  if (l_Type and PNT_EXIT_FLAG) <> 0 then
   Result := untExiting
  else
   if (l_Type and PNT_SYSTEM_FLAG) <> 0 then
   begin
    if (l_Type and PNT_LOGGED_FLAG) <> 0 then
     Result := untActiveSystem
    else
     Result := untInactiveSystem;
   end
   else
   begin
    if (l_Type and PNT_PRIVILEGED_FLAG) <> 0 then
    begin
     if (l_Type and PNT_LOGGED_FLAG) <> 0 then
      Result := untActivePrivileged
     else
      Result := untInactivePrivileged;
    end
    else
    begin
     if (l_Type and PNT_LOGGED_FLAG) <> 0 then
      Result := untActiveNonSystem
     else
      Result := untInactiveNonSystem;
    end
   end;
 end
 else
  Result := untUnknownUser;
//#UC END# *49245EB103E1_49246742002B_impl*
end;//TdsUserList.UserListNodeType

function TdsUserList.GetFrosenNode(const aNode: Il3SimpleNode): IdeNode;
//#UC START# *49245EC10119_49246742002B_var*
var
 l_Node,
 l_Frosen: INodeBase;
//#UC END# *49245EC10119_49246742002B_var*
begin
//#UC START# *49245EC10119_49246742002B_impl*
 if Supports(aNode, INodeBase, l_Node) then
 begin
  l_Node.GetFrozenNode(l_Frosen);
  Result := TdeNode.Make(l_Frosen);
 end
 else
  Result := TdeNode.Make(nil);
//#UC END# *49245EC10119_49246742002B_impl*
end;//TdsUserList.GetFrosenNode

function TdsUserList.FindFrosenNode(const aNode: IdeNode;
  aShowRootFlag: Boolean): Integer;
//#UC START# *49245ECB01E9_49246742002B_var*
var
 l_Node: INodeBase;
//#UC END# *49245ECB01E9_49246742002B_var*
begin
//#UC START# *49245ECB01E9_49246742002B_impl*
 Result := -1;
 if Assigned(aNode) and
    Assigned(aNode.Node) and
    Assigned(f_Root) then
 begin
  f_Root.FindNode(aNode.Node, l_Node);
  try
   Result := f_Root.GetVisibleDelta(l_Node);
   if (Result <> -1) and
      not aShowRootFlag then
    dec(Result);
  except
   on ENotFound do ; // ������ �� �����, ������ -1
  end;
 end;
//#UC END# *49245ECB01E9_49246742002B_impl*
end;//TdsUserList.FindFrosenNode

procedure TdsUserList.DeleteUser(const aNode: Il3SimpleNode);
//#UC START# *49245EDB0225_49246742002B_var*
//#UC END# *49245EDB0225_49246742002B_var*
begin
//#UC START# *49245EDB0225_49246742002B_impl*
 SDS.DeleteUser(aNode);
//#UC END# *49245EDB0225_49246742002B_impl*
end;//TdsUserList.DeleteUser

procedure TdsUserList.DeleteUsers(const aUserTree: Il3SimpleTree;
  out aFailed: Il3InterfaceList);
//#UC START# *49245EE602A0_49246742002B_var*
//#UC END# *49245EE602A0_49246742002B_var*
begin
//#UC START# *49245EE602A0_49246742002B_impl*
 SDS.DeleteUsers(aUserTree, MakeSelectedList(aUserTree), aFailed);
//#UC END# *49245EE602A0_49246742002B_impl*
end;//TdsUserList.DeleteUsers

procedure TdsUserList.CreateNewUser;
//#UC START# *49245EF90140_49246742002B_var*
//#UC END# *49245EF90140_49246742002B_var*
begin
//#UC START# *49245EF90140_49246742002B_impl*
 SDS.ChangeUser(TdeProfile.Make(nil, True));
//#UC END# *49245EF90140_49246742002B_impl*
end;//TdsUserList.CreateNewUser

function TdsUserList.GetUserState(const aNode: Il3SimpleNode): TUserStates;
//#UC START# *49245F730020_49246742002B_var*
var
 l_Node: INodeBase;
//#UC END# *49245F730020_49246742002B_var*
begin
//#UC START# *49245F730020_49246742002B_impl*
 Result := [];
 if Supports(aNode, INodeBase, l_Node) then
 begin
  if (l_Node.GetType and PNT_EXIT_FLAG) <> 0 then
   Result := [usExiting]
  else
  begin
   if (l_Node.GetType and PNT_LOGGED_FLAG) <> 0 then
    Include(Result, usActive);
   if (l_Node.GetType and PNT_SYSTEM_FLAG) <> 0 then
    Include(Result, usSystem);
  end;
 end;
//#UC END# *49245F730020_49246742002B_impl*
end;//TdsUserList.GetUserState

procedure TdsUserList.LogoutUser(const aNode: Il3SimpleNode);
//#UC START# *49245FA201D9_49246742002B_var*
//#UC END# *49245FA201D9_49246742002B_var*
begin
//#UC START# *49245FA201D9_49246742002B_impl*
 SDS.LogoutUser(aNode);
//#UC END# *49245FA201D9_49246742002B_impl*
end;//TdsUserList.LogoutUser

procedure TdsUserList.LogoutUsers(const aUserTree: Il3SimpleTree);
//#UC START# *49245FC30050_49246742002B_var*
//#UC END# *49245FC30050_49246742002B_var*
begin
//#UC START# *49245FC30050_49246742002B_impl*
 SDS.LogoutUsers(MakeSelectedList(aUserTree));
//#UC END# *49245FC30050_49246742002B_impl*
end;//TdsUserList.LogoutUsers

function TdsUserList.FiltrateByType(const aTreeSource: Il3SimpleTree;
  const aCurrentNode: Il3SimpleNode;
  aFilter: TUserListFilterTypes;
  out aCurrent: Integer): Il3SimpleTree;
//#UC START# *49246092009E_49246742002B_var*
var
 l_FilterableTree: Il3FilterableTree;
 l_TreeFilters: InsUserFlagsFilters;

 function lp_MakeFilter: InsUserFlagsFilter;
 begin
  case CurrentFlagFilter of
   ulftNone:
    Result := nil;
   ulftActive:
    Result := TnsUserFlagsFilter.Make(UFF_USER_ACTIVE);
   ulftUsual:
    Result := TnsUserFlagsFilter.Make(UFF_USER_NOT_SYSTEM);
   ulftSystem:
    Result := TnsUserFlagsFilter.Make(UFF_USER_SYSTEM);
   ulftConsultingEnabled:
    Result := TnsUserFlagsFilter.Make(UFF_USER_CAN_BUY_CONSULTING);
   ulftConsultingDisabled:
    Result := TnsUserFlagsFilter.Make(UFF_USER_CANT_BUY_CONSULTING);
   ulftPrivileged:
    Result := TnsUserFlagsFilter.Make(UFF_USER_PRIVILEGED);
   ulftNonPrivileged:
    Result := TnsUserFlagsFilter.Make(UFF_USER_NOT_PRIVILEGED);
   ulftWithoutGroup:
    Result := TnsUserFlagsFilter.Make(UFF_NOT_GROUPPED_USERS);
   else
   begin
    Result := nil;
    Assert(False);
   end;
  end;
 end;

//#UC END# *49246092009E_49246742002B_var*
begin
//#UC START# *49246092009E_49246742002B_impl*
 if (aFilter <> CurrentFlagFilter) and
    Supports(aTreeSource, Il3FilterableTree, l_FilterableTree) and
    Supports(l_FilterableTree.CloneFilters, InsUserFlagsFilters, l_TreeFilters) then
 begin
  f_CurrentFlagFilter := aFilter;
  Result := l_FilterableTree.MakeFiltered(l_TreeFilters.
                                          SetUserFlag(lp_MakeFilter).
                                          SetContext(pm_GetCurrentContextFilter.ActiveContext),
                                          aCurrentNode,
                                          aCurrent,
                                          True,
                                          True);


 end
 else
  Result := aTreeSource;
//#UC END# *49246092009E_49246742002B_impl*
end;//TdsUserList.FiltrateByType

procedure TdsUserList.SetConsultingPaymentForAll(IsAllowed: Boolean);
//#UC START# *49246116033D_49246742002B_var*
//#UC END# *49246116033D_49246742002B_var*
begin
//#UC START# *49246116033D_49246742002B_impl*
 SDS.SetConsultingPaymentForAll(IsAllowed);
//#UC END# *49246116033D_49246742002B_impl*
end;//TdsUserList.SetConsultingPaymentForAll

procedure TdsUserList.SetConsultingPayment(const aUserTree: Il3SimpleTree;
  IsAllowed: Boolean);
//#UC START# *4924612E0296_49246742002B_var*
//#UC END# *4924612E0296_49246742002B_var*
begin
//#UC START# *4924612E0296_49246742002B_impl*
 SDS.SetConsultingPayment(MakeSelectedList(aUserTree), IsAllowed);
//#UC END# *4924612E0296_49246742002B_impl*
end;//TdsUserList.SetConsultingPayment

procedure TdsUserList.SetIsPrivileged(const aNode: Il3SimpleNode;
  IsPrivileged: Boolean);
//#UC START# *4924614D0345_49246742002B_var*
//#UC END# *4924614D0345_49246742002B_var*
begin
//#UC START# *4924614D0345_49246742002B_impl*
 SDS.SetIsPrivileged(aNode, IsPrivileged);
//#UC END# *4924614D0345_49246742002B_impl*
end;//TdsUserList.SetIsPrivileged

procedure TdsUserList.SetPrivelegedRights(const aUserTree: Il3SimpleTree;
  IsPrivileged: Boolean);
//#UC START# *4924615E0279_49246742002B_var*
//#UC END# *4924615E0279_49246742002B_var*
begin
//#UC START# *4924615E0279_49246742002B_impl*
 SDS.SetPrivelegedRights(MakeSelectedList(aUserTree), IsPrivileged);
//#UC END# *4924615E0279_49246742002B_impl*
end;//TdsUserList.SetPrivelegedRights

procedure TdsUserList.SelectNodes(const aUserTree: Il3SimpleTree;
  const aList: Il3InterfaceList);
//#UC START# *492461970357_49246742002B_var*
var
 l_IDX: Integer;
 l_Node: INodeBase;
//#UC END# *492461970357_49246742002B_var*
begin
//#UC START# *492461970357_49246742002B_impl*
 if Supports(aUserTree.RootNode, INodeBase, l_Node) then
  l_Node.SetAllFlag(FM_SELECTION, False);
 for l_IDX := 0 to aList.Count - 1 do
  if Supports(aList.Items[l_IDX], INodeBase, l_Node) then
   l_Node.SetFlag(FM_SELECTION, True);
//#UC END# *492461970357_49246742002B_impl*
end;//TdsUserList.SelectNodes

function TdsUserList.pm_GetCurrentFlagFilter: TUserListFilterTypes;
//#UC START# *492461B60284_49246742002Bget_var*
//#UC END# *492461B60284_49246742002Bget_var*
begin
//#UC START# *492461B60284_49246742002Bget_impl*
 Result := f_CurrentFlagFilter;
//#UC END# *492461B60284_49246742002Bget_impl*
end;//TdsUserList.pm_GetCurrentFlagFilter

function TdsUserList.pm_GetConsultingPaymentForNewbies: Boolean;
//#UC START# *492461FE0363_49246742002Bget_var*
//#UC END# *492461FE0363_49246742002Bget_var*
begin
//#UC START# *492461FE0363_49246742002Bget_impl*
 Result := SDS.ConsultingPaymentForNewbies;
//#UC END# *492461FE0363_49246742002Bget_impl*
end;//TdsUserList.pm_GetConsultingPaymentForNewbies

procedure TdsUserList.pm_SetConsultingPaymentForNewbies(aValue: Boolean);
//#UC START# *492461FE0363_49246742002Bset_var*
//#UC END# *492461FE0363_49246742002Bset_var*
begin
//#UC START# *492461FE0363_49246742002Bset_impl*
 SDS.ConsultingPaymentForNewbies := aValue
//#UC END# *492461FE0363_49246742002Bset_impl*
end;//TdsUserList.pm_SetConsultingPaymentForNewbies

procedure TdsUserList.NotifyCreateUserFinished(Successfull: Boolean);
//#UC START# *49E5B8C7024C_49246742002B_var*
var
 l_Index    : Integer;
 l_Listener : IbsUserListViewListener;
 l_Item     : IUnknown;
//#UC END# *49E5B8C7024C_49246742002B_var*
begin
//#UC START# *49E5B8C7024C_49246742002B_impl*
 if (NotifiedObjList <> nil) and (NotifiedObjList.Count > 0) then
  for l_Index := 0 to Pred(NotifiedObjList.Count) do
  begin
   l_Item := NotifiedObjList.Items[l_Index];
   if Supports(l_Item, IbsUserListViewListener, l_Listener) and
     (l_Item = l_Listener) then
    l_Listener.CreateUserFinished(Successfull);
  end;//if (NotifiedObjList <> nil)
//#UC END# *49E5B8C7024C_49246742002B_impl*
end;//TdsUserList.NotifyCreateUserFinished

procedure TdsUserList.NotifyGroupChanged(aGroupUID: Integer);
//#UC START# *49F02BA70361_49246742002B_var*
var
 l_Index    : Integer;
 l_Listener : IbsUserListViewListener;
 l_Item     : IUnknown;
//#UC END# *49F02BA70361_49246742002B_var*
begin
//#UC START# *49F02BA70361_49246742002B_impl*
 if (NotifiedObjList <> nil) and (NotifiedObjList.Count > 0) then
  for l_Index := 0 to Pred(NotifiedObjList.Count) do
  begin
   l_Item := NotifiedObjList.Items[l_Index];
   if Supports(l_Item, IbsUserListViewListener, l_Listener) and
     (l_Item = l_Listener) then
    l_Listener.GroupChanged(aGroupUID);
  end;//if (NotifiedObjList <> nil)
//#UC END# *49F02BA70361_49246742002B_impl*
end;//TdsUserList.NotifyGroupChanged

function TdsUserList.FiltrateByGroup(const aTreeSource: Il3SimpleTree;
  const aCurrentNode: Il3SimpleNode;
  aFilter: Integer;
  out aCurrent: Integer): Il3SimpleTree;
//#UC START# *49F02C0400AA_49246742002B_var*
var
 l_FilterableTree: Il3FilterableTree;
 l_TreeFilters: InsUserFlagsFilters;

 function lp_MakeFilter: InsGroupFilter;
 begin
  if (CurrentGroupFilter <> GROUP_ALL_ID) and (CurrentGroupFilter <> cBadUID) then
   Result := TnsGroupFilter.Make(CurrentGroupFilter)
  else
   Result := nil;
 end;
//#UC END# *49F02C0400AA_49246742002B_var*
begin
//#UC START# *49F02C0400AA_49246742002B_impl*
 if (aFilter <> CurrentGroupFilter) and
    Supports(aTreeSource, Il3FilterableTree, l_FilterableTree) and
    Supports(l_FilterableTree.CloneFilters, InsUserFlagsFilters, l_TreeFilters) then
 begin
  f_CurrentGroupFilter := aFilter;
  Result := l_FilterableTree.MakeFiltered(l_TreeFilters.
                                          SetGroup(lp_MakeFilter).
                                          SetContext(pm_GetCurrentContextFilter.ActiveContext),
                                          aCurrentNode,
                                          aCurrent,
                                          True,
                                          True);


 end
 else
  Result := aTreeSource;
//#UC END# *49F02C0400AA_49246742002B_impl*
end;//TdsUserList.FiltrateByGroup

procedure TdsUserList.CheckUnsavedUserProperty;
//#UC START# *49F6DB9B02A8_49246742002B_var*
//#UC END# *49F6DB9B02A8_49246742002B_var*
begin
//#UC START# *49F6DB9B02A8_49246742002B_impl*
 SDS.CheckUnsavedUserProperty;
//#UC END# *49F6DB9B02A8_49246742002B_impl*
end;//TdsUserList.CheckUnsavedUserProperty

procedure TdsUserList.RequestUpdateCureent;
//#UC START# *49F6E0DB0163_49246742002B_var*
var
 l_Index    : Integer;
 l_Listener : IbsUserListViewListener;
 l_Item     : IUnknown;
//#UC END# *49F6E0DB0163_49246742002B_var*
begin
//#UC START# *49F6E0DB0163_49246742002B_impl*
 if (NotifiedObjList <> nil) and (NotifiedObjList.Count > 0) then
  for l_Index := 0 to Pred(NotifiedObjList.Count) do
  begin
   l_Item := NotifiedObjList.Items[l_Index];
   if Supports(l_Item, IbsUserListViewListener, l_Listener) and
     (l_Item = l_Listener) then
    l_Listener.RequestUpdateCurrent;
  end;//if (NotifiedObjList <> nil)
//#UC END# *49F6E0DB0163_49246742002B_impl*
end;//TdsUserList.RequestUpdateCureent

procedure TdsUserList.Cleanup;
//#UC START# *479731C50290_49246742002B_var*
//#UC END# *479731C50290_49246742002B_var*
begin
//#UC START# *479731C50290_49246742002B_impl*
 f_Root := nil;
 f_CurrentFlagFilter := ulftNone;
 inherited;
//#UC END# *479731C50290_49246742002B_impl*
end;//TdsUserList.Cleanup

procedure TdsUserList.DoCurrentChanged(const aNode: Il3SimpleNode);
//#UC START# *47F0C1BF0314_49246742002B_var*
var
 l_Node: INodeBase;
 l_Entity: IEntityBase;
 l_Profile: IUserProfile;
//#UC END# *47F0C1BF0314_49246742002B_var*
begin
//#UC START# *47F0C1BF0314_49246742002B_impl*
 if Supports(aNode, INodeBase, l_Node) then
 begin
  try
   l_Node.GetEntity(l_Entity);
   Supports(l_Entity, IUserProfile, l_Profile);
  except
   on ENoEntity do
    l_Profile := nil;
  end;
 end
 else
  l_Profile := nil;
 SDS.ChangeUser(TdeProfile.Make(l_Profile));
//#UC END# *47F0C1BF0314_49246742002B_impl*
end;//TdsUserList.DoCurrentChanged

function TdsUserList.MakeImageList: Il3ImageList;
//#UC START# *47F465F80149_49246742002B_var*
//#UC END# *47F465F80149_49246742002B_var*
begin
//#UC START# *47F465F80149_49246742002B_impl*
 Result := vtMakeImageListWrapper(dmAdmin.ilUsers);
//#UC END# *47F465F80149_49246742002B_impl*
end;//TdsUserList.MakeImageList

{$If not defined(NoVCM)}
procedure TdsUserList.GotData;
//#UC START# *492ACF630072_49246742002B_var*
//#UC END# *492ACF630072_49246742002B_var*
begin
//#UC START# *492ACF630072_49246742002B_impl*
 inherited;
 f_Root := PartData.Node;
//#UC END# *492ACF630072_49246742002B_impl*
end;//TdsUserList.GotData
{$IfEnd} //not NoVCM

procedure TdsUserList.InitRefs(const aDS: IvcmUseCaseController);
begin
 inherited;
 SDS := aDS As IsdsAdmin;
end;

procedure TdsUserList.ClearRefs;
begin
 inherited;
 SDS := nil;
end;

{$IfEnd} //Admin

end.