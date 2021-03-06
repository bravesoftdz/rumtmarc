unit exprTokensList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Expr"
// �����: ����� �.�.
// ������: "w:/common/components/rtl/external/Expr/exprTokensList.pas"
// �����: 31.03.2010 17:10
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Expr::ExprMake::TexprTokensList
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Expr\l3Define.inc}

interface

uses
  l3Interfaces,
  l3ProtoDataContainer,
  l3Memory,
  l3Types,
  l3Core,
  l3Except,
  Classes
  ;

type
 TexprTokenInfo = {$IfDef XE4}record{$Else}object{$EndIf}
  {* ���������� � ������ }
 public
   rChar : Integer; // "������"
   rPos : Integer; // ����������� ������� ������� (� �������� ������)
   rString : Il3CString; // �������������� ������ (���� ����������)
 public
    function IsA(aChar: AnsiChar): Boolean; overload; 
    function IsA(anInt: Integer): Boolean; overload; 
 end;//TexprTokenInfo

 {$Define l3Items_NoSort}

 _ItemType_ = TexprTokenInfo;
 _l3RecordListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3RecordListPrim.imp.pas}
 TexprTokensList = class(_l3RecordListPrim_)
 end;//TexprTokensList

function TexprTokenInfo_C(aChar: Integer;
     aPos: Integer;
     const aString: Il3CString = nil): TexprTokenInfo;
  {* ������ ���������� � ������ }

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class TexprTokensList

procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSame(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_4BB3497F03CC_var*
//#UC END# *47B07CF403D0_4BB3497F03CC_var*
begin
//#UC START# *47B07CF403D0_4BB3497F03CC_impl*
 Result := false;
 Assert(false);
//#UC END# *47B07CF403D0_4BB3497F03CC_impl*
end;//IsSame
{$IfEnd} //not l3Items_IsAtomic

procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_4BB3497F03CC_var*
//#UC END# *47B2C42A0163_4BB3497F03CC_var*
begin
//#UC START# *47B2C42A0163_4BB3497F03CC_impl*
 Assert(false);
//#UC END# *47B2C42A0163_4BB3497F03CC_impl*
end;//AssignItem

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_4BB3497F03CC_var*
//#UC END# *47B99D4503A2_4BB3497F03CC_var*
begin
//#UC START# *47B99D4503A2_4BB3497F03CC_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_4BB3497F03CC_impl*
end;//CompareExistingItems

type _Instance_R_ = TexprTokensList;

{$Include w:\common\components\rtl\Garant\L3\l3RecordListPrim.imp.pas}


function TexprTokenInfo_C(aChar: Integer;
        aPos: Integer;
        const aString: Il3CString = nil): TexprTokenInfo;
  {* ������ ���������� � ������ }
//#UC START# *4BB34BE200EB_4BB34A130179_var*
//#UC END# *4BB34BE200EB_4BB34A130179_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4BB34BE200EB_4BB34A130179_impl*
 Result.rChar := aChar;
 Result.rPos := aPos;
 Result.rString := aString;
//#UC END# *4BB34BE200EB_4BB34A130179_impl*
end;//TexprTokenInfo.C

// start class TexprTokenInfo

function TexprTokenInfo.IsA(aChar: AnsiChar): Boolean;
//#UC START# *4BB34F6602CC_4BB34A130179_var*
//#UC END# *4BB34F6602CC_4BB34A130179_var*
begin
//#UC START# *4BB34F6602CC_4BB34A130179_impl*
 Result := IsA(Integer(aChar));
//#UC END# *4BB34F6602CC_4BB34A130179_impl*
end;//TexprTokenInfo.IsA

function TexprTokenInfo.IsA(anInt: Integer): Boolean;
//#UC START# *4BB34F8B0303_4BB34A130179_var*
//#UC END# *4BB34F8B0303_4BB34A130179_var*
begin
//#UC START# *4BB34F8B0303_4BB34A130179_impl*
 Result := (rChar = anInt);
//#UC END# *4BB34F8B0303_4BB34A130179_impl*
end;//TexprTokenInfo.IsA

end.