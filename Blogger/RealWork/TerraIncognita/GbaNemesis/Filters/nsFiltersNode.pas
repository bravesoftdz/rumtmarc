unit nsFiltersNode;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Filters"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Filters/nsFiltersNode.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 Core::Common::Filters::Impl::TnsFiltersNode
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
  IOUnit,
  FiltersUnit,
  l3Tree_TLB,
  l3Nodes,
  nsFiltersInterfaces,
  l3Interfaces,
  l3TreeInterfaces,
  l3Types,
  l3IID
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TnsFiltersNode = class(Tl3PlaceNode, InsFilterNode)
 private
 // private fields
   f_Filter : IFilterFromQuery;
   f_NameCache : IString;
 protected
 // realized methods
   function pm_GetUsedStatus: Boolean;
   function pm_GetDeletedStatus: Boolean;
   function pm_GetAutoApplied: Boolean;
   procedure pm_SetAutoApplied(aValue: Boolean);
   function CanModify: Boolean;
   procedure MarkToDelete;
   procedure ValidateName;
   function pm_GetID: Longword;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   function GetAsPCharLen: Tl3WString; override;
   procedure DoSetAsPCharLen(const Value: Tl3PCharLen); override;
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
     {* ���������� ������� ���������� }
   function IsSame(const aNode: Il3SimpleNode): Boolean; override;
 public
 // public methods
   constructor Create(const aFilter: IFilterFromQuery); reintroduce;
   class function Make(const aFilter: IFilterFromQuery): Il3Node; reintroduce;
     {* ��������� ������� TnsFiltersNode.Make }
 end;//TnsFiltersNode
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  SysUtils,
  nsTypes
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

// start class TnsFiltersNode

constructor TnsFiltersNode.Create(const aFilter: IFilterFromQuery);
//#UC START# *4CB30BE00217_4CAEEE74038E_var*
//#UC END# *4CB30BE00217_4CAEEE74038E_var*
begin
//#UC START# *4CB30BE00217_4CAEEE74038E_impl*
 inherited Create;
 f_Filter := aFilter;
//#UC END# *4CB30BE00217_4CAEEE74038E_impl*
end;//TnsFiltersNode.Create

class function TnsFiltersNode.Make(const aFilter: IFilterFromQuery): Il3Node;
var
 l_Inst : TnsFiltersNode;
begin
 l_Inst := Create(aFilter);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TnsFiltersNode.pm_GetUsedStatus: Boolean;
//#UC START# *499189000111_4CAEEE74038Eget_var*
//#UC END# *499189000111_4CAEEE74038Eget_var*
begin
//#UC START# *499189000111_4CAEEE74038Eget_impl*
 Result := f_Filter.IsUsed;
//#UC END# *499189000111_4CAEEE74038Eget_impl*
end;//TnsFiltersNode.pm_GetUsedStatus

function TnsFiltersNode.pm_GetDeletedStatus: Boolean;
//#UC START# *4991890D03D6_4CAEEE74038Eget_var*
//#UC END# *4991890D03D6_4CAEEE74038Eget_var*
begin
//#UC START# *4991890D03D6_4CAEEE74038Eget_impl*
 Result := f_Filter.MarkedToErase;
//#UC END# *4991890D03D6_4CAEEE74038Eget_impl*
end;//TnsFiltersNode.pm_GetDeletedStatus

function TnsFiltersNode.pm_GetAutoApplied: Boolean;
//#UC START# *4991891D0093_4CAEEE74038Eget_var*
//#UC END# *4991891D0093_4CAEEE74038Eget_var*
begin
//#UC START# *4991891D0093_4CAEEE74038Eget_impl*
 Result := f_Filter.GetPermanent;
//#UC END# *4991891D0093_4CAEEE74038Eget_impl*
end;//TnsFiltersNode.pm_GetAutoApplied

procedure TnsFiltersNode.pm_SetAutoApplied(aValue: Boolean);
//#UC START# *4991891D0093_4CAEEE74038Eset_var*
//#UC END# *4991891D0093_4CAEEE74038Eset_var*
begin
//#UC START# *4991891D0093_4CAEEE74038Eset_impl*
 f_Filter.SetPermanent(aValue);
//#UC END# *4991891D0093_4CAEEE74038Eset_impl*
end;//TnsFiltersNode.pm_SetAutoApplied

function TnsFiltersNode.CanModify: Boolean;
//#UC START# *4CAEEF3100F9_4CAEEE74038E_var*
//#UC END# *4CAEEF3100F9_4CAEEE74038E_var*
begin
//#UC START# *4CAEEF3100F9_4CAEEE74038E_impl*
 Result := f_Filter.GetChangeable and not pm_GetDeletedStatus;
//#UC END# *4CAEEF3100F9_4CAEEE74038E_impl*
end;//TnsFiltersNode.CanModify

procedure TnsFiltersNode.MarkToDelete;
//#UC START# *4CB2FCFD029F_4CAEEE74038E_var*
//#UC END# *4CB2FCFD029F_4CAEEE74038E_var*
begin
//#UC START# *4CB2FCFD029F_4CAEEE74038E_impl*
 f_Filter.MarkToErase;
//#UC END# *4CB2FCFD029F_4CAEEE74038E_impl*
end;//TnsFiltersNode.MarkToDelete

procedure TnsFiltersNode.ValidateName;
//#UC START# *4CB55A3101E0_4CAEEE74038E_var*
//#UC END# *4CB55A3101E0_4CAEEE74038E_var*
begin
//#UC START# *4CB55A3101E0_4CAEEE74038E_impl*
 f_NameCache := nil;
//#UC END# *4CB55A3101E0_4CAEEE74038E_impl*
end;//TnsFiltersNode.ValidateName

function TnsFiltersNode.pm_GetID: Longword;
//#UC START# *4FD9E3F900B3_4CAEEE74038Eget_var*
//#UC END# *4FD9E3F900B3_4CAEEE74038Eget_var*
begin
//#UC START# *4FD9E3F900B3_4CAEEE74038Eget_impl*
 Result := f_Filter.GetID;
//#UC END# *4FD9E3F900B3_4CAEEE74038Eget_impl*
end;//TnsFiltersNode.pm_GetID

procedure TnsFiltersNode.Cleanup;
//#UC START# *479731C50290_4CAEEE74038E_var*
//#UC END# *479731C50290_4CAEEE74038E_var*
begin
//#UC START# *479731C50290_4CAEEE74038E_impl*
 f_Filter := nil;
 f_NameCache := nil;
 inherited;
//#UC END# *479731C50290_4CAEEE74038E_impl*
end;//TnsFiltersNode.Cleanup

function TnsFiltersNode.GetAsPCharLen: Tl3WString;
//#UC START# *47A869BB02DE_4CAEEE74038E_var*
var
 l_Name: IString;
//#UC END# *47A869BB02DE_4CAEEE74038E_var*
begin
//#UC START# *47A869BB02DE_4CAEEE74038E_impl*
 if f_NameCache = nil then
  f_Filter.GetName(f_NameCache);
 Result := nsWStr(f_NameCache);
//#UC END# *47A869BB02DE_4CAEEE74038E_impl*
end;//TnsFiltersNode.GetAsPCharLen

procedure TnsFiltersNode.DoSetAsPCharLen(const Value: Tl3PCharLen);
//#UC START# *47A869D10074_4CAEEE74038E_var*
//#UC END# *47A869D10074_4CAEEE74038E_var*
begin
//#UC START# *47A869D10074_4CAEEE74038E_impl*
// !!! Needs to be implemented !!!
//#UC END# *47A869D10074_4CAEEE74038E_impl*
end;//TnsFiltersNode.DoSetAsPCharLen

function TnsFiltersNode.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *4A60B23E00C3_4CAEEE74038E_var*
var
 l_Filter : IFilterFromQuery;
//#UC END# *4A60B23E00C3_4CAEEE74038E_var*
begin
//#UC START# *4A60B23E00C3_4CAEEE74038E_impl*
 if IID.EQ(IFilterFromQuery) then
 begin
  l_Filter := f_Filter;
  if (l_Filter = nil) then
   Result.SetNOINTERFACE
  else
  begin
   Result.SetOk;
   IFilterFromQuery(Obj) := l_Filter;
  end;//l_Filter = nil
 end//IID.EQ(IFilterFromQuery)
 else
 begin
  Result := inherited COMQueryInterface(IID, Obj);
  if Result.fail then
  begin
   l_Filter := f_Filter;
   if (l_Filter = nil) then
    Result.SetNOINTERFACE
   else
    Result := Tl3HResult_C(l_Filter.QueryInterface(IID.IID, Obj));
  end;//l3IFail(Result)
 end;//IID.EQ(IFilterFromQuery)
//#UC END# *4A60B23E00C3_4CAEEE74038E_impl*
end;//TnsFiltersNode.COMQueryInterface

function TnsFiltersNode.IsSame(const aNode: Il3SimpleNode): Boolean;
//#UC START# *4ADEE0F60264_4CAEEE74038E_var*
var
 l_Filter: IFilterFromQuery;
//#UC END# *4ADEE0F60264_4CAEEE74038E_var*
begin
//#UC START# *4ADEE0F60264_4CAEEE74038E_impl*
 if Supports(aNode, IFilterFromQuery, l_Filter) then
  Result := f_Filter.IsSame(l_Filter)
 else
  Result := inherited IsSame(aNode);
//#UC END# *4ADEE0F60264_4CAEEE74038E_impl*
end;//TnsFiltersNode.IsSame

{$IfEnd} //not Admin AND not Monitorings

end.