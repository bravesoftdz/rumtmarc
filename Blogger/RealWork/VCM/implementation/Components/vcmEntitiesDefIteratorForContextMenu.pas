unit vcmEntitiesDefIteratorForContextMenu;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "VCM"
// ������: "w:/common/components/gui/Garant/VCM/implementation/Components/vcmEntitiesDefIteratorForContextMenu.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::VCM::Components::TvcmEntitiesDefIteratorForContextMenu
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If not defined(NoVCM)}
uses
  vcmInterfaces,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
type
 _ItemType_ = IvcmEntityDef;
 _l3InterfaceRefListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefListPrim.imp.pas}
 TvcmEntitiesDefIteratorForContextMenu = class(_l3InterfaceRefListPrim_, IvcmEntitiesDefIterator)
 private
 // private fields
   f_Iter : IvcmEntitiesDefIterator;
   f_Index : Integer;
 protected
 // realized methods
   function Get_Next: IvcmEntityDef;
 protected
 // overridden protected methods
   procedure ClearFields; override;
 public
 // public methods
   constructor Create(const anIter: IvcmEntitiesDefIterator); reintroduce;
   class function Make(const anIter: IvcmEntitiesDefIterator): IvcmEntitiesDefIterator; reintroduce;
     {* ��������� ������� TvcmEntitiesDefIteratorForContextMenu.Make }
 end;//TvcmEntitiesDefIteratorForContextMenu
{$IfEnd} //not NoVCM

implementation

{$If not defined(NoVCM)}
uses
  vcmEntityDefForContextMenu,
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}

// start class TvcmEntitiesDefIteratorForContextMenu

procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSame(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_51D128930090_var*
//#UC END# *47B07CF403D0_51D128930090_var*
begin
//#UC START# *47B07CF403D0_51D128930090_impl*
 Result := (A = B);
//#UC END# *47B07CF403D0_51D128930090_impl*
end;//IsSame
{$IfEnd} //not l3Items_IsAtomic

procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_51D128930090_var*
//#UC END# *47B2C42A0163_51D128930090_var*
begin
//#UC START# *47B2C42A0163_51D128930090_impl*
 assert(false);
//#UC END# *47B2C42A0163_51D128930090_impl*
end;//AssignItem

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_51D128930090_var*
//#UC END# *47B99D4503A2_51D128930090_var*
begin
//#UC START# *47B99D4503A2_51D128930090_impl*
  Result := CI.rA.ContextMenuWeight - CI.rB.ContextMenuWeight;
//#UC END# *47B99D4503A2_51D128930090_impl*
end;//CompareExistingItems

type _Instance_R_ = TvcmEntitiesDefIteratorForContextMenu;

{$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefListPrim.imp.pas}

// start class TvcmEntitiesDefIteratorForContextMenu

constructor TvcmEntitiesDefIteratorForContextMenu.Create(const anIter: IvcmEntitiesDefIterator);
//#UC START# *51D12A5F02EE_51D128930090_var*
var
 l_E : IvcmEntityDef;
//#UC END# *51D12A5F02EE_51D128930090_var*
begin
//#UC START# *51D12A5F02EE_51D128930090_impl*
 inherited Create;
 f_Index := 0;
 f_Iter := anIter;

 // ��� ����� �����, ������ ��� ����� �������� ������� �������� �
 // ����������� (��������) ������
 // http://mdp.garant.ru/pages/viewpage.action?pageId=467276976
 Self.Duplicates := l3_dupAccept;
 Self.Sorted := true;
 while true do
 begin
  l_E := anIter.Next;
  if (l_E = nil) then
   break;
  Self.Add(l_E);
 end;
//#UC END# *51D12A5F02EE_51D128930090_impl*
end;//TvcmEntitiesDefIteratorForContextMenu.Create

class function TvcmEntitiesDefIteratorForContextMenu.Make(const anIter: IvcmEntitiesDefIterator): IvcmEntitiesDefIterator;
var
 l_Inst : TvcmEntitiesDefIteratorForContextMenu;
begin
 if (anIter = nil) then
 begin
  Result := nil;
  Exit;
 end;//anIter = nil
 l_Inst := Create(anIter);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TvcmEntitiesDefIteratorForContextMenu.Get_Next: IvcmEntityDef;
//#UC START# *49956DB300D6_51D128930090get_var*
//#UC END# *49956DB300D6_51D128930090get_var*
begin
//#UC START# *49956DB300D6_51D128930090get_impl*
 if (f_Index >= Self.Count) then
  Result := nil
 else
 begin
  Result := TvcmEntityDefForContextMenu.Make(Self.Items[f_Index]);
  Inc(f_Index);
 end;
//#UC END# *49956DB300D6_51D128930090get_impl*
end;//TvcmEntitiesDefIteratorForContextMenu.Get_Next

procedure TvcmEntitiesDefIteratorForContextMenu.ClearFields;
 {-}
begin
 f_Iter := nil;
 inherited;
end;//TvcmEntitiesDefIteratorForContextMenu.ClearFields

{$IfEnd} //not NoVCM

end.