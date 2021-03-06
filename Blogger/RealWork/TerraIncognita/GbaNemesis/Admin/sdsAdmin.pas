unit sdsAdmin;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Admin"
// �����: ������ �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Admin/sdsAdmin.pas"
// �����: 15.08.2005 20.00
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UseCaseControllerImp::Class>> F1 �������������::Admin::Admin::Admin::TsdsAdmin
//
// ������ ������ ������ ������������� �������������
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
  SecurityUnit,
  l3Interfaces,
  l3TreeInterfaces,
  AdminInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmControllers
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3ProtoObjectWithCOMQI,
  l3NotifyPtrList
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  
  ;
{$IfEnd} //Admin

{$If defined(Admin)}
type
 _InitDataType_ = IdeAdmin;
 _SetType_ = IsdsAdmin;
 {$Include w:\common\components\gui\Garant\VCM\implementation\vcmFormSetDataSourceWithoutData.imp.pas}
 TsdsAdmin = {ucc} class(_vcmFormSetDataSourceWithoutData_, IsdsAdmin)
  {* ������ ������ ������ ������������� ������������� }
 private
 // private fields
   f_CurrentGroupID : Integer;
    {* ������� ������}
   f_Profile : IdeProfile;
   f_dsUserList : IvcmViewAreaControllerRef;
    {* ���� ��� ������� ������ dsUserList}
   f_dsAdmin : IvcmViewAreaControllerRef;
    {* ���� ��� ������� ������ dsAdmin}
   f_dsUserProperty : IvcmViewAreaControllerRef;
    {* ���� ��� ������� ������ dsUserProperty}
   f_dsGroupsList : IvcmViewAreaControllerRef;
    {* ���� ��� ������� ������ dsGroupsList}
 private
 // private methods
   function ChangeBaseAccess: Boolean;
   function GetUID(const aNode: Il3SimpleNode): Integer;
   procedure PrepareBasesTree(const aList: INodeIdList);
   function FindNode(anID: TNodeId): INodeBase;
   function EncodeUIDList(const aList: Il3InterfaceList): IUidList;
     {* � �������� ������ ����� ����, ������������ ������ �� UID }
   function DecodeUIDList(const aUserTree: Il3SimpleTree;
    const aList: IUidList): Il3InterfaceList;
     {* � �������� ������ ����� UID, ������������ ������ ��������������� ��� }
   function EditGroupName(const aNode: Il3SimpleNode;
    out aName: Il3CString): Boolean;
     {* ��������������� ��� ������ }
 protected
 // property methods
   function pm_GetInternalUserList: IdsUserList;
   function pm_GetInternalUserProperty: IdsUserProperty;
   function pm_GetBaseAccessRootTag: Il3CString;
   function pm_GetBaseAccessRoot: INodeBase;
 protected
 // realized methods
   procedure ChangeUser(const aProfile: IdeProfile);
   procedure DeleteUser(const aNode: Il3SimpleNode);
   procedure DeleteUsers(const aUserTree: Il3SimpleTree;
    const anList: Il3InterfaceList;
    out aFailed: Il3InterfaceList);
     {* ������� ���������� �� ������ �������������, ������� ������ ��� ������� �� ������� ������� }
   procedure SetConsultingPaymentForAll(IsAllowed: Boolean);
   procedure SetConsultingPayment(const anList: Il3InterfaceList;
    IsAllowed: Boolean);
     {* �������� ����������� ����������� ��� ���������� �� ������ ������������� }
   procedure LogoutUser(const aNode: Il3SimpleNode); // can raise ETryLogoutCurrentUser
   procedure LogoutUsers(const anList: Il3InterfaceList); // can raise ETryLogoutCurrentUser
     {* ��������� ���������� �� ������ �������������, ������� ������ ��� ������� �� ������� ��������� }
   procedure SetIsPrivileged(const aNode: Il3SimpleNode;
    IsPrivileged: Boolean);
   procedure SetPrivelegedRights(const anList: Il3InterfaceList;
    IsPrivileged: Boolean);
     {* �������� ������������������� ��� ���������� �� ������ ������������� }
   function pm_GetConsultingPaymentForNewbies: Boolean;
   procedure pm_SetConsultingPaymentForNewbies(aValue: Boolean);
   function pm_GetDsUserList: IdsUserList;
   function DoGet_dsUserList: IdsUserList;
   function pm_GetDsAdmin: IdsAdmin;
   function DoGet_dsAdmin: IdsAdmin;
   function pm_GetDsUserProperty: IdsUserProperty;
   function DoGet_dsUserProperty: IdsUserProperty;
   function pm_GetDsGroupsList: IdsGroupsList;
   function DoGet_dsGroupsList: IdsGroupsList;
   function ChangeBaseAccessForGroup(const aNode: Il3SimpleNode): Boolean; overload; 
     {* �������� ������ ��� ����� }
   procedure DeleteGroup(const aNode: Il3SimpleNode);
     {* ������� ������ }
   procedure CreateNewGroup;
     {* ������� ������ }
   function ChangeBaseAccessForGroup(anUID: Integer): Boolean; overload; 
   procedure ChangeGroup(const aNode: Il3SimpleNode);
     {* ���������� ������ }
   function Get_CurrentGroupUID: Integer;
   procedure RenameGroup(const aNode: Il3SimpleNode);
     {* ������������� ������ }
   procedure CreateUserFinished(Successfull: Boolean);
     {* ����������� �� ������� ������������ }
   procedure CheckUnsavedUserProperty;
     {* ���� �������� �� ��������� - �������� �� ���� }
   procedure RequestUpdateCurrent;
   procedure SetDontDeleteIdle(const aNode: Il3SimpleNode;
    aValue: Boolean);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure InitFields; override;
   {$If not defined(NoVCM)}
   procedure ClearAreas; override;
     {* ������� ������ �� ������� ����� }
   {$IfEnd} //not NoVCM
 private
 // private properties
   property BaseAccessRootTag: Il3CString
     read pm_GetBaseAccessRootTag;
   property BaseAccessRoot: INodeBase
     read pm_GetBaseAccessRoot;
 public
 // public properties
   property InternalUserList: IdsUserList
     read pm_GetInternalUserList;
     {* ������ �� ����������� ds }
   property InternalUserProperty: IdsUserProperty
     read pm_GetInternalUserProperty;
 end;//TsdsAdmin
{$IfEnd} //Admin

implementation

{$If defined(Admin)}
uses
  deSearch,
  dsBasesAccess,
  dsUserList,
  dsUserProperty,
  dsAdmin,
  SysUtils,
  DataAdapter,
  nsAttributeTreeCacheNew,
  nsConst,
  nsTypes
  {$If not defined(NoVCM)}
  ,
  vcmFormSetRefreshParams
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  StdRes
  {$IfEnd} //not NoVCM
  ,
  nsLogicOperationToFlags,
  l3Nodes,
  Controls,
  SearchDomainInterfaces,
  dsGroupsList,
  bsEditGroupName,
  l3Base
  {$If not defined(NoVCM)}
  ,
  vcmLocalInterfaces
  {$IfEnd} //not NoVCM
  ,
  vcmFormDataSourceRef {a}
  ;
{$IfEnd} //Admin

{$If defined(Admin)}

type _Instance_R_ = TsdsAdmin;

{$Include w:\common\components\gui\Garant\VCM\implementation\vcmFormSetDataSourceWithoutData.imp.pas}

// start class TsdsAdmin

function TsdsAdmin.ChangeBaseAccess: Boolean;
//#UC START# *4AAF58000352_493126130280_var*
//#UC END# *4AAF58000352_493126130280_var*
begin
//#UC START# *4AAF58000352_493126130280_impl*
 Result := TdmStdRes.OpenTreeSelection(BaseAccessRootTag, ns_ftNone,
                                       TdsBasesAccess.Make(nil,
                                                           TdeSearch.Make(BaseAccessRootTag, nil))) = mrOk;
//#UC END# *4AAF58000352_493126130280_impl*
end;//TsdsAdmin.ChangeBaseAccess

function TsdsAdmin.pm_GetInternalUserList: IdsUserList;
//#UC START# *49F0282D02AA_493126130280get_var*
//#UC END# *49F0282D02AA_493126130280get_var*
begin
//#UC START# *49F0282D02AA_493126130280get_impl*
 Result := pm_GetDsUserList;
//#UC END# *49F0282D02AA_493126130280get_impl*
end;//TsdsAdmin.pm_GetInternalUserList

function TsdsAdmin.pm_GetInternalUserProperty: IdsUserProperty;
//#UC START# *49F6E384028E_493126130280get_var*
//#UC END# *49F6E384028E_493126130280get_var*
begin
//#UC START# *49F6E384028E_493126130280get_impl*
 Result := pm_GetDsUserProperty;
//#UC END# *49F6E384028E_493126130280get_impl*
end;//TsdsAdmin.pm_GetInternalUserProperty

function TsdsAdmin.pm_GetBaseAccessRootTag: Il3CString;
//#UC START# *4931295B0260_493126130280get_var*
//#UC END# *4931295B0260_493126130280get_var*
begin
//#UC START# *4931295B0260_493126130280get_impl*
 Result := nsCStr(AT_BASES);
//#UC END# *4931295B0260_493126130280get_impl*
end;//TsdsAdmin.pm_GetBaseAccessRootTag

function TsdsAdmin.pm_GetBaseAccessRoot: INodeBase;
//#UC START# *4931297703B0_493126130280get_var*
//#UC END# *4931297703B0_493126130280get_var*
begin
//#UC START# *4931297703B0_493126130280get_impl*
 Result := TnsAttributeTreeCacheNew.Instance.AttributeRoot[BaseAccessRootTag];
//#UC END# *4931297703B0_493126130280get_impl*
end;//TsdsAdmin.pm_GetBaseAccessRoot

function TsdsAdmin.GetUID(const aNode: Il3SimpleNode): Integer;
//#UC START# *4931291701BD_493126130280_var*
var
 l_Node: IProfileNode;
//#UC END# *4931291701BD_493126130280_var*
begin
//#UC START# *4931291701BD_493126130280_impl*
 if Supports(aNode, IProfileNode, l_Node) then
  Result := l_Node.GetUid
 else
  Result := cBadUID;
//#UC END# *4931291701BD_493126130280_impl*
end;//TsdsAdmin.GetUID

procedure TsdsAdmin.PrepareBasesTree(const aList: INodeIdList);
//#UC START# *49312C9E0289_493126130280_var*
var
 l_IDX: Integer;
 l_Node: INodeBase;
//#UC END# *49312C9E0289_493126130280_var*
begin
//#UC START# *49312C9E0289_493126130280_impl*
 DropAllOperations(BaseAccessRoot);
 BaseAccessRoot.SetAllFlag(FM_SELECTION, False);
 if Assigned(aList) then
  for l_IDX := 0 to aList.Count - 1 do
  begin
   l_Node := FindNode(aList[l_IDX]);
   if Assigned(l_Node) then
    nsLogicOperationToFlags.SetLogicOperation(l_Node, loNot);
  end;
//#UC END# *49312C9E0289_493126130280_impl*
end;//TsdsAdmin.PrepareBasesTree

function TsdsAdmin.FindNode(anID: TNodeId): INodeBase;
//#UC START# *49339B8A016C_493126130280_var*
var
 l_NodeIterator: INodeIterator;
 l_ChildNode: INodeBase;
//#UC END# *49339B8A016C_493126130280_var*
begin
//#UC START# *49339B8A016C_493126130280_impl*
 Result := nil;
 BaseAccessRoot.IterateNodes(0, l_NodeIterator);
 l_NodeIterator.GetNext(l_ChildNode);
 while l_ChildNode <> nil do
 begin
  if l_ChildNode.GetNodeId = anID then
  begin
   Result := l_ChildNode;
   Break;
  end;
  l_NodeIterator.GetNext(l_ChildNode);
 end;//while l_ChildNode <> nil
//#UC END# *49339B8A016C_493126130280_impl*
end;//TsdsAdmin.FindNode

function TsdsAdmin.EncodeUIDList(const aList: Il3InterfaceList): IUidList;
//#UC START# *49339DC90212_493126130280_var*
var
 l_IDX: Integer;
//#UC END# *49339DC90212_493126130280_var*
begin
//#UC START# *49339DC90212_493126130280_impl*
 Assert(Assigned(aList));
 Result := defDataAdapter.NativeAdapter.MakeUIDList;
 for l_IDX := 0 to aList.Count - 1 do
  Result.Add(GetUID(aList.Items[l_IDX] as Il3SimpleNode));
//#UC END# *49339DC90212_493126130280_impl*
end;//TsdsAdmin.EncodeUIDList

function TsdsAdmin.DecodeUIDList(const aUserTree: Il3SimpleTree;
  const aList: IUidList): Il3InterfaceList;
//#UC START# *49339DFE00BD_493126130280_var*
var
 l_ResulList: Il3InterfaceList absolute Result;
 l_UIDList: TvcmLongintList;

 function CheckUID(const aNode: Il3SimpleNode): Boolean;
 var
  l_IDX: Integer;
  l_UID: LongInt;
 begin
  Result := False;
  l_UID := GetUID(aNode);
  for l_IDX := 0 to l_UIDList.Count - 1 do
   if l_UID = l_UIDList.Items[l_IDX] then
   begin
    l_ResulList.Add(aNode);
    l_UIDList.Delete(l_IDX);
    Result := l_UIDList.Count = 0;
    Break;
   end;
 end;

var
 l_IDX : Integer;
//#UC END# *49339DFE00BD_493126130280_var*
begin
//#UC START# *49339DFE00BD_493126130280_impl*
 Result := TvcmInterfaceList.MakeI;
 if Assigned(aList) and (aList.Count > 0) then
 begin
  l_UIDList := TvcmLongintList.Make;
  try
   for l_IDX := 0 to aList.Count - 1 do
    l_UIDList.Add(aList[l_IDX]);
   aUserTree.SimpleIterateF(l3L2SNA(@CheckUID), imCheckResult);
  finally
   vcmFree(l_UIDList);
  end;
 end;
//#UC END# *49339DFE00BD_493126130280_impl*
end;//TsdsAdmin.DecodeUIDList

function TsdsAdmin.EditGroupName(const aNode: Il3SimpleNode;
  out aName: Il3CString): Boolean;
//#UC START# *49EEEB1D0215_493126130280_var*
var
 l_Data : IbsEditGroupName;
//#UC END# *49EEEB1D0215_493126130280_var*
begin
//#UC START# *49EEEB1D0215_493126130280_impl*
 l_Data := TbsEditGroupName.Make(l3CStr(aNode));
 if (TdmStdRes.ShowRenameGroupDialog(l_Data) = mrOk) then
 begin
  aName := l_Data.Name;
  Result := true
 end//TdmStdRes.ShowRenameGroupDialog(TbsEditGroupName.Make(l_Name))  = mrOk
 else
  Result := false;
//#UC END# *49EEEB1D0215_493126130280_impl*
end;//TsdsAdmin.EditGroupName

procedure TsdsAdmin.ChangeUser(const aProfile: IdeProfile);
//#UC START# *493121A10045_493126130280_var*
//#UC END# *493121A10045_493126130280_var*
begin
//#UC START# *493121A10045_493126130280_impl*
 if (f_dsUserProperty <> nil) then
  f_dsUserProperty.Referred := nil;
 f_Profile := aProfile;
 Refresh(vcmMakeDataRefreshParams);
//#UC END# *493121A10045_493126130280_impl*
end;//TsdsAdmin.ChangeUser

procedure TsdsAdmin.DeleteUser(const aNode: Il3SimpleNode);
//#UC START# *4931222C03DE_493126130280_var*
var
 l_UserManager: IUserManager;
 l_UID: LongInt;
//#UC END# *4931222C03DE_493126130280_var*
begin
//#UC START# *4931222C03DE_493126130280_impl*
 l_UID := GetUID(aNode);
 if l_UID <> cBadUID then
 begin
  l_UserManager := defDataAdapter.NativeAdapter.MakeUserManager;
  try
   l_UserManager.DeleteUser(l_UID);
  finally
   l_UserManager := nil;
  end; // try
 end; // l_UID <> cBadUID
//#UC END# *4931222C03DE_493126130280_impl*
end;//TsdsAdmin.DeleteUser

procedure TsdsAdmin.DeleteUsers(const aUserTree: Il3SimpleTree;
  const anList: Il3InterfaceList;
  out aFailed: Il3InterfaceList);
//#UC START# *493122380020_493126130280_var*
var
 l_UserManager: IUserManager;
 l_Failed: IUidList;
//#UC END# *493122380020_493126130280_var*
begin
//#UC START# *493122380020_493126130280_impl*
 l_UserManager := defDataAdapter.NativeAdapter.MakeUserManager;
 try
  l_UserManager.DeleteUsers(EncodeUIDList(anList), l_Failed);
  aFailed := DecodeUIDList(aUserTree, l_Failed);
 finally
  l_UserManager := nil;
 end; // try
//#UC END# *493122380020_493126130280_impl*
end;//TsdsAdmin.DeleteUsers

procedure TsdsAdmin.SetConsultingPaymentForAll(IsAllowed: Boolean);
//#UC START# *49312258036D_493126130280_var*
var
 l_UserManager: IUserManager;
//#UC END# *49312258036D_493126130280_var*
begin
//#UC START# *49312258036D_493126130280_impl*
 l_UserManager := defDataAdapter.NativeAdapter.MakeUserManager;
 try
  l_UserManager.SetConsultingPaymentForAll(IsAllowed);
 finally
  l_UserManager := nil;
 end;
//#UC END# *49312258036D_493126130280_impl*
end;//TsdsAdmin.SetConsultingPaymentForAll

procedure TsdsAdmin.SetConsultingPayment(const anList: Il3InterfaceList;
  IsAllowed: Boolean);
//#UC START# *4931226101A3_493126130280_var*
var
 l_UserManager: IUserManager;
//#UC END# *4931226101A3_493126130280_var*
begin
//#UC START# *4931226101A3_493126130280_impl*
 l_UserManager := defDataAdapter.NativeAdapter.MakeUserManager;
 try
  l_UserManager.SetConsultingRights(EncodeUIDList(anList), IsAllowed);
 finally
  l_UserManager := nil;
 end; // try
//#UC END# *4931226101A3_493126130280_impl*
end;//TsdsAdmin.SetConsultingPayment

procedure TsdsAdmin.LogoutUser(const aNode: Il3SimpleNode); // can raise ETryLogoutCurrentUser
//#UC START# *493122770111_493126130280_var*
var
 l_UserManager: IUserManager;
 l_SelfProfile: IUserProfile;
//#UC END# *493122770111_493126130280_var*
begin
//#UC START# *493122770111_493126130280_impl*
 l_UserManager := defDataAdapter.NativeAdapter.MakeUserManager;
 try
  l_UserManager.GetSelfProfile(l_SelfProfile);
  try
   if l_SelfProfile.GetUID <> GetUID(aNode) then
     l_UserManager.LogoutUser(GetUID(aNode))
   else
    raise ETryLogoutCurrentUser.Create('');
  finally
   l_SelfProfile := nil;
  end;
 finally
  l_UserManager := nil;
 end;
//#UC END# *493122770111_493126130280_impl*
end;//TsdsAdmin.LogoutUser

procedure TsdsAdmin.LogoutUsers(const anList: Il3InterfaceList); // can raise ETryLogoutCurrentUser
//#UC START# *4931229500C5_493126130280_var*
var
 l_UserManager: IUserManager;
 l_List: IUIDList;
 l_IDX: Integer;
 l_SelfProfile: IUserProfile;
 l_SelfUID: LongInt;
//#UC END# *4931229500C5_493126130280_var*
begin
//#UC START# *4931229500C5_493126130280_impl*
 l_UserManager := defDataAdapter.NativeAdapter.MakeUserManager;
 try
  l_List := EncodeUIDList(anList);
  try
   l_UserManager.GetSelfProfile(l_SelfProfile);
   try
    l_SelfUID := l_SelfProfile.GetUID;
   finally
    l_SelfProfile := nil;
   end;
   for l_IDX := 0 to l_List.Count - 1 do
    if l_SelfUID = l_List[l_IDX] then
     raise ETryLogoutCurrentUser.Create('');
   l_UserManager.LogoutUsers(l_List);
  finally
   l_List := nil;
  end;
 finally
  l_UserManager := nil;
 end; // try
//#UC END# *4931229500C5_493126130280_impl*
end;//TsdsAdmin.LogoutUsers

procedure TsdsAdmin.SetIsPrivileged(const aNode: Il3SimpleNode;
  IsPrivileged: Boolean);
//#UC START# *493122D301EB_493126130280_var*
var
 l_UserManager: IUserManager;
//#UC END# *493122D301EB_493126130280_var*
begin
//#UC START# *493122D301EB_493126130280_impl*
 l_UserManager := defDataAdapter.NativeAdapter.MakeUserManager;
 try
  l_UserManager.UserIsPrivileged(GetUID(aNode), IsPrivileged);
 finally
  l_UserManager := nil;
 end;
//#UC END# *493122D301EB_493126130280_impl*
end;//TsdsAdmin.SetIsPrivileged

procedure TsdsAdmin.SetPrivelegedRights(const anList: Il3InterfaceList;
  IsPrivileged: Boolean);
//#UC START# *493122E402DC_493126130280_var*
var
 l_UserManager: IUserManager;
//#UC END# *493122E402DC_493126130280_var*
begin
//#UC START# *493122E402DC_493126130280_impl*
 l_UserManager := defDataAdapter.NativeAdapter.MakeUserManager;
 try
  l_UserManager.SetPrivilegedRights(EncodeUIDList(anList), IsPrivileged);
 finally
  l_UserManager := nil;
 end; // try
//#UC END# *493122E402DC_493126130280_impl*
end;//TsdsAdmin.SetPrivelegedRights

function TsdsAdmin.pm_GetConsultingPaymentForNewbies: Boolean;
//#UC START# *4931230801FC_493126130280get_var*
var
 l_UserManager: IUserManager;
//#UC END# *4931230801FC_493126130280get_var*
begin
//#UC START# *4931230801FC_493126130280get_impl*
 l_UserManager := defDataAdapter.NativeAdapter.MakeUserManager;
 try
  Result := l_UserManager.GetConsultingPaymentForNewbies;
 finally
  l_UserManager := nil;
 end;
//#UC END# *4931230801FC_493126130280get_impl*
end;//TsdsAdmin.pm_GetConsultingPaymentForNewbies

procedure TsdsAdmin.pm_SetConsultingPaymentForNewbies(aValue: Boolean);
//#UC START# *4931230801FC_493126130280set_var*
var
 l_UserManager: IUserManager;
//#UC END# *4931230801FC_493126130280set_var*
begin
//#UC START# *4931230801FC_493126130280set_impl*
 l_UserManager := defDataAdapter.NativeAdapter.MakeUserManager;
 try
  l_UserManager.SetConsultingPaymentForNewbies(aValue);
 finally
  l_UserManager := nil;
 end;
//#UC END# *4931230801FC_493126130280set_impl*
end;//TsdsAdmin.pm_SetConsultingPaymentForNewbies

function TsdsAdmin.pm_GetDsUserList: IdsUserList;
//#UC START# *4933A3DE0399_493126130280get_var*
//#UC END# *4933A3DE0399_493126130280get_var*
begin
 if (f_dsUserList = nil) then
 begin
  f_dsUserList := TvcmViewAreaControllerRef.Make;
  //#UC START# *4933A3DE0399_493126130280get_init*
  // - ��� ������������� ������ �� ViewArea
  //#UC END# *4933A3DE0399_493126130280get_init*
 end;//f_dsUserList = nil
 if f_dsUserList.IsEmpty
  //#UC START# *4933A3DE0399_493126130280get_need*
  // - ������� �������� ViewArea
  //#UC END# *4933A3DE0399_493126130280get_need*
  then
   f_dsUserList.Referred := DoGet_dsUserList;
 Result := IdsUserList(f_dsUserList.Referred);
end;

function TsdsAdmin.DoGet_dsUserList: IdsUserList;
//#UC START# *4933A3DE0399_493126130280area_var*
//#UC END# *4933A3DE0399_493126130280area_var*
begin
//#UC START# *4933A3DE0399_493126130280area_impl*
 Result := TdsUserList.Make(Self, InitialUseCaseData.Users);
//#UC END# *4933A3DE0399_493126130280area_impl*
end;//TsdsAdmin.DoGet_dsUserList

function TsdsAdmin.pm_GetDsAdmin: IdsAdmin;
//#UC START# *4933A42A000B_493126130280get_var*
//#UC END# *4933A42A000B_493126130280get_var*
begin
 if (f_dsAdmin = nil) then
 begin
  f_dsAdmin := TvcmViewAreaControllerRef.Make;
  //#UC START# *4933A42A000B_493126130280get_init*
  // - ��� ������������� ������ �� ViewArea
  //#UC END# *4933A42A000B_493126130280get_init*
 end;//f_dsAdmin = nil
 if f_dsAdmin.IsEmpty
  //#UC START# *4933A42A000B_493126130280get_need*
  // - ������� �������� ViewArea
  //#UC END# *4933A42A000B_493126130280get_need*
  then
   f_dsAdmin.Referred := DoGet_dsAdmin;
 Result := IdsAdmin(f_dsAdmin.Referred);
end;

function TsdsAdmin.DoGet_dsAdmin: IdsAdmin;
//#UC START# *4933A42A000B_493126130280area_var*
//#UC END# *4933A42A000B_493126130280area_var*
begin
//#UC START# *4933A42A000B_493126130280area_impl*
 Result := TdsAdmin.Make(Self);
//#UC END# *4933A42A000B_493126130280area_impl*
end;//TsdsAdmin.DoGet_dsAdmin

function TsdsAdmin.pm_GetDsUserProperty: IdsUserProperty;
//#UC START# *4933A4B2026A_493126130280get_var*
//#UC END# *4933A4B2026A_493126130280get_var*
begin
 if (f_dsUserProperty = nil) then
 begin
  f_dsUserProperty := TvcmViewAreaControllerRef.Make;
  //#UC START# *4933A4B2026A_493126130280get_init*
  // - ��� ������������� ������ �� ViewArea
  //#UC END# *4933A4B2026A_493126130280get_init*
 end;//f_dsUserProperty = nil
 if f_dsUserProperty.IsEmpty
  //#UC START# *4933A4B2026A_493126130280get_need*
  // - ������� �������� ViewArea
  //#UC END# *4933A4B2026A_493126130280get_need*
  then
   f_dsUserProperty.Referred := DoGet_dsUserProperty;
 Result := IdsUserProperty(f_dsUserProperty.Referred);
end;

function TsdsAdmin.DoGet_dsUserProperty: IdsUserProperty;
//#UC START# *4933A4B2026A_493126130280area_var*
//#UC END# *4933A4B2026A_493126130280area_var*
begin
//#UC START# *4933A4B2026A_493126130280area_impl*
 Result := TdsUserProperty.Make(Self, f_Profile);
//#UC END# *4933A4B2026A_493126130280area_impl*
end;//TsdsAdmin.DoGet_dsUserProperty

function TsdsAdmin.pm_GetDsGroupsList: IdsGroupsList;
//#UC START# *49EC52D1019D_493126130280get_var*
//#UC END# *49EC52D1019D_493126130280get_var*
begin
 if (f_dsGroupsList = nil) then
 begin
  f_dsGroupsList := TvcmViewAreaControllerRef.Make;
  //#UC START# *49EC52D1019D_493126130280get_init*
  // - ��� ������������� ������ �� ViewArea
  //#UC END# *49EC52D1019D_493126130280get_init*
 end;//f_dsGroupsList = nil
 if f_dsGroupsList.IsEmpty
  //#UC START# *49EC52D1019D_493126130280get_need*
  // - ������� �������� ViewArea
  //#UC END# *49EC52D1019D_493126130280get_need*
  then
   f_dsGroupsList.Referred := DoGet_dsGroupsList;
 Result := IdsGroupsList(f_dsGroupsList.Referred);
end;

function TsdsAdmin.DoGet_dsGroupsList: IdsGroupsList;
//#UC START# *49EC52D1019D_493126130280area_var*
//#UC END# *49EC52D1019D_493126130280area_var*
begin
//#UC START# *49EC52D1019D_493126130280area_impl*
 Result := TdsGroupsList.Make(Self, InitialUseCaseData.Groups);
//#UC END# *49EC52D1019D_493126130280area_impl*
end;//TsdsAdmin.DoGet_dsGroupsList

function TsdsAdmin.ChangeBaseAccessForGroup(const aNode: Il3SimpleNode): Boolean;
//#UC START# *49EC53DA01C9_493126130280_var*
var
 l_UID: LongInt;
//#UC END# *49EC53DA01C9_493126130280_var*
begin
//#UC START# *49EC53DA01C9_493126130280_impl*
 l_UID := GetUID(aNode);
 if l_UID <> cBadUID then
  Result := ChangeBaseAccessForGroup(l_UID)
 else
  Result := False;
//#UC END# *49EC53DA01C9_493126130280_impl*
end;//TsdsAdmin.ChangeBaseAccessForGroup

procedure TsdsAdmin.DeleteGroup(const aNode: Il3SimpleNode);
//#UC START# *49EC53FE0039_493126130280_var*
var
 l_UserManager: IUserManager;
 l_UID: LongInt;
//#UC END# *49EC53FE0039_493126130280_var*
begin
//#UC START# *49EC53FE0039_493126130280_impl*
 l_UID := GetUID(aNode);
 if l_UID <> cBadUID then
 begin
  l_UserManager := defDataAdapter.NativeAdapter.MakeUserManager;
  try
   l_UserManager.DeleteGroup(l_UID);
  finally
   l_UserManager := nil;
  end; // try
 end; // l_UID <> cBadUID
//#UC END# *49EC53FE0039_493126130280_impl*
end;//TsdsAdmin.DeleteGroup

procedure TsdsAdmin.CreateNewGroup;
//#UC START# *49EC5423006B_493126130280_var*
var
 l_Name: Il3CString;
 l_UserManager: IUserManager;
//#UC END# *49EC5423006B_493126130280_var*
begin
//#UC START# *49EC5423006B_493126130280_impl*
 if EditGroupName(nil, l_Name) then
  try
   defDataAdapter.NativeAdapter.MakeUserManager.CreateGroup(nsAStr(l_Name).S);
  except
   on ELoginDuplicate do
    raise EDuplicateGroupName.Create(nsEStr(l_Name));
  end
//#UC END# *49EC5423006B_493126130280_impl*
end;//TsdsAdmin.CreateNewGroup

function TsdsAdmin.ChangeBaseAccessForGroup(anUID: Integer): Boolean;
//#UC START# *49EC5B7D023E_493126130280_var*
var
 l_UserManager: IUserManager;
 l_List: INodeIdList;
 l_Iterator: INodeIterator;
 l_NodeBase: INodeBase;
//#UC END# *49EC5B7D023E_493126130280_var*
begin
//#UC START# *49EC5B7D023E_493126130280_impl*
 if anUID <> cBadUID then
 begin
  defDataAdapter.NativeAdapter.MakeUserManager.GetNonsearchableBlocksForGroup(anUID, l_List);
  PrepareBasesTree(l_List);
  Result := ChangeBaseAccess;
  if Result then
  begin
   l_List := defDataAdapter.NativeAdapter.MakeNodeIdList;
   l_Iterator := GetOperationIterator(BaseAccessRoot, loNot);
   l_Iterator.GetNext(l_NodeBase);
   while Assigned(l_NodeBase) do
   begin
    l_List.Add(l_NodeBase.GetNodeId);
    l_Iterator.GetNext(l_NodeBase);
   end;//while Assigned(l_NodeBase) do
   defDataAdapter.NativeAdapter.MakeUserManager.SetNonsearchableBlocksForGroup(anUID, l_List);
  end;
 end
 else
  Result := False;
//#UC END# *49EC5B7D023E_493126130280_impl*
end;//TsdsAdmin.ChangeBaseAccessForGroup

procedure TsdsAdmin.ChangeGroup(const aNode: Il3SimpleNode);
//#UC START# *49EEDC8F02C1_493126130280_var*
//#UC END# *49EEDC8F02C1_493126130280_var*
begin
//#UC START# *49EEDC8F02C1_493126130280_impl*
 if f_CurrentGroupID <> GetUID(aNode) then
 begin
  f_CurrentGroupID := GetUID(aNode);
  InternalUserList.NotifyGroupChanged(f_CurrentGroupID)
 end;
//#UC END# *49EEDC8F02C1_493126130280_impl*
end;//TsdsAdmin.ChangeGroup

function TsdsAdmin.Get_CurrentGroupUID: Integer;
//#UC START# *49EEDEB10042_493126130280get_var*
//#UC END# *49EEDEB10042_493126130280get_var*
begin
//#UC START# *49EEDEB10042_493126130280get_impl*
 Result := f_CurrentGroupID;
//#UC END# *49EEDEB10042_493126130280get_impl*
end;//TsdsAdmin.Get_CurrentGroupUID

procedure TsdsAdmin.RenameGroup(const aNode: Il3SimpleNode);
//#UC START# *49EEEBD40313_493126130280_var*
var
 l_Name: Il3CString;
 l_UP: IdsUserProperty;
//#UC END# *49EEEBD40313_493126130280_var*
begin
//#UC START# *49EEEBD40313_493126130280_impl*
 if EditGroupName(aNode, l_Name) then
 try
  if Supports(f_dsUserProperty, IdsUserProperty, l_UP) then
   l_UP.IsReadOnlyFor268342582 := True;
  try
   defDataAdapter.NativeAdapter.MakeUserManager.ChangeGroupName(GetUID(aNode),nsAStr(l_Name).S);
   Sleep(200); // ���� sleep ������ � l_UP.IsReadOnly - ��� "�������" � �268342582 
  except
   on ELoginDuplicate do
    raise EDuplicateGroupName.Create(nsEStr(l_Name));
  end;

 finally
  if l_UP <> nil then
   l_UP.IsReadOnlyFor268342582 := False;
 end;
//#UC END# *49EEEBD40313_493126130280_impl*
end;//TsdsAdmin.RenameGroup

procedure TsdsAdmin.CreateUserFinished(Successfull: Boolean);
//#UC START# *49F021CE03E6_493126130280_var*
//#UC END# *49F021CE03E6_493126130280_var*
begin
//#UC START# *49F021CE03E6_493126130280_impl*
 InternalUserList.NotifyCreateUserFinished(Successfull);
//#UC END# *49F021CE03E6_493126130280_impl*
end;//TsdsAdmin.CreateUserFinished

procedure TsdsAdmin.CheckUnsavedUserProperty;
//#UC START# *49F6DB7B0165_493126130280_var*
//#UC END# *49F6DB7B0165_493126130280_var*
begin
//#UC START# *49F6DB7B0165_493126130280_impl*
 InternalUserProperty.CheckUnsavedUserProperty;
//#UC END# *49F6DB7B0165_493126130280_impl*
end;//TsdsAdmin.CheckUnsavedUserProperty

procedure TsdsAdmin.RequestUpdateCurrent;
//#UC START# *49F6E0E901BA_493126130280_var*
//#UC END# *49F6E0E901BA_493126130280_var*
begin
//#UC START# *49F6E0E901BA_493126130280_impl*
 InternalUserList.RequestUpdateCureent;
//#UC END# *49F6E0E901BA_493126130280_impl*
end;//TsdsAdmin.RequestUpdateCurrent

procedure TsdsAdmin.SetDontDeleteIdle(const aNode: Il3SimpleNode;
  aValue: Boolean);
//#UC START# *4F3BE8370292_493126130280_var*
var
 l_UserManager: IUserManager;
//#UC END# *4F3BE8370292_493126130280_var*
begin
//#UC START# *4F3BE8370292_493126130280_impl*
 l_UserManager := defDataAdapter.NativeAdapter.MakeUserManager;
 try
  l_UserManager.SetErasableState(GetUID(aNode), not aValue);
 finally
  l_UserManager := nil;
 end;
//#UC END# *4F3BE8370292_493126130280_impl*
end;//TsdsAdmin.SetDontDeleteIdle

procedure TsdsAdmin.Cleanup;
//#UC START# *479731C50290_493126130280_var*
//#UC END# *479731C50290_493126130280_var*
begin
//#UC START# *479731C50290_493126130280_impl*
 f_Profile := nil;
 inherited;
//#UC END# *479731C50290_493126130280_impl*
end;//TsdsAdmin.Cleanup

procedure TsdsAdmin.InitFields;
//#UC START# *47A042E100E2_493126130280_var*
//#UC END# *47A042E100E2_493126130280_var*
begin
//#UC START# *47A042E100E2_493126130280_impl*
 inherited;
 f_CurrentGroupID := -1;
//#UC END# *47A042E100E2_493126130280_impl*
end;//TsdsAdmin.InitFields

{$If not defined(NoVCM)}
procedure TsdsAdmin.ClearAreas;
 {-}
begin
 if (f_dsUserList <> nil) then f_dsUserList.Referred := nil;
 if (f_dsAdmin <> nil) then f_dsAdmin.Referred := nil;
 if (f_dsUserProperty <> nil) then f_dsUserProperty.Referred := nil;
 if (f_dsGroupsList <> nil) then f_dsGroupsList.Referred := nil;
 inherited;
end;//TsdsAdmin.ClearAreas
{$IfEnd} //not NoVCM

{$IfEnd} //Admin

end.