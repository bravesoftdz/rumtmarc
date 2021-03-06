unit evSavedCursorListPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evSavedCursorListPrim.pas"
// �����: 21.03.2008
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Cursors::TevSavedCursorListPrim
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  evSavedCursor,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = TevSavedCursor;
 _l3UncomparabeObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3UncomparabeObjectRefList.imp.pas}
 TevSavedCursorListPrim = class(_l3UncomparabeObjectRefList_)
 end;//TevSavedCursorListPrim

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class TevSavedCursorListPrim

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_47E3E5A102C9_var*
//#UC END# *47B2C42A0163_47E3E5A102C9_var*
begin
//#UC START# *47B2C42A0163_47E3E5A102C9_impl*
 Assert(false);
//#UC END# *47B2C42A0163_47E3E5A102C9_impl*
end;//AssignItem

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_47E3E5A102C9_var*
//#UC END# *47B99D4503A2_47E3E5A102C9_var*
begin
//#UC START# *47B99D4503A2_47E3E5A102C9_impl*
 Assert(false);
 Result := -1;
//#UC END# *47B99D4503A2_47E3E5A102C9_impl*
end;//CompareExistingItems

type _Instance_R_ = TevSavedCursorListPrim;

{$Include w:\common\components\rtl\Garant\L3\l3UncomparabeObjectRefList.imp.pas}

end.