unit nsTreeStruct;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Data"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Data/Tree/nsTreeStruct.pas"
// �����: 22.04.2004 14:06
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 ������� ����������� ���������� �������::LegalDomain::Data::Tree::TnsTreeStruct
//
// ������. ����� � ����������� ������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
  DynamicTreeUnit,
  l3Interfaces,
  l3InternalInterfaces,
  l3TreeInterfaces,
  nsINodeWrapBase,
  nsRootManager
  ;

type
 TnsTreeStruct = class(TnsRootManager, Il3RootSource, Il3SimpleTree, Il3ExpandedSimpleTree)
  {* ������. ����� � ����������� ������ }
 private
 // private fields
   f_ShowRoot : Boolean;
 private
 // private methods
   function GetNodeClass(const aNode: INodeBase): RnsINodeWrap;
     {* ��������� ����� ���� ��� �������� ������� }
 protected
 // property methods
   function pm_GetRoot: Il3SimpleRootNode; virtual;
   procedure pm_SetRoot(const aValue: Il3SimpleRootNode); virtual;
 protected
 // realized methods
   function Get_RootNode: Il3SimpleRootNode;
   procedure Set_RootNode(const aValue: Il3SimpleRootNode);
   procedure CursorTop;
     {* ����������� ������ �� ������ ������� �������. }
   function GetIndex(const aNode: Il3SimpleNode;
    const aSubRootNode: Il3SimpleNode = nil): Integer;
     {* ���������� ������� ������ aNode ������������ aSubRootNode ��� �����. }
   function GetLevel(const aNode: Il3SimpleNode): Integer;
     {* ���������� ������� ���� ������������ �����. }
   procedure SelectAllNodes(aMode: Tl3SetBitType);
     {* ��������/����������� ��� ����. }
   procedure SelectInterval(aFirstIndex: Integer;
    aLastIndex: Integer;
    aMode: Tl3SetBitType;
    aCleanOther: Boolean);
     {* ��������/����������� ���� �� ��������� ���������. }
   function ChangeExpand(const aNode: Il3SimpleNode;
    aMode: Tl3SetBitType;
    aForceMode: Boolean = false): Boolean;
     {* ������ ������������� ����. }
   procedure ExpandSubDir(const aNode: Il3SimpleNode = nil;
    anExpand: Boolean = true;
    aDeepLevel: Byte = 0);
     {* ����������/�������� ����. }
   procedure SetBranchFlag(const aParentNode: Il3SimpleNode;
    aMode: Tl3SetBitType;
    aFlagsMask: Integer;
    anIterMode: Integer);
     {* �����-�� ������������ ��������� � ExpandNode. }
   function CountViewItemsInSubDir(const aNode: Il3SimpleNode): Integer;
     {* �����-�� ������������ ��������� � ShowMoreChildrenOnScreen. }
   function IsRoot(const aNode: Il3SimpleNode): Boolean;
     {* �������� �� ���� �������� ��� ������. }
   function IsExpanded(const aNode: Il3SimpleNode): Boolean;
     {* ������� �� ����. }
   function IsFirstVis(const aNode: Il3SimpleNode): Boolean;
     {* �������� �� ���� ������ ������� � �����. }
   function IsLastVis(const aNode: Il3SimpleNode): Boolean;
     {* �������� �� ���� ��������� ������� � �����. }
   function HasVisibleChildren(const aNode: Il3SimpleNode): Boolean;
     {* ���� �� ������� ���� � aNode. }
   function GetLines(const aNode: Il3SimpleNode): Integer;
     {* ����� ��� ��������� ����� (���� �������� ����������). }
   function Wake: Boolean;
     {* ��������!!! ���� ������ ��������. }
   function MoveNode(const aNode: Il3SimpleNode;
    aDirection: Tl3Direction): Boolean;
     {* ����������� ����. }
   function SearchNameBegin(const aFirstNode: Il3SimpleNode;
    aSrchStr: PAnsiChar;
    aIterMode: Integer): Il3SimpleNode;
     {* �����-�� ������������ ��������� � CharToItem. }
   function SearchNameOccur(const aFirstNode: Il3SimpleNode;
    aSrchStr: PAnsiChar;
    aIterMode: Integer): Il3SimpleNode;
     {* �����-�� ������������ ��������� � SearchOccurStr,  ������� ������ ����� �� ������������. }
   function MakeNodeVisible(const aNode: Il3SimpleNode): Integer;
     {* �����-�� ������������ ��������� � CharToItem, ������ ��� ����������� ������� �� ����. }
   function GetPrev(const aNode: Il3SimpleNode): Il3SimpleNode;
     {* ���������� ����. �����-�� ������������ � CharToItem. }
   function SimpleIterateF(Action: Tl3SimpleNodeAction;
    IterMode: Integer = 0;
    const aSubRootNode: Il3SimpleNode = nil): Il3SimpleNode;
     {* ��������� ��� ���� � ���������� �������� ��� Action. IterMode: imCheckResult, imParentNeed }
   function IsChanging: Boolean;
     {* ������ ��������� � ���� ����������. }
   procedure Changing;
   procedure Changed;
   function Get_ShowRoot: Boolean;
   procedure Set_ShowRoot(aValue: Boolean);
   function Get_CountView: Integer;
   function Get_SelectCount: Integer;
   function Get_Flags(anIndex: Integer): Integer;
   function Get_Select(anIndex: Integer): Boolean;
   procedure Set_Select(anIndex: Integer; aValue: Boolean);
   function Get_Nodes(anIndex: Integer): Il3SimpleNode;
   function FlagIterateF(Action: Tl3SimpleNodeAction;
    FlagMask: Word = 0;
    IterMode: Integer = 0;
    const aSubRootNode: Il3SimpleNode = nil): Il3SimpleNode;
     {* ��������� ��� ����, ��������������� FlagMask, � ���������� �������� ��� Action. IterMode: imCheckResult, imParentNeed }
   function MakeDataObject(const aNode: Il3SimpleNode;
    const aBitmap: IUnknown): IDataObject;
     {* ������� ������ ������ ������, ������������ ��� ����������� ��������� ������ � ������ ���������� }
   function CanAcceptData(const aTargetNode: Il3SimpleNode;
    const aData: Tl3TreeData): Boolean;
   function DropData(const aTargetNode: Il3SimpleNode;
    const aData: Tl3TreeData): Boolean;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure FireChanged; override;
   procedure ChangeChildrenCountPrim(aNodeIndex: TVisibleIndex;
    aDelta: Integer;
    const aIndexPath: INodeIndexPath;
    aChildIndex: TIndexInParent); override;
   function GetShowRoot: Boolean; override;
   procedure ChangingPrim; override;
   procedure ChangedPrim; override;
   procedure ExternalInvalidate; override;
   procedure ExternalVisibleCountChanged(aNewCount: Integer;
    aNodeIndex: Integer;
    aDelta: Integer); override;
     {* ����������� ����������� ������ � ����� ���������� ������� ��������� }
 protected
 // protected fields
   f_Root : Il3SimpleRootNode;
 protected
 // protected methods
   procedure DoSelectAllNodes(aMode: Tl3SetBitType); virtual;
   procedure DoSelectInterval(aFirstIndex: Integer;
     aLastIndex: Integer;
     aMode: Tl3SetBitType;
     aCleanOther: Boolean); virtual;
   procedure RootChanged(const aOld: Il3SimpleRootNode;
    const aNew: Il3SimpleRootNode); virtual;
   procedure MakeRootNode(const aRoot: INodeBase); virtual;
   function IsNodeVisible(const aNode: INodeBase): Boolean;
   procedure SelectCountChanged(anOldCount: Integer;
    aNewCount: Integer);
     {* ����������� ����������� ������ � ����� ���������� ���������� ��������� }
   function RootNodeClass: RnsINodeWrap; virtual;
     {* ���������� ����� ������� ��� Root }
   function MakeChildNode(const aChild: INodeBase): Il3SimpleNode; virtual;
   function DoMakeDataObject(const aData: Il3SimpleNode;
    const aBitmap: Il3Bitmap): IDataObject; virtual;
     {* ������ ������ ������. aData - ������� ������� ������. aBitmap (Il3Bitmap) - �������� ��� �������������� }
   function DoCanAcceptData(const aTargetNode: Il3SimpleNode;
    const aData: Tl3TreeData;
    aProcessed: PBoolean): Boolean; virtual;
   function DoDropData(const aTargetNode: Il3SimpleNode;
    const aData: Tl3TreeData;
    var aProcessed: Boolean): Boolean; virtual;
   procedure ExternalModified(aNode: Integer;
    aDelta: Integer);
     {* � ������ ���� ���������/������� ��������.
             - aNode:
                 ���� ���� �������� ��������/������� ����. ��������� ����������
                 � ����;
             - aDelta:
                 ���������� ��������� ������� ���� ���������/�������. ����
                 aDelta �� ������ ����� �������� ���� �������; }
   function DoChangeExpand(const aNode: Il3SimpleNode;
    aMode: Tl3SetBitType;
    aForceMode: Boolean): Boolean; virtual;
   function GetSelectCount: Integer; virtual;
 public
 // public methods
   constructor Create(const aRoot: INodeBase;
    aShowRoot: Boolean); reintroduce; virtual;
   class function Make(const aRoot: INodeBase;
    aShowRoot: Boolean): Il3SimpleTree; reintroduce;
 protected
 // protected properties
   property Root: Il3SimpleRootNode
     read pm_GetRoot
     write pm_SetRoot;
 end;//TnsTreeStruct

implementation

uses
  SysUtils,
  l3InterfacesMisc,
  l3Nodes,
  l3Bits,
  l3Base,
  l3Types,
  bsInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  nsINodeRootWrap,
  nsINodeWrap,
  BaseTypesUnit
  ;

// start class TnsTreeStruct

procedure TnsTreeStruct.DoSelectAllNodes(aMode: Tl3SetBitType);
//#UC START# *51F1503E01A9_46835B4001A4_var*
var
 l_OldSelectCount,
 l_NewSelectCount: Integer;
//#UC END# *51F1503E01A9_46835B4001A4_var*
begin
//#UC START# *51F1503E01A9_46835B4001A4_impl*
 if RootNode <> nil then
 begin
  l_OldSelectCount := RootNode.GetFlagCount(FM_SELECTION);
  if aMode = sbSelect then
   RootNode.SetAllFlag(FM_SELECTION, True)
  else
   if aMode = sbDeselect then
    RootNode.SetAllFlag(FM_SELECTION, False);
  l_NewSelectCount := RootNode.GetFlagCount(FM_SELECTION);
  SelectCountChanged(l_OldSelectCount, l_NewSelectCount);
 end;
//#UC END# *51F1503E01A9_46835B4001A4_impl*
end;//TnsTreeStruct.DoSelectAllNodes

procedure TnsTreeStruct.DoSelectInterval(aFirstIndex: Integer;
  aLastIndex: Integer;
  aMode: Tl3SetBitType;
  aCleanOther: Boolean);
//#UC START# *51F1508A01EA_46835B4001A4_var*
var
 l_Node: INodeBase;
 l_First,
 l_Last: LongInt;
 l_OldSelectCount,
 l_NewSelectCount: Integer;
//#UC END# *51F1508A01EA_46835B4001A4_var*
begin
//#UC START# *51F1508A01EA_46835B4001A4_impl*
 if CurrentNode <> nil then
 begin
  l_Node := CurrentNode;
  l_First := aFirstIndex - CurrentNodeIndex;
  l_Last := aLastIndex - CurrentNodeIndex;
 end
 else
  if RootNode <> nil then
  begin
   l_Node := RootNode;
   l_First := aFirstIndex;
   l_Last := aLastIndex;
  end
  else
   exit;

 l_OldSelectCount := RootNode.GetFlagCount(FM_SELECTION);
 if aMode = sbSelect then
  l_Node.SetRangeFlag(l_First, l_Last, FM_SELECTION, True, aCleanOther)
 else
  if aMode = sbDeselect then
   l_Node.SetRangeFlag(l_First, l_Last, FM_SELECTION, False, aCleanOther);
 l_NewSelectCount := RootNode.GetFlagCount(FM_SELECTION);
 SelectCountChanged(l_OldSelectCount, l_NewSelectCount);
//#UC END# *51F1508A01EA_46835B4001A4_impl*
end;//TnsTreeStruct.DoSelectInterval

function TnsTreeStruct.pm_GetRoot: Il3SimpleRootNode;
//#UC START# *48FDD9D901BB_46835B4001A4get_var*
//#UC END# *48FDD9D901BB_46835B4001A4get_var*
begin
//#UC START# *48FDD9D901BB_46835B4001A4get_impl*
 Result := f_Root;
//#UC END# *48FDD9D901BB_46835B4001A4get_impl*
end;//TnsTreeStruct.pm_GetRoot

procedure TnsTreeStruct.pm_SetRoot(const aValue: Il3SimpleRootNode);
//#UC START# *48FDD9D901BB_46835B4001A4set_var*
var
 l_Root    : INodeBase;
 l_OldRoot : Il3SimpleRootNode;
//#UC END# *48FDD9D901BB_46835B4001A4set_var*
begin
//#UC START# *48FDD9D901BB_46835B4001A4set_impl*
 if not l3IEQ(f_Root, aValue) then
 begin
  l_OldRoot := f_Root;
  try
   RootNode := nil;
   f_Root := aValue;
   DropCountView;
   Supports(f_Root, INodeBase, l_Root);
   RootNode := l_Root;
   CursorTop;
   RootChanged(l_OldRoot, aValue);
  finally
   l_OldRoot := nil;
  end;//try..finally
 end;//not l3IEQ(f_Root, aValue)
//#UC END# *48FDD9D901BB_46835B4001A4set_impl*
end;//TnsTreeStruct.pm_SetRoot

constructor TnsTreeStruct.Create(const aRoot: INodeBase;
  aShowRoot: Boolean);
//#UC START# *48FDD9270194_46835B4001A4_var*
//#UC END# *48FDD9270194_46835B4001A4_var*
begin
//#UC START# *48FDD9270194_46835B4001A4_impl*
 inherited Create;
 f_ShowRoot := aShowRoot;
 MakeRootNode(aRoot);
//#UC END# *48FDD9270194_46835B4001A4_impl*
end;//TnsTreeStruct.Create

class function TnsTreeStruct.Make(const aRoot: INodeBase;
  aShowRoot: Boolean): Il3SimpleTree;
var
 l_Inst : TnsTreeStruct;
begin
 l_Inst := Create(aRoot, aShowRoot);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TnsTreeStruct.RootChanged(const aOld: Il3SimpleRootNode;
  const aNew: Il3SimpleRootNode);
//#UC START# *48FDDE4B01F5_46835B4001A4_var*

  procedure lp_Notify;
  var
   l_Index : Integer;
   l_Spy   : Il3RootSpy;
   l_Item  : IUnknown;
  begin
   if (NotifiedObjList <> nil) and (NotifiedObjList.Count > 0) then
    for l_Index := 0 to Pred(NotifiedObjList.Count) do
    begin
     l_Item := IUnknown(NotifiedObjList.Items[l_Index]);
     if Supports(l_Item, Il3RootSpy, l_Spy) and (l_Item = l_Spy) then
      l_Spy.RootChanged(aOld, aNew);
    end;//if (NotifiedObjList <> nil)
  end;//lp_Notify

//#UC END# *48FDDE4B01F5_46835B4001A4_var*
begin
//#UC START# *48FDDE4B01F5_46835B4001A4_impl*
 lp_Notify;
//#UC END# *48FDDE4B01F5_46835B4001A4_impl*
end;//TnsTreeStruct.RootChanged

procedure TnsTreeStruct.MakeRootNode(const aRoot: INodeBase);
//#UC START# *48FDDE69025A_46835B4001A4_var*
//#UC END# *48FDDE69025A_46835B4001A4_var*
begin
//#UC START# *48FDDE69025A_46835B4001A4_impl*
 Root := RootNodeClass.Make(aRoot) as Il3SimpleRootNode;
//#UC END# *48FDDE69025A_46835B4001A4_impl*
end;//TnsTreeStruct.MakeRootNode

function TnsTreeStruct.IsNodeVisible(const aNode: INodeBase): Boolean;
//#UC START# *48FDDE8402E9_46835B4001A4_var*
Var
 l_Parent: INodeBase;
 l_PrevParent: INodeBase;
//#UC END# *48FDDE8402E9_46835B4001A4_var*
begin
//#UC START# *48FDDE8402E9_46835B4001A4_impl*
 Result := false;
 if aNode <> nil then
 begin
  aNode.GetParent(l_Parent);
  while l_Parent <> nil do
  begin
   if not l_Parent.HasFlag(FM_OPEN) then
    exit;

   l_Parent.GetParent(l_PrevParent);
   l_Parent := nil;
   l_Parent := l_PrevParent;
  end;
  Result := true;
 end;
//#UC END# *48FDDE8402E9_46835B4001A4_impl*
end;//TnsTreeStruct.IsNodeVisible

procedure TnsTreeStruct.SelectCountChanged(anOldCount: Integer;
  aNewCount: Integer);
//#UC START# *48FDDE9E01C4_46835B4001A4_var*
var
 l_Index : Integer;
 l_Intf  : Il3SelectCountChangedRecipient;
 l_Item  : IUnknown;
//#UC END# *48FDDE9E01C4_46835B4001A4_var*
begin
//#UC START# *48FDDE9E01C4_46835B4001A4_impl*
 if HasNotified then
  for l_Index := Pred(NotifiedObjList.Count) downto 0 do
  begin
   l_Item := IUnknown(NotifiedObjList.Items[l_Index]);
   if Supports(IUnknown(NotifiedObjList[l_Index]), Il3SelectCountChangedRecipient, l_Intf) and (l_Item = l_Intf) then
   try
    l_Intf.SelectCountChanged(anOldCount, aNewCount);
   finally
    l_Intf := nil;
   end;//try..finally
  end;//for
//#UC END# *48FDDE9E01C4_46835B4001A4_impl*
end;//TnsTreeStruct.SelectCountChanged

function TnsTreeStruct.GetNodeClass(const aNode: INodeBase): RnsINodeWrap;
//#UC START# *48FEE33D00A2_46835B4001A4_var*
var
 l_NodeInfo: InsNodeImplementationInfo;
//#UC END# *48FEE33D00A2_46835B4001A4_var*
begin
//#UC START# *48FEE33D00A2_46835B4001A4_impl*
 Result := TnsINodeWrap;
 if RootNode <> nil then
 begin
  if RootNode.IsSameNode(aNode) then
   Result := RootNodeClass
  else
   if Supports(f_Root, InsNodeImplementationInfo, l_NodeInfo) then
    Result := l_NodeInfo.ChildNodeClass;
 end;
//#UC END# *48FEE33D00A2_46835B4001A4_impl*
end;//TnsTreeStruct.GetNodeClass

function TnsTreeStruct.RootNodeClass: RnsINodeWrap;
//#UC START# *48FEE3640227_46835B4001A4_var*
//#UC END# *48FEE3640227_46835B4001A4_var*
begin
//#UC START# *48FEE3640227_46835B4001A4_impl*
 Result := TnsINodeRootWrap;
//#UC END# *48FEE3640227_46835B4001A4_impl*
end;//TnsTreeStruct.RootNodeClass

function TnsTreeStruct.MakeChildNode(const aChild: INodeBase): Il3SimpleNode;
//#UC START# *48FEE50002EB_46835B4001A4_var*
//#UC END# *48FEE50002EB_46835B4001A4_var*
begin
//#UC START# *48FEE50002EB_46835B4001A4_impl*
 Result := GetNodeClass(aChild).Make(aChild);
//#UC END# *48FEE50002EB_46835B4001A4_impl*
end;//TnsTreeStruct.MakeChildNode

function TnsTreeStruct.DoMakeDataObject(const aData: Il3SimpleNode;
  const aBitmap: Il3Bitmap): IDataObject;
//#UC START# *48FEE6210205_46835B4001A4_var*
//#UC END# *48FEE6210205_46835B4001A4_var*
begin
//#UC START# *48FEE6210205_46835B4001A4_impl*
 Result := nil;
//#UC END# *48FEE6210205_46835B4001A4_impl*
end;//TnsTreeStruct.DoMakeDataObject

function TnsTreeStruct.DoCanAcceptData(const aTargetNode: Il3SimpleNode;
  const aData: Tl3TreeData;
  aProcessed: PBoolean): Boolean;
//#UC START# *48FEE78E01B2_46835B4001A4_var*
//#UC END# *48FEE78E01B2_46835B4001A4_var*
begin
//#UC START# *48FEE78E01B2_46835B4001A4_impl*
 Result := False;
//#UC END# *48FEE78E01B2_46835B4001A4_impl*
end;//TnsTreeStruct.DoCanAcceptData

function TnsTreeStruct.DoDropData(const aTargetNode: Il3SimpleNode;
  const aData: Tl3TreeData;
  var aProcessed: Boolean): Boolean;
//#UC START# *48FEE9D303B6_46835B4001A4_var*
//#UC END# *48FEE9D303B6_46835B4001A4_var*
begin
//#UC START# *48FEE9D303B6_46835B4001A4_impl*
 Result := False;
//#UC END# *48FEE9D303B6_46835B4001A4_impl*
end;//TnsTreeStruct.DoDropData

procedure TnsTreeStruct.ExternalModified(aNode: Integer;
  aDelta: Integer);
//#UC START# *48FEEAB703D5_46835B4001A4_var*
var
 l_Index : Integer;
 l_Intf  : Il3ExternalTreeChangedRecipient;
 l_Obj   : IUnknown;
//#UC END# *48FEEAB703D5_46835B4001A4_var*
begin
//#UC START# *48FEEAB703D5_46835B4001A4_impl*
 inherited;
 if HasNotified then
  for l_Index := Pred(NotifiedObjList.Count) downto 0 do
  begin
   l_Obj := IUnknown(NotifiedObjList[l_Index]);
   if Supports(l_Obj, Il3ExternalTreeChangedRecipient, l_Intf) and
      (l_Obj = l_Intf) then
   try
    l_Intf.ExternalModified(aNode, aDelta);
   finally
    l_Intf := nil;
   end;//try..finally
  end;
//#UC END# *48FEEAB703D5_46835B4001A4_impl*
end;//TnsTreeStruct.ExternalModified

function TnsTreeStruct.DoChangeExpand(const aNode: Il3SimpleNode;
  aMode: Tl3SetBitType;
  aForceMode: Boolean): Boolean;
//#UC START# *48FEFA1E02E7_46835B4001A4_var*
var
 l_Node : INodeBase;
//#UC END# *48FEFA1E02E7_46835B4001A4_var*
begin
//#UC START# *48FEFA1E02E7_46835B4001A4_impl*
 if Supports(aNode, INodeBase, l_Node) then
  try
   Result := true;
   Case aMode of
    sbSelect : l_Node.SetFlag(FM_OPEN, true);
    sbDeselect : l_Node.SetFlag(FM_OPEN, false);
    sbInvert : if IsExpanded(aNode) then
                l_Node.SetFlag(FM_OPEN, false)
               else
                l_Node.SetFlag(FM_OPEN, true);
   end;//Case aMode
  finally
   l_Node := nil;
  end//try..finally
 else
  Result := false;
//#UC END# *48FEFA1E02E7_46835B4001A4_impl*
end;//TnsTreeStruct.DoChangeExpand

function TnsTreeStruct.GetSelectCount: Integer;
//#UC START# *48FEFE040094_46835B4001A4_var*
//#UC END# *48FEFE040094_46835B4001A4_var*
begin
//#UC START# *48FEFE040094_46835B4001A4_impl*
 if (RootNode = nil) then
  Result := 0
 else
  Result := RootNode.GetFlagCount(FM_SELECTION);
//#UC END# *48FEFE040094_46835B4001A4_impl*
end;//TnsTreeStruct.GetSelectCount

function TnsTreeStruct.Get_RootNode: Il3SimpleRootNode;
//#UC START# *46825CAA0125_46835B4001A4get_var*
//#UC END# *46825CAA0125_46835B4001A4get_var*
begin
//#UC START# *46825CAA0125_46835B4001A4get_impl*
 Result := Root;
//#UC END# *46825CAA0125_46835B4001A4get_impl*
end;//TnsTreeStruct.Get_RootNode

procedure TnsTreeStruct.Set_RootNode(const aValue: Il3SimpleRootNode);
//#UC START# *46825CAA0125_46835B4001A4set_var*
//#UC END# *46825CAA0125_46835B4001A4set_var*
begin
//#UC START# *46825CAA0125_46835B4001A4set_impl*
 Root := aValue;
//#UC END# *46825CAA0125_46835B4001A4set_impl*
end;//TnsTreeStruct.Set_RootNode

procedure TnsTreeStruct.CursorTop;
//#UC START# *4772448C01D2_46835B4001A4_var*
//#UC END# *4772448C01D2_46835B4001A4_var*
begin
//#UC START# *4772448C01D2_46835B4001A4_impl*
 inherited CursorTop;
//#UC END# *4772448C01D2_46835B4001A4_impl*
end;//TnsTreeStruct.CursorTop

function TnsTreeStruct.GetIndex(const aNode: Il3SimpleNode;
  const aSubRootNode: Il3SimpleNode = nil): Integer;
//#UC START# *4772449B00A1_46835B4001A4_var*
Var
 l_AdapterNode: INodeBase;  
//#UC END# *4772449B00A1_46835B4001A4_var*
begin
//#UC START# *4772449B00A1_46835B4001A4_impl*
// ����� ���� ��������� � ���������� �������� ��������� �� �������
 Result := -1;
 if Supports(aNode, INodeBase, l_AdapterNode) then
 try
  try
   if IsNodeVisible(l_AdapterNode) then
   begin
    if (aSubRootNode <> nil) then
     Result := (aSubRootNode as INodeBase).GetVisibleDelta(l_AdapterNode)
    else
    if (RootNode <> nil) then
    begin
     Result := RootNode.GetVisibleDelta(l_AdapterNode);
     if not Self.GetShowRoot then
      dec(Result);
    end;//RootNode <> nil
   end;//IsNodeVisible(l_AdapterNode)
  except
   on ENotFound do ; // ������ �� �����, ������ -1
  end;//try..except
 finally
  l_AdapterNode := nil;
 end;//try..finally
//#UC END# *4772449B00A1_46835B4001A4_impl*
end;//TnsTreeStruct.GetIndex

function TnsTreeStruct.GetLevel(const aNode: Il3SimpleNode): Integer;
//#UC START# *477244BA0074_46835B4001A4_var*
//#UC END# *477244BA0074_46835B4001A4_var*
begin
//#UC START# *477244BA0074_46835B4001A4_impl*
 if (aNode = nil) then
  Result := 0
 else
 begin
  Result := aNode.GetLevelFor(Root);
// ������ �� �����, �.�. � ������ ��������������  
//  if not ShowRoot then
//   Dec(Result);
 end;
//#UC END# *477244BA0074_46835B4001A4_impl*
end;//TnsTreeStruct.GetLevel

procedure TnsTreeStruct.SelectAllNodes(aMode: Tl3SetBitType);
//#UC START# *477244CE02AE_46835B4001A4_var*
//#UC END# *477244CE02AE_46835B4001A4_var*
begin
//#UC START# *477244CE02AE_46835B4001A4_impl*
 DoSelectAllNodes(aMode);
//#UC END# *477244CE02AE_46835B4001A4_impl*
end;//TnsTreeStruct.SelectAllNodes

procedure TnsTreeStruct.SelectInterval(aFirstIndex: Integer;
  aLastIndex: Integer;
  aMode: Tl3SetBitType;
  aCleanOther: Boolean);
//#UC START# *477244DD0292_46835B4001A4_var*
//#UC END# *477244DD0292_46835B4001A4_var*
begin
//#UC START# *477244DD0292_46835B4001A4_impl*
 DoSelectInterval(aFirstIndex, aLastIndex, aMode, aCleanOther);
//#UC END# *477244DD0292_46835B4001A4_impl*
end;//TnsTreeStruct.SelectInterval

function TnsTreeStruct.ChangeExpand(const aNode: Il3SimpleNode;
  aMode: Tl3SetBitType;
  aForceMode: Boolean = false): Boolean;
//#UC START# *47724512002D_46835B4001A4_var*
//#UC END# *47724512002D_46835B4001A4_var*
begin
//#UC START# *47724512002D_46835B4001A4_impl*
 Result := DoChangeExpand(aNode, aMode, aForceMode);
//#UC END# *47724512002D_46835B4001A4_impl*
end;//TnsTreeStruct.ChangeExpand

procedure TnsTreeStruct.ExpandSubDir(const aNode: Il3SimpleNode = nil;
  anExpand: Boolean = true;
  aDeepLevel: Byte = 0);
//#UC START# *4772452E002D_46835B4001A4_var*
var
 l_SubRoot: Il3SimpleNode;

  {* - ����������/�������� ����. }
  function lpIterator(const aNode : Il3SimpleNode) : Boolean;
  var
   lNode : INodeBase;
  begin
   Result := True;
   // ��� �����
   if not aNode.HasChild then
    Exit;
   // ���� aDeepLevel = 0, �� ������������� ���
   if aDeepLevel > 0 then
    // �������� �� ��������� �� �������� �������
    if aNode.GetLevelFor(l_SubRoot) > aDeepLevel then
     Exit;
   // �������/���������
   if Supports(aNode, INodeBase, lNode) then
   try
    lNode.SetFlag(FM_OPEN, anExpand);
   finally
    lNode := nil;
   end;
  end;

//#UC END# *4772452E002D_46835B4001A4_var*
begin
//#UC START# *4772452E002D_46835B4001A4_impl*
 Changing;
 try
  if Assigned(aNode) then
   l_SubRoot := aNode
  else
   l_SubRoot := Root;

  if (l_SubRoot = nil) then
   // http://mdp.garant.ru/pages/viewpage.action?pageId=95489271&focusedCommentId=95489273#comment-95489273
   Exit;

  if (aDeepLevel = 0) and l_SubRoot.IsSame(Root) then
   Root.ExpandCollapseAll(anExpand)
  else
   SimpleIterateF(l3L2SNA(@lpIterator), 0, aNode);
 finally
  Changed;
 end;
//#UC END# *4772452E002D_46835B4001A4_impl*
end;//TnsTreeStruct.ExpandSubDir

procedure TnsTreeStruct.SetBranchFlag(const aParentNode: Il3SimpleNode;
  aMode: Tl3SetBitType;
  aFlagsMask: Integer;
  anIterMode: Integer);
//#UC START# *477245520298_46835B4001A4_var*
var
 l_Node: INodeBase;  
//#UC END# *477245520298_46835B4001A4_var*
begin
//#UC START# *477245520298_46835B4001A4_impl*
// ������ ��� ������������� � vtOutliner.ExpandNode
 if (anIterMode = 0) and (aFlagsMask = nfSelected) then
 begin
  if Supports(aParentNode, INodeBase, l_Node) then
   l_Node.SetAllFlag(FM_SELECTION, aMode = sbSelect);
 end
 else
  Assert(False);
//#UC END# *477245520298_46835B4001A4_impl*
end;//TnsTreeStruct.SetBranchFlag

function TnsTreeStruct.CountViewItemsInSubDir(const aNode: Il3SimpleNode): Integer;
//#UC START# *4772457D032A_46835B4001A4_var*
//#UC END# *4772457D032A_46835B4001A4_var*
begin
//#UC START# *4772457D032A_46835B4001A4_impl*
 Result := 0// !STUB!
//#UC END# *4772457D032A_46835B4001A4_impl*
end;//TnsTreeStruct.CountViewItemsInSubDir

function TnsTreeStruct.IsRoot(const aNode: Il3SimpleNode): Boolean;
//#UC START# *477245A20228_46835B4001A4_var*
//#UC END# *477245A20228_46835B4001A4_var*
begin
//#UC START# *477245A20228_46835B4001A4_impl*
 Result := (Root <> nil) AND (aNode <> nil) AND Root.IsSame(aNode);
//#UC END# *477245A20228_46835B4001A4_impl*
end;//TnsTreeStruct.IsRoot

function TnsTreeStruct.IsExpanded(const aNode: Il3SimpleNode): Boolean;
//#UC START# *477245B301DE_46835B4001A4_var*
var
 l_Node : INodeBase;
//#UC END# *477245B301DE_46835B4001A4_var*
begin
//#UC START# *477245B301DE_46835B4001A4_impl*
 if Supports(aNode, INodeBase, l_Node) then
  try
   Result := l_Node.HasFlag(FM_OPEN);
  finally
   l_Node := nil;
  end//try..finally
 else
  Result := false;
//#UC END# *477245B301DE_46835B4001A4_impl*
end;//TnsTreeStruct.IsExpanded

function TnsTreeStruct.IsFirstVis(const aNode: Il3SimpleNode): Boolean;
//#UC START# *477245C40171_46835B4001A4_var*
//#UC END# *477245C40171_46835B4001A4_var*
begin
//#UC START# *477245C40171_46835B4001A4_impl*
 if (aNode = nil) then
  Result := true
 else
  Result := aNode.IsFirst; 
//#UC END# *477245C40171_46835B4001A4_impl*
end;//TnsTreeStruct.IsFirstVis

function TnsTreeStruct.IsLastVis(const aNode: Il3SimpleNode): Boolean;
//#UC START# *477245D9031B_46835B4001A4_var*
//#UC END# *477245D9031B_46835B4001A4_var*
begin
//#UC START# *477245D9031B_46835B4001A4_impl*
 if (aNode = nil) then
  Result := true
 else
  Result := aNode.IsLast;
//#UC END# *477245D9031B_46835B4001A4_impl*
end;//TnsTreeStruct.IsLastVis

function TnsTreeStruct.HasVisibleChildren(const aNode: Il3SimpleNode): Boolean;
//#UC START# *477245F301AE_46835B4001A4_var*
//#UC END# *477245F301AE_46835B4001A4_var*
begin
//#UC START# *477245F301AE_46835B4001A4_impl*
 if (aNode = nil) then
  Result := false
 else
  Result := aNode.HasChild; 
//#UC END# *477245F301AE_46835B4001A4_impl*
end;//TnsTreeStruct.HasVisibleChildren

function TnsTreeStruct.GetLines(const aNode: Il3SimpleNode): Integer;
//#UC START# *477246040221_46835B4001A4_var*
var
 lCNode  : Il3SimpleNode;
//#UC END# *477246040221_46835B4001A4_var*
begin
//#UC START# *477246040221_46835B4001A4_impl*
 with Root do
  if IsSame(aNode) then
   Result := 0
  else
  begin
   Result := 1;
   lCNode := aNode.Parent;
   if (lCNode = nil) then
    Result := 0
   else
   begin
    while not IsSame(lCNode) do
    begin
     Result := Result shl 1;
     If not IsLastVis(lCNode) then l3SetBit(Result, 0);

     lCNode := lCNode.Parent;
     If lCNode = nil then Exit;
    end;
   end;//lCNode = nil
  end;//IsSame(aNode)
//#UC END# *477246040221_46835B4001A4_impl*
end;//TnsTreeStruct.GetLines

function TnsTreeStruct.Wake: Boolean;
//#UC START# *4772461601C6_46835B4001A4_var*
//#UC END# *4772461601C6_46835B4001A4_var*
begin
//#UC START# *4772461601C6_46835B4001A4_impl*
 Result := false; // - �� ���� � �� �����
//#UC END# *4772461601C6_46835B4001A4_impl*
end;//TnsTreeStruct.Wake

function TnsTreeStruct.MoveNode(const aNode: Il3SimpleNode;
  aDirection: Tl3Direction): Boolean;
//#UC START# *477246270133_46835B4001A4_var*
//#UC END# *477246270133_46835B4001A4_var*
begin
//#UC START# *477246270133_46835B4001A4_impl*
 Result := false; // !STUB!
//#UC END# *477246270133_46835B4001A4_impl*
end;//TnsTreeStruct.MoveNode

function TnsTreeStruct.SearchNameBegin(const aFirstNode: Il3SimpleNode;
  aSrchStr: PAnsiChar;
  aIterMode: Integer): Il3SimpleNode;
//#UC START# *477246440037_46835B4001A4_var*
//#UC END# *477246440037_46835B4001A4_var*
begin
//#UC START# *477246440037_46835B4001A4_impl*
 Result := nil; // !STUB!
//#UC END# *477246440037_46835B4001A4_impl*
end;//TnsTreeStruct.SearchNameBegin

function TnsTreeStruct.SearchNameOccur(const aFirstNode: Il3SimpleNode;
  aSrchStr: PAnsiChar;
  aIterMode: Integer): Il3SimpleNode;
//#UC START# *4772465F0276_46835B4001A4_var*
//#UC END# *4772465F0276_46835B4001A4_var*
begin
//#UC START# *4772465F0276_46835B4001A4_impl*
 Result := nil; // !STUB!
//#UC END# *4772465F0276_46835B4001A4_impl*
end;//TnsTreeStruct.SearchNameOccur

function TnsTreeStruct.MakeNodeVisible(const aNode: Il3SimpleNode): Integer;
//#UC START# *477246860169_46835B4001A4_var*
Var
 l_Node : INodeBase;
//#UC END# *477246860169_46835B4001A4_var*
begin
//#UC START# *477246860169_46835B4001A4_impl*
 Result := -1;
 if (RootNode <> nil) and
    Supports(aNode, INodeBase, l_Node) then
  try
   l_Node.MakeVisible;
   Result := GetVisibleIndex(l_Node);
  finally
   l_Node := nil;
  end;
//#UC END# *477246860169_46835B4001A4_impl*
end;//TnsTreeStruct.MakeNodeVisible

function TnsTreeStruct.GetPrev(const aNode: Il3SimpleNode): Il3SimpleNode;
//#UC START# *477246A40174_46835B4001A4_var*
//#UC END# *477246A40174_46835B4001A4_var*
begin
//#UC START# *477246A40174_46835B4001A4_impl*
 Result := nil; // !STUB!
//#UC END# *477246A40174_46835B4001A4_impl*
end;//TnsTreeStruct.GetPrev

function TnsTreeStruct.SimpleIterateF(Action: Tl3SimpleNodeAction;
  IterMode: Integer = 0;
  const aSubRootNode: Il3SimpleNode = nil): Il3SimpleNode;
//#UC START# *477246C70141_46835B4001A4_var*
//#UC END# *477246C70141_46835B4001A4_var*
begin
//#UC START# *477246C70141_46835B4001A4_impl*
 Result := FlagIterateF(Action, 0, IterMode, aSubRootNode);
//#UC END# *477246C70141_46835B4001A4_impl*
end;//TnsTreeStruct.SimpleIterateF

function TnsTreeStruct.IsChanging: Boolean;
//#UC START# *477246E802B1_46835B4001A4_var*
//#UC END# *477246E802B1_46835B4001A4_var*
begin
//#UC START# *477246E802B1_46835B4001A4_impl*
 Result := inherited IsChanging;
//#UC END# *477246E802B1_46835B4001A4_impl*
end;//TnsTreeStruct.IsChanging

procedure TnsTreeStruct.Changing;
//#UC START# *477246F7039B_46835B4001A4_var*
//#UC END# *477246F7039B_46835B4001A4_var*
begin
//#UC START# *477246F7039B_46835B4001A4_impl*
 inherited Changing;
//#UC END# *477246F7039B_46835B4001A4_impl*
end;//TnsTreeStruct.Changing

procedure TnsTreeStruct.Changed;
//#UC START# *4772470100BC_46835B4001A4_var*
//#UC END# *4772470100BC_46835B4001A4_var*
begin
//#UC START# *4772470100BC_46835B4001A4_impl*
 inherited Changed;
//#UC END# *4772470100BC_46835B4001A4_impl*
end;//TnsTreeStruct.Changed

function TnsTreeStruct.Get_ShowRoot: Boolean;
//#UC START# *477248FE005A_46835B4001A4get_var*
//#UC END# *477248FE005A_46835B4001A4get_var*
begin
//#UC START# *477248FE005A_46835B4001A4get_impl*
 Result := GetShowRoot;
//#UC END# *477248FE005A_46835B4001A4get_impl*
end;//TnsTreeStruct.Get_ShowRoot

procedure TnsTreeStruct.Set_ShowRoot(aValue: Boolean);
//#UC START# *477248FE005A_46835B4001A4set_var*
//#UC END# *477248FE005A_46835B4001A4set_var*
begin
//#UC START# *477248FE005A_46835B4001A4set_impl*
 f_ShowRoot := aValue;
 CursorTop;
//#UC END# *477248FE005A_46835B4001A4set_impl*
end;//TnsTreeStruct.Set_ShowRoot

function TnsTreeStruct.Get_CountView: Integer;
//#UC START# *4772490E02F7_46835B4001A4get_var*
//#UC END# *4772490E02F7_46835B4001A4get_var*
begin
//#UC START# *4772490E02F7_46835B4001A4get_impl*
 Result := CountView;
//#UC END# *4772490E02F7_46835B4001A4get_impl*
end;//TnsTreeStruct.Get_CountView

function TnsTreeStruct.Get_SelectCount: Integer;
//#UC START# *4772491C01C5_46835B4001A4get_var*
//#UC END# *4772491C01C5_46835B4001A4get_var*
begin
//#UC START# *4772491C01C5_46835B4001A4get_impl*
 Result := GetSelectCount;
//#UC END# *4772491C01C5_46835B4001A4get_impl*
end;//TnsTreeStruct.Get_SelectCount

function TnsTreeStruct.Get_Flags(anIndex: Integer): Integer;
//#UC START# *4772495902EE_46835B4001A4get_var*
var
 l_Node : Il3SimpleNode;
//#UC END# *4772495902EE_46835B4001A4get_var*
begin
//#UC START# *4772495902EE_46835B4001A4get_impl*
 l_Node := Get_Nodes(anIndex);
 if (l_Node = nil) then
  Result := 0
 else
  Result := l_Node.Flags;
//#UC END# *4772495902EE_46835B4001A4get_impl*
end;//TnsTreeStruct.Get_Flags

function TnsTreeStruct.Get_Select(anIndex: Integer): Boolean;
//#UC START# *477249AB0057_46835B4001A4get_var*
var
 l_Node : INodeBase;
//#UC END# *477249AB0057_46835B4001A4get_var*
begin
//#UC START# *477249AB0057_46835B4001A4get_impl*
 l_Node := GetINode(anIndex);
 if (l_Node = nil) then
  Result := false
 else
  Result := l_Node.HasFlag(FM_SELECTION);
//#UC END# *477249AB0057_46835B4001A4get_impl*
end;//TnsTreeStruct.Get_Select

procedure TnsTreeStruct.Set_Select(anIndex: Integer; aValue: Boolean);
//#UC START# *477249AB0057_46835B4001A4set_var*
var
 l_Node : INodeBase;
 l_CurSelectCount: Integer;
//#UC END# *477249AB0057_46835B4001A4set_var*
begin
//#UC START# *477249AB0057_46835B4001A4set_impl*
 l_Node := GetINode(anIndex);
 if (l_Node <> nil) then
 begin
  l_Node.SetFlag(FM_SELECTION, aValue);
  if (RootNode <> nil) then
  begin
   l_CurSelectCount := RootNode.GetFlagCount(FM_SELECTION);
   if aValue then
    SelectCountChanged(l_CurSelectCount - 1, l_CurSelectCount)
   else
    SelectCountChanged(l_CurSelectCount + 1, l_CurSelectCount);
  end;//RootNode <> nil
 end;//l_Node <> nil
//#UC END# *477249AB0057_46835B4001A4set_impl*
end;//TnsTreeStruct.Set_Select

function TnsTreeStruct.Get_Nodes(anIndex: Integer): Il3SimpleNode;
//#UC START# *477249EB02D9_46835B4001A4get_var*
//#UC END# *477249EB02D9_46835B4001A4get_var*
begin
//#UC START# *477249EB02D9_46835B4001A4get_impl*
 Result := MakeChildNode(GetINode(anIndex));
//#UC END# *477249EB02D9_46835B4001A4get_impl*
end;//TnsTreeStruct.Get_Nodes

function TnsTreeStruct.FlagIterateF(Action: Tl3SimpleNodeAction;
  FlagMask: Word = 0;
  IterMode: Integer = 0;
  const aSubRootNode: Il3SimpleNode = nil): Il3SimpleNode;
//#UC START# *47724AB70207_46835B4001A4_var*
var
 l_RootNeeded,
 l_CheckResult,
 l_OneLevel,
 l_ActionResult : Boolean;
 l_RootNode,
 l_ChildNode    : INodeBase;
 l_NodeIterator : INodeIterator;
 l_Node         : Il3SimpleNode;
 l_Root         : Il3SimpleNode;
//#UC END# *47724AB70207_46835B4001A4_var*
begin
//#UC START# *47724AB70207_46835B4001A4_impl*
 Result := nil;
 try
  if (aSubRootNode = nil) then
   l_Root := Root
  else
   l_Root := aSubRootNode;

  if Supports(l_Root , INodeBase, l_RootNode) then
  begin
   l_CheckResult := l3TestMask(IterMode, imCheckResult);
   l_RootNeeded := l3TestMask(IterMode, imParentNeed);
   l_OneLevel := l3TestMask(IterMode, imOneLevel);

   l_RootNode.IterateNodes(FlagMask, l_NodeIterator);

   if l_RootNeeded then
   begin
    l_Node := MakeChildNode(l_RootNode);
    l_ActionResult := Action(l_Node);                   
    if l_ActionResult then
     Result := l_Node;
   end//l_RootNeeded
   else
    l_ActionResult := false;

   while not (l_CheckResult and l_ActionResult) do
   begin
    l_NodeIterator.GetNext(l_ChildNode);
    if (l_ChildNode <> nil) then
    begin
     l_Node := MakeChildNode(l_ChildNode);
     if l_OneLevel and (l_Node.GetLevelFor(l_Root) <> 1) then
      Continue;
     l_ActionResult := Action(l_Node);
     if l_ActionResult then
      Result := l_Node;
    end//l_ChildNode <> nil
    else
     Break;
   end;//while not (l_CheckResult and l_ActionResult)
  end;//l_RootNode <> nil
 finally
  l3FreeFA(Tl3FreeAction(Action));
 end;//try..finally
//#UC END# *47724AB70207_46835B4001A4_impl*
end;//TnsTreeStruct.FlagIterateF

function TnsTreeStruct.MakeDataObject(const aNode: Il3SimpleNode;
  const aBitmap: IUnknown): IDataObject;
//#UC START# *47A86EA80292_46835B4001A4_var*
//#UC END# *47A86EA80292_46835B4001A4_var*
begin
//#UC START# *47A86EA80292_46835B4001A4_impl*
 Result := DoMakeDataObject(aNode, aBitmap As Il3Bitmap);
//#UC END# *47A86EA80292_46835B4001A4_impl*
end;//TnsTreeStruct.MakeDataObject

function TnsTreeStruct.CanAcceptData(const aTargetNode: Il3SimpleNode;
  const aData: Tl3TreeData): Boolean;
//#UC START# *47BAD3080349_46835B4001A4_var*
var
 l_Processed: Boolean;
//#UC END# *47BAD3080349_46835B4001A4_var*
begin
//#UC START# *47BAD3080349_46835B4001A4_impl*
 l_Processed := False;
 Result := DoCanAcceptData(aTargetNode, aData, @l_Processed);
 if not l_Processed and (aTargetNode <> nil) then
  Result := aTargetNode.CanAcceptData(aData);
//#UC END# *47BAD3080349_46835B4001A4_impl*
end;//TnsTreeStruct.CanAcceptData

function TnsTreeStruct.DropData(const aTargetNode: Il3SimpleNode;
  const aData: Tl3TreeData): Boolean;
//#UC START# *47BAD32501E2_46835B4001A4_var*

  procedure lp_Notify;
  var
   l_Index    : Integer;
   l_Item     : IUnknown;
   l_Listener : InsDropListener;
  begin
   for l_Index := 0 to Pred(NotifiedObjList.Count) do
   begin
    l_Item := IUnknown(NotifiedObjList.Items[l_Index]);
    if Supports(l_Item, InsDropListener, l_Listener) and
      (l_Item = l_Listener) then
     l_Listener.DataDropped; 
   end;//for l_Index := 0 to Pred(NotifiedObjList.Count) do
  end;//lp_Notify

var
 l_Processed: Boolean;
//#UC END# *47BAD32501E2_46835B4001A4_var*
begin
//#UC START# *47BAD32501E2_46835B4001A4_impl*
 l_Processed := False;
 // ��������� ������ ������:
 Result := DoDropData(aTargetNode, aData, l_Processed);
 // ��������� ������ ����:
 if not l_Processed and (aTargetNode <> nil) then
  Result := aTargetNode.DropData(aData);
 // �������� � ����� ������:
 if Result then
  lp_Notify;
//#UC END# *47BAD32501E2_46835B4001A4_impl*
end;//TnsTreeStruct.DropData

procedure TnsTreeStruct.Cleanup;
//#UC START# *479731C50290_46835B4001A4_var*
//#UC END# *479731C50290_46835B4001A4_var*
begin
//#UC START# *479731C50290_46835B4001A4_impl*
 Root := nil;
 inherited;
//#UC END# *479731C50290_46835B4001A4_impl*
end;//TnsTreeStruct.Cleanup

procedure TnsTreeStruct.FireChanged;
//#UC START# *48FC9D300237_46835B4001A4_var*
//#UC END# *48FC9D300237_46835B4001A4_var*
begin
//#UC START# *48FC9D300237_46835B4001A4_impl*
 try
  CursorTop;
  inherited;
 except
  on ECannotFindData do ;
  // - ����� �����-�� ���������� � ��������
  // - ���� �������� �������� ����� �������� ������� ������
 end;//try..except
//#UC END# *48FC9D300237_46835B4001A4_impl*
end;//TnsTreeStruct.FireChanged

procedure TnsTreeStruct.ChangeChildrenCountPrim(aNodeIndex: TVisibleIndex;
  aDelta: Integer;
  const aIndexPath: INodeIndexPath;
  aChildIndex: TIndexInParent);
//#UC START# *48FDA11E02D1_46835B4001A4_var*

 function lp_ConvertChildIndexToVisibleIndex(const aParent: INodeBase; aChildIndex: TIndexInParent; aResult: Integer): Integer;
 var
  l_ChildNode: INodeBase;
  l_FirstChild: INodeBase;
  l_IDX: Integer;
 begin
  if aChildIndex = 0 then
  begin
   Result := aResult;
   Exit;
  end;
  if aParent = nil then
  begin
   Result := aChildIndex;
   Exit;
  end;
  aParent.GetFirstChild(l_FirstChild);
  l_ChildNode := l_FirstChild;
  try
   try
    for l_IDX := 1 to aChildIndex - 1 do
    begin
     l_FirstChild.GetNext(l_ChildNode);
     l_FirstChild := l_ChildNode;
    end;
    if Assigned(l_ChildNode) then
     Result := RootNode.GetVisibleDelta(l_ChildNode)
    else
     Result := aResult + aChildIndex;
   finally
    l_ChildNode := nil;
   end;
  finally
   l_FirstChild := nil;
  end;
 end;

 function lp_MakeNodeIndex: Integer;
 var
  l_Node        : INodeBase;
  l_ParentIndex : Integer;
 begin
  Result := -1;
  if (aIndexPath.Count > 1) then
  begin
   try
    RootNode.GetNodeByPath(aIndexPath, l_Node);
    try
     l_ParentIndex := RootNode.GetVisibleDelta(l_Node);
     Result := l_ParentIndex;
     if aChildIndex = IIP_BEFORE_LEFT_CHILD then
      Dec(Result)
     else
      Result := lp_ConvertChildIndexToVisibleIndex(l_Node, aChildIndex, Result);
    finally
     l_Node := nil;
    end;{try..finally}
   except
    on ENotFound do begin end;
   end;{try..except}
  end//if (aIndexPath.GetCount > 1) then
  else
   if aChildIndex = IIP_BEFORE_LEFT_CHILD then
    Result := -1
   else
    Result := lp_ConvertChildIndexToVisibleIndex(RootNode, aChildIndex, Result);
  if (Result <> -1) and not GetShowRoot then
   Dec(Result);
 end;//lp_MakeNodeIndex

//#UC END# *48FDA11E02D1_46835B4001A4_var*
begin
//#UC START# *48FDA11E02D1_46835B4001A4_impl*
 inherited;
 if (aNodeIndex = -1) then
 begin
  if Assigned(aIndexPath) then
   ExternalModified(lp_MakeNodeIndex, aDelta);
  CallNotify(ntCountChange, 0);
 end;//if (aNodeIndex = -1) then
//#UC END# *48FDA11E02D1_46835B4001A4_impl*
end;//TnsTreeStruct.ChangeChildrenCountPrim

function TnsTreeStruct.GetShowRoot: Boolean;
//#UC START# *48FDA1A60056_46835B4001A4_var*
//#UC END# *48FDA1A60056_46835B4001A4_var*
begin
//#UC START# *48FDA1A60056_46835B4001A4_impl*
 Result := f_ShowRoot;
//#UC END# *48FDA1A60056_46835B4001A4_impl*
end;//TnsTreeStruct.GetShowRoot

procedure TnsTreeStruct.ChangingPrim;
//#UC START# *48FDA1C3002E_46835B4001A4_var*
//#UC END# *48FDA1C3002E_46835B4001A4_var*
begin
//#UC START# *48FDA1C3002E_46835B4001A4_impl*
 inherited;
 if (g_Dispatcher <> nil) then
  g_Dispatcher.LockActionUpdate;
//#UC END# *48FDA1C3002E_46835B4001A4_impl*
end;//TnsTreeStruct.ChangingPrim

procedure TnsTreeStruct.ChangedPrim;
//#UC START# *48FDA1D0006F_46835B4001A4_var*
//#UC END# *48FDA1D0006F_46835B4001A4_var*
begin
//#UC START# *48FDA1D0006F_46835B4001A4_impl*
 inherited;
 if (g_Dispatcher <> nil) then
  g_Dispatcher.UnLockActionUpdate;
//#UC END# *48FDA1D0006F_46835B4001A4_impl*
end;//TnsTreeStruct.ChangedPrim

procedure TnsTreeStruct.ExternalInvalidate;
//#UC START# *48FDA1E701DF_46835B4001A4_var*
var
 l_Index: Integer;
 l_Intf  : Il3ExternalTreeChangedRecipient;
//#UC END# *48FDA1E701DF_46835B4001A4_var*
begin
//#UC START# *48FDA1E701DF_46835B4001A4_impl*
 inherited;
 if HasNotified then
  for l_Index := Pred(NotifiedObjList.Count) downto 0 do
   if Supports(IUnknown(NotifiedObjList[l_Index]), Il3ExternalTreeChangedRecipient, l_Intf) then
   try
    l_Intf.ExternalInvalidate;
   finally
    l_Intf := nil;
   end;//try..finally
//#UC END# *48FDA1E701DF_46835B4001A4_impl*
end;//TnsTreeStruct.ExternalInvalidate

procedure TnsTreeStruct.ExternalVisibleCountChanged(aNewCount: Integer;
  aNodeIndex: Integer;
  aDelta: Integer);
//#UC START# *48FDA30E0390_46835B4001A4_var*
var
 l_Index : Integer;
 l_Intf  : Il3ExternalTreeChangedRecipient;
 l_Obj   : IUnknown;
//#UC END# *48FDA30E0390_46835B4001A4_var*
begin
//#UC START# *48FDA30E0390_46835B4001A4_impl*
 inherited;
 if HasNotified then
  for l_Index := Pred(NotifiedObjList.Count) downto 0 do
  begin
   l_Obj := IUnknown(NotifiedObjList[l_Index]);
   if Supports(l_Obj, Il3ExternalTreeChangedRecipient, l_Intf) and
      (l_Obj = l_Intf) then
   try
    l_Intf.ExternalVisibleCountChanged(aNewCount, aNodeIndex, aDelta);
   finally
    l_Intf := nil;
   end;//try..finally
  end;
//#UC END# *48FDA30E0390_46835B4001A4_impl*
end;//TnsTreeStruct.ExternalVisibleCountChanged

end.