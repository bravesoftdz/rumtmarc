unit nevSelection;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/nevSelection.pas"
// �����: 09.12.1998 16:17
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Editors::TnevSelection
//
// ������ � ����������. ��� ��������� �������������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  nevTools,
  evTypes,
  evBlockCursor,
  nevBase
  ;

type
 TnevSelection = class(TevBlockCursor)
  {* ������ � ����������. ��� ��������� �������������. }
 private
 // private fields
   f_Mouse : InevPoint;
    {* ���� ��� �������� Mouse}
   f_FoundBlock : InevRange;
    {* ���� ��� �������� FoundBlock}
 protected
 // property methods
   function pm_GetMouse: InevPoint;
   procedure pm_SetFoundBlock(const aValue: InevRange);
 protected
 // overridden property methods
   function pm_GetCollapsed: Boolean; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   function DoGetBlock(const aDocument: InevObject): InevRange; override;
   function GetContains(const C: InevBasePoint): Boolean; override;
   procedure DoSetDocument(const OldDocument: InevTag;
    const Value: InevTag); override;
   procedure AfterProcessCommand; override;
   procedure ClearFields; override;
 public
 // public methods
   procedure DeleteFoundBlockBeforeSearch;
   procedure Select(aTarget: TevSelectTarget;
    const aCursor: InevPoint = nil;
    Start: Boolean = true); virtual;
     {* �������� ����� ��������� (�������� ������� �����, ������, �������� etc) }
 public
 // public properties
   property Mouse: InevPoint
     read pm_GetMouse;
   property FoundBlock: InevRange
     read f_FoundBlock
     write pm_SetFoundBlock;
 end;//TnevSelection

implementation

uses
  l3InterfacesMisc,
  evMsgCode,
  evSelectConst
  ;

// start class TnevSelection

function TnevSelection.pm_GetMouse: InevPoint;
//#UC START# *48E3A5E503CD_487B5DD202DFget_var*
//#UC END# *48E3A5E503CD_487B5DD202DFget_var*
begin
//#UC START# *48E3A5E503CD_487B5DD202DFget_impl*
 if (View = nil) then
  Result := nil
 else
 begin
  Result := CheckCursor(f_Mouse);
  Result.AssignPoint(View, View.PointByPt(View.MousePos));
 end;//View = nil
//#UC END# *48E3A5E503CD_487B5DD202DFget_impl*
end;//TnevSelection.pm_GetMouse

procedure TnevSelection.pm_SetFoundBlock(const aValue: InevRange);
//#UC START# *48E3A614017E_487B5DD202DFset_var*
//#UC END# *48E3A614017E_487B5DD202DFset_var*
begin
//#UC START# *48E3A614017E_487B5DD202DFset_impl*
 if not l3IEQ(f_FoundBlock, aValue) then
 begin
 f_FoundBlock := aValue;
  if Assigned(View) and Assigned(View.Control) then
  begin
   if (f_FoundBlock = nil) then
   // - ���� ��������� ����� CQ 26553
    View.Control.ViewArea.Invalidate
   else
    View.Control.UpdateCaretAndInvalidate;
  end;//Assigned(View)..
 end;//not l3IEQ(f_FoundBlock, aBlock)
//#UC END# *48E3A614017E_487B5DD202DFset_impl*
end;//TnevSelection.pm_SetFoundBlock

procedure TnevSelection.DeleteFoundBlockBeforeSearch;
//#UC START# *48E3A5C203E1_487B5DD202DF_var*
//#UC END# *48E3A5C203E1_487B5DD202DF_var*
begin
//#UC START# *48E3A5C203E1_487B5DD202DF_impl*
 f_FoundBlock := nil;
//#UC END# *48E3A5C203E1_487B5DD202DF_impl*
end;//TnevSelection.DeleteFoundBlockBeforeSearch

procedure TnevSelection.Select(aTarget: TevSelectTarget;
  const aCursor: InevPoint = nil;
  Start: Boolean = true);
//#UC START# *48E3A6260063_487B5DD202DF_var*
var
 C1       : InevBasePoint;
 l_Pack   : InevOp;
 l_Cursor : InevBasePoint;
//#UC END# *48E3A6260063_487B5DD202DF_var*
begin
//#UC START# *48E3A6260063_487B5DD202DF_impl*
 if (StartMark <> nil) AND (FinishMark <> nil) then
 begin
  if (aCursor = nil) then
   l_Cursor := Cursor
  else
   l_Cursor := aCursor;
  l_Pack := Processor.StartOp(ev_msgMove);
  try
   if Start then
   begin
    (*case aTarget of
     ev_stChar : StartMark.Assign(l_Cursor);
     else *)
     begin
      StartMark.AssignPoint(View, l_Cursor);
      if (evSelectBrackets[aTarget].Open <> -1) then
       StartMark.Move(View, evSelectBrackets[aTarget].Open, l_Pack);
      FinishMark.AssignPoint(View, l_Cursor);
      if (evSelectBrackets[aTarget].Close <> -1) then
       FinishMark.Move(View, evSelectBrackets[aTarget].Close, l_Pack);
      AddBlock(StartMark, FinishMark);
     end;//else
    (*end;//case aTarget*)
    {Start}
   end
   else
   begin
    (*case aTarget of
     ev_stChar : AddBlock(StartMark, aCursor);
     else *)
     begin
      C1 := aCursor.ClonePoint(View);
      try
       if (C1.Compare(StartMark) < 0) then
       begin
        C1.Move(View, evSelectBrackets[aTarget].Open, l_Pack);
        AddBlock(C1, FinishMark);
       end//C1.Compare(StartMark) < 0
       else
       begin
        C1.Move(View, evSelectBrackets[aTarget].Close, l_Pack);
        AddBlock(StartMark, C1);
       end;//C1.Compare(StartMark) < 0
      finally
       FreeCursor(C1);
      end;//try..finally
     end;//else
    (*end;//case aTarget*)
   end;//Start
  finally
   l_Pack := nil;
  end;//try..finally
 end;//(StartMark <> nil) AND (FinishMark <> nil)
//#UC END# *48E3A6260063_487B5DD202DF_impl*
end;//TnevSelection.Select

procedure TnevSelection.Cleanup;
//#UC START# *479731C50290_487B5DD202DF_var*
//#UC END# *479731C50290_487B5DD202DF_var*
begin
//#UC START# *479731C50290_487B5DD202DF_impl*
 FoundBlock := nil;
 inherited;
//#UC END# *479731C50290_487B5DD202DF_impl*
end;//TnevSelection.Cleanup

function TnevSelection.DoGetBlock(const aDocument: InevObject): InevRange;
//#UC START# *48E252D40298_487B5DD202DF_var*
//#UC END# *48E252D40298_487B5DD202DF_var*
begin
//#UC START# *48E252D40298_487B5DD202DF_impl*
 Result := FoundBlock;
 if (Result = nil) then
  Result := inherited DoGetBlock(aDocument);
//#UC END# *48E252D40298_487B5DD202DF_impl*
end;//TnevSelection.DoGetBlock

function TnevSelection.GetContains(const C: InevBasePoint): Boolean;
//#UC START# *48E271FC0130_487B5DD202DF_var*
//#UC END# *48E271FC0130_487B5DD202DF_var*
begin
//#UC START# *48E271FC0130_487B5DD202DF_impl*
 if (FoundBlock <> nil) then
  Result := FoundBlock.Contains(View, C)
 else
  Result := inherited GetContains(C);
//#UC END# *48E271FC0130_487B5DD202DF_impl*
end;//TnevSelection.GetContains

procedure TnevSelection.DoSetDocument(const OldDocument: InevTag;
  const Value: InevTag);
//#UC START# *48E276B10286_487B5DD202DF_var*
//#UC END# *48E276B10286_487B5DD202DF_var*
begin
//#UC START# *48E276B10286_487B5DD202DF_impl*
 FreeCursor(f_Mouse);
 FoundBlock := nil;
 inherited;
//#UC END# *48E276B10286_487B5DD202DF_impl*
end;//TnevSelection.DoSetDocument

function TnevSelection.pm_GetCollapsed: Boolean;
//#UC START# *48E3723E0107_487B5DD202DFget_var*
//#UC END# *48E3723E0107_487B5DD202DFget_var*
begin
//#UC START# *48E3723E0107_487B5DD202DFget_impl*
 Result := (FoundBlock = nil);
 if Result then
  Result := inherited pm_GetCollapsed;
//#UC END# *48E3723E0107_487B5DD202DFget_impl*
end;//TnevSelection.pm_GetCollapsed

procedure TnevSelection.AfterProcessCommand;
//#UC START# *48E38E83007A_487B5DD202DF_var*
//#UC END# *48E38E83007A_487B5DD202DF_var*
begin
//#UC START# *48E38E83007A_487B5DD202DF_impl*
 inherited AfterProcessCommand;
 FoundBlock := nil;
//#UC END# *48E38E83007A_487B5DD202DF_impl*
end;//TnevSelection.AfterProcessCommand

procedure TnevSelection.ClearFields;
 {-}
begin
 f_Mouse := nil;
 FoundBlock := nil;
 inherited;
end;//TnevSelection.ClearFields

end.