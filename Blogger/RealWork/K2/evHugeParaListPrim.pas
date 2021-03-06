unit evHugeParaListPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "K2"
// �����: ����� �.�.
// ������: "w:/common/components/rtl/Garant/K2/evHugeParaListPrim.pas"
// �����: 17.06.2009 15:38
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::K2::k2CoreObjects::TevHugeParaListPrim
//
// ������ ���������� � ������ ������� ������ 32
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\K2\k2Define.inc}

interface

uses
  k2Interfaces,
  l3ProtoPersistentOwnedDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

 {$Define l3Items_NoOwner}

type
//#UC START# *4A6062890343ci*
 {$Define l3Items_NoSort}
//#UC END# *4A6062890343ci*
 _ItemType_ = Ik2Tag;
 _l3InterfaceRefListPrim_Parent_ = Tl3ProtoPersistentOwnedDataContainer;
 {$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefListPrim.imp.pas}
 TevHugeParaListPrim = class(_l3InterfaceRefListPrim_)
  {* ������ ���������� � ������ ������� ������ 32 }
//#UC START# *4A6062890343publ*
//#UC END# *4A6062890343publ*
 end;//TevHugeParaListPrim

implementation

uses
  k2BaseTypes,
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class TevHugeParaListPrim

procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSame(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_4A6062890343_var*
//#UC END# *47B07CF403D0_4A6062890343_var*
begin
//#UC START# *47B07CF403D0_4A6062890343_impl*
 if (A = nil) then
  Result := (B = nil) OR B.IsNull
 else
  Result := A.Box.IsSame(B.Box);
//#UC END# *47B07CF403D0_4A6062890343_impl*
end;//IsSame
{$IfEnd} //not l3Items_IsAtomic

procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_4A6062890343_var*
//#UC END# *47B2C42A0163_4A6062890343_var*
begin
//#UC START# *47B2C42A0163_4A6062890343_impl*
 aTo.AssignTag(aFrom, k2_amAll - [k2_amNull]);
//#UC END# *47B2C42A0163_4A6062890343_impl*
end;//AssignItem

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_4A6062890343_var*
//#UC END# *47B99D4503A2_4A6062890343_var*
begin
//#UC START# *47B99D4503A2_4A6062890343_impl*
 {$IfDef l3Items_HasCustomSort}
 Result := CI.rA^.CompareWithTag(CI.rB^, CI.rSortIndex);
 {$Else  l3Items_HasCustomSort}
 Result := -1;
 Assert(false);
 {$EndIf l3Items_HasCustomSort}
//#UC END# *47B99D4503A2_4A6062890343_impl*
end;//CompareExistingItems

type _Instance_R_ = TevHugeParaListPrim;

{$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefListPrim.imp.pas}


//#UC START# *4A6062890343impl*
//#UC END# *4A6062890343impl*
end.