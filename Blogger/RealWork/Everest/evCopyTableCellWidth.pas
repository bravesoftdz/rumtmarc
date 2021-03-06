unit evCopyTableCellWidth;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ������ �.�.
// ������: "w:/common/components/gui/Garant/Everest/evCopyTableCellWidth.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::CellUtils::TevCopyTableCellWidth
//
// ���������� ��� ����������� ����� ������� �� ����� ������� � ������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  l3Interfaces,
  nevTools,
  evEditorInterfaces,
  l3ProtoObject,
  evCellsOffsetsList
  ;

type
 TevCopyTableCellWidth = {final} class(Tl3ProtoObject)
  {* ���������� ��� ����������� ����� ������� �� ����� ������� � ������. }
 private
 // private fields
   f_TemplatesArray : TevCellsOffsetsList;
   f_TableTag : InevTag;
 private
 // private methods
   procedure RememberRowWidth(const anIterator: IedCellsIterator);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
 public
 // public methods
   procedure RememberWidths(const aRange: IedRange); virtual;
   procedure ApplyWidths(const aRange: IedRange;
    const aProgress: Il3Progress = nil); virtual;
   function CanApply: Boolean; virtual;
   procedure Clear; virtual;
 public
 // singleton factory method
   class function Instance: TevCopyTableCellWidth;
    {- ���������� ��������� ����������. }
 end;//TevCopyTableCellWidth

implementation

uses
  l3Base {a},
  nevBase,
  evCellsWidthCorrecter
  ;


// start class TevCopyTableCellWidth

var g_TevCopyTableCellWidth : TevCopyTableCellWidth = nil;

procedure TevCopyTableCellWidthFree;
begin
 l3Free(g_TevCopyTableCellWidth);
end;

class function TevCopyTableCellWidth.Instance: TevCopyTableCellWidth;
begin
 if (g_TevCopyTableCellWidth = nil) then
 begin
  l3System.AddExitProc(TevCopyTableCellWidthFree);
  g_TevCopyTableCellWidth := Create;
 end;
 Result := g_TevCopyTableCellWidth;
end;


procedure TevCopyTableCellWidth.RememberRowWidth(const anIterator: IedCellsIterator);
//#UC START# *4F29052701FB_4F28F7160399_var*
//#UC END# *4F29052701FB_4F28F7160399_var*
begin
//#UC START# *4F29052701FB_4F28F7160399_impl*
 f_TemplatesArray.Try2RemeberWidths(anIterator);
//#UC END# *4F29052701FB_4F28F7160399_impl*
end;//TevCopyTableCellWidth.RememberRowWidth

procedure TevCopyTableCellWidth.RememberWidths(const aRange: IedRange);
//#UC START# *4F28FC7702ED_4F28F7160399_var*
var
 l_Row          : IedRow;
 l_Table        : IedTable;
 l_RowsIterator : IedRowsIterator;
 l_CellIterator : IedCellsIterator;
//#UC END# *4F28FC7702ED_4F28F7160399_var*
begin
//#UC START# *4F28FC7702ED_4F28F7160399_impl*
 if (aRange <> nil) then
 begin
  l_Table := aRange.Table;
  if (l_Table <> nil) then
  begin
   l_RowsIterator := l_Table.RowsIterator;
   if (l_RowsIterator <> nil) then
   begin
    l_Row := l_RowsIterator.First;
    if f_TemplatesArray = nil then
     f_TemplatesArray := TevCellsOffsetsList.Create
    else
     f_TemplatesArray.Clear;
    while (l_Row <> nil) do
    begin
     l_CellIterator := l_Row.CellsIterator;
     if l_CellIterator <> nil then
      RememberRowWidth(l_CellIterator);
     l_Row := l_RowsIterator.Next;
    end; // while (l_Row <> nil) do
    f_TableTag := l_Table.GetTag;
   end; // if (l_RowsIterator <> nil) then
  end; // if (l_Table <> nil) then
 end; // if (aRange <> nil) then
//#UC END# *4F28FC7702ED_4F28F7160399_impl*
end;//TevCopyTableCellWidth.RememberWidths

procedure TevCopyTableCellWidth.ApplyWidths(const aRange: IedRange;
  const aProgress: Il3Progress = nil);
//#UC START# *4F28FC900076_4F28F7160399_var*
var
 l_Table: IedTable;
//#UC END# *4F28FC900076_4F28F7160399_var*
begin
//#UC START# *4F28FC900076_4F28F7160399_impl*
 if (aRange <> nil) then
 begin
  l_Table := aRange.Table;
  if (l_Table <> nil) and (f_TemplatesArray <> nil) and (f_TemplatesArray.Count > 0) then
  begin
   if l_Table.GetTag.IsSame(f_TableTag) then
    TevCellsWidthCorrecter.DoCorrection(l_Table, nil, True, aProgress)
   else
    TevCellsWidthCorrecter.DoCorrection(l_Table, f_TemplatesArray, True, aProgress);
  end; // if (l_Table <> nil) and (f_TemplatesArray <> nil) and (f_TemplatesArray.Count > 0) then
 end; // if (aRange <> nil) then
//#UC END# *4F28FC900076_4F28F7160399_impl*
end;//TevCopyTableCellWidth.ApplyWidths

function TevCopyTableCellWidth.CanApply: Boolean;
//#UC START# *4F28FCC703E7_4F28F7160399_var*
//#UC END# *4F28FCC703E7_4F28F7160399_var*
begin
//#UC START# *4F28FCC703E7_4F28F7160399_impl*
 Result := (f_TemplatesArray <> nil) and (f_TemplatesArray.Count > 0);
//#UC END# *4F28FCC703E7_4F28F7160399_impl*
end;//TevCopyTableCellWidth.CanApply

procedure TevCopyTableCellWidth.Clear;
//#UC START# *4F28FCDD00F8_4F28F7160399_var*
//#UC END# *4F28FCDD00F8_4F28F7160399_var*
begin
//#UC START# *4F28FCDD00F8_4F28F7160399_impl*
 l3Free(f_TemplatesArray);
 f_TableTag := nil;
 inherited;
//#UC END# *4F28FCDD00F8_4F28F7160399_impl*
end;//TevCopyTableCellWidth.Clear

procedure TevCopyTableCellWidth.Cleanup;
//#UC START# *479731C50290_4F28F7160399_var*
//#UC END# *479731C50290_4F28F7160399_var*
begin
//#UC START# *479731C50290_4F28F7160399_impl*
 l3Free(f_TemplatesArray);
 f_TableTag := nil;
 inherited;
//#UC END# *479731C50290_4F28F7160399_impl*
end;//TevCopyTableCellWidth.Cleanup

end.