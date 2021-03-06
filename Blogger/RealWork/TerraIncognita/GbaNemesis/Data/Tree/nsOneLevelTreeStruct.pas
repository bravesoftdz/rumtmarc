unit nsOneLevelTreeStruct;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Data"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Data/Tree/nsOneLevelTreeStruct.pas"
// �����: 2005/11/22 18:29:30
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 ������� ����������� ���������� �������::LegalDomain::Data::Tree::TnsOneLevelTreeStruct
//
// ������������� ������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
  nsDataResetTreeStruct,
  DynamicTreeUnit,
  nsINodeWrapBase,
  l3Interfaces,
  l3TreeInterfaces
  ;

type
 TnsOneLevelTreeStruct = {abstract} class(TnsDataResetTreeStruct)
  {* ������������� ������ }
 protected
 // overridden protected methods
   function IsOneLevelPrim: Boolean; override;
   procedure ChangeChildrenCountPrim(aNodeIndex: TVisibleIndex;
    aDelta: Integer;
    const aIndexPath: INodeIndexPath;
    aChildIndex: TIndexInParent); override;
   function GetByVisibleIndex(anIndex: Integer): INodeBase; override;
     {* ���������� ���� �� �������� ������� }
   function RootNodeClass: RnsINodeWrap; override;
     {* ���������� ����� ������� ��� Root }
   function DoChangeExpand(const aNode: Il3SimpleNode;
    aMode: Tl3SetBitType;
    aForceMode: Boolean): Boolean; override;
 end;//TnsOneLevelTreeStruct

implementation

uses
  nsINodeOneLevelRootWrap
  ;

// start class TnsOneLevelTreeStruct

function TnsOneLevelTreeStruct.IsOneLevelPrim: Boolean;
//#UC START# *48FDA0DD02E1_4683692B0105_var*
//#UC END# *48FDA0DD02E1_4683692B0105_var*
begin
//#UC START# *48FDA0DD02E1_4683692B0105_impl*
 Result := True;
//#UC END# *48FDA0DD02E1_4683692B0105_impl*
end;//TnsOneLevelTreeStruct.IsOneLevelPrim

procedure TnsOneLevelTreeStruct.ChangeChildrenCountPrim(aNodeIndex: TVisibleIndex;
  aDelta: Integer;
  const aIndexPath: INodeIndexPath;
  aChildIndex: TIndexInParent);
//#UC START# *48FDA11E02D1_4683692B0105_var*
//#UC END# *48FDA11E02D1_4683692B0105_var*
begin
//#UC START# *48FDA11E02D1_4683692B0105_impl*
 if (aDelta <> 0) and (RootNode <> nil) and (aNodeIndex = 0) then
  inherited;
//#UC END# *48FDA11E02D1_4683692B0105_impl*
end;//TnsOneLevelTreeStruct.ChangeChildrenCountPrim

function TnsOneLevelTreeStruct.GetByVisibleIndex(anIndex: Integer): INodeBase;
//#UC START# *48FDC58F0218_4683692B0105_var*
var
 l_Child: INodeBase;
 l_Index: Integer;
//#UC END# *48FDC58F0218_4683692B0105_var*
begin
//#UC START# *48FDC58F0218_4683692B0105_impl*
 Result := nil;
 if (CurrentNode = nil) then
 begin
  if Get_ShowRoot then
   l_Index := anIndex - 1
  else
   l_Index := anIndex;
  if (RootNode <> nil) then
  begin
   RootNode.GetFirstChild(l_Child);
   try
    if l_Index = 0 then
     Result := l_Child
    else
     l_Child.GetBySibblingIndex(l_Index, Result);
   finally
    l_Child := nil;
   end;//try..finally
  end;//RootNode <> nil
 end//CurrentNode = nil
 else
  CurrentNode.GetBySibblingIndex(anIndex - CurrentNodeIndex, Result);
//#UC END# *48FDC58F0218_4683692B0105_impl*
end;//TnsOneLevelTreeStruct.GetByVisibleIndex

function TnsOneLevelTreeStruct.RootNodeClass: RnsINodeWrap;
//#UC START# *48FEE3640227_4683692B0105_var*
//#UC END# *48FEE3640227_4683692B0105_var*
begin
//#UC START# *48FEE3640227_4683692B0105_impl*
 Result := TnsINodeOneLevelRootWrap;
//#UC END# *48FEE3640227_4683692B0105_impl*
end;//TnsOneLevelTreeStruct.RootNodeClass

function TnsOneLevelTreeStruct.DoChangeExpand(const aNode: Il3SimpleNode;
  aMode: Tl3SetBitType;
  aForceMode: Boolean): Boolean;
//#UC START# *48FEFA1E02E7_4683692B0105_var*
//#UC END# *48FEFA1E02E7_4683692B0105_var*
begin
//#UC START# *48FEFA1E02E7_4683692B0105_impl*
 Result := False;
//#UC END# *48FEFA1E02E7_4683692B0105_impl*
end;//TnsOneLevelTreeStruct.DoChangeExpand

end.