unit nsNodesDataObject;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Business"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Business/List/nsNodesDataObject.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 Core::Common::Business::ListDataObjects::TnsNodesDataObject
//
// ������ ������ ��� ��� ����������� ������.
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
  DynamicTreeUnit,
  l3Interfaces,
  bsTypes,
  evPersistentDataObjectEx,
  l3IID,
  evPersistentDataObject,
  nevBase,
  evdInterfaces
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TnsNodesDataObject = class(TevPersistentDataObjectEx)
  {* ������ ������ ��� ��� ����������� ������. }
 private
 // private fields
   f_Inited : Boolean;
    {* ������ �������� � �����.}
   f_ListType : TbsListType;
   f_List : INodesClipboard;
    {* ������ ���������� ���.}
 protected
 // overridden protected methods
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
     {* ����� ��� ���������� QueryInterface (��� ���������� � ��������) }
   function DataObjectClass: RevDataObject; override;
   function GetIsQuestionNeedBeforeFlush: Boolean; override;
   function DoStore(aFormat: TnevFormat;
    const aPool: IStream;
    const aFilters: InevTagGenerator;
    aFlags: TevdStoreFlags): Boolean; override;
   procedure ClearFields; override;
 public
 // public methods
   constructor Create(const aList: INodesClipboard;
    aListType: TbsListType); reintroduce;
   class function Make(const aList: INodesClipboard;
    aListType: TbsListType): IDataObject; reintroduce;
 end;//TnsNodesDataObject
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  nsNodesInterfacedDataObject,
  l3Base,
  SysUtils,
  nevTools,
  evTypes,
  Classes,
  bsConvert,
  bsUtils
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

// start class TnsNodesDataObject

constructor TnsNodesDataObject.Create(const aList: INodesClipboard;
  aListType: TbsListType);
//#UC START# *48F864830042_468246D003B6_var*
var
 l_OH : InevObjectHolder;
//#UC END# *48F864830042_468246D003B6_var*
begin
//#UC START# *48F864830042_468246D003B6_impl*
 f_Inited := false;
 f_List := aList;
 f_ListType := aListType;
 l_OH := Holder;
 try
  inherited Create(nil, true, cf_EverestBin,
                   l_OH.TagReader, l_OH.TagWriter,
                   l3FormatArray([cf_EverestBin, cf_RTF, cf_UnicodeText,
                               cf_Text, cf_OEMText]),
                   nil);
 finally
  l_OH := nil;
 end;//try..finally
//#UC END# *48F864830042_468246D003B6_impl*
end;//TnsNodesDataObject.Create

class function TnsNodesDataObject.Make(const aList: INodesClipboard;
  aListType: TbsListType): IDataObject;
var
 l_Inst : TnsNodesDataObject;
begin
 l_Inst := Create(aList, aListType);
 try
  Result := l_Inst As IDataObject;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TnsNodesDataObject.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *48F475350256_468246D003B6_var*
//#UC END# *48F475350256_468246D003B6_var*
begin
//#UC START# *48F475350256_468246D003B6_impl*
 if IID.EQ(INodesClipboard) then
 begin
  Result.SetOk;
  INodesClipboard(Obj) := f_List;
 end//IID.EQ(INodesClipboard)
 else
  Result := inherited COMQueryInterface(IID, Obj);
//#UC END# *48F475350256_468246D003B6_impl*
end;//TnsNodesDataObject.COMQueryInterface

function TnsNodesDataObject.DataObjectClass: RevDataObject;
//#UC START# *48F4795901B5_468246D003B6_var*
//#UC END# *48F4795901B5_468246D003B6_var*
begin
//#UC START# *48F4795901B5_468246D003B6_impl*
 Result := TnsNodesInterfacedDataObject;
//#UC END# *48F4795901B5_468246D003B6_impl*
end;//TnsNodesDataObject.DataObjectClass

function TnsNodesDataObject.GetIsQuestionNeedBeforeFlush: Boolean;
//#UC START# *48F4818300A5_468246D003B6_var*
//#UC END# *48F4818300A5_468246D003B6_var*
begin
//#UC START# *48F4818300A5_468246D003B6_impl*
 Result := Assigned(f_List) and (f_List.GetCount > 1000);
//#UC END# *48F4818300A5_468246D003B6_impl*
end;//TnsNodesDataObject.GetIsQuestionNeedBeforeFlush

function TnsNodesDataObject.DoStore(aFormat: TnevFormat;
  const aPool: IStream;
  const aFilters: InevTagGenerator;
  aFlags: TevdStoreFlags): Boolean;
//#UC START# *48F481B6035B_468246D003B6_var*
var
 l_Stream  : IStream;
 l_Read    : Int64;
 l_Written : Int64;
//#UC END# *48F481B6035B_468246D003B6_var*
begin
//#UC START# *48F481B6035B_468246D003B6_impl*
 Result := false;
 if not f_Inited then
 begin
  f_List.AsEvd(bsBusinessToAdapter(bsListPrintOnlyFirstLevel(f_ListType)), l_Stream);
  try
   if (aFormat = Format) then
   begin
    l_Stream.CopyTo(aPool, High(Int64), l_Read, l_Written);
    Result := true;
    Exit;
   end//aFormat = Format
   else
   begin
    l_Stream.CopyTo(Self, High(Int64), l_Read, l_Written);
    Seek(0, soBeginning);
    f_Inited := true;
   end;//aFormat = Format
  finally
   l_Stream := nil;
  end;//try..finally
 end;//not f_Inited
 Result := inherited DoStore(aFormat, aPool, aFilters, aFlags);
//#UC END# *48F481B6035B_468246D003B6_impl*
end;//TnsNodesDataObject.DoStore

procedure TnsNodesDataObject.ClearFields;
 {-}
begin
 f_List := nil;
 inherited;
end;//TnsNodesDataObject.ClearFields

{$IfEnd} //not Admin AND not Monitorings

end.