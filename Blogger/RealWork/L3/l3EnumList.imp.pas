{$IfNDef l3EnumList_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "L3"
// ������: "w:/common/components/rtl/Garant/L3/l3EnumList.imp.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Low Level::L3::l3CoreObjects::l3EnumList
//
// ����������� ������ �� ��������� ������������� ����
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define l3EnumList_imp}
 _l3StandardMemTypedList_Parent_ = _l3EnumList_Parent_;
 {$Include ..\L3\l3StandardMemTypedList.imp.pas}
 _l3EnumList_ = {mixin} class(_l3StandardMemTypedList_)
  {* ����������� ������ �� ��������� ������������� ���� }
 end;//_l3EnumList_

{$Else l3EnumList_imp}

// start class _l3EnumList_

procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;

procedure DoExchange(var A: _ItemType_;
  var B: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  ); forward;

procedure FillItem(var aPlace: _ItemType_;
  const anItem: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  ); forward;

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  ); forward;

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSame(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_49142D7000F3_var*
//#UC END# *47B07CF403D0_49142D7000F3_var*
begin
//#UC START# *47B07CF403D0_49142D7000F3_impl*
 Result := (A = B);
//#UC END# *47B07CF403D0_49142D7000F3_impl*
end;//IsSame
{$IfEnd} //not l3Items_IsAtomic

procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_49142D7000F3_var*
//#UC END# *47B2C42A0163_49142D7000F3_var*
begin
//#UC START# *47B2C42A0163_49142D7000F3_impl*
 Assert(false);
//#UC END# *47B2C42A0163_49142D7000F3_impl*
end;//AssignItem

procedure DoExchange(var A: _ItemType_;
  var B: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  );
//#UC START# *47B5C4080270_49142D7000F3_var*
var
 l_Tmp : _ItemType_;
//#UC END# *47B5C4080270_49142D7000F3_var*
begin
//#UC START# *47B5C4080270_49142D7000F3_impl*
 l_Tmp := A;
 A := B;
 B := l_Tmp;
//#UC END# *47B5C4080270_49142D7000F3_impl*
end;//DoExchange

procedure FillItem(var aPlace: _ItemType_;
  const anItem: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  );
//#UC START# *47B935AF0066_49142D7000F3_var*
//#UC END# *47B935AF0066_49142D7000F3_var*
begin
//#UC START# *47B935AF0066_49142D7000F3_impl*
 aPlace := anItem;
//#UC END# *47B935AF0066_49142D7000F3_impl*
end;//FillItem

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  );
//#UC START# *47B94A5C006E_49142D7000F3_var*
//#UC END# *47B94A5C006E_49142D7000F3_var*
begin
//#UC START# *47B94A5C006E_49142D7000F3_impl*
 // - ������ �� ������
//#UC END# *47B94A5C006E_49142D7000F3_impl*
end;//FreeItem

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_49142D7000F3_var*
//#UC END# *47B99D4503A2_49142D7000F3_var*
begin
//#UC START# *47B99D4503A2_49142D7000F3_impl*
 Result := Ord(CI.rA^) - Ord(CI.rB^);
//#UC END# *47B99D4503A2_49142D7000F3_impl*
end;//CompareExistingItems


{$Include ..\L3\l3StandardMemTypedList.imp.pas}


{$EndIf l3EnumList_imp}
