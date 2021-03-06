unit nevLeafRenderInfo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/new/nevLeafRenderInfo.pas"
// �����: 28.04.2008 15:46
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Rendering::TnevLeafRenderInfo
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
  nevParaFormatInfo,
  nevBase,
  nevTools
  ;

type
 TnevLeafRenderInfo = class(TnevParaFormatInfo)
 protected
 // realized methods
   procedure DoInvalidateShape(const aShape: InevObject;
    aParts: TnevShapeParts); override;
 protected
 // overridden property methods
   function pm_GetLocSpacing: TnevRect; override;
 protected
 // overridden protected methods
   function GetMaxLinesCount: Integer; override;
 end;//TnevLeafRenderInfo

implementation

uses
  nevFacade,
  l3String,
  evParaTools,
  k2Tags,
  TableCell_Const,
  Block_Const,
  nevFormatInfo
  ;

// start class TnevLeafRenderInfo

procedure TnevLeafRenderInfo.DoInvalidateShape(const aShape: InevObject;
  aParts: TnevShapeParts);
//#UC START# *48172A690313_481F0442026B_var*
const
 cForce = [nev_ripHeight, nev_ripLines];
var
 l_H : Integer;
 l_Prepared : TnevRenderingInfoParts;
//#UC END# *48172A690313_481F0442026B_var*
begin
//#UC START# *48172A690313_481F0442026B_impl*
 Assert(aShape.IsSame(Obj));
 if (nev_spExtent in aParts) then
 begin
  l_Prepared := Prepared;
  // ^http://mdp.garant.ru/pages/editpage.action?pageId=93259698 - ���������� ��,
  //  ��� ���� ��� ���������.
  wForce(cForce);
  // - ��� ���� - ����� ����������� ��-�����, ����� - �������� �� �����������������
  //   ��. �������� - http://mdp.garant.ru/pages/viewpage.action?pageId=90440717
  if (nev_ripHeight in l_Prepared) then
  // - ���� �� ���� ���������, �� ������ � ��������
  begin
   l_H := f_FI.rHeight;
   if Prepare([nev_ripHeight]) then
   begin
    //ShapesPainted.Clear;
    // - ��� ������ ����� �����, �.�. ��� ����� ������� ������ ����� ���������
    //   ������? - ���� �����������, �� � ��� ����� ������� ������ ���������
    //   ����������������.
    if ((f_FI.rHeight - l_H) <> 0) then
    begin
     ForceParent;
     ViewArea.InvalidateShape(aShape, [nev_spExtent]);
    end//(l_FI.rHeight - l_H) <> 0
    else
     ViewArea.InvalidateShape(aShape, []);
   end//Prepare
   else
   begin
    ForceParent;
    ViewArea.Invalidate;
    Assert(false);
    // - ����� - ����� ������ ����
   end;//Prepare
  end//nev_ripHeight in l_Prepared
  else
  begin
   ForceParent;
   ViewArea.InvalidateShape(aShape, [nev_spExtent]);
  end;//nev_ripHeight in l_Prepared
 end;//nev_spExtent in aParts
//#UC END# *48172A690313_481F0442026B_impl*
end;//TnevLeafRenderInfo.DoInvalidateShape

function TnevLeafRenderInfo.GetMaxLinesCount: Integer;
//#UC START# *4BC45843011E_481F0442026B_var*
//#UC END# *4BC45843011E_481F0442026B_var*
begin
//#UC START# *4BC45843011E_481F0442026B_impl*
 Result := Height div nev.LineScrollDelta.Y;
//#UC END# *4BC45843011E_481F0442026B_impl*
end;//TnevLeafRenderInfo.GetMaxLinesCount

function TnevLeafRenderInfo.pm_GetLocSpacing: TnevRect;
//#UC START# *4E5F3D1102B8_481F0442026Bget_var*

 procedure CheckCells(const aPara : InevPara; var aRes: InevPara);
 var
  l_C1 : InevTag;
  l_C2 : InevTag;
 begin//CheckCells
  if (aRes <> nil) AND aRes.IsValid then
  begin
   if not evInPara(aPara, k2_idTableCell, l_C1) then
   begin
    if not aPara.Owner.IsValid then
    // - �������� �������� �������
    // http://mdp.garant.ru/pages/viewpage.action?pageId=264902374
    begin
     aRes := nil;
     Exit;
    end//not aPara.Owner.IsValid
    else
    if evInPara(aRes, k2_idTableCell, l_C2) then
     aRes := nil;
   end//not evInPara(aPara, k2_idTableCell, l_C1)
   else
   begin
    if evInPara(aRes, k2_idTableCell, l_C2) then
    begin
     if not l_C1.Box.IsSame(l_C2.Box) then
      aRes := nil;
    end//evInPara(aRes, k2_idTableCell, l_C2)
    else
     aRes := nil;
   end;//not evInPara(aPara, k2_idTableCell, l_C1)
  end;//(aRes <> nil) AND aRes.IsValid
 end;//CheckCells

 procedure CheckRes(const aPara : InevPara; var aRes: InevPara);
 var
  l_B1 : InevTag;
  l_B2 : InevTag;
 begin//CheckRes
  // http://mdp.garant.ru/pages/viewpage.action?pageId=255960842
  if (aRes <> nil) AND aRes.IsValid then
  begin
   if not evInPara(aPara, k2_idBlock, l_B1) then
    if not aPara.Owner.IsValid then
    // - �������� �������� �������
    // http://mdp.garant.ru/pages/viewpage.action?pageId=264902374
    begin
     aRes := nil;
     Exit;
    end//not aPara.Owner.IsValid
    else
     Assert(false);
   if not evInPara(aRes, k2_idBlock, l_B2) then
    Assert(false);
   if (l_B1.IntA[k2_tiHandle] <> l_B2.IntA[k2_tiHandle]) then
    aRes := nil;
  end;//(aRes <> nil) AND aRes.IsValid
 end;//CheckRes

 function l_Prev(const aPara : InevObjectPrim): InevPara;
 var
  l_Para : InevPara;
 begin//l_Prev
  if not aPara.QT(InevPara, l_Para) then
   Assert(false);
  Result := evPrevOverallPara(l_Para);
  CheckRes(l_Para, Result);
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=255960842
  CheckCells(l_Para, Result);
 end;//l_Prev

 function l_Next(const aPara : InevObjectPrim): InevPara;
 var
  l_Para : InevPara;
 begin//l_Next
  if not aPara.QT(InevPara, l_Para) then
   Assert(false);
  Result := evNextOverallPara(l_Para);
  //CheckRes(l_Para, Result);
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=255960842
  CheckCells(l_Para, Result);
 end;//l_Next

 procedure IncTop;
 begin//IncTop
  Result.Top := Result.Top + Self.DecorHeight(nev_dtHeader);
 end;//IncTop

 procedure IncBottom;
 begin//IncBottom
  Result.Bottom := Result.Bottom + Self.DecorHeight(nev_dtFooter);
 end;//IncBottom

var
 l_N : InevPara;
 l_Style : InevTag;
 l_IsHidden : Boolean;
 l_H : Integer;
//#UC END# *4E5F3D1102B8_481F0442026Bget_var*
begin
//#UC START# *4E5F3D1102B8_481F0442026Bget_impl*
 Result := inherited pm_GetLocSpacing;                            
 l_IsHidden := Self.IsHidden(false, false);
 l_Style := Obj.Attr[k2_tiStyle];
 if l_Style.IsValid then
 begin
  if not l3IsNil(l_Style.PCharLenA[k2_tiShortName]) AND
     not l_IsHidden then
  // - ����� ����� ���������, ������� ���� ��������
  begin
   l_H := l_Style.IntA[k2_tiHandle];
   l_N := l_Prev(Obj);
   if (l_N = nil) OR not l_N.IsValid OR
      (l_N.IntA[k2_tiStyle] <> l_H) then
    // - ���� ���������� �������� - �� ����� �� ��� ��
    IncTop
   else
    Result.Top := 0;
   l_N := l_Next(Obj);
   if (l_N = nil) OR not l_N.IsValid OR
      (l_N.IntA[k2_tiStyle] <> l_H) then
    IncBottom;
   if (l_N <> nil) and l_N.IsValid and (l_N.IntA[k2_tiStyle] = l_H) then
   begin
    if evAACStyle(l_H) then
     Result.Bottom := 0;
    {$IFNDEF Nemesis} // ������ �������� �������� �� ����� - ��� ��� ����������� ����� ���������� ������� � ���������.
    l_N.Invalidate([nev_spExtent]);
    {$ENDIF Nemesis}
   end; // if (l_N <> nil) and l_N.IsValid and (l_N.IntA[k2_tiStyle] = l_H) then
   Exit;
  end;//not l3IsNil(l_Style.PCharLenA[k2_tiShortName])
 end;//l_Style.IsValid
 if l3IsNil(Obj.PCharLenA[k2_tiText]) OR
    l_IsHidden then
  if (Result.Bottom > 0) then
  begin
   l_N := l_Next(Obj);
   if (l_N <> nil) AND l_N.IsValid then
    if l_N.DecorObj(nev_dtHeader).IsValid then
     Result.Bottom := 0;
  end;//Result.Bottom > 0
//#UC END# *4E5F3D1102B8_481F0442026Bget_impl*
end;//TnevLeafRenderInfo.pm_GetLocSpacing

end.