unit evTableRowCursor;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// ������: "w:/common/components/gui/Garant/Everest/evTableRowCursor.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::ParaList Cursors::TevTableRowCursor
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  evParaListCursor,
  evColumnBorderMarker,
  nevTools,
  nevBase
  ;

type
 TevTableRowCursor = class(TevParaListCursor)
 protected
 // overridden protected methods
   {$If defined(evNeedMarkers)}
   procedure DoGetMarkers(const aView: InevView;
    const aList: IevMarkersList); override;
   {$IfEnd} //evNeedMarkers
   function DoDiff(const aView: InevView;
    const aPoint: InevBasePoint;
    aMap: TnevFormatInfoPrim): Integer; override;
   function DoPartiallyVisible(const aView: InevView;
    const aPoint: InevBasePoint;
    aMap: TnevFormatInfoPrim): Boolean; override;
 protected
 // protected methods
   function GetColumnMarkerClass: RevColumnMarkerClass; virtual;
 end;//TevTableRowCursor

implementation

uses
  nevInterfaces,
  k2Base,
  l3Base,
  evdTypes,
  k2Tags
  ;

// start class TevTableRowCursor

function TevTableRowCursor.GetColumnMarkerClass: RevColumnMarkerClass;
//#UC START# *4ED4C5C40177_4ED4C5640359_var*
//#UC END# *4ED4C5C40177_4ED4C5640359_var*
begin
//#UC START# *4ED4C5C40177_4ED4C5640359_impl*
 Result := TevColumnBorderMarker;
//#UC END# *4ED4C5C40177_4ED4C5640359_impl*
end;//TevTableRowCursor.GetColumnMarkerClass

{$If defined(evNeedMarkers)}
procedure TevTableRowCursor.DoGetMarkers(const aView: InevView;
  const aList: IevMarkersList);
//#UC START# *4A38AA5C019F_4ED4C5640359_var*

 function AddMarker(const aCell: InevTag; Index: Integer): Boolean; far;
 var
  l_Marker : TevColumnBorderMarker;
 begin//AddMarker
  l_Marker := GetColumnMarkerClass.Create(aView,
                                          GetRedirect^,
                                          Index + 1,
                                          str_nevmhCellSize.AsCStr);
  try
   aList.Add(l_Marker);
  finally
   l3Free(l_Marker);
  end;{try..finally}
  Result := True;
 end;//AddMarker

//#UC END# *4A38AA5C019F_4ED4C5640359_var*
begin
//#UC START# *4A38AA5C019F_4ED4C5640359_impl*
 GetRedirect.IterateChildrenF(k2L2TIA(@AddMarker));
//#UC END# *4A38AA5C019F_4ED4C5640359_impl*
end;//TevTableRowCursor.DoGetMarkers
{$IfEnd} //evNeedMarkers

function TevTableRowCursor.DoDiff(const aView: InevView;
  const aPoint: InevBasePoint;
  aMap: TnevFormatInfoPrim): Integer;
//#UC START# *4AA785540310_4ED4C5640359_var*
var
 l_Inn     : InevBasePoint;
 l_Top     : InevBasePoint;
 l_MaxTop  : InevBasePoint;
 l_RealTop : InevBasePoint;
//#UC END# *4AA785540310_4ED4C5640359_var*
begin
//#UC START# *4AA785540310_4ED4C5640359_impl*
 Result := inherited DoDiff(aView, aPoint, aMap);
 if (aPoint <> nil) and aPoint.HasBaseLine and not aPoint.HasInner then
 begin
  l_Inn := pm_GetInner;
  l_MaxTop := aPoint.InnerForChildThatNotAfterEnd(aMap, nev_itNone);
  if (l_Inn <> nil) then
   l_Top := aPoint.InnerFor(l_Inn.Obj^, l_RealTop);
  if (l_Top = nil) then
  begin
   if l_Inn <> nil then
    Result := nev_PlusDiff
  end // if (l_Top = nil) then
  else
  if l_Top.AfterEnd then
  begin
   if l_Inn = nil then
    Result := nev_MinusDiff
   else
    if l_Inn.AfterEnd then
     Result := 0
    else
     if (l_MaxTop = nil) or l_MaxTop.AfterEnd then
      Result := nev_PlusDiff
     else
      Result := nev_MinusDiff;
  end // if l_Top.AfterEnd then
  else
   if (l_Inn = nil) then
    Result := nev_MinusDiff
   else
    Result := l_Inn.Diff(aView, l_Top, aMap.InfoForChild(l_Inn.Obj^));
 end; // if (aPoint <> nil) and aPoint.HasBaseLine and not aPoint.HasInner then
//#UC END# *4AA785540310_4ED4C5640359_impl*
end;//TevTableRowCursor.DoDiff

function TevTableRowCursor.DoPartiallyVisible(const aView: InevView;
  const aPoint: InevBasePoint;
  aMap: TnevFormatInfoPrim): Boolean;
//#UC START# *4BBB10FB015B_4ED4C5640359_var*
var
 l_Cell    : InevTableCell;
 l_Inner   : InevBasePoint;
 l_RealTop : InevBasePoint;
 l_Point   : InevBasePoint;
//#UC END# *4BBB10FB015B_4ED4C5640359_var*
begin
//#UC START# *4BBB10FB015B_4ED4C5640359_impl*
 Result := inherited DoPartiallyVisible(aView, aPoint, aMap);
 if aPoint.HasBaseLine and HasInner then            
 begin
  l_Inner := GetInner;
  if TevMergeStatus(l_Inner.IntA[k2_tiMergeStatus]) = ev_msHead then
  begin
   l_Inner.QT(InevTableCell, l_Cell);
   Assert(l_Cell <> nil);
   while l_Cell <> nil do
   begin
    if l_Cell.OwnerPara.IsSame(aPoint.Obj^) then Break;
    l_Cell := l_Cell.GetContinueCell(True, fc_Down);
   end; // while l_Cell <> nil do
   if l_Cell <> nil then
   begin
    l_Point := aPoint.InnerFor(l_Cell, l_RealTop);
    Result := (l_RealTop <> nil) and
              (l_Inner.Diff(aView, l_RealTop, aMap.InfoForChild(l_Inner.Obj^)) >= 0);
              // - ����� ���� ��� ����� ��������������� ����� � ������� �����
   end; // if l_Cell <> nil then
  end; // if TevMergeStatus(l_Inner.IntA[k2_tiMergeStatus]) = ev_msHead then
 end; // if aPoint.HasBaseLine and HasInner then
//#UC END# *4BBB10FB015B_4ED4C5640359_impl*
end;//TevTableRowCursor.DoPartiallyVisible

end.