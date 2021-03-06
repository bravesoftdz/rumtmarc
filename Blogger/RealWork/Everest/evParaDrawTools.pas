unit evParaDrawTools;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evParaDrawTools.pas"
// �����: 13.01.2004 18:57
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi::Everest::Printing::evParaDrawTools
//
// ���������� �����-�� �� evTextSource ������ ���������/������
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
  nevRealTools
  ;

function EvDrawPara(const anArea: TnevShapeArea;
  const aPara: InevObject;
  const aTop: InevBasePoint;
  const aBlock: InevRange;
  aPrevHeight: Integer): TnevShapeInfo;
   {* ����� ��������� ��������� }

implementation

// unit methods

function EvDrawPara(const anArea: TnevShapeArea;
  const aPara: InevObject;
  const aTop: InevBasePoint;
  const aBlock: InevRange;
  aPrevHeight: Integer): TnevShapeInfo;
//#UC START# *49CCC052009F_481D76A4005D_var*
//#UC END# *49CCC052009F_481D76A4005D_var*
var
 l_Painter : InevDrawingShape;
 l_Points : TnevShapePoints;
begin
//#UC START# *49CCC052009F_481D76A4005D_impl*
 anArea.rCanvas.BeginPaint;
 try
  if not aPara.IsValid then
   with anArea.rCanvas do
    FillRect(ClipRect)
  else
  begin
   if aPara.QT(InevDrawingShape, l_Painter, nil) then
    try
     l_Points.rTop := aTop;
     l_Points.rCaret := nil;
     l_Points.rSelection := aBlock;
     l_Points.rPrevHeight := aPrevHeight;
     l_Points.rRealTop := nil;
     l_Points.rFake := False;
     l_Points.rCheckCaret := nil;
     l_Points.rCheckSelection := nil;
     anArea.rCanvas.Printed := l_Painter.Draw(anArea, l_Points, Result);
    finally
     l_Painter := nil;
    end;//try..finally
  end;//aPara.IsValid
  anArea.rCanvas.SetPageTop;
 finally
  anArea.rCanvas.EndPaint;
 end;//try..finally
//#UC END# *49CCC052009F_481D76A4005D_impl*
end;//EvDrawPara

end.