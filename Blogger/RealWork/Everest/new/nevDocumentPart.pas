unit nevDocumentPart;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// ������: "w:/common/components/gui/Garant/Everest/new/nevDocumentPart.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::ParagraphsImplementation::TnevDocumentPart
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
  nevParaList,
  nevBase
  ;

type
 TnevDocumentPart = class(TnevParaList)
 protected
 // overridden protected methods
   function GetAppliesToMaxWidth: Boolean; override;
   function GetIsHiddenPrim(aMap: TnevFormatInfoPrim;
    aHiddenStyles: TnevStandardStyles): Boolean; override;
   function TreatCollapsedAsHidden: Boolean; override;
 end;//TnevDocumentPart

implementation

// start class TnevDocumentPart

function TnevDocumentPart.GetAppliesToMaxWidth: Boolean;
//#UC START# *48CFB17F03A2_4F87E8B50206_var*
//#UC END# *48CFB17F03A2_4F87E8B50206_var*
begin
//#UC START# *48CFB17F03A2_4F87E8B50206_impl*
 Result := false;
//#UC END# *48CFB17F03A2_4F87E8B50206_impl*
end;//TnevDocumentPart.GetAppliesToMaxWidth

function TnevDocumentPart.GetIsHiddenPrim(aMap: TnevFormatInfoPrim;
  aHiddenStyles: TnevStandardStyles): Boolean;
//#UC START# *48CFB1F5024F_4F87E8B50206_var*
//#UC END# *48CFB1F5024F_4F87E8B50206_var*
begin
//#UC START# *48CFB1F5024F_4F87E8B50206_impl*
 Result := (GetRedirect.ChildrenCount = 0);
//#UC END# *48CFB1F5024F_4F87E8B50206_impl*
end;//TnevDocumentPart.GetIsHiddenPrim

function TnevDocumentPart.TreatCollapsedAsHidden: Boolean;
//#UC START# *4D596369028C_4F87E8B50206_var*
//#UC END# *4D596369028C_4F87E8B50206_var*
begin
//#UC START# *4D596369028C_4F87E8B50206_impl*
 Result := False;
//#UC END# *4D596369028C_4F87E8B50206_impl*
end;//TnevDocumentPart.TreatCollapsedAsHidden

end.