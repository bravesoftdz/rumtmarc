unit nevDocumentFormatInfo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/new/nevDocumentFormatInfo.pas"
// �����: 09.09.2011 19:26
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Rendering::TnevDocumentFormatInfo
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
  nevListFormatInfo,
  nevFormatInfoList,
  nevBase,
  nevFormatInfo
  ;

type
 TnevDocumentFormatInfo = class(TnevListFormatInfo)
 private
 // private fields
   f_DecorFIs : TnevFormatInfoList;
 protected
 // overridden property methods
   function pm_GetLocSpacing: TnevRect; override;
 protected
 // overridden protected methods
   procedure ClearCache; override;
   function LocDecorHeight(const aView: InevViewMetrics;
     aFI: TnevFormatInfo;
     aType: TnevDecorType): Integer; override;
   function LocLocDecorFormatInfo(const aDecorObj: InevObjectPrim): TnevFormatInfo; override;
   function AllowTotalRecalc: Boolean; override;
 public
 // overridden public methods
   function GetInfoForChild(const aChild: InevObjectPrim): TnevFormatInfo; override;
 end;//TnevDocumentFormatInfo

implementation

uses
  nevFormatInfoFactory,
  SysUtils,
  LeafPara_Const
  ;

// start class TnevDocumentFormatInfo

function TnevDocumentFormatInfo.GetInfoForChild(const aChild: InevObjectPrim): TnevFormatInfo;
//#UC START# *4815C94A027A_4E6A302701CF_var*
//#UC END# *4815C94A027A_4E6A302701CF_var*
begin
//#UC START# *4815C94A027A_4E6A302701CF_impl*
 if aChild.IsDecorationElement then
  Result := LocLocDecorFormatInfo(aChild)
 else
  Result := inherited GetInfoForChild(aChild);
//#UC END# *4815C94A027A_4E6A302701CF_impl*
end;//TnevDocumentFormatInfo.GetInfoForChild

procedure TnevDocumentFormatInfo.ClearCache;
//#UC START# *4E5E7D240227_4E6A302701CF_var*
//#UC END# *4E5E7D240227_4E6A302701CF_var*
begin
//#UC START# *4E5E7D240227_4E6A302701CF_impl*
 if (f_DecorFIs <> nil) then
  f_DecorFIs.ClearReferencesToParentFormatInfo;
 FreeAndNil(f_DecorFIs);
 inherited;
//#UC END# *4E5E7D240227_4E6A302701CF_impl*
end;//TnevDocumentFormatInfo.ClearCache

function TnevDocumentFormatInfo.pm_GetLocSpacing: TnevRect;
//#UC START# *4E5F3D1102B8_4E6A302701CFget_var*
//#UC END# *4E5F3D1102B8_4E6A302701CFget_var*
begin
//#UC START# *4E5F3D1102B8_4E6A302701CFget_impl*
 Result := inherited pm_GetLocSpacing;
 Result.Top := Result.Top + Self.DecorHeight(nev_dtHeader); 
//#UC END# *4E5F3D1102B8_4E6A302701CFget_impl*
end;//TnevDocumentFormatInfo.pm_GetLocSpacing

function TnevDocumentFormatInfo.LocDecorHeight(const aView: InevViewMetrics;
  aFI: TnevFormatInfo;
  aType: TnevDecorType): Integer;
//#UC START# *4E6DE6D800F4_4E6A302701CF_var*
var
 l_FI : TnevFormatInfo;
//#UC END# *4E6DE6D800F4_4E6A302701CF_var*
begin
//#UC START# *4E6DE6D800F4_4E6A302701CF_impl*
 if (aFI <> nil) then
  l_FI := aFI.LocDecorFormatInfo(aType)
 else
  l_FI := nil;
 if (l_FI = nil) then
  Result := 0
 else
  Result := l_FI.Height;
//#UC END# *4E6DE6D800F4_4E6A302701CF_impl*
end;//TnevDocumentFormatInfo.LocDecorHeight

function TnevDocumentFormatInfo.LocLocDecorFormatInfo(const aDecorObj: InevObjectPrim): TnevFormatInfo;
//#UC START# *4E6DF94C00F1_4E6A302701CF_var*
var
 l_Index : Integer;
 l_Item  : TnevFormatInfo;  
(*var
 l_O : InevObjectPrim;*)
//#UC END# *4E6DF94C00F1_4E6A302701CF_var*
begin
//#UC START# *4E6DF94C00F1_4E6A302701CF_impl*
 Assert(aDecorObj.InheritsFrom(k2_idLeafPara){ OR
        aDecorObj.InheritsFrom(k2_idTextSegment)});
 if (f_DecorFIs = nil) then
  f_DecorFIs := TnevFormatInfoList.Create;
 with f_DecorFIs do
 begin
  for l_Index := 0 to Pred(Count) do
  begin
   l_Item := Items[l_Index];
   if l_Item.Obj.IsSame(aDecorObj) then
   begin
    Result := l_Item;
    Exit;
   end;//l_Item.f_Obj.IsSame(aShape)
  end;//for l_Index
  l_Item := TnevFormatInfoFactory.CreateFormatInfo(aDecorObj, Self, Metrics);
  try
   l_Item.LimitWidth := LimitWidth;
          // ^ - ����� ���� ����� ���� ������� ������
          // V - ������ ���� ��� Spacing
          //     ���� ��������� Spacing � HorzSpacing
   Add(l_Item);
   Result := l_Item;
  finally
   FreeAndNil(l_Item);
  end;//try..finally
 end;//with f_DecorFIs
(* if (aType = nev_dtHeader) then
 begin
  if (f_HeaderFI = nil) then
   f_HeaderFI := TnevFormatInfoFactory.CreateFormatInfo(aDecorObj, Self, Metrics)
  else
   Assert(f_HeaderFI.Obj.IsSame(aDecorObj));
//  if not Self.Obj.Child[0].QT(InevObjectPrim, l_O) then
//   Assert(false);
  f_HeaderFI.LimitWidth := Self.LimitWidth
   {ChildWidth(GetInfoForChild(l_O))}
   // ^ ��� - ���������� �����, �� ��� �������� Stack Overflow - �.�. ��� ���������� Spacing
   {ChildWidth(f_HeaderFI)};
  Result := InevFormatInfoModify(f_HeaderFI);
 end//aType = ev_dtHeader
 else
  Result := nil;*)
//#UC END# *4E6DF94C00F1_4E6A302701CF_impl*
end;//TnevDocumentFormatInfo.LocLocDecorFormatInfo

function TnevDocumentFormatInfo.AllowTotalRecalc: Boolean;
//#UC START# *4E7095FC023D_4E6A302701CF_var*
//#UC END# *4E7095FC023D_4E6A302701CF_var*
begin
//#UC START# *4E7095FC023D_4E6A302701CF_impl*
 Result := false;
//#UC END# *4E7095FC023D_4E6A302701CF_impl*
end;//TnevDocumentFormatInfo.AllowTotalRecalc

end.