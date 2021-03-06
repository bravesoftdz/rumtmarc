unit nsDocumentContextHistoryPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/nsDocumentContextHistoryPrim.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 Core::Base Operations::View::BaseSearch::TnsDocumentContextHistoryPrim
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  l3SimpleObject,
  BaseSearchInterfaces,
  afwInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  ,
  InsContextSearchHistoryNotifierList
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 _nsContextHistoryPrim_Parent_ = Tl3SimpleObject;
 {$Include ..\View\nsContextHistoryPrim.imp.pas}
 TnsDocumentContextHistoryPrim = class(_nsContextHistoryPrim_, InsContextSearchHistory)
 public
 // public methods
   constructor Create; reintroduce;
   class function Make: InsContextSearchHistory; reintroduce;
 end;//TnsDocumentContextHistoryPrim
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  afwFacade,
  nsConst
  {$If not defined(NoVCM)}
  ,
  vcmStringList
  {$IfEnd} //not NoVCM
  ,
  SysUtils,
  l3Types,
  l3String
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

{$Include ..\View\nsContextHistoryPrim.imp.pas}

// start class TnsDocumentContextHistoryPrim

constructor TnsDocumentContextHistoryPrim.Create;
//#UC START# *4AD8461A0275_4AD8457200F3_var*
//#UC END# *4AD8461A0275_4AD8457200F3_var*
begin
//#UC START# *4AD8461A0275_4AD8457200F3_impl*
 inherited Create(ns_chkDocument);
//#UC END# *4AD8461A0275_4AD8457200F3_impl*
end;//TnsDocumentContextHistoryPrim.Create

class function TnsDocumentContextHistoryPrim.Make: InsContextSearchHistory;
var
 l_Inst : TnsDocumentContextHistoryPrim;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

{$IfEnd} //not Admin AND not Monitorings

end.