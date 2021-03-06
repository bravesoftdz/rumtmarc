unit evNodePainter;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// ������: "w:/common/components/gui/Garant/Everest/evNodePainter.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::PaintedNode::TevNodePainter
//
// ���������� �����-����������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  l3CacheableBase,
  k2Interfaces,
  l3InternalInterfaces,
  nevTools,
  l3Units
  ;

type
 TevNodePainter = class(Tl3CacheableBase, Il3NodePainter)
  {* ���������� �����-����������. }
 private
 // private fields
   f_Tag : InevObject;
   f_Document : InevObject;
 private
 // private methods
   procedure InternalPaintNode(const aCanvas: Il3Canvas;
     aWidth: Integer;
     aSelStart: Integer;
     aSelEnd: Integer;
     DoInverse: Boolean = False);
   function GetDocument(aLimitWidth: Integer;
     const aCanvas: Il3InfoCanvas): InevObjectList;
 protected
 // realized methods
   procedure PaintNode(const aCanvas: Il3Canvas;
    const aRect: Tl3Rect;
    aSelStart: Integer;
    aSelEnd: Integer;
    DoInverse: Boolean = False);
     {* ������ ���� }
   function CalcHeight(const aCanvas: Il3InfoCanvas;
    aWidth: Integer): Integer;
     {* ������� ������ �� ������. }
   function HintSupported: Boolean;
     {* ���� �������� ���� }
   function GetItemTextIndent(const aCanvas: Il3InfoCanvas;
    aTextHeight: Integer): Integer;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
 public
 // public methods
   constructor Create(const aTag: Ik2Tag); reintroduce;
   class function Make(const aTag: Ik2Tag): Il3NodePainter;
 end;//TevNodePainter

implementation

uses
  nevRealTools,
  k2Tags,
  Document_Const,
  l3Base,
  l3VirtualCanvas,
  nevNodeView,
  evConst
  ;

// start class TevNodePainter

procedure TevNodePainter.InternalPaintNode(const aCanvas: Il3Canvas;
  aWidth: Integer;
  aSelStart: Integer;
  aSelEnd: Integer;
  DoInverse: Boolean = False);
//#UC START# *4E2421C5016E_4E2412DF02EA_var*
var
 l_Map     : TnevShapeInfo;
 l_View    : InevView;
 l_Painter : InevDrawingShape;
 l_Area    : TnevShapeAreaEx;
 l_Points  : TnevShapePoints;
 //l_Para    : InevPara;
 l_Pt      : InevPoint;
//#UC END# *4E2421C5016E_4E2412DF02EA_var*
begin
//#UC START# *4E2421C5016E_4E2412DF02EA_impl*
 l_View := TnevNodeView.Make(GetDocument(aWidth, aCanvas), aCanvas);
 aCanvas.BeginPaint;
 try
  if DoInverse then
   aCanvas.BeginInvert;
  try
   Assert(f_Document <> nil);
   if f_Document.QT(InevDrawingShape, l_Painter, nil) {and
      f_Document.QT(InevPara, l_Para, nil)} then
    try
     l_Area.Init(l_View, aCanvas, false);
     try
      // ������� � ������ ������ ��� ������ ������, �.�. ������ ����� ��� ������ ��������� ��� ���
      //aCanvas.MoveWindowOrg(l3Point(0, l_Para.Margins(l_View.Metrics).Top));
      if (aSelEnd > 0) then
      begin
       f_Tag.QT(InevPoint, l_Pt);
       l_Pt.PositionW := aSelEnd;
       l_Points.rCaret := l_Pt;
      end//aSelEnd > 0
      else
       l_Points.rCaret := nil;
      l_Points.rCheckCaret := nil;
      l_Points.rCheckSelection := nil;
      aCanvas.Printed := l_Painter.Draw(l_Area{$IfDef XE4}.rTnevShapeArea{$EndIf}, l_Points, l_Map);
     finally
      l_Area.Free;
     end;//try..finally
    finally
     l_Painter := nil;
    end;//try..finally
   aCanvas.SetPageTop;
   aCanvas.FillEmptyRect(l3RectBnd(evPoint0, l3Point(High(LongInt), l_Map.rMap.FI.Height)));
  finally
   if DoInverse then
    aCanvas.EndInvert;
  end;//try..finally
 finally
  aCanvas.EndPaint;
 end;//try..finally
//#UC END# *4E2421C5016E_4E2412DF02EA_impl*
end;//TevNodePainter.InternalPaintNode

function TevNodePainter.GetDocument(aLimitWidth: Integer;
  const aCanvas: Il3InfoCanvas): InevObjectList;
//#UC START# *4E242246000E_4E2412DF02EA_var*
var
 l_Doc  : Ik2Tag;
 l_Text : Ik2Tag;
//#UC END# *4E242246000E_4E2412DF02EA_var*
begin
//#UC START# *4E242246000E_4E2412DF02EA_impl*
 if (f_Document = nil) then
 begin
  l_Doc := k2_typDocument.MakeTag;
  try
   l_Doc.IntA[k2_tiSpaceBefore] := 0;
   l_Doc.IntA[k2_tiLeftIndent] := 0;
   l_Doc.IntA[k2_tiRightIndent] := 0;
   l_Doc.IntA[k2_tiWidth] := aLimitWidth - aCanvas.DP2LP(PointX(2)).X;
   l_Text := f_Tag;
   l_Doc.AddChild(l_Text);
   if not l_Doc.QT(InevObject, f_Document) then
    Assert(false);
  finally
   l_Text := nil;
   l_Doc := nil;
  end;//try..finally
 end;//f_Document = nil
 Result := f_Document.ToList;
//#UC END# *4E242246000E_4E2412DF02EA_impl*
end;//TevNodePainter.GetDocument

constructor TevNodePainter.Create(const aTag: Ik2Tag);
//#UC START# *4E2413DD0113_4E2412DF02EA_var*
//#UC END# *4E2413DD0113_4E2412DF02EA_var*
begin
//#UC START# *4E2413DD0113_4E2412DF02EA_impl*
 inherited Create;
 if not aTag.QT(InevObject, f_Tag, nil) then
  Assert(false);
//#UC END# *4E2413DD0113_4E2412DF02EA_impl*
end;//TevNodePainter.Create

class function TevNodePainter.Make(const aTag: Ik2Tag): Il3NodePainter;
//#UC START# *4E2413EB01DB_4E2412DF02EA_var*
var
 l_NodePainter : TevNodePainter;
//#UC END# *4E2413EB01DB_4E2412DF02EA_var*
begin
//#UC START# *4E2413EB01DB_4E2412DF02EA_impl*
 l_NodePainter := TevNodePainter.Create(aTag);
 try
  Result := l_NodePainter;
 finally
  l3Free(l_NodePainter);
 end;//try..finally
//#UC END# *4E2413EB01DB_4E2412DF02EA_impl*
end;//TevNodePainter.Make

procedure TevNodePainter.PaintNode(const aCanvas: Il3Canvas;
  const aRect: Tl3Rect;
  aSelStart: Integer;
  aSelEnd: Integer;
  DoInverse: Boolean = False);
//#UC START# *476BFDCF003A_4E2412DF02EA_var*
//#UC END# *476BFDCF003A_4E2412DF02EA_var*
begin
//#UC START# *476BFDCF003A_4E2412DF02EA_impl*
 aCanvas.PushWO;
 try
  aCanvas.PushBC;
  try
   aCanvas.WindowOrg := aRect.TopLeft.Neg;
   InternalPaintNode(aCanvas, aRect.Right - aRect.Left, aSelStart, aSelEnd, DoInverse);
  finally
   aCanvas.PopBC;
  end;//try..finally
 finally
  aCanvas.PopWO;
 end;//try..finally
//#UC END# *476BFDCF003A_4E2412DF02EA_impl*
end;//TevNodePainter.PaintNode

function TevNodePainter.CalcHeight(const aCanvas: Il3InfoCanvas;
  aWidth: Integer): Integer;
//#UC START# *476BFDE5038B_4E2412DF02EA_var*
var
 l_Canvas : Il3Canvas;
 l_View   : InevView;
//#UC END# *476BFDE5038B_4E2412DF02EA_var*
begin
//#UC START# *476BFDE5038B_4E2412DF02EA_impl*
 l_Canvas := Tl3VirtualCanvas.Make(l3Point(High(Integer), High(Integer)));
 l_View := TnevNodeView.Make(GetDocument(aWidth, l_Canvas), l_Canvas);
 Result := l_View.RootFormatInfo.InfoForChild(f_Tag).Height;
//#UC END# *476BFDE5038B_4E2412DF02EA_impl*
end;//TevNodePainter.CalcHeight

function TevNodePainter.HintSupported: Boolean;
//#UC START# *49C0DC1201F9_4E2412DF02EA_var*
//#UC END# *49C0DC1201F9_4E2412DF02EA_var*
begin
//#UC START# *49C0DC1201F9_4E2412DF02EA_impl*
 Result := False;
//#UC END# *49C0DC1201F9_4E2412DF02EA_impl*
end;//TevNodePainter.HintSupported

function TevNodePainter.GetItemTextIndent(const aCanvas: Il3InfoCanvas;
  aTextHeight: Integer): Integer;
//#UC START# *49C0E568031B_4E2412DF02EA_var*
//#UC END# *49C0E568031B_4E2412DF02EA_var*
begin
//#UC START# *49C0E568031B_4E2412DF02EA_impl*
 Result := 0;
//#UC END# *49C0E568031B_4E2412DF02EA_impl*
end;//TevNodePainter.GetItemTextIndent

procedure TevNodePainter.Cleanup;
//#UC START# *479731C50290_4E2412DF02EA_var*
//#UC END# *479731C50290_4E2412DF02EA_var*
begin
//#UC START# *479731C50290_4E2412DF02EA_impl*
 f_Document := nil;
 f_Tag := nil;
 inherited;
//#UC END# *479731C50290_4E2412DF02EA_impl*
end;//TevNodePainter.Cleanup

end.