unit evContentsSubNode;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ������ �.�.
// ������: "w:/common/components/gui/Garant/Everest/evContentsSubNode.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::ContentsTree::TevContentsSubNode
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
  l3Tree_TLB,
  evInternalInterfaces,
  evContentsTagNode,
  l3Interfaces,
  l3IID
  ;

type
 TevContentsSubNode = class(TevContentsTagNode)
 private
 // private fields
   f_Sub : Ik2Tag;
    {* ���� c���.}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   function GetAsPCharLen: Tl3WString; override;
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
     {* ���������� ������� ���������� }
   function NeedMakeChildren: Boolean; override;
   function GetHandle: Integer; override;
 public
 // public methods
   constructor Create(const aTag: Ik2Tag;
    const aSub: Ik2Tag;
    const aFilter: InevContentsNodeFilter); reintroduce; virtual;
   class function Make(const aTag: Ik2Tag;
    const aSub: Ik2Tag;
    const aFilter: InevContentsNodeFilter): Il3Node;
 end;//TevContentsSubNode

implementation

uses
  l3Base,
  nevTools,
  Sub_Const,
  k2Tags,
  evDocumentPart
  ;

// start class TevContentsSubNode

constructor TevContentsSubNode.Create(const aTag: Ik2Tag;
  const aSub: Ik2Tag;
  const aFilter: InevContentsNodeFilter);
//#UC START# *4DFF24020067_4DFEF18B02C4_var*
//#UC END# *4DFF24020067_4DFEF18B02C4_var*
begin
//#UC START# *4DFF24020067_4DFEF18B02C4_impl*
 inherited Create(aTag, aFilter);
 f_Sub := aSub;
//#UC END# *4DFF24020067_4DFEF18B02C4_impl*
end;//TevContentsSubNode.Create

class function TevContentsSubNode.Make(const aTag: Ik2Tag;
  const aSub: Ik2Tag;
  const aFilter: InevContentsNodeFilter): Il3Node;
//#UC START# *4DFF241100E3_4DFEF18B02C4_var*
var
 l_CN: TevContentsSubNode;
//#UC END# *4DFF241100E3_4DFEF18B02C4_var*
begin
//#UC START# *4DFF241100E3_4DFEF18B02C4_impl*
 l_CN := TevContentsSubNode.Create(aTag, aSub, aFilter);
 try
  Result := l_CN;
 finally
  l3Free(l_CN);
 end;
//#UC END# *4DFF241100E3_4DFEF18B02C4_impl*
end;//TevContentsSubNode.Make

procedure TevContentsSubNode.Cleanup;
//#UC START# *479731C50290_4DFEF18B02C4_var*
//#UC END# *479731C50290_4DFEF18B02C4_var*
begin
//#UC START# *479731C50290_4DFEF18B02C4_impl*
 f_Sub := nil;
 inherited;
//#UC END# *479731C50290_4DFEF18B02C4_impl*
end;//TevContentsSubNode.Cleanup

function TevContentsSubNode.GetAsPCharLen: Tl3WString;
//#UC START# *47A869BB02DE_4DFEF18B02C4_var*
var
 l_Result: Tl3CustomString;
//#UC END# *47A869BB02DE_4DFEF18B02C4_var*
begin
//#UC START# *47A869BB02DE_4DFEF18B02C4_impl*
 l_Result := evGetBlockName(f_Sub);
 if l_Result = nil then
  Result := inherited GetAsPCharLen
 else
  Result := l_Result.AsWStr;
//#UC END# *47A869BB02DE_4DFEF18B02C4_impl*
end;//TevContentsSubNode.GetAsPCharLen

function TevContentsSubNode.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *4A60B23E00C3_4DFEF18B02C4_var*
var
 l_Document : InevPara;
 l_SubList  : InevSubList;
 l_Sub      : IevSub;
//#UC END# *4A60B23E00C3_4DFEF18B02C4_var*
begin
//#UC START# *4A60B23E00C3_4DFEF18B02C4_impl*
 if IID.EQ(Ik2Tag) then
 begin
  Ik2Tag(Obj) := f_Sub;
  Result.SetOk;
  Exit;
 end
 else
 Result := inherited COMQueryInterface(IID, Obj);
 if Result.Fail then
  if IID.EQ(IevSub) then
   if f_Sub.InheritsFrom(k2_idSub) then
   begin
    if Document.QT(InevPara, l_Document, nil) then 
    begin
     if (l_Document <> nil) then
     begin
      l_SubList := l_Document.MainSubList;
      if (l_SubList <> nil) then
       try
        with f_Sub.Attr[k2_tiHandle] do
         if IsValid then
         begin
          IevSub(Obj) := l_SubList.SubEx[AsLong, GetLayerID];
          if (IevSub(Obj) <> nil) then
          begin
           Result.SetOk;
           Exit;
          end;{IevSub(Obj) <> nil}
         end;{IsValid}
       finally
        l_SubList := nil;
       end;{try..finally}
     end;//l_Document <> nil
    end
    else
     Result.SetNoInterface;
   end;//..k2_idSub..
//#UC END# *4A60B23E00C3_4DFEF18B02C4_impl*
end;//TevContentsSubNode.COMQueryInterface

function TevContentsSubNode.NeedMakeChildren: Boolean;
//#UC START# *4DFF1C860175_4DFEF18B02C4_var*
//#UC END# *4DFF1C860175_4DFEF18B02C4_var*
begin
//#UC START# *4DFF1C860175_4DFEF18B02C4_impl*
 Result := False;
//#UC END# *4DFF1C860175_4DFEF18B02C4_impl*
end;//TevContentsSubNode.NeedMakeChildren

function TevContentsSubNode.GetHandle: Integer;
//#UC START# *4DFF2034008D_4DFEF18B02C4_var*
//#UC END# *4DFF2034008D_4DFEF18B02C4_var*
begin
//#UC START# *4DFF2034008D_4DFEF18B02C4_impl*
 Result := f_Sub.IntA[k2_tiHandle];
//#UC END# *4DFF2034008D_4DFEF18B02C4_impl*
end;//TevContentsSubNode.GetHandle

end.