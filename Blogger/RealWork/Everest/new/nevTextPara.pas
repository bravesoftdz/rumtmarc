unit nevTextPara;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/new/nevTextPara.pas"
// �����: 01.04.2005 12:59
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::ParagraphsImplementation::TnevTextPara
//
// ���������� ����������� InevTextPara
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
  l3CacheableBase,
  nevBase,
  nevTools,
  nevLeafPara
  ;

type
 TnevTextPara = class(TnevLeafPara, InevTextPara)
  {* ���������� ����������� InevTextPara }
 protected
 // realized methods
   function pm_GetFormatting(aPosition: Integer): InevDataFormatting;
 protected
 // overridden protected methods
   function GetIsEmpty: Boolean; override;
   function GetAppliesToMaxWidth: Boolean; override;
   function GetIsHidden(aMap: TnevFormatInfoPrim;
    aHiddenStyles: TnevStandardStyles): Boolean; override;
   function GetText: TnevStr; override;
 protected
 // protected methods
   function SegmentIsHidden(const aSegment: InevTag;
     aHiddenStyles: TnevStandardStyles): Boolean;
 public
 // public methods
   class function Make(const aTag: InevTag): InevTextPara; reintroduce;
 end;//TnevTextPara

implementation

uses
  nevFontPrim,
  l3Types,
  nevSegmentObject,
  evSegLst,
  k2Tags,
  evdTypes,
  evTabStops,
  l3String,
  k2Base
  ;

type
  TnevTextParaFormatting = class(Tl3CacheableBase, InevDataFormatting)
  private
  // private fields
   f_Position : Integer;
   f_Para : InevTextPara;
  protected
  // realized methods
   function GetFont(const aView: InevView;
    aMap: TnevFormatInfoPrim;
    Stop: PInteger = nil): InevFontPrim;
   function GetStyle(Stop: PInteger = nil): InevTag;
   function Modify(const aView: InevView): InevDataFormattingModify;
  protected
  // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
  public
  // public methods
   constructor Create(const aPara: InevTextPara;
     aPosition: Integer); reintroduce;
   class function Make(const aPara: InevTextPara;
     aPosition: Integer): InevDataFormatting; reintroduce;
  end;//TnevTextParaFormatting

// start class TnevTextParaFormatting

constructor TnevTextParaFormatting.Create(const aPara: InevTextPara;
  aPosition: Integer);
//#UC START# *48D10D19009B_48D103950150_var*
//#UC END# *48D10D19009B_48D103950150_var*
begin
//#UC START# *48D10D19009B_48D103950150_impl*
 inherited Create;
 f_Para := aPara;
 f_Position := aPosition;
//#UC END# *48D10D19009B_48D103950150_impl*
end;//TnevTextParaFormatting.Create

class function TnevTextParaFormatting.Make(const aPara: InevTextPara;
  aPosition: Integer): InevDataFormatting;
var
 l_Inst : TnevTextParaFormatting;
begin
 l_Inst := Create(aPara, aPosition);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TnevTextParaFormatting.GetFont(const aView: InevView;
  aMap: TnevFormatInfoPrim;
  Stop: PInteger = nil): InevFontPrim;
//#UC START# *47C68E0C02E2_48D103950150_var*
var
 l_Segment : InevTag;
//#UC END# *47C68E0C02E2_48D103950150_var*
begin
//#UC START# *47C68E0C02E2_48D103950150_impl*
 l_Segment := aMap.ViewSegments.rAtomEx([k2_tiChildren, l3_siNative, f_Position]);
 if l_Segment.IsValid then
  Result := TnevFontPrim.Make(aMap.InfoForChild(TnevSegmentObject.Make(l_Segment)).GetObjFont(false).Font)
 else
  Result := TnevFontPrim.Make(aMap.GetObjFont(false).Font);
//#UC END# *47C68E0C02E2_48D103950150_impl*
end;//TnevTextParaFormatting.GetFont

function TnevTextParaFormatting.GetStyle(Stop: PInteger = nil): InevTag;
//#UC START# *47C68E3402A5_48D103950150_var*
//#UC END# *47C68E3402A5_48D103950150_var*
begin
//#UC START# *47C68E3402A5_48D103950150_impl*
 Result := f_Para[k2_tiStyle];
//#UC END# *47C68E3402A5_48D103950150_impl*
end;//TnevTextParaFormatting.GetStyle

function TnevTextParaFormatting.Modify(const aView: InevView): InevDataFormattingModify;
//#UC START# *47C68E3D0279_48D103950150_var*
//#UC END# *47C68E3D0279_48D103950150_var*
begin
//#UC START# *47C68E3D0279_48D103950150_impl*
 Result := nil;
//#UC END# *47C68E3D0279_48D103950150_impl*
end;//TnevTextParaFormatting.Modify

procedure TnevTextParaFormatting.Cleanup;
//#UC START# *479731C50290_48D103950150_var*
//#UC END# *479731C50290_48D103950150_var*
begin
//#UC START# *479731C50290_48D103950150_impl*
 f_Para := nil;
 inherited; 
//#UC END# *479731C50290_48D103950150_impl*
end;//TnevTextParaFormatting.Cleanup

function TnevTextPara.SegmentIsHidden(const aSegment: InevTag;
  aHiddenStyles: TnevStandardStyles): Boolean;
//#UC START# *49E59D7F009F_48D100920185_var*
//#UC END# *49E59D7F009F_48D100920185_var*
var
 l_Layer : InevTag;
 l_Child : InevTag;
begin
//#UC START# *49E59D7F009F_48D100920185_impl*
 Result := false;
 if (aHiddenStyles <> []) then
 begin
  if (-aSegment.IntA[k2_tiStyle] in aHiddenStyles) then
  begin
   Result := true;
  end//-aSegment.IntA[k2_tiStyle]..
  else
  begin
   // - �������� ��� ���������� ������ � ������������ �������
   l_Layer := evSegments_GetLayer(TagInst[k2_tiSegments], ev_slView);
   if l_Layer.IsValid AND (l_Layer.ChildrenCount >= 1) then
   begin
    l_Child := l_Layer.Child[0];
    if (l_Child.IntA[k2_tiStart] <= 1) AND
       TagIsHidden(l_Child, aHiddenStyles) then
    begin
     Result := true;
    end;//IntA[k2_tiStart] <= 1..
   end;//l_Layer.IsValid
  end;//aSegment.IntA[k2_tiStyle]..
 end;//aHiddenStyles <> []
//#UC END# *49E59D7F009F_48D100920185_impl*
end;//TnevTextPara.SegmentIsHidden

class function TnevTextPara.Make(const aTag: InevTag): InevTextPara;
var
 l_Inst : TnevTextPara;
begin
 l_Inst := Create(aTag);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TnevTextPara.pm_GetFormatting(aPosition: Integer): InevDataFormatting;
//#UC START# *47C6AB76032D_48D100920185get_var*
//#UC END# *47C6AB76032D_48D100920185get_var*
begin
//#UC START# *47C6AB76032D_48D100920185get_impl*
 Result := TnevTextParaFormatting.Make(Self, aPosition);
//#UC END# *47C6AB76032D_48D100920185get_impl*
end;//TnevTextPara.pm_GetFormatting

function TnevTextPara.GetIsEmpty: Boolean;
//#UC START# *48CF9F4F01D0_48D100920185_var*
//#UC END# *48CF9F4F01D0_48D100920185_var*
begin
//#UC START# *48CF9F4F01D0_48D100920185_impl*
 Result := l3IsNil(pm_GetText);
//#UC END# *48CF9F4F01D0_48D100920185_impl*
end;//TnevTextPara.GetIsEmpty

function TnevTextPara.GetAppliesToMaxWidth: Boolean;
//#UC START# *48CFB17F03A2_48D100920185_var*
//#UC END# *48CFB17F03A2_48D100920185_var*
begin
//#UC START# *48CFB17F03A2_48D100920185_impl*
 Result := (GetRedirect.IntA[k2_tiJustification] = Ord(ev_itPreformatted));
//#UC END# *48CFB17F03A2_48D100920185_impl*
end;//TnevTextPara.GetAppliesToMaxWidth

function TnevTextPara.GetIsHidden(aMap: TnevFormatInfoPrim;
  aHiddenStyles: TnevStandardStyles): Boolean;
//#UC START# *48D0F8DF01AF_48D100920185_var*
var
 l_Hidden : Boolean absolute Result;

 function CheckSegment(const aSegment: InevTag; Index: Integer): Boolean;
 begin//CheckSegment
  Result := false;
  l_Hidden := (Pred(aSegment.IntA[k2_tiStart]) <= 0) AND
              SegmentIsHidden(aSegment, aHiddenStyles);
 end;//CheckSegment

//#UC END# *48D0F8DF01AF_48D100920185_var*
begin
//#UC START# *48D0F8DF01AF_48D100920185_impl*
 if (aHiddenStyles <> []) then
 begin
  Result := inherited GetIsHidden(aMap, aHiddenStyles);
  if not Result then
  begin
   if (aMap <> nil) then
    with aMap.ViewSegments do
     if IsValid then
      IterateChildrenF(k2L2TIA(@CheckSegment));
  end;//not Result
 end//aHiddenStyles <> []
 else
  Result := false;
//#UC END# *48D0F8DF01AF_48D100920185_impl*
end;//TnevTextPara.GetIsHidden

function TnevTextPara.GetText: TnevStr;
//#UC START# *4D7255870102_48D100920185_var*
//#UC END# *4D7255870102_48D100920185_var*
begin
//#UC START# *4D7255870102_48D100920185_impl*
 Result := TagInst.PCharLenA[k2_tiText];
//#UC END# *4D7255870102_48D100920185_impl*
end;//TnevTextPara.GetText

end.