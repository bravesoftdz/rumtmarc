unit nevSBSRowFormatInfo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/new/nevSBSRowFormatInfo.pas"
// �����: 14.09.2011 12:27
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Rendering::TnevSBSRowFormatInfo
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
  nevRubberCellsRenderInfo,
  nevBase
  ;

type
 TnevSBSRowFormatInfo = class(TnevRubberCellsRenderInfo)
 private
 // private fields
   f_SecondColWdith : Integer;
    {* ������������ ������ ������ ������� ��� �������� ���������.}
 private
 // private methods
   function CalcNewWidth(aParentWidth: Integer;
     aValue: Integer): Integer;
   function ParentWidth: Integer;
     {* ������ ��� ����������. }
 protected
 // overridden protected methods
   function WasChanged: Boolean; override;
   procedure ClearChangedFlag; override;
 public
 // overridden public methods
   function CalcClientValue4Column(aColumnID: Integer): Integer; override;
   procedure ResizeColumn(aColumnID: Integer;
     aValue: Integer;
     const aContext: InevOp); override;
 end;//TnevSBSRowFormatInfo

implementation

uses
  k2Tags,
  l3Math,
  l3MinMax,
  nevTools,
  evSectionPara,
  evConst
  ;

// start class TnevSBSRowFormatInfo

function TnevSBSRowFormatInfo.CalcNewWidth(aParentWidth: Integer;
  aValue: Integer): Integer;
//#UC START# *4ED4B9B50021_4E70655403BD_var*
var
 l_NewWidth: Integer;
 l_Width: Integer;
//#UC END# *4ED4B9B50021_4E70655403BD_var*
begin
//#UC START# *4ED4B9B50021_4E70655403BD_impl*
 l_NewWidth := LimitWidth;
 with Obj do
  l_Width := Abs(Child[0].IntA[k2_tiWidth]) + Abs(Child[1].IntA[k2_tiWidth]);
 if Abs(l_Width - aParentWidth) > evEpsilon then
  Result := l3MulDiv(aValue, aParentWidth, l_NewWidth)
 else
  Result := l3MulDiv(aValue, l_Width, l_NewWidth);
//#UC END# *4ED4B9B50021_4E70655403BD_impl*
end;//TnevSBSRowFormatInfo.CalcNewWidth

function TnevSBSRowFormatInfo.ParentWidth: Integer;
//#UC START# *4ED61E7200D0_4E70655403BD_var*
var
 l_SB     : InevSectionBreaks;
 l_Holder : InevObjectHolder;
 l_Break  : InevObject;
 l_Obj    : InevObject;
 l_PI     : TnevFormatInfoPrim;
//#UC END# *4ED61E7200D0_4E70655403BD_var*
begin
//#UC START# *4ED61E7200D0_4E70655403BD_impl*
 Result := 0;
 if Metrics.IsWebStyle then
 begin
  l_Obj := (Obj As InevObject);
  l_Holder := l_Obj.Holder;
  if (l_Holder <> nil) then
  begin
   l_SB := l_Holder.SectionBreaks;
   if (l_SB <> nil) then
    if l_SB.GetSectionBreak(l_Obj, l_Break) then
     Result := evSectionExtent(l_Break).X;
  end; // if (l_Holder <> nil) then
  if Result = 0 then
   Result := Abs(RootFormatInfo.Obj.IntA[k2_tiWidth]);
  l_PI := ParentInfo;
  while l_PI <> nil do
  begin
   Dec(Result, l_PI.Obj.IntA[k2_tiLeftIndent]);
   Dec(Result, l_PI.Obj.IntA[k2_tiRightIndent]);
   l_PI := l_PI.ParentInfo;
  end; // while l_PI <> nil do
 end // if Metrics.IsWebStyle then
 else
  Result := LimitWidth;
//#UC END# *4ED61E7200D0_4E70655403BD_impl*
end;//TnevSBSRowFormatInfo.ParentWidth

function TnevSBSRowFormatInfo.CalcClientValue4Column(aColumnID: Integer): Integer;
//#UC START# *4ED4ADA90212_4E70655403BD_var*
var
 i       : Integer;
 l_Count : Integer;
//#UC END# *4ED4ADA90212_4E70655403BD_var*
begin
//#UC START# *4ED4ADA90212_4E70655403BD_impl*
 Result := 0;
 if Widthes = nil then Exit;
 l_Count := Min(Obj.ChildrenCount, aColumnID);
 for i := 0 to l_Count - 1 do
  Inc(Result, Widthes[i]);
//#UC END# *4ED4ADA90212_4E70655403BD_impl*
end;//TnevSBSRowFormatInfo.CalcClientValue4Column

procedure TnevSBSRowFormatInfo.ResizeColumn(aColumnID: Integer;
  aValue: Integer;
  const aContext: InevOp);
//#UC START# *4ED4AE2B03D3_4E70655403BD_var*
var
 l_LW    : Integer;
 l_Delta : Integer;
 l_Width : Integer;
//#UC END# *4ED4AE2B03D3_4E70655403BD_var*
begin
//#UC START# *4ED4AE2B03D3_4E70655403BD_impl*
 if aColumnID > 1 then Exit;
 // ^ - ���� � ���������� ��������� ������� �������������� � ������ ���������,
 // �� �� ����� ���� �� ��������, �.�. ����� �������������� ��� ����� "����������".
 l_LW := ParentWidth;
 l_Width := CalcNewWidth(l_LW, aValue);
 aContext.Lock; // ������ ��� ���������� ����������� �������� �� �������.
 try
  with Obj do
  begin
   Child[aColumnID - 1].IntW[k2_tiWidth, aContext] := l_Width;
   Child[aColumnID].IntW[k2_tiWidth, aContext] := l_LW - l_Width;
  end; // with Obj do
 finally
  aContext.Unlock;
 end;
//#UC END# *4ED4AE2B03D3_4E70655403BD_impl*
end;//TnevSBSRowFormatInfo.ResizeColumn

function TnevSBSRowFormatInfo.WasChanged: Boolean;
//#UC START# *4ED719EE01C1_4E70655403BD_var*
//#UC END# *4ED719EE01C1_4E70655403BD_var*
begin
//#UC START# *4ED719EE01C1_4E70655403BD_impl*
 Result := inherited WasChanged;
 {$IF Defined(Archi) or Defined(EverestLite)}
 if (Obj.ChildrenCount > 1) and not Result then
  Result := Abs(f_SecondColWdith - Abs(Obj.Child[1].IntA[k2_tiWidth])) > evEpsilon;
 {$IFEND}
//#UC END# *4ED719EE01C1_4E70655403BD_impl*
end;//TnevSBSRowFormatInfo.WasChanged

procedure TnevSBSRowFormatInfo.ClearChangedFlag;
//#UC START# *4ED71A110169_4E70655403BD_var*
//#UC END# *4ED71A110169_4E70655403BD_var*
begin
//#UC START# *4ED71A110169_4E70655403BD_impl*
 inherited ClearChangedFlag;
 {$IF Defined(Archi) or Defined(EverestLite)}
 if Obj.ChildrenCount > 1 then
  f_SecondColWdith := Abs(Obj.Child[1].IntA[k2_tiWidth]);
 {$IFEND}
//#UC END# *4ED71A110169_4E70655403BD_impl*
end;//TnevSBSRowFormatInfo.ClearChangedFlag

end.