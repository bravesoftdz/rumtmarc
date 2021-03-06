unit nevFormulaFormatInfo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/new/nevFormulaFormatInfo.pas"
// �����: 01.09.2011 11:35
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Rendering::TnevFormulaFormatInfo
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
  l3InternalInterfaces,
  nevTextParaRenderInfo,
  evResultFontInterfaces,
  nevBase
  ;

type
 TnevFormulaFormatInfo = class(TnevTextParaRenderInfo)
 private
 // private fields
   f_Rendered : Il3Bitmap;
 protected
 // overridden property methods
   function pm_GetRendered: Il3Bitmap; override;
 protected
 // overridden protected methods
   procedure ClearCache; override;
   procedure DoRecalc(const aView: InevViewMetrics); override;
   procedure ClearFields; override;
 public
 // overridden public methods
   function ParaFont(aCorrectItalic: Boolean): IevResultFont; override;
 end;//TnevFormulaFormatInfo

implementation

uses
  k2Tags,
  evFormulaParaBitmapContainer,
  ExprDraw,
  SysUtils,
  TextPara_Const,
  nevSegmentObject
  ;

// start class TnevFormulaFormatInfo

procedure TnevFormulaFormatInfo.ClearCache;
//#UC START# *4E5E7D240227_4E5F35A9022C_var*
//#UC END# *4E5E7D240227_4E5F35A9022C_var*
begin
//#UC START# *4E5E7D240227_4E5F35A9022C_impl*
 f_Rendered := nil;
 inherited;
//#UC END# *4E5E7D240227_4E5F35A9022C_impl*
end;//TnevFormulaFormatInfo.ClearCache

function TnevFormulaFormatInfo.ParaFont(aCorrectItalic: Boolean): IevResultFont;
//#UC START# *4E5FBCFA0118_4E5F35A9022C_var*
//#UC END# *4E5FBCFA0118_4E5F35A9022C_var*
begin
//#UC START# *4E5FBCFA0118_4E5F35A9022C_impl*
 if (f_ParaFont = nil) then
 begin
  if Parent.Obj.InheritsFrom(k2_idTextPara) then
  begin
   f_ParaFont := Parent.GetInfoForChild(TnevSegmentObject.Make(Obj.Owner)).GetObjFont(aCorrectItalic);
   Result := f_ParaFont;
  end//Parent.Obj.InheritsFrom(k2_idTextPara)
  else
   Result := inherited ParaFont(aCorrectItalic);
 end//f_ParaFont = nil
 else
  Result := inherited ParaFont(aCorrectItalic);
//#UC END# *4E5FBCFA0118_4E5F35A9022C_impl*
end;//TnevFormulaFormatInfo.ParaFont

function TnevFormulaFormatInfo.pm_GetRendered: Il3Bitmap;
//#UC START# *4E60F48503E6_4E5F35A9022Cget_var*
var
 l_ABC : TevFormulaParaBitmapContainer;
 l_Expr : Tl3Expr;
// l_Tag : InevTag;
//#UC END# *4E60F48503E6_4E5F35A9022Cget_var*
begin
//#UC START# *4E60F48503E6_4E5F35A9022Cget_impl*
 if (f_Rendered = nil) then
 begin
  with Obj.Attr[k2_tiData] do
   if IsValid then
    l_Expr := AsObject As Tl3Expr
   else
    l_Expr := nil;
  Assert(l_Expr <> nil);  
  l_ABC := TevFormulaParaBitmapContainer.Create;
  try
   l_ABC.SetParams(l_Expr As Il3Renderer, Self.Get_Font(false));
   f_Rendered := l_ABC;
  finally
   FreeAndNil(l_ABC);
  end;//try..finally
 end;//f_Rendered = nil
 Result := f_Rendered;
(* l_Tag := Obj.Attr[k2_tiObject];
 if l_Tag.IsValid then
  Result := l_Tag As Il3Bitmap
 else
  Result := nil;*)
//#UC END# *4E60F48503E6_4E5F35A9022Cget_impl*
end;//TnevFormulaFormatInfo.pm_GetRendered

procedure TnevFormulaFormatInfo.DoRecalc(const aView: InevViewMetrics);
//#UC START# *4E7094780214_4E5F35A9022C_var*
var
 l_B : Il3Bitmap;
//#UC END# *4E7094780214_4E5F35A9022C_var*
begin
//#UC START# *4E7094780214_4E5F35A9022C_impl*
 if Obj.BoolA[k2_tiCollapsed] then
 begin
  //Assert(Obj.HasSubAtom(k2_tiObject));
  l_B := Rendered;
  Assert(l_B <> nil);
  wMap(nil);
  wWidth(l_B.InchWidth);
  wHeight(l_B.InchHeight);
 end//BoolA[k2_tiCollapsed]
 else
  inherited;
//#UC END# *4E7094780214_4E5F35A9022C_impl*
end;//TnevFormulaFormatInfo.DoRecalc

procedure TnevFormulaFormatInfo.ClearFields;
 {-}
begin
 f_Rendered := nil;
 inherited;
end;//TnevFormulaFormatInfo.ClearFields

end.