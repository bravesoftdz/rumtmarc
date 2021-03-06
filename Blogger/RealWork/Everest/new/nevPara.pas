unit nevPara;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/new/nevPara.pas"
// �����: 31.03.2005 19:02
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::ParagraphsImplementation::TnevPara
//
// ������� ������ ��� ���������� ������������ ����������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
  k2Interfaces,
  nevBase,
  nevTools,
  nevParaPrim
  ;

type
 TnevPara = class(TnevParaPrim, InevParaInternal)
  {* ������� ������ ��� ���������� ������������ ���������� }
 private
 // private fields
   f_OwnerTag : InevTag;
   f_OwnerPara : InevParaList;
   f_PID : Tk2Integer;
 protected
 // realized methods
   procedure SignalPID(aPID: TnevParaIndex);
 protected
 // overridden protected methods
   function GetOwnerPara: InevParaList; override;
   procedure ClearTagCache; override;
   function GetIsEmpty: Boolean; override;
   function GetAppliesToMaxWidth: Boolean; override;
   function GetIsHiddenPrim(aMap: TnevFormatInfoPrim;
    aHiddenStyles: TnevStandardStyles): Boolean; override;
   function GetDocumentContainer: InevDocumentContainer; override;
   function GetPID: TnevParaIndex; override;
   procedure ClearParents; override;
   function GetPrev: InevPara; override;
   function GetNext: InevPara; override;
   function GetOwnerTag: InevTag; override;
   function GetParentTool: Ik2TagTool; override;
   function DoDelete(anInMerge: Boolean;
    const anOp: InevOp): Boolean; override;
   function GetHolder: InevObjectHolder; override;
 public
 // public methods
   class function Make(const aTag: InevTag): InevParaInternal; reintroduce;
 end;//TnevPara

implementation

uses
  k2Tags,
  k2Const,
  l3Units,
  Classes,
  SysUtils,
  nevFacade,
  ParaList_Const,
  k2Base
  ;

// start class TnevPara

class function TnevPara.Make(const aTag: InevTag): InevParaInternal;
var
 l_Inst : TnevPara;
begin
 l_Inst := Create(aTag);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TnevPara.SignalPID(aPID: TnevParaIndex);
//#UC START# *47C6A7D400FF_48CE0B5703B5_var*
//#UC END# *47C6A7D400FF_48CE0B5703B5_var*
begin
//#UC START# *47C6A7D400FF_48CE0B5703B5_impl*
 cvSet(aPID, f_PID);
//#UC END# *47C6A7D400FF_48CE0B5703B5_impl*
end;//TnevPara.SignalPID

function TnevPara.GetOwnerPara: InevParaList;
//#UC START# *48CE65BC021C_48CE0B5703B5_var*
var
 l_Owner : InevTag;
//#UC END# *48CE65BC021C_48CE0B5703B5_var*
begin
//#UC START# *48CE65BC021C_48CE0B5703B5_impl*
 if (f_OwnerPara = nil) then
 begin
  if (ParentTool = nil) OR
     not ParentTool.GetOwnInterface(InevParaList, Result) then
  begin
   l_Owner := OwnerTag;
   if (l_Owner = nil) then
    Result := nev.NullParaList
   else
    if not l_Owner.QT(InevParaList, Result) then
     if l_Owner.InheritsFrom(k2_idParaList) then
     begin
      Result := nil;
      Assert(false);
     end//l_Owner.InheritsFrom(k2_idParaList)
     else
      Result := nev.NullParaList;
  end;//not ParentTool.GetOwnInterface(InevParaList, Result)
 end//f_OwnerPara = nil
 else
  Result := f_OwnerPara;
 if CanCacheTagState then
  f_OwnerPara := Result;
//#UC END# *48CE65BC021C_48CE0B5703B5_impl*
end;//TnevPara.GetOwnerPara

procedure TnevPara.ClearTagCache;
//#UC START# *48CE74A10014_48CE0B5703B5_var*
//#UC END# *48CE74A10014_48CE0B5703B5_var*
begin
//#UC START# *48CE74A10014_48CE0B5703B5_impl*
 cvReset(f_PID);
 inherited;
//#UC END# *48CE74A10014_48CE0B5703B5_impl*
end;//TnevPara.ClearTagCache

function TnevPara.GetIsEmpty: Boolean;
//#UC START# *48CF9F4F01D0_48CE0B5703B5_var*
//#UC END# *48CF9F4F01D0_48CE0B5703B5_var*
begin
//#UC START# *48CF9F4F01D0_48CE0B5703B5_impl*
 Result := false;
//#UC END# *48CF9F4F01D0_48CE0B5703B5_impl*
end;//TnevPara.GetIsEmpty

function TnevPara.GetAppliesToMaxWidth: Boolean;
//#UC START# *48CFB17F03A2_48CE0B5703B5_var*
//#UC END# *48CFB17F03A2_48CE0B5703B5_var*
begin
//#UC START# *48CFB17F03A2_48CE0B5703B5_impl*
 Result := not TagInst.BoolA[k2_tiRubber];
//#UC END# *48CFB17F03A2_48CE0B5703B5_impl*
end;//TnevPara.GetAppliesToMaxWidth

function TnevPara.GetIsHiddenPrim(aMap: TnevFormatInfoPrim;
  aHiddenStyles: TnevStandardStyles): Boolean;
//#UC START# *48CFB1F5024F_48CE0B5703B5_var*
//#UC END# *48CFB1F5024F_48CE0B5703B5_var*
begin
//#UC START# *48CFB1F5024F_48CE0B5703B5_impl*
 Result := false;
//#UC END# *48CFB1F5024F_48CE0B5703B5_impl*
end;//TnevPara.GetIsHiddenPrim

function TnevPara.GetDocumentContainer: InevDocumentContainer;
//#UC START# *48CFB5700290_48CE0B5703B5_var*
//#UC END# *48CFB5700290_48CE0B5703B5_var*
begin
//#UC START# *48CFB5700290_48CE0B5703B5_impl*
 Result := OwnerPara.DocumentContainer;
//#UC END# *48CFB5700290_48CE0B5703B5_impl*
end;//TnevPara.GetDocumentContainer

function TnevPara.GetPID: TnevParaIndex;
//#UC START# *48CFB61F01FA_48CE0B5703B5_var*
var
 l_Owner    : InevObjectList;
 l_OwnerTag : InevTag;
//#UC END# *48CFB61F01FA_48CE0B5703B5_var*
begin
//#UC START# *48CFB61F01FA_48CE0B5703B5_impl*
 l_Owner := nil;
 if cvCheck(f_PID, Integer(Result)) then
 begin
  l_OwnerTag := OwnerPara;
  try
   if not l_OwnerTag.IsValid then
   begin
    Result := nev_piNull;
    Exit;
   end//not l_OwnerTag.IsValid
   else
   if (Result >= 0) AND
      (Result < l_OwnerTag.ChildrenCount) AND
      l_OwnerTag.Child[Result].IsSame(Self) then
    Exit;
  except
   on EListError do ;
  end;//try..except
 end;//cvCheck(f_PID, Integer(Result))
 begin
  l_Owner := OwnerObj;
  if l_Owner.IsValid then
   Result := l_Owner.IndexOfObj(Self)
  else
   Result := inherited GetPID;
  cvSet(Result, f_PID);
 end;//not cvCheck(f_PID, Result)
//#UC END# *48CFB61F01FA_48CE0B5703B5_impl*
end;//TnevPara.GetPID

procedure TnevPara.ClearParents;
//#UC START# *48CFBCF803B3_48CE0B5703B5_var*
//#UC END# *48CFBCF803B3_48CE0B5703B5_var*
begin
//#UC START# *48CFBCF803B3_48CE0B5703B5_impl*
 f_OwnerTag := nil;
 f_OwnerPara := nil;
 inherited;
//#UC END# *48CFBCF803B3_48CE0B5703B5_impl*
end;//TnevPara.ClearParents

function TnevPara.GetPrev: InevPara;
//#UC START# *48D0B73C0009_48CE0B5703B5_var*
var
 l_PID : TnevParaIndex;
//#UC END# *48D0B73C0009_48CE0B5703B5_var*
begin
//#UC START# *48D0B73C0009_48CE0B5703B5_impl*
 l_PID := Pred(pm_GetPID);
 if (l_PID < nev_piFirst) then
  Result := nev.NullPara
 else
  Result := OwnerPara[l_PID];
//#UC END# *48D0B73C0009_48CE0B5703B5_impl*
end;//TnevPara.GetPrev

function TnevPara.GetNext: InevPara;
//#UC START# *48D0B77A02E5_48CE0B5703B5_var*
var
 l_PID : TnevParaIndex;
//#UC END# *48D0B77A02E5_48CE0B5703B5_var*
begin
//#UC START# *48D0B77A02E5_48CE0B5703B5_impl*
 l_PID := Succ(pm_GetPID);
 if (l_PID >= OwnerPara.ParaCount) then
  Result := nev.NullPara
 else
  Result := OwnerPara[l_PID];
//#UC END# *48D0B77A02E5_48CE0B5703B5_impl*
end;//TnevPara.GetNext

function TnevPara.GetOwnerTag: InevTag;
//#UC START# *48D0BC1D0099_48CE0B5703B5_var*
var
 l_Parent : Ik2TagTool;
//#UC END# *48D0BC1D0099_48CE0B5703B5_var*
begin
//#UC START# *48D0BC1D0099_48CE0B5703B5_impl*
 l_Parent := ParentTool;
 if (l_Parent <> nil) then
  Result := l_Parent
 else 
 if (f_OwnerTag = nil) then
 begin
  if (TagInst = nil) then
   Result := k2NullTag
  else
   Result := TagInst.Owner
 end//f_OwnerTag = nil
 else
  Result := f_OwnerTag;
 if CanCacheTagState then
  f_OwnerTag := Result;
//#UC END# *48D0BC1D0099_48CE0B5703B5_impl*
end;//TnevPara.GetOwnerTag

function TnevPara.GetParentTool: Ik2TagTool;
//#UC START# *48D0BC9401DB_48CE0B5703B5_var*
//#UC END# *48D0BC9401DB_48CE0B5703B5_var*
begin
//#UC START# *48D0BC9401DB_48CE0B5703B5_impl*
 Result := inherited GetParentTool;
 if (Result = nil) AND (f_OwnerPara <> nil) AND f_OwnerPara.IsValid then
  Result := f_OwnerPara;
//#UC END# *48D0BC9401DB_48CE0B5703B5_impl*
end;//TnevPara.GetParentTool

function TnevPara.DoDelete(anInMerge: Boolean;
  const anOp: InevOp): Boolean;
//#UC START# *48D0BFEF01CE_48CE0B5703B5_var*
var
 l_Flags: TevDeleteParaFlags;

 function lp_DeletePara(const anOpPack : InevOp;
                        aCursor        : InevBasePoint): Boolean;
   {* - ������� �������� �� ������� ��������� ������ aCursor. }
 var
  l_Op : IevOpDeletePara;
 begin//evDeletePara
  if Supports(aCursor, IevOpDeletePara, l_Op) then
   try
    Result := l_Op.DoIt(anOpPack, l_Flags);
   finally
    l_Op := nil;
   end//try..finally
  else
   Result := false;
 end;//evDeletePara

var
 l_Tag   : InevObject;
 l_Point : InevBasePoint;
//#UC END# *48D0BFEF01CE_48CE0B5703B5_var*
begin
//#UC START# *48D0BFEF01CE_48CE0B5703B5_impl*
 Result := false;
 l_Tag := Self;
 if anInMerge then
  l_Flags := [ev_dpfInMerge]
 else
  l_Flags := []; 
 repeat
  with l_Tag do
  begin
   l_Point := MakePoint;
   try
    l_Point := l_Point.PointToParent;
    if IsSame(l_Point) then
     Break;
    if lp_DeletePara(anOp, l_Point) then
     Result := true
    else
     Break;
    l_Tag := l_Point.Obj^;
   finally
    l_Point := nil;
   end;//try..finally
  end;//with l_Tag
 until not l_Tag.IsValid OR (l_Tag.ChildrenCount > 0);
//#UC END# *48D0BFEF01CE_48CE0B5703B5_impl*
end;//TnevPara.DoDelete

function TnevPara.GetHolder: InevObjectHolder;
//#UC START# *48D0EC2001E5_48CE0B5703B5_var*
//#UC END# *48D0EC2001E5_48CE0B5703B5_var*
begin
//#UC START# *48D0EC2001E5_48CE0B5703B5_impl*
 //Result := inherited GetHolder;
 Result := OwnerPara.Holder;
//#UC END# *48D0EC2001E5_48CE0B5703B5_impl*
end;//TnevPara.GetHolder

end.