unit evSegmentHotSpot;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evSegmentHotSpot.pas"
// �����: 28.01.2000 20:26
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::HotSpots::TevSegmentHotSpot
//
// ������� ����� ��� �������� ���������� ���������� ���������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  k2Interfaces,
  nevBase,
  afwInterfaces,
  l3Units,
  nevTools,
  nevGUIInterfaces,
  afwNavigation,
  evHotSpot,
  l3IID
  ;

type
 TevSegmentPlacement = (
  {* ��������� ������� ������������ �������� }
   ev_spNone
 , ev_spLeft
 , ev_spBody
 , ev_spRight
 );//TevSegmentPlacement

 TevSegmentHotSpot = class(TevHotSpot, IevMoniker, IevMouseMoveHandler, IevHotSpot)
  {* ������� ����� ��� �������� ���������� ���������� ��������� }
 private
 // private fields
   fl_LayerHandle : Integer;
   f_Cursor : InevPoint;
   f_DownPoint : InevBasePoint;
 private
 // private methods
   function IsHyperlink: Boolean;
   function GetHyperLink: InevTag;
     {* ���������� �����������, �� ����������� �� ������ �������� }
    {$If defined(evChangeSegmentByMouse)}
   function GetPlacement: TevSegmentPlacement;
    {$IfEnd} //evChangeSegmentByMouse
    {$If defined(evChangeSegmentByMouse)}
   procedure ChangeBorder(const aTag: InevObject;
     aPosition: Integer;
     const aPack: InevOp);
    {$IfEnd} //evChangeSegmentByMouse
    {$If defined(evChangeSegmentByMouse)}
   function CanChangeBorderPrim(const aPara: InevTag;
     const aSegments: InevTag;
     aPosition: Integer;
     out aPlacement: TevSegmentPlacement): Boolean;
    {$IfEnd} //evChangeSegmentByMouse
    {$If defined(evChangeSegmentByMouse)}
   function CanChangeBorder(const aView: InevControlView;
     const aPt: Tl3Point;
     out aPlacement: TevSegmentPlacement): Boolean;
    {$IfEnd} //evChangeSegmentByMouse
   procedure TryToSelectHypelink(const aView: InevControlView);
 protected
 // realized methods
   function TransMouseMove(const aView: InevControlView;
     const aKeys: TevMouseState;
     out theActiveElement: InevActiveElement): Boolean;
     {* ���������� �������� MouseMove, ������������ ��������� }
   function MouseMove(const aView: InevControlView;
    const Keys: TevMouseState): Boolean;
     {* ������������ ����������� ���� }
   function LButtonDown(const aView: InevControlView;
    const Keys: TevMouseState;
    var Effect: TevMouseEffect): Boolean;
     {* ������������ ������� ����� ������ ���� }
   function LButtonUp(const aView: InevControlView;
    const Keys: TevMouseState): Boolean;
     {* ������������ ���������� ����� ������ ���� }
   function LButtonDoubleClick(const aView: InevControlView;
    const Keys: TevMouseState;
    var Effect: TevMouseEffect): Boolean;
     {* ������������ ������� ������� ����� ������ ���� }
   function RButtonDown(const aView: InevControlView;
    const Keys: TevMouseState): Boolean;
     {* ������������ ������� ������ ������ ���� }
   function RButtonUp(const aView: InevControlView;
    const Keys: TevMouseState): Boolean;
     {* ������������ ���������� ������ ������� ���� }
   function MButtonDown(const aView: InevControlView;
    const Keys: TevMouseState): Boolean;
     {* ������������ ������� ������ ���� }
   function MButtonUp(const aView: InevControlView;
    const Keys: TevMouseState): Boolean;
     {* ������������ ���������� ������ ���� }
   function CanDrag: Boolean;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure DoHitTest(const aView: InevControlView;
    const aState: TafwCursorState;
    var theInfo: TafwCursorInfo); override;
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
     {* ���������� ������� ���������� }
 protected
 // protected methods
   function TryDoHyperlink(const aView: InevControlView;
     anEffects: TafwJumpToEffects): Boolean;
 public
 // public methods
   constructor Create(const aDownPoint: InevBasePoint;
    const aTarget: InevTag;
    aLayerHandle: Integer;
    const aProcessor: InevProcessor); reintroduce;
   class function Make(const aDownPoint: InevBasePoint;
    const aTarget: InevTag;
    aLayerHandle: Integer;
    const aProcessor: InevProcessor): IevHotSpot; reintroduce;
     {* ������ ������� ����� ��� �������� }
 end;//TevSegmentHotSpot

implementation

uses
  SysUtils,
  evdStyles,
  k2Tags,
  HyperLink_Const,
  evdTypes,
  k2Base,
  nevNavigation,
  l3Base,
  evHotSpotMisc,
  nevInterfaces,
  evHyperlink,
  evInternalInterfaces,
  Classes,
  Segment_Const,
  evSegLst,
  l3Const,
  nevActiveHyperlink,
  evCursorTools
  ;

type
  TEffectMap = array [Boolean] of TafwJumpToEffects;
const
   { Internal Constants }
  cEffectMap : TEffectMap = ([], [afw_jteRequestNewWindow]);

// start class TevSegmentHotSpot

function TevSegmentHotSpot.IsHyperlink: Boolean;
//#UC START# *4A269501015E_4A268E590029_var*
//#UC END# *4A269501015E_4A268E590029_var*
begin
//#UC START# *4A269501015E_4A268E590029_impl*
 with GetRedirect^ do
  if InheritsFrom(k2_idHyperLink) then
   Result := true
  else
   Result := ((IntA[k2_tiStyle] = ev_saHyperlinkCont)
             {$IfNDef evSmartHyperlinkCont}
              AND (IntA[k2_tiStart] = 1)
             {$EndIf  evSmartHyperlinkCont} )
             AND GetHyperlink.IsValid;
//#UC END# *4A269501015E_4A268E590029_impl*
end;//TevSegmentHotSpot.IsHyperlink

function TevSegmentHotSpot.GetHyperLink: InevTag;
var
 l_Para : InevPara;
 l_Segment : InevTag absolute Result;

 procedure IterateLayers;

  function DoIt(const anItem: Ik2Tag;
    anIndex: Integer): Boolean;

   procedure IterateSegments;

    function DoIt(const anItem: Ik2Tag;
      anIndex: Integer): Boolean;
    //#UC START# *4BB226CA0326__var*
    //#UC END# *4BB226CA0326__var*
    begin
    //#UC START# *4BB226CA0326__impl*
     if anItem.IsValid and anItem.InheritsFrom(k2_idHyperLink) then
     begin
      l_Segment := anItem;
      Result := false;
     end//anItem.IsValid and anItem.InheritsFrom(k2_idHyperLink)
     else
      Result := true;
    //#UC END# *4BB226CA0326__impl*
    end;//DoIt

   //#UC START# *4BB22F6C00B4__var*
   //#UC END# *4BB22F6C00B4__var*
   begin
    //#UC START# *4BB22F6C00B4iter*
    anItem.
    //#UC END# *4BB22F6C00B4iter*
     IterateChildrenF(L2Ik2TagIterateChildrenFAction(@DoIt)
      //#UC START# *4BB22F6C00B4iterparam*
      //#UC END# *4BB22F6C00B4iterparam*
     );
   end;//IterateSegments

  //#UC START# *4BB22649001E__var*
  //#UC END# *4BB22649001E__var*
  var
   l_Handle : Integer;
  begin
  //#UC START# *4BB22649001E__impl*
   l_Handle := anItem.IntA[k2_tiHandle];
   if (l_Handle = ev_slHyperlinks) then
   begin
    IterateSegments;
    Result := l_Segment.IsNull;
   end//l_Handle = ev_slHyperlinks
   else
    Result := true;
  //#UC END# *4BB22649001E__impl*
  end;//DoIt

 //#UC START# *4BB225E103A4__var*
 //#UC END# *4BB225E103A4__var*
 begin
  //#UC START# *4BB225E103A4iter*
  with l_Para.Attr[k2_tiSegments] do
   if IsValid then                                 
  //#UC END# *4BB225E103A4iter*
   IterateChildrenF(L2Ik2TagIterateChildrenFAction(@DoIt)
    //#UC START# *4BB225E103A4iterparam*
    //#UC END# *4BB225E103A4iterparam*
   );
 end;//IterateLayers

//#UC START# *4A269526011E_4A268E590029_var*
//#UC END# *4A269526011E_4A268E590029_var*
begin
//#UC START# *4A269526011E_4A268E590029_impl*
 l_Segment := k2NullTag;
 l_Para := f_DownPoint.Obj.AsPara;
 while (l_Para <> nil) do
 begin
  l_Para := l_Para.Prev;
  if l_Para.IsNull then Break;
  IterateLayers;
  if not l_Segment.IsNull then Break;
 end;//while (l_Point <> nil) and 
//#UC END# *4A269526011E_4A268E590029_impl*
end;//TevSegmentHotSpot.GetHyperLink

{$If defined(evChangeSegmentByMouse)}
function TevSegmentHotSpot.GetPlacement: TevSegmentPlacement;
//#UC START# *4A26A1E303A6_4A268E590029_var*
//#UC END# *4A26A1E303A6_4A268E590029_var*
var
 l_CursorPos : Integer;
begin
//#UC START# *4A26A1E303A6_4A268E590029_impl*
 Result := ev_spNone;
 with GetRedirect^ do
 begin
  if InheritsFrom(k2_idSegment) then
  begin
   Result := ev_spBody;
   l_CursorPos := f_DownPoint.Position;
   if (l_CursorPos = Pred(IntA[k2_tiStart])) then
    Result := ev_spLeft
   else
    if (l_CursorPos = Pred(IntA[k2_tiFinish])) then
     Result := ev_spRight
  end;//InheritsFrom(k2_idSegment)
 end;//with GetRedirect^
//#UC END# *4A26A1E303A6_4A268E590029_impl*
end;//TevSegmentHotSpot.GetPlacement
{$IfEnd} //evChangeSegmentByMouse

{$If defined(evChangeSegmentByMouse)}
procedure TevSegmentHotSpot.ChangeBorder(const aTag: InevObject;
  aPosition: Integer;
  const aPack: InevOp);
//#UC START# *4A26A2020328_4A268E590029_var*
//#UC END# *4A26A2020328_4A268E590029_var*
var
 l_Placement : TevSegmentPlacement;
 l_Segments : InevTag;
begin
//#UC START# *4A26A2020328_4A268E590029_impl*
 l_Segments := aTag.Attr[k2_tiSegments];
 if CanChangeBorderPrim(aTag, l_Segments, aPosition, l_Placement) then
 begin
  case l_Placement of
   ev_spLeft:
    GetRedirect.IntW[k2_tiStart, aPack] := Succ(aPosition);
   ev_spRight:
    GetRedirect.IntW[k2_tiFinish, aPack] := aPosition;
  end;{case l_Placement}
  aPack.MarkModified(aTag);
  evSegments_ClearSuper(aTag, aPack);
  //aTag.Shape.Unformat(false); // <stub>
 end;//CanChangeBorder
//#UC END# *4A26A2020328_4A268E590029_impl*
end;//TevSegmentHotSpot.ChangeBorder
{$IfEnd} //evChangeSegmentByMouse

{$If defined(evChangeSegmentByMouse)}
function TevSegmentHotSpot.CanChangeBorderPrim(const aPara: InevTag;
  const aSegments: InevTag;
  aPosition: Integer;
  out aPlacement: TevSegmentPlacement): Boolean;

 function HasSegment(aStart: Integer;
   aFinish: Integer): Boolean;

  function ThereIsSegment(const S: InevTag;
    Index: Integer): Boolean;
  //#UC START# *4A26A3010265__var*
  //#UC END# *4A26A3010265__var*
  begin
  //#UC START# *4A26A3010265__impl*
   Result := false;
   HasSegment := true;
  //#UC END# *4A26A3010265__impl*
  end;//ThereIsSegment

 //#UC START# *4A26A2D40030__var*
 //#UC END# *4A26A2D40030__var*
 begin
 //#UC START# *4A26A2D40030__impl*
  Result := false;
  evSegmentsLayer_IterateSegmentsF(aPara,
                                   aSegments.rAtomEx([k2_tiChildren, k2_tiHandle, fl_LayerHandle]),
                                   aStart, aFinish, k2L2TIA(@thereIsSegment));
//#UC END# *4A26A2D40030__impl*
 end;//HasSegment

//#UC START# *4A26A2600221_4A268E590029_var*
//#UC END# *4A26A2600221_4A268E590029_var*
var
 l_Start : Integer;
 l_Finish : Integer;
begin
//#UC START# *4A26A2600221_4A268E590029_impl*
 if (fl_LayerHandle = ev_slHyperlinks) then
 begin
  aPlacement := GetPlacement;
  with GetRedirect^ do
  begin
   l_Start := IntA[k2_tiStart];
   l_Finish := IntA[k2_tiFinish];
  end;//with GetRedirect^
  case aPlacement of
   ev_spLeft  : begin
    Inc(aPosition);
    if (aPosition > l_Finish) then
    begin
     if (l_Start = l_Finish) then
     begin
      Result := not HasSegment(Succ(l_Finish), aPosition);
      if Result then
       aPlacement := ev_spRight;
     end
     else
      Result := false;
    end
    else
     Result := (aPosition > l_Start) OR not HasSegment(aPosition, Pred(l_Start));
   end;//ev_spLeft
   ev_spRight :
    if (aPosition <{=} l_Start) then
     Result := false
    else
     Result := (aPosition <= l_Finish) OR not HasSegment(Succ(l_Finish), aPosition);
   else Result := false;
  end;{case aPlacement}
 end else
  Result := false;
//#UC END# *4A26A2600221_4A268E590029_impl*
end;//TevSegmentHotSpot.CanChangeBorderPrim
{$IfEnd} //evChangeSegmentByMouse

{$If defined(evChangeSegmentByMouse)}
function TevSegmentHotSpot.CanChangeBorder(const aView: InevControlView;
  const aPt: Tl3Point;
  out aPlacement: TevSegmentPlacement): Boolean;
//#UC START# *4A26A32F026B_4A268E590029_var*
//#UC END# *4A26A32F026B_4A268E590029_var*
var
 l_Tag : InevObject;
 l_Map : InevMap;
 l_Point : InevBasePoint;
begin
//#UC START# *4A26A32F026B_4A268E590029_impl*
 l_Point := aView.PointByPt(aPt);
 l_Tag := f_DownPoint.Obj^;
 Result := CanChangeBorderPrim(l_Tag, l_Tag.Attr[k2_tiSegments], l_Point.MostInner.Position, aPlacement);
 if Result then
 begin
  with l_Tag do
  begin
   if (aPt.Y < -l3Epsilon) then
    Result := false
   else
   begin
    l_Map := aView.MapByPoint(l_Point.MostInner);
    if (l_Map <> nil) AND (aPt.Y > l_Map.Bounds.Bottom + l3Epsilon) then
     Result := false;
   end;
  end;//with l_Tag
 end;//Result
//#UC END# *4A26A32F026B_4A268E590029_impl*
end;//TevSegmentHotSpot.CanChangeBorder
{$IfEnd} //evChangeSegmentByMouse

procedure TevSegmentHotSpot.TryToSelectHypelink(const aView: InevControlView);
//#UC START# *50580EBC032C_4A268E590029_var*
//#UC END# *50580EBC032C_4A268E590029_var*
begin
//#UC START# *50580EBC032C_4A268E590029_impl*
 if (aView.Metrics.AACLike > nev_aacNone) and IsHyperlink then
  EvSelectHyperlink(aView, GetRedirect^, f_DownPoint.Obj^);
//#UC END# *50580EBC032C_4A268E590029_impl*
end;//TevSegmentHotSpot.TryToSelectHypelink

function TevSegmentHotSpot.TryDoHyperlink(const aView: InevControlView;
  anEffects: TafwJumpToEffects): Boolean;
//#UC START# *4A269489009C_4A268E590029_var*
//#UC END# *4A269489009C_4A268E590029_var*
var
 l_MonikerSink : IevMonikerSink;
begin
//#UC START# *4A269489009C_4A268E590029_impl*
 if IsHyperlink AND
    Supports(aView.Control, IevMonikerSink, l_MonikerSink) then
  try
   Result := l_MonikerSink.JumpTo(anEffects, Self);
  finally
   l_MonikerSink := nil;
  end//try..finally
 else
  Result := false;
//#UC END# *4A269489009C_4A268E590029_impl*
end;//TevSegmentHotSpot.TryDoHyperlink

constructor TevSegmentHotSpot.Create(const aDownPoint: InevBasePoint;
  const aTarget: InevTag;
  aLayerHandle: Integer;
  const aProcessor: InevProcessor);
//#UC START# *4A268F9002C7_4A268E590029_var*
//#UC END# *4A268F9002C7_4A268E590029_var*
begin
//#UC START# *4A268F9002C7_4A268E590029_impl*
 inherited Create(aTarget, aProcessor);
 f_DownPoint := aDownPoint;
 fl_LayerHandle := aLayerHandle;
//#UC END# *4A268F9002C7_4A268E590029_impl*
end;//TevSegmentHotSpot.Create

class function TevSegmentHotSpot.Make(const aDownPoint: InevBasePoint;
  const aTarget: InevTag;
  aLayerHandle: Integer;
  const aProcessor: InevProcessor): IevHotSpot;
var
 l_Inst : TevSegmentHotSpot;
begin
 l_Inst := Create(aDownPoint, aTarget, aLayerHandle, aProcessor);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TevSegmentHotSpot.TransMouseMove(const aView: InevControlView;
  const aKeys: TevMouseState;
  out theActiveElement: InevActiveElement): Boolean;
//#UC START# *48E2638F0358_4A268E590029_var*
//#UC END# *48E2638F0358_4A268E590029_var*
begin
//#UC START# *48E2638F0358_4A268E590029_impl*
 Result := true;
 if IsHyperlink then
  theActiveElement := TnevActiveHyperlink.Make(f_DownPoint.Obj.AsPara, GetRedirect^);
//#UC END# *48E2638F0358_4A268E590029_impl*
end;//TevSegmentHotSpot.TransMouseMove

function TevSegmentHotSpot.MouseMove(const aView: InevControlView;
  const Keys: TevMouseState): Boolean;
//#UC START# *48E266730188_4A268E590029_var*
{$IfDef evChangeSegmentByMouse}
var
 l_Placement : TevSegmentPlacement;
{$EndIf evChangeSegmentByMouse}
//#UC END# *48E266730188_4A268E590029_var*
begin
//#UC START# *48E266730188_4A268E590029_impl*
 {$IfDef evChangeSegmentByMouse}
 Result := CanChangeBorder(aView, Tl3Point(Keys.rPoint), l_Placement);
 aView.Control.Selection.SelectPt(Keys.rPoint, true);
 {$Else  evChangeSegmentByMouse}
 Result := false;
 {$EndIf evChangeSegmentByMouse}
//#UC END# *48E266730188_4A268E590029_impl*
end;//TevSegmentHotSpot.MouseMove

function TevSegmentHotSpot.LButtonDown(const aView: InevControlView;
  const Keys: TevMouseState;
  var Effect: TevMouseEffect): Boolean;
//#UC START# *48E266AA00A4_4A268E590029_var*
//#UC END# *48E266AA00A4_4A268E590029_var*
begin
//#UC START# *48E266AA00A4_4A268E590029_impl*
 {$IfDef evChangeSegmentByMouse}
 case GetPlacement of
  ev_spLeft, ev_spRight:
  begin
   if not ((ssCtrl in Keys.rKeys){ AND (ssShift in Keys)}) then
    Result := false
   else
    Result := true;
  end;//ev_spLeft..
  else Result := false;
 end;//case GetPlacement
 {$Else evChangeSegmentByMouse}
 {$IFDEF evSingleHyperlinkClick}
 Result := {(ssShift in Keys.rKeys) AND }IsHyperlink;
 // - �� ���� ��� ������� ����������� ����
 {$ELSE}
 Result := inherited LButtonDown(aView, Keys, Effect);
 {$ENDIF evSingleHyperlinkClick}
 {$EndIf evChangeSegmentByMouse}
//#UC END# *48E266AA00A4_4A268E590029_impl*
end;//TevSegmentHotSpot.LButtonDown

function TevSegmentHotSpot.LButtonUp(const aView: InevControlView;
  const Keys: TevMouseState): Boolean;
//#UC START# *48E266C70128_4A268E590029_var*
{$IfDef evChangeSegmentByMouse}
var
 l_Pack  : InevOp;
 l_Tag   : InevObject;
 l_Point : InevBasePoint;
{$EndIf evChangeSegmentByMouse}
//#UC END# *48E266C70128_4A268E590029_var*
begin
//#UC START# *48E266C70128_4A268E590029_impl*
 {$IfDef evChangeSegmentByMouse}
 Result := false;
 if ((Abs(Keys.rPoint.X - Keys.rInitialPoint.X) > l3Epsilon) OR
    (Abs(Keys.rPoint.Y - Keys.rInitialPoint.Y) > l3Epsilon)) AND
    (ssCtrl in Keys.rKeys) {AND
    (ssShift in Keys)} then
 begin
  l_Pack := Processor.StartOp;
  try
   l_Tag := f_DownPoint.Obj^;
   l_Point := aView.PointByPt(Tl3Point(Keys.rPoint));
   ChangeBorder(l_Tag, l_Point.MostInner.Position, l_Pack);
   Result := true;
  finally
   l_Pack := nil;
  end;{try..finally}
 end;//Abs(Keys.rPoint.X - Keys.rInitialPoint.X) > l3Epsilon.. 
 {$Else  evChangeSegmentByMouse}
 {$IFDEF evSingleHyperlinkClick}
 if not (ssCtrl in Keys.rKeys) then
 begin
  TryToSelectHypelink(aView);
  Result := TryDoHyperlink(aView, cEffectMap[[ssCtrl, ssShift, ssAlt] * Keys.rKeys = [ssShift]])
 end // if not (ssCtrl in Keys.rKeys) then
 else
  Result := False;
 {$Else evSingleHyperlinkClick}
 Result := false;
 {$ENDIF evSingleHyperlinkClick}
 {$EndIf evChangeSegmentByMouse}
//#UC END# *48E266C70128_4A268E590029_impl*
end;//TevSegmentHotSpot.LButtonUp

function TevSegmentHotSpot.LButtonDoubleClick(const aView: InevControlView;
  const Keys: TevMouseState;
  var Effect: TevMouseEffect): Boolean;
//#UC START# *48E266DE026B_4A268E590029_var*
//#UC END# *48E266DE026B_4A268E590029_var*
begin
//#UC START# *48E266DE026B_4A268E590029_impl*
 {$IFNDEF evSingleHyperlinkClick}
 if {$IfDef Archi}
    true
    {$Else  Archi}
    not (ssCtrl in Keys.rKeys)
    {$EndIf Archi}
    then
  Result := TryDoHyperlink(aView, cEffectMap[[ssCtrl, ssShift, ssAlt] * Keys.rKeys = [ssShift]])
 else
  Result := False;
 if Result then
  Effect.rNeedAsyncLoop := false;
 {$ELSE}
 Result := false;
 {$ENDIF evSingleHyperlinkClick}
 if not Result then
  Result := evTranslateMouseAction(aView, Self, ev_mbLeft, ev_maDouble, Keys, Effect);
//#UC END# *48E266DE026B_4A268E590029_impl*
end;//TevSegmentHotSpot.LButtonDoubleClick

function TevSegmentHotSpot.RButtonDown(const aView: InevControlView;
  const Keys: TevMouseState): Boolean;
//#UC START# *48E266FB01FC_4A268E590029_var*
//#UC END# *48E266FB01FC_4A268E590029_var*
begin
//#UC START# *48E266FB01FC_4A268E590029_impl*
 Result := false;
//#UC END# *48E266FB01FC_4A268E590029_impl*
end;//TevSegmentHotSpot.RButtonDown

function TevSegmentHotSpot.RButtonUp(const aView: InevControlView;
  const Keys: TevMouseState): Boolean;
//#UC START# *48E267150266_4A268E590029_var*
var
 l_Dummy : TevMouseEffect;
//#UC END# *48E267150266_4A268E590029_var*
begin
//#UC START# *48E267150266_4A268E590029_impl*
 l3FillChar(l_Dummy, SizeOf(l_Dummy), 0);
 Result := evTranslateMouseAction(aView, Self, ev_mbRight, ev_maUp, Keys, l_Dummy);
//#UC END# *48E267150266_4A268E590029_impl*
end;//TevSegmentHotSpot.RButtonUp

function TevSegmentHotSpot.MButtonDown(const aView: InevControlView;
  const Keys: TevMouseState): Boolean;
//#UC START# *49DB4675025E_4A268E590029_var*
//#UC END# *49DB4675025E_4A268E590029_var*
begin
//#UC START# *49DB4675025E_4A268E590029_impl*
 Result := False;
//#UC END# *49DB4675025E_4A268E590029_impl*
end;//TevSegmentHotSpot.MButtonDown

function TevSegmentHotSpot.MButtonUp(const aView: InevControlView;
  const Keys: TevMouseState): Boolean;
//#UC START# *49DB468302A5_4A268E590029_var*
//#UC END# *49DB468302A5_4A268E590029_var*
begin
//#UC START# *49DB468302A5_4A268E590029_impl*
 Result := TryDoHyperlink(aView, cEffectMap[True]);
//#UC END# *49DB468302A5_4A268E590029_impl*
end;//TevSegmentHotSpot.MButtonUp

function TevSegmentHotSpot.CanDrag: Boolean;
//#UC START# *4ECCD6840014_4A268E590029_var*
//#UC END# *4ECCD6840014_4A268E590029_var*
begin
//#UC START# *4ECCD6840014_4A268E590029_impl*
 Result := True;
//#UC END# *4ECCD6840014_4A268E590029_impl*
end;//TevSegmentHotSpot.CanDrag

procedure TevSegmentHotSpot.Cleanup;
//#UC START# *479731C50290_4A268E590029_var*
//#UC END# *479731C50290_4A268E590029_var*
begin
//#UC START# *479731C50290_4A268E590029_impl*
 f_DownPoint := nil;
 f_Cursor := nil;
 inherited;
//#UC END# *479731C50290_4A268E590029_impl*
end;//TevSegmentHotSpot.Cleanup

procedure TevSegmentHotSpot.DoHitTest(const aView: InevControlView;
  const aState: TafwCursorState;
  var theInfo: TafwCursorInfo);
//#UC START# *4A267FC6016B_4A268E590029_var*
//#UC END# *4A267FC6016B_4A268E590029_var*
begin
//#UC START# *4A267FC6016B_4A268E590029_impl*
 inherited;
 with GetRedirect^ do
 begin
  if InheritsFrom(k2_idSegment) then
  begin
   if IsHyperLink then
   begin
    {$IfDef evChangeSegmentByMouse}
    case GetPlacement of
     ev_spLeft, ev_spRight :
      if (ssControl in aState.rKeys){ AND
         (ssShift in aState.rKeys)} then
       theInfo.rCursor := ev_csHSplit
      else
       theInfo.rCursor := ev_csHandPoint;
     else
      theInfo.rCursor := ev_csHandPoint;
    end;//case GetPlacement
    {$Else  evChangeSegmentByMouse}
    theInfo.rCursor := ev_csHandPoint;
    {$EndIf evChangeSegmentByMouse}
   end//InheritsFrom(k2_idHyperLink)
   else
    theInfo.rCursor := {crCross}ev_csDefault;
  end;//..k2_idSegment..
  if InheritsFrom(k2_idHyperlink) then
  begin
   {$IfDef evChangeSegmentByMouse}
   if (ssControl in aState.rKeys){ AND
      (ssShift in aState.rKeys)} then
   begin
    case GetPlacement of
     ev_spLeft : begin
      theInfo.rHint := str_nevmhhLeftHyperlinkBorder.AsCStr;
      Exit;
     end;//ev_spLeft
     ev_spRight : begin
      theInfo.rHint := str_nevmhhRightHyperlinkBorder.AsCStr;
      Exit;
     end;//ev_spRight
    end;{case GetPlacement}
   end;//(ssControl is aState.rKeys)
   {$EndIf evChangeSegmentByMouse}
   with Attr[k2_tiURL] do
    if IsValid then
    begin
     theInfo.rHint := l3CStr(AsPCharLen);
     Exit;
    end;//with Attr[k2_tiURL]
   with Attr[k2_tiHandle] do
    if IsValid then
    begin
     theInfo.rHint := l3CStr(AsPCharLen);
     Exit;
    end;//with Attr[k2_tiHandle]
  end;//..k2_idHyperlink..
 end;//with GetRedirect^
//#UC END# *4A267FC6016B_4A268E590029_impl*
end;//TevSegmentHotSpot.DoHitTest

function TevSegmentHotSpot.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *4A60B23E00C3_4A268E590029_var*
var
 l_IHyperlink : IevHyperlink;
//#UC END# *4A60B23E00C3_4A268E590029_var*
begin
//#UC START# *4A60B23E00C3_4A268E590029_impl*
 if IID.SomeOf([IevSub, IevDocumentPart]) then
  Result.SetNoInterface
 else
 if IID.EQ(IevHyperlink) then
 begin
  if GetRedirect.InheritsFrom(k2_idHyperlink) then
  begin
   IevHyperlink(Obj) := TevHyperlink.Make(f_DownPoint, GetRedirect^, f_DownPoint.Obj^);
   Result.SetOK;
  end//GetRedirect.InheritsFrom(k2_idHyperlink)
  else
   if (IntA[k2_tiStyle] = ev_saHyperlinkCont)
            {$IfNDef evSmartHyperlinkCont}
             AND (IntA[k2_tiStart] = 1)
            {$EndIf  evSmartHyperlinkCont} then
   begin
    Result.SetOK;
    IevHyperlink(Obj) := TevHyperlink.Make(f_DownPoint, GetHyperLink, f_DownPoint.Obj^);
   end//IntA[k2_tiStyle] = ev_saHyperlinkCont
   else
    Result.SetNOINTERFACE;
 end//IID.EQ(IevHyperlink)
 else
 if IID.SomeOf([IevHyperlinkMoniker, IevIDMoniker, IevURLMoniker,
                IevAddressMoniker]) then
 begin
  if l3IOk(QueryInterface(IevHyperlink, l_IHyperlink)) then
   try
    Result := Tl3HResult_C(l_IHyperlink.QueryInterface(IID.IID, Obj));
   finally
    l_IHyperlink := nil;
   end//try..finally
  else
   Result := inherited COMQueryInterface(IID, Obj);
 end else
  Result := inherited COMQueryInterface(IID, Obj);
//#UC END# *4A60B23E00C3_4A268E590029_impl*
end;//TevSegmentHotSpot.COMQueryInterface

end.