unit nevActiveHyperlink;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/nevActiveHyperlink.pas"
// �����: 04.06.2009 17:29
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::HotSpots::TnevActiveHyperlink
//
// �������� �����������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  nevBase,
  nevTools,
  l3CProtoObject
  ;

type
 InevActiveHyperlink = interface(InevActiveElement)
   ['{2FAD6248-B71E-4E2F-8F01-263AE880319D}']
   function Get_Hyperlink: InevTag;
   property Hyperlink: InevTag
     read Get_Hyperlink;
 end;//InevActiveHyperlink

 TnevActiveHyperlink = class(Tl3CProtoObject, InevActiveHyperlink)
  {* �������� ����������� }
 private
 // private fields
   f_Para : InevPara;
   f_Hyperlink : InevTag;
 protected
 // realized methods
   function IsSame(const anElement: InevActiveElement): Boolean;
   function Get_Hyperlink: InevTag;
   function Get_Para: InevPara;
   procedure Invalidate;
     {* �������������� ������� ��������� �������� }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* ������� ������, ������������ ����� �� ������� ������� ������ �������� � ��� ���������� �������������. }
   {$IfEnd} //not DesignTimeLibrary
 public
 // public methods
   constructor Create(const aPara: InevPara;
    const aHyperlink: InevTag); reintroduce;
   class function Make(const aPara: InevPara;
    const aHyperlink: InevTag): InevActiveHyperlink; reintroduce;
 end;//TnevActiveHyperlink

implementation

uses
  SysUtils,
  k2Tags
  ;

// start class TnevActiveHyperlink

constructor TnevActiveHyperlink.Create(const aPara: InevPara;
  const aHyperlink: InevTag);
//#UC START# *4A27C50D027C_4A27C4D20100_var*
//#UC END# *4A27C50D027C_4A27C4D20100_var*
begin
//#UC START# *4A27C50D027C_4A27C4D20100_impl*
 inherited Create;
 Assert(aPara <> nil);
 Assert(aHyperlink <> nil);
 f_Para := aPara;
 f_Hyperlink := aHyperlink;
//#UC END# *4A27C50D027C_4A27C4D20100_impl*
end;//TnevActiveHyperlink.Create

class function TnevActiveHyperlink.Make(const aPara: InevPara;
  const aHyperlink: InevTag): InevActiveHyperlink;
var
 l_Inst : TnevActiveHyperlink;
begin
 l_Inst := Create(aPara, aHyperlink);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TnevActiveHyperlink.IsSame(const anElement: InevActiveElement): Boolean;
//#UC START# *4A27C48E017F_4A27C4D20100_var*
var
 l_E  : InevActiveHyperlink;
 l_HL : InevTag;
//#UC END# *4A27C48E017F_4A27C4D20100_var*
begin
//#UC START# *4A27C48E017F_4A27C4D20100_impl*
 Result := false;
 if Supports(anElement, InevActiveHyperlink, l_E) then
  try
   if f_Para.IsSame(l_E.Para) then
   begin
    l_HL := l_E.Hyperlink;
    Result := f_Hyperlink.IsSame(l_HL);
    if not Result then
     // - �������� ���������� ������������ �����������
     Result := //(f_Hyperlink.TagType.ID = l_HL.TagType.ID) AND
               // http://mdp.garant.ru/pages/viewpage.action?pageId=176751058
               // - �� ���� ���������� ���� �����, �.�. ����������� ����� �����������
               //   ������ ���������� � ������ ����� ���������� ���� ����������
               //   ����� �������� �����������
               (l_HL.IntA[k2_tiStart] >= f_Hyperlink.IntA[k2_tiStart]) AND
               (l_HL.IntA[k2_tiFinish] <= f_Hyperlink.IntA[k2_tiFinish]);
   end;//f_Para.IsSame(l_E.Para)
  finally
   l_E := nil;
  end;//try..finally
//#UC END# *4A27C48E017F_4A27C4D20100_impl*
end;//TnevActiveHyperlink.IsSame

function TnevActiveHyperlink.Get_Hyperlink: InevTag;
//#UC START# *4A27C5C600AC_4A27C4D20100get_var*
//#UC END# *4A27C5C600AC_4A27C4D20100get_var*
begin
//#UC START# *4A27C5C600AC_4A27C4D20100get_impl*
 Result := f_Hyperlink;
//#UC END# *4A27C5C600AC_4A27C4D20100get_impl*
end;//TnevActiveHyperlink.Get_Hyperlink

function TnevActiveHyperlink.Get_Para: InevPara;
//#UC START# *4A27C5CD001C_4A27C4D20100get_var*
//#UC END# *4A27C5CD001C_4A27C4D20100get_var*
begin
//#UC START# *4A27C5CD001C_4A27C4D20100get_impl*
 Result := f_Para;
//#UC END# *4A27C5CD001C_4A27C4D20100get_impl*
end;//TnevActiveHyperlink.Get_Para

procedure TnevActiveHyperlink.Invalidate;
//#UC START# *4FBF5595010C_4A27C4D20100_var*
//#UC END# *4FBF5595010C_4A27C4D20100_var*
begin
//#UC START# *4FBF5595010C_4A27C4D20100_impl*
 f_Para.Invalidate([]);
//#UC END# *4FBF5595010C_4A27C4D20100_impl*
end;//TnevActiveHyperlink.Invalidate

procedure TnevActiveHyperlink.Cleanup;
//#UC START# *479731C50290_4A27C4D20100_var*
//#UC END# *479731C50290_4A27C4D20100_var*
begin
//#UC START# *479731C50290_4A27C4D20100_impl*
 f_Para := nil;
 f_Hyperlink := nil;
 inherited;
//#UC END# *479731C50290_4A27C4D20100_impl*
end;//TnevActiveHyperlink.Cleanup

{$If not defined(DesignTimeLibrary)}
class function TnevActiveHyperlink.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4A27C4D20100_var*
//#UC END# *47A6FEE600FC_4A27C4D20100_var*
begin
//#UC START# *47A6FEE600FC_4A27C4D20100_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4A27C4D20100_impl*
end;//TnevActiveHyperlink.IsCacheable
{$IfEnd} //not DesignTimeLibrary

end.