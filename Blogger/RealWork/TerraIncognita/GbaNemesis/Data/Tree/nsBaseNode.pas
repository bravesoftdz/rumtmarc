unit nsBaseNode;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Data"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Data/Tree/nsBaseNode.pas"
// �����: 21.10.2009 15:05
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 ������� ����������� ���������� �������::LegalDomain::Data::OldTree::TnsBaseNode
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
  BaseTreeSupportUnit,
  l3Tree_TLB,
  nsPrimCacheableNode
  ;

type
 InsCacheable = interface(IUnknown)
   ['{DFCFB2AE-BBBB-44F4-963F-AB185ED1AAAB}']
   procedure ClearNums(aRecursive: Boolean);
   function Next: InsCacheable;
 end;//InsCacheable

 InsLastCache = interface(IUnknown)
   ['{AF66F55C-8880-4568-A079-B9E5C2EC90E8}']
   function Get_LastChild: Il3Node;
   procedure Set_LastChild(const aValue: Il3Node);
   property LastChild: Il3Node
     read Get_LastChild
     write Set_LastChild;
 end;//InsLastCache

 TnsBaseNode = class(TnsPrimCacheableNode, InsCacheable, InsLastCache)
 private
 // private fields
   f_AllChildrenCount : Integer;
   f_ChildNode : Il3Node;
    {* ���� ��� �������� ChildNode}
   f_LastChild : Il3Node;
    {* ���� ��� �������� LastChild}
   f_NextNode : Il3Node;
    {* ���� ��� �������� NextNode}
 protected
 // property methods
   function pm_GetLastChild: Il3Node;
   procedure pm_SetLastChild(const aValue: Il3Node);
 protected
 // realized methods
   procedure ClearNums(aRecursive: Boolean);
   function Next: InsCacheable;
   function Get_LastChild: Il3Node;
   procedure Set_LastChild(const aValue: Il3Node);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   function GetNumInParent(aOnlyOneLevel: Boolean = false): Integer; override;
   function Get_AllChildrenCount: Integer; override;
   procedure IncAllChildrenCount(aInc: Integer); override;
   procedure SortChilds(const aChild: Il3Node = nil); override;
   procedure ReleaseChilds; override;
   procedure Set_ChildNode(const aValue: Il3Node); override;
   function Get_ChildNode: Il3Node; override;
   procedure ClearFields; override;
 protected
 // protected fields
   f_TotalNumInParent : Integer;
   f_ParentNode : Pointer;
   f_PrevNode : Pointer;
 protected
 // protected methods
   procedure ClearCache; virtual;
   procedure CallNextClearNums; virtual;
   procedure DoClearNums; virtual;
   function InsCacheableNext: InsCacheable;
   procedure InsCacheableClearNums(aRecursive: Boolean);
 public
 // public methods
   constructor Create(const aNode: INode;
     aNumInParent: Integer;
     aTotalNumInParent: Integer); reintroduce;
   class function Make(const aNode: INode;
     aNumInParent: Integer = -1;
     aTotalNumInParent: Integer = -1): Il3Node; reintroduce;
 public
 // public properties
   property ChildNode: Il3Node
     read f_ChildNode
     write f_ChildNode;
   property LastChild: Il3Node
     read pm_GetLastChild
     write pm_SetLastChild;
   property NextNode: Il3Node
     read f_NextNode
     write f_NextNode;
 end;//TnsBaseNode

implementation

uses
  SysUtils,
  l3Nodes,
  l3Types,
  l3TreeInterfaces
  ;

// start class TnsBaseNode

constructor TnsBaseNode.Create(const aNode: INode;
  aNumInParent: Integer;
  aTotalNumInParent: Integer);
//#UC START# *4AE05F2A0067_4ADDF4470087_var*
//#UC END# *4AE05F2A0067_4ADDF4470087_var*
begin
//#UC START# *4AE05F2A0067_4ADDF4470087_impl*
 DoClearNums;
 inherited Create(aNode, aNumInParent);
 f_AllChildrenCount := -1;
 f_TotalNumInParent := aTotalNumInParent;
//#UC END# *4AE05F2A0067_4ADDF4470087_impl*
end;//TnsBaseNode.Create

class function TnsBaseNode.Make(const aNode: INode;
  aNumInParent: Integer = -1;
  aTotalNumInParent: Integer = -1): Il3Node;
var
 l_Inst : TnsBaseNode;
begin
 l_Inst := Create(aNode, aNumInParent, aTotalNumInParent);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TnsBaseNode.pm_GetLastChild: Il3Node;
//#UC START# *4ADEE7A00336_4ADDF4470087get_var*
//#UC END# *4ADEE7A00336_4ADDF4470087get_var*
begin
//#UC START# *4ADEE7A00336_4ADDF4470087get_impl*
 Result := f_LastChild;
//#UC END# *4ADEE7A00336_4ADDF4470087get_impl*
end;//TnsBaseNode.pm_GetLastChild

procedure TnsBaseNode.pm_SetLastChild(const aValue: Il3Node);
//#UC START# *4ADEE7A00336_4ADDF4470087set_var*
//#UC END# *4ADEE7A00336_4ADDF4470087set_var*
begin
//#UC START# *4ADEE7A00336_4ADDF4470087set_impl*
 f_LastChild := aValue;
//#UC END# *4ADEE7A00336_4ADDF4470087set_impl*
end;//TnsBaseNode.pm_SetLastChild

procedure TnsBaseNode.ClearCache;
//#UC START# *4ADEE7F1039D_4ADDF4470087_var*
//#UC END# *4ADEE7F1039D_4ADDF4470087_var*
begin
//#UC START# *4ADEE7F1039D_4ADDF4470087_impl*
 f_AdapterCaption := nil;
 f_AllChildrenCount := -1;
//#UC END# *4ADEE7F1039D_4ADDF4470087_impl*
end;//TnsBaseNode.ClearCache

procedure TnsBaseNode.CallNextClearNums;
//#UC START# *4ADEE7FC0068_4ADDF4470087_var*
var
 l_Cacheable : InsCacheable;
//#UC END# *4ADEE7FC0068_4ADDF4470087_var*
begin
//#UC START# *4ADEE7FC0068_4ADDF4470087_impl*
 l_Cacheable := InsCacheableNext;
 while (l_Cacheable <> nil) do
 begin
  l_Cacheable.ClearNums(false);
  l_Cacheable := l_Cacheable.Next;
 end;//while (l_Cacheable
//#UC END# *4ADEE7FC0068_4ADDF4470087_impl*
end;//TnsBaseNode.CallNextClearNums

procedure TnsBaseNode.DoClearNums;
//#UC START# *4ADEE99702C7_4ADDF4470087_var*
//#UC END# *4ADEE99702C7_4ADDF4470087_var*
begin
//#UC START# *4ADEE99702C7_4ADDF4470087_impl*
 f_NumInParent := -1;
 f_TotalNumInParent := -1;
//#UC END# *4ADEE99702C7_4ADDF4470087_impl*
end;//TnsBaseNode.DoClearNums

function TnsBaseNode.InsCacheableNext: InsCacheable;
//#UC START# *4ADEE9B203C9_4ADDF4470087_var*
//#UC END# *4ADEE9B203C9_4ADDF4470087_var*
begin
//#UC START# *4ADEE9B203C9_4ADDF4470087_impl*
 Supports(f_NextNode, InsCacheable, Result);
//#UC END# *4ADEE9B203C9_4ADDF4470087_impl*
end;//TnsBaseNode.InsCacheableNext

procedure TnsBaseNode.InsCacheableClearNums(aRecursive: Boolean);
//#UC START# *4ADEE9D002E9_4ADDF4470087_var*
//#UC END# *4ADEE9D002E9_4ADDF4470087_var*
begin
//#UC START# *4ADEE9D002E9_4ADDF4470087_impl*
 DoClearNums;
 if aRecursive then
  CallNextClearNums;
//#UC END# *4ADEE9D002E9_4ADDF4470087_impl*
end;//TnsBaseNode.InsCacheableClearNums

procedure TnsBaseNode.ClearNums(aRecursive: Boolean);
//#UC START# *4ADEE648003C_4ADDF4470087_var*
//#UC END# *4ADEE648003C_4ADDF4470087_var*
begin
//#UC START# *4ADEE648003C_4ADDF4470087_impl*
 InsCacheableClearNums(aRecursive);
//#UC END# *4ADEE648003C_4ADDF4470087_impl*
end;//TnsBaseNode.ClearNums

function TnsBaseNode.Next: InsCacheable;
//#UC START# *4ADEE659029C_4ADDF4470087_var*
//#UC END# *4ADEE659029C_4ADDF4470087_var*
begin
//#UC START# *4ADEE659029C_4ADDF4470087_impl*
 Result := InsCacheableNext;
//#UC END# *4ADEE659029C_4ADDF4470087_impl*
end;//TnsBaseNode.Next

function TnsBaseNode.Get_LastChild: Il3Node;
//#UC START# *4ADEE67A002B_4ADDF4470087get_var*
//#UC END# *4ADEE67A002B_4ADDF4470087get_var*
begin
//#UC START# *4ADEE67A002B_4ADDF4470087get_impl*
 Result := LastChild;
//#UC END# *4ADEE67A002B_4ADDF4470087get_impl*
end;//TnsBaseNode.Get_LastChild

procedure TnsBaseNode.Set_LastChild(const aValue: Il3Node);
//#UC START# *4ADEE67A002B_4ADDF4470087set_var*
//#UC END# *4ADEE67A002B_4ADDF4470087set_var*
begin
//#UC START# *4ADEE67A002B_4ADDF4470087set_impl*
 LastChild := aValue;
//#UC END# *4ADEE67A002B_4ADDF4470087set_impl*
end;//TnsBaseNode.Set_LastChild

procedure TnsBaseNode.Cleanup;
//#UC START# *479731C50290_4ADDF4470087_var*
//#UC END# *479731C50290_4ADDF4470087_var*
begin
//#UC START# *479731C50290_4ADDF4470087_impl*
 ClearCache;
 inherited;
//#UC END# *479731C50290_4ADDF4470087_impl*
end;//TnsBaseNode.Cleanup

function TnsBaseNode.GetNumInParent(aOnlyOneLevel: Boolean = false): Integer;
//#UC START# *4ADEDD64015A_4ADDF4470087_var*
//#UC END# *4ADEDD64015A_4ADDF4470087_var*
begin
//#UC START# *4ADEDD64015A_4ADDF4470087_impl*
 if aOnlyOneLevel then
  Result := inherited GetNumInParent(aOnlyOneLevel)
 else
 begin
  if (f_TotalNumInParent < 0) then
   f_TotalNumInParent := DoGetNumInParent(false);
  Result := f_TotalNumInParent;
 end;//aOnlyOneLevel
//#UC END# *4ADEDD64015A_4ADDF4470087_impl*
end;//TnsBaseNode.GetNumInParent

function TnsBaseNode.Get_AllChildrenCount: Integer;
//#UC START# *4ADEE8EE025E_4ADDF4470087_var*

 procedure CountChild(const aNode: Il3Node);
 begin
  Inc(Result, aNode.AllChildrenCount);
  Inc(Result);
 end;

//#UC END# *4ADEE8EE025E_4ADDF4470087_var*
begin
//#UC START# *4ADEE8EE025E_4ADDF4470087_impl*
 if (f_AllChildrenCount < 0) then
 begin
  Result := 0;
  IterateF(l3L2NA(@CountChild), imOneLevel);
  f_AllChildrenCount := Result;
 end
 else
  Result := f_AllChildrenCount;
//#UC END# *4ADEE8EE025E_4ADDF4470087_impl*
end;//TnsBaseNode.Get_AllChildrenCount

procedure TnsBaseNode.IncAllChildrenCount(aInc: Integer);
//#UC START# *4ADEE9120163_4ADDF4470087_var*
//#UC END# *4ADEE9120163_4ADDF4470087_var*
begin
//#UC START# *4ADEE9120163_4ADDF4470087_impl*
 if (aInc <> 0) then
 begin
  if (f_AllChildrenCount >= 0) then
   f_AllChildrenCount := f_AllChildrenCount + aInc
  else
   AllChildrenCount;

  if (ParentNode <> nil) then ParentNode.IncAllChildrenCount(aInc);
  CallNextClearNums;
 end;
//#UC END# *4ADEE9120163_4ADDF4470087_impl*
end;//TnsBaseNode.IncAllChildrenCount

procedure TnsBaseNode.SortChilds(const aChild: Il3Node = nil);
//#UC START# *4ADEEA340039_4ADDF4470087_var*

var
 lChild,
 lNextNode,
 lNextOfChild : Il3InternalNode;

 lEndList     : Boolean;

 lUserParam   : Pointer;

 procedure lpMoveNode(const aMoveNode : Il3InternalNode;
                      const aNextNode : Il3InternalNode);
 begin
  // ���� aMoveNode � ��� ����� ����� aNextNode ��� ��� ������������, �� ������ ������ �� ����
  if (not aMoveNode.IsLast and (aMoveNode.NextNode As Il3InternalNode).IsSame(aNextNode)) or
     (aMoveNode.IsFirst and aMoveNode.IsLast) then
   exit;

  Notify(ntMoveBegin, aMoveNode);
  try
   lUserParam := nil;
   aMoveNode.BeginMove(lUserParam);
   try
    // aMoveNode ������������ �� ����� ������
    if aMoveNode.IsLast then
     LastChild := aMoveNode.PrevNode
    else
     if not aMoveNode.IsFirst then
      (aMoveNode.NextNode As Il3InternalNode).PrevNode := aMoveNode.PrevNode
     else
      (aMoveNode.NextNode As Il3InternalNode).PrevNode := nil;

    // aMoveNode ������������ �� ������ ������
    if aMoveNode.IsFirst then
     ChildNode := aMoveNode.NextNode
    else
     if not aMoveNode.IsLast then
      (aMoveNode.PrevNode As Il3InternalNode).NextNode := aMoveNode.NextNode
     else
      (aMoveNode.PrevNode As Il3InternalNode).NextNode := nil;

    
    // aMoveNode ������������ � ����� ������
    if aNextNode = nil then
    begin
     aMoveNode.NextNode := nil;
     aMoveNode.PrevNode := LastChild;
     (aMoveNode.PrevNode As Il3InternalNode).NextNode := aMoveNode;
     LastChild := aMoveNode;
    end
    else
     // aMoveNode ������������ � ������ ������
     if aNextNode.IsFirst then
     begin
      ChildNode := aMoveNode;
      aMoveNode.PrevNode := nil;
      aMoveNode.NextNode := aNextNode;
      aNextNode.PrevNode := aMoveNode;
     end
     else
     begin
      // ��������� aMoveNode ����� aNextNode
      aMoveNode.PrevNode := aNextNode.PrevNode;
      aMoveNode.NextNode := aNextNode;
      (aNextNode.PrevNode As Il3InternalNode).NextNode := aMoveNode;
      aNextNode.PrevNode := aMoveNode;
     end;

    // C��������� �������������� NumInParent � TotalNumInParent
    (aMoveNode as InsCacheable).ClearNums(true);
   finally
    aMoveNode.EndMove(lUserParam);
   end;//try..finally
  finally
   Notify(ntMoveEnd, aMoveNode);
  end;//try..finally
 end;//lpMoveNode

//#UC END# *4ADEEA340039_4ADDF4470087_var*
begin
//#UC START# *4ADEEA340039_4ADDF4470087_impl*
 if not HasChild or // ���� � ������� ����� ��� ����� ���
    ChildNode.IsLast then // ���� � ����� ����� ���� ������� - �� ������ ������ �� ����
  exit;

 if (aChild <> nil) then // ���������������� ���������� �������� ������������ ��������� �����
 begin
  // ���������������� ���������� �������� ������������ ��������� �����
  if not IsSame(aChild.ParentNode) then
   exit;

  lNextNode := (ChildNode as Il3InternalNode);
  lChild := aChild as Il3InternalNode;

  // ���� ������� ��� ����������� ��� l�hild, ������� � lNextNode
  while true do
  begin
   if not lChild.IsSame(lNextNode) then
   begin
    if CompareChild(lChild, lNextNode) < 0 then
     Break; // ������� ��� ����������� �������
   end;//not lChild.IsSameNode(lNextNode)

   lNextNode := lNextNode.NextNode as Il3InternalNode;

   if lNextNode.IsFirst then // ���������� ���� ������ �����
   begin
    lNextNode := nil; // ����� ���������� lChild � ����� ������.
    Break;
   end;
  end;//while true

  lpMoveNode(lChild, lNextNode); // �����������
 end//aChild <> nil
 else // ���������� ���� ����� � �����
 begin
  lChild := ChildNode.NextNode as Il3InternalNode;
  lEndList := lChild.IsLast;
  while true do
  begin
   lNextNode := ChildNode as Il3InternalNode;

   while true do
   begin
    if not lChild.IsSame(lNextNode) then
    begin
     if (CompareChild(lChild, lNextNode) < 0) then
     begin
      lNextOfChild := lChild.NextNode as Il3InternalNode;
      if lNextNode.IsLast then
       lpMoveNode(lChild, nil)
      else
       lpMoveNode(lChild, lNextNode);
      lChild := lNextOfChild;
      Break;
     end
    end
    else
    begin
     lChild := lChild.NextNode as Il3InternalNode;
     Break;
    end;
    lNextNode := lNextNode.NextNode as Il3InternalNode;
   end;//while true

   if lEndList then Break; {����� ������}
   lEndList := lChild.IsLast;
  end;//while true
 end;//aChild <> nil
//#UC END# *4ADEEA340039_4ADDF4470087_impl*
end;//TnsBaseNode.SortChilds

procedure TnsBaseNode.ReleaseChilds;
//#UC START# *4ADEEA5A0206_4ADDF4470087_var*
//#UC END# *4ADEEA5A0206_4ADDF4470087_var*
begin
//#UC START# *4ADEEA5A0206_4ADDF4470087_impl*
 Notify(ntChildClear, Self);
 AllChildrenCount := 0;
 ChildNode := nil;
 AdapterNode := nil;
 LastChild := nil;
//#UC END# *4ADEEA5A0206_4ADDF4470087_impl*
end;//TnsBaseNode.ReleaseChilds

procedure TnsBaseNode.Set_ChildNode(const aValue: Il3Node);
//#UC START# *4ADEEFA00164_4ADDF4470087_var*
//#UC END# *4ADEEFA00164_4ADDF4470087_var*
begin
//#UC START# *4ADEEFA00164_4ADDF4470087_impl*
 ChildNode := aValue;
//#UC END# *4ADEEFA00164_4ADDF4470087_impl*
end;//TnsBaseNode.Set_ChildNode

function TnsBaseNode.Get_ChildNode: Il3Node;
//#UC START# *4ADEF5410241_4ADDF4470087_var*
//#UC END# *4ADEF5410241_4ADDF4470087_var*
begin
//#UC START# *4ADEF5410241_4ADDF4470087_impl*
 Result := ChildNode;
//#UC END# *4ADEF5410241_4ADDF4470087_impl*
end;//TnsBaseNode.Get_ChildNode

procedure TnsBaseNode.ClearFields;
 {-}
begin
 ChildNode := nil;
 LastChild := nil;
 NextNode := nil;
 inherited;
end;//TnsBaseNode.ClearFields

end.