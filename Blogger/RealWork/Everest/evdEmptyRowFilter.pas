unit evdEmptyRowFilter;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ������ �.�
// ������: "w:/common/components/gui/Garant/Everest/evdEmptyRowFilter.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Generators::TevdEmptyRowFilter
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  evdBufferedFilter,
  k2Types,
  k2Interfaces
  ;

type
 TevdEmptyRowFilter = class(TevdBufferedFilter)
 private
 // private fields
   f_Empty : Boolean;
    {* �������, ��� ������ �������.}
   f_MergedFlag : Boolean;
    {* ���� ��� ����������� ��������, ��� �� ������ �������� MergeStatus
        �� ���� - ��� �� ������, ��� ������ ������.}
   f_NeedCache : Boolean;
    {* ������� ����� �� �������� ����������� ��������� ������.}
   f_OnlyHead : Boolean;
    {* ������ ������ ������ ����������� � ������.}
 protected
 // overridden protected methods
   procedure StartChild(TypeID: Integer); override;
   procedure CloseStructure(NeedUndo: Boolean); override;
     {* ���������� �� ������������� "������". ��� ���������� � ��������. }
   procedure AddAtomEx(AtomIndex: Integer;
    const Value: Tk2Variant); override;
   function NeedStartBuffering(aID: Integer): Boolean; override;
   function NeedFlushBuffer(const aLeaf: Ik2Tag;
     aTagId: Integer): Boolean; override;
 end;//TevdEmptyRowFilter

implementation

uses
  evdTypes,
  k2Tags,
  TableRow_Const,
  Table_Const,
  TableCell_Const
  ;

// start class TevdEmptyRowFilter

procedure TevdEmptyRowFilter.StartChild(TypeID: Integer);
//#UC START# *4836D4650177_4C07BD030266_var*
//#UC END# *4836D4650177_4C07BD030266_var*
begin
//#UC START# *4836D4650177_4C07BD030266_impl*
 if TypeID = k2_idTable then
  f_NeedCache := False;
 if TypeID = k2_idTableRow then
  f_OnlyHead := True; 
 if TypeID = k2_idTableCell then
  f_MergedFlag := False;
 if (SkipLevel = 2) and not f_Empty then
  StopBufferingAndFlush(False, TopObject[0], False);
 inherited;
//#UC END# *4836D4650177_4C07BD030266_impl*
end;//TevdEmptyRowFilter.StartChild

procedure TevdEmptyRowFilter.CloseStructure(NeedUndo: Boolean);
//#UC START# *4836D4C20059_4C07BD030266_var*
//#UC END# *4836D4C20059_4C07BD030266_var*
begin
//#UC START# *4836D4C20059_4C07BD030266_impl*
 if CurrentType.InheritsFrom(k2_idTableCell) and not f_MergedFlag then
 begin
  f_Empty := False;
  f_OnlyHead := False;
 end; // if CurrentType.InheritsFrom(k2_idTableCell) and not f_MergedFlag then
 if CurrentType.InheritsFrom(k2_idTableRow) and not f_OnlyHead then
  f_NeedCache := False;
 inherited;
//#UC END# *4836D4C20059_4C07BD030266_impl*
end;//TevdEmptyRowFilter.CloseStructure

procedure TevdEmptyRowFilter.AddAtomEx(AtomIndex: Integer;
  const Value: Tk2Variant);
//#UC START# *4836D52400D9_4C07BD030266_var*
var
 l_MS : TevMergeStatus;
//#UC END# *4836D52400D9_4C07BD030266_var*
begin
//#UC START# *4836D52400D9_4C07BD030266_impl*
 if AtomIndex = k2_tiMergeStatus then
 begin
  l_MS := TevMergeStatus(VariantAsInteger(AtomIndex, Value));
  if l_MS <> ev_msContinue then
   f_Empty := False;
  if l_MS = ev_msHead then
   f_NeedCache := True
  else
   if l_MS = ev_msNone then
    f_OnlyHead := False;
  f_MergedFlag := True;
 end;
 inherited;
//#UC END# *4836D52400D9_4C07BD030266_impl*
end;//TevdEmptyRowFilter.AddAtomEx

function TevdEmptyRowFilter.NeedStartBuffering(aID: Integer): Boolean;
//#UC START# *4C56D54B002A_4C07BD030266_var*
//#UC END# *4C56D54B002A_4C07BD030266_var*
begin
//#UC START# *4C56D54B002A_4C07BD030266_impl*
 Result := (aID = -k2_idTableRow) and f_NeedCache;
 if Result then
 begin
  f_Empty := True;
  f_NeedCache := False;
 end;
//#UC END# *4C56D54B002A_4C07BD030266_impl*
end;//TevdEmptyRowFilter.NeedStartBuffering

function TevdEmptyRowFilter.NeedFlushBuffer(const aLeaf: Ik2Tag;
  aTagId: Integer): Boolean;
//#UC START# *4CF7BC520161_4C07BD030266_var*
//#UC END# *4CF7BC520161_4C07BD030266_var*
begin
//#UC START# *4CF7BC520161_4C07BD030266_impl*
 Result := not f_Empty;
 if f_Empty then
  f_NeedCache := True;
//#UC END# *4CF7BC520161_4C07BD030266_impl*
end;//TevdEmptyRowFilter.NeedFlushBuffer

end.