unit evCursor;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evCursor.pas"
// �����: 01.06.2005 16:28
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Cursors::TevCursor
//
// ������
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
  nevBase,
  l3Core,
  evLocation,
  Classes,
  l3IID
  ;

type
 {$Include ..\Everest\evCursor.imp.pas}
 _nevViewBounds_Parent_ = _evCursor_;
 {$Include ..\Everest\nevViewBounds.imp.pas}
 _nevAnchorModify_Parent_ = _nevViewBounds_;
 {$Include ..\Everest\nevAnchorModify.imp.pas}
 TevCursor = class(_nevAnchorModify_, InevPoint, InevBasePoint)
  {* ������ }
 protected
 // property methods
   {$If defined(evNeedMarkers)}
   function pm_GetMarkersSource: IevMarkersSource; virtual;
   {$IfEnd} //evNeedMarkers
   function pm_GetHasInner: Boolean; virtual;
 protected
 // realized methods
   function VertPosition(const aView: InevView;
    aMap: TnevFormatInfoPrim): TnevParaIndex;
   function NeedWindowsCaret: Boolean;
   function ClonePoint(const aView: InevView): InevBasePoint;
   function DeltaX(const aView: InevView;
    const aMap: InevMap): Integer;
   function pm_GetInner: InevBasePoint;
   procedure pm_SetInner(const aValue: InevBasePoint);
   function Get_Position: TnevPosition;
   function InnerFor(const aChild: InevObject;
    var aRealTop: InevBasePoint): InevBasePoint;
   function pm_GetAfterEnd: Boolean;
   function Get_AsLeaf: InevLeafPoint;
   function Get_LinkedPoint: InevLinkedPoint;
   function AtEnd(const aView: InevView): Boolean;
   function AtStart: Boolean;
   function Get_HasInner: Boolean;
   function Get_ShowCollapsed: Boolean;
   procedure Set_ShowCollapsed(aValue: Boolean);
   function Compare(const aPoint: InevBasePoint): Integer;
   procedure CheckPos(const anOp: InevOp);
     {* ����������� �� ���������������� ������� ������� � ��������� ���������. �������� ������� }
   function ReadOnly: Boolean;
   function AsCursor(const aView: InevView): InevPoint;
   {$If defined(evNeedMarkers)}
   function Get_MarkersSource: IevMarkersSource;
   {$IfEnd} //evNeedMarkers
   function ProcessMessage(const aView: InevControlView;
    var aMessage: TMessage;
    aTime: Cardinal): Boolean;
   function Get_Listner: InevPointListner;
   function GetBlockLength: Integer;
   procedure MergeTo(const aView: InevView;
    const aBaseLine: InevBasePoint);
     {* ���������� �������� ������������ ������. }
   function InnerForChildThatNotAfterEnd(aFI: TnevFormatInfoPrim;
    aForDrawing: TnevInnerType): InevBasePoint;
     {* �������� ������ ��������, �� �������� ����� �������� ��������� �����. }
   function HasBaseLine: Boolean;
     {* ��������� ���� �� ����������� ������ � ������� ������ �� ����� }
   procedure AddInner(const aView: InevView;
    const anInner: InevBaseLine4Anchor;
    anIndex: Integer;
    var aFirst: Boolean;
    aMode: TnevAddInnerMode);
   procedure CompareWithOtherInner(const aView: InevView);
     {* ����� ���������� AnchorByPoint ����� �������� "��������������������" (����� ��������� �� ������ ������) �������� ����� � ������� �����. }
   function InnerHead(aPID: Integer): InevBasePoint;
     {* ������ InnerFor, �� ��� ������ ������������ �����, ���������� �� ������ ������ (���� ������������ ������ ��� ������). }
   function HasHeadPart: Boolean;
     {* ������ �������� ����������� ������������ �����. }
   procedure AddHeadInner(const aHeadInner: InevBasePoint);
     {* ������ ��� ���������� � ������� ����� ����������� ������������ ����� (������������ ������ ��� ������). }
   procedure CopyHeadParts(const aFrom: InevBasePoint);
     {* �������� ������ ����� ����������� �����, ���� ��� ����. }
   procedure InitByCursor(const aView: InevView;
    const anInnerPoint: InevBasePoint);
     {* �������������� ������� ����� �� �������. }
   procedure InitBaseLineInner(const aView: InevView;
    const anItem: InevPara);
   function InnerTop(const aChild: InevObject): InevBasePoint;
     {* ���������� ��������� �� �������������� ������� ��� �����. ��� ������� ����� - ������ nil. }
   function pm_GetBeforeStart: Boolean;
 public
 // realized methods
   procedure CorrectMoveRight(const aView: InevView;
     const aPoint: InevBasePoint;
     const anOp: InevOp);
 protected
 // overridden protected methods
   function DoMovePrim(const aView: InevView;
    aCode: Integer;
    const anOp: InevOp;
    aCount: Integer): TnevMoveResult; override;
 protected
 // protected methods
   procedure DoCorrectMoveRight(const aView: InevView;
     const aPoint: InevBasePoint;
     const anOp: InevOp); virtual;
 protected
 // protected properties
   {$If defined(evNeedMarkers)}
   property MarkersSource: IevMarkersSource
     read pm_GetMarkersSource;
   {$IfEnd} //evNeedMarkers
   property HasInner: Boolean
     read pm_GetHasInner;
 end;//TevCursor

implementation

uses
  evOp,
  k2Base,
  l3InterfacesMisc,
  SysUtils,
  k2Tags,
  evdTypes,
  k2Const
  ;

type _Instance_R_ = TevCursor;

{$Include ..\Everest\evCursor.imp.pas}

{$Include ..\Everest\nevViewBounds.imp.pas}

{$Include ..\Everest\nevAnchorModify.imp.pas}

// start class TevCursor

procedure TevCursor.DoCorrectMoveRight(const aView: InevView;
  const aPoint: InevBasePoint;
  const anOp: InevOp);
//#UC START# *50DAB0190074_49D245770337_var*
//#UC END# *50DAB0190074_49D245770337_var*
begin
//#UC START# *50DAB0190074_49D245770337_impl*
 
//#UC END# *50DAB0190074_49D245770337_impl*
end;//TevCursor.DoCorrectMoveRight

{$If defined(evNeedMarkers)}
function TevCursor.pm_GetMarkersSource: IevMarkersSource;
//#UC START# *4A38BC2D00FB_49D245770337get_var*
//#UC END# *4A38BC2D00FB_49D245770337get_var*
begin
//#UC START# *4A38BC2D00FB_49D245770337get_impl*
 Result := nil;
//#UC END# *4A38BC2D00FB_49D245770337get_impl*
end;//TevCursor.pm_GetMarkersSource
{$IfEnd} //evNeedMarkers

function TevCursor.pm_GetHasInner: Boolean;
//#UC START# *4A3A2E170304_49D245770337get_var*
//#UC END# *4A3A2E170304_49D245770337get_var*
begin
//#UC START# *4A3A2E170304_49D245770337get_impl*
 Result := false;
//#UC END# *4A3A2E170304_49D245770337get_impl*
end;//TevCursor.pm_GetHasInner

function TevCursor.VertPosition(const aView: InevView;
  aMap: TnevFormatInfoPrim): TnevParaIndex;
//#UC START# *47C5B65D0195_49D245770337_var*
//#UC END# *47C5B65D0195_49D245770337_var*
begin
//#UC START# *47C5B65D0195_49D245770337_impl*
 Result := GetVertPosition(aView, aMap);
//#UC END# *47C5B65D0195_49D245770337_impl*
end;//TevCursor.VertPosition

function TevCursor.NeedWindowsCaret: Boolean;
//#UC START# *47C5B6D30128_49D245770337_var*
//#UC END# *47C5B6D30128_49D245770337_var*
begin
//#UC START# *47C5B6D30128_49D245770337_impl*
 Result := GetNeedWindowsCaret;
//#UC END# *47C5B6D30128_49D245770337_impl*
end;//TevCursor.NeedWindowsCaret

function TevCursor.ClonePoint(const aView: InevView): InevBasePoint;
//#UC START# *47C5B6E503C3_49D245770337_var*
//#UC END# *47C5B6E503C3_49D245770337_var*
begin
//#UC START# *47C5B6E503C3_49D245770337_impl*
 Result := ParaX.MakePoint;
 Result.AssignPoint(aView, Self);
//#UC END# *47C5B6E503C3_49D245770337_impl*
end;//TevCursor.ClonePoint

function TevCursor.DeltaX(const aView: InevView;
  const aMap: InevMap): Integer;
//#UC START# *47C5B6F202A0_49D245770337_var*
//#UC END# *47C5B6F202A0_49D245770337_var*
begin
//#UC START# *47C5B6F202A0_49D245770337_impl*
 Result := GetDeltaX(aView, aMap);
//#UC END# *47C5B6F202A0_49D245770337_impl*
end;//TevCursor.DeltaX

function TevCursor.pm_GetInner: InevBasePoint;
//#UC START# *47C5B7400152_49D245770337get_var*
//#UC END# *47C5B7400152_49D245770337get_var*
begin
//#UC START# *47C5B7400152_49D245770337get_impl*
 Result := GetInner;
//#UC END# *47C5B7400152_49D245770337get_impl*
end;//TevCursor.pm_GetInner

procedure TevCursor.pm_SetInner(const aValue: InevBasePoint);
//#UC START# *47C5B7400152_49D245770337set_var*
//#UC END# *47C5B7400152_49D245770337set_var*
begin
//#UC START# *47C5B7400152_49D245770337set_impl*
 SetInner(aValue);
//#UC END# *47C5B7400152_49D245770337set_impl*
end;//TevCursor.pm_SetInner

function TevCursor.Get_Position: TnevPosition;
//#UC START# *47C5B75F00AF_49D245770337get_var*
//#UC END# *47C5B75F00AF_49D245770337get_var*
begin
//#UC START# *47C5B75F00AF_49D245770337get_impl*
 Result := Position;
//#UC END# *47C5B75F00AF_49D245770337get_impl*
end;//TevCursor.Get_Position

function TevCursor.InnerFor(const aChild: InevObject;
  var aRealTop: InevBasePoint): InevBasePoint;
//#UC START# *47F5FDA303BC_49D245770337_var*
//#UC END# *47F5FDA303BC_49D245770337_var*
begin
//#UC START# *47F5FDA303BC_49D245770337_impl*
 aRealTop := nil;
 Result := Self.GetInner;
 if (Result <> nil) AND not Result.IsSame(aChild) then
  Result := nil;
//#UC END# *47F5FDA303BC_49D245770337_impl*
end;//TevCursor.InnerFor

function TevCursor.pm_GetAfterEnd: Boolean;
//#UC START# *47F618A90162_49D245770337get_var*
//#UC END# *47F618A90162_49D245770337get_var*
begin
//#UC START# *47F618A90162_49D245770337get_impl*
 Result := false;
//#UC END# *47F618A90162_49D245770337get_impl*
end;//TevCursor.pm_GetAfterEnd

function TevCursor.Get_AsLeaf: InevLeafPoint;
//#UC START# *47FB32280262_49D245770337get_var*
//#UC END# *47FB32280262_49D245770337get_var*
begin
//#UC START# *47FB32280262_49D245770337get_impl*
 Result := AsLeaf;
//#UC END# *47FB32280262_49D245770337get_impl*
end;//TevCursor.Get_AsLeaf

function TevCursor.Get_LinkedPoint: InevLinkedPoint;
//#UC START# *47FCC68B03B1_49D245770337get_var*
//#UC END# *47FCC68B03B1_49D245770337get_var*
begin
//#UC START# *47FCC68B03B1_49D245770337get_impl*
 Result := LinkedPoint;
//#UC END# *47FCC68B03B1_49D245770337get_impl*
end;//TevCursor.Get_LinkedPoint

function TevCursor.AtEnd(const aView: InevView): Boolean;
//#UC START# *47FF3F1800FE_49D245770337_var*
//#UC END# *47FF3F1800FE_49D245770337_var*
begin
//#UC START# *47FF3F1800FE_49D245770337_impl*
 Result := (Self <> nil) AND GetAtEnd(aView);
//#UC END# *47FF3F1800FE_49D245770337_impl*
end;//TevCursor.AtEnd

function TevCursor.AtStart: Boolean;
//#UC START# *47FF414E039D_49D245770337_var*
//#UC END# *47FF414E039D_49D245770337_var*
begin
//#UC START# *47FF414E039D_49D245770337_impl*
 Result := (Self <> nil) AND GetAtStart;
//#UC END# *47FF414E039D_49D245770337_impl*
end;//TevCursor.AtStart

function TevCursor.Get_HasInner: Boolean;
//#UC START# *4A58B79A0360_49D245770337get_var*
//#UC END# *4A58B79A0360_49D245770337get_var*
begin
//#UC START# *4A58B79A0360_49D245770337get_impl*
 Result := HasInner;
//#UC END# *4A58B79A0360_49D245770337get_impl*
end;//TevCursor.Get_HasInner

function TevCursor.Get_ShowCollapsed: Boolean;
//#UC START# *4A5B48A701A9_49D245770337get_var*
//#UC END# *4A5B48A701A9_49D245770337get_var*
begin
//#UC START# *4A5B48A701A9_49D245770337get_impl*
 Result := ShowCollapsed;
//#UC END# *4A5B48A701A9_49D245770337get_impl*
end;//TevCursor.Get_ShowCollapsed

procedure TevCursor.Set_ShowCollapsed(aValue: Boolean);
//#UC START# *4A5B48A701A9_49D245770337set_var*
//#UC END# *4A5B48A701A9_49D245770337set_var*
begin
//#UC START# *4A5B48A701A9_49D245770337set_impl*
 ShowCollapsed := aValue;
//#UC END# *4A5B48A701A9_49D245770337set_impl*
end;//TevCursor.Set_ShowCollapsed

function TevCursor.Compare(const aPoint: InevBasePoint): Integer;
//#UC START# *4A5B60870158_49D245770337_var*
//#UC END# *4A5B60870158_49D245770337_var*
begin
//#UC START# *4A5B60870158_49D245770337_impl*
 Result := DoCompare(aPoint);
//#UC END# *4A5B60870158_49D245770337_impl*
end;//TevCursor.Compare

procedure TevCursor.CheckPos(const anOp: InevOp);
//#UC START# *4A5B6D370262_49D245770337_var*
//#UC END# *4A5B6D370262_49D245770337_var*
begin
//#UC START# *4A5B6D370262_49D245770337_impl*
 DoCheckPos(anOp);
//#UC END# *4A5B6D370262_49D245770337_impl*
end;//TevCursor.CheckPos

function TevCursor.ReadOnly: Boolean;
//#UC START# *4A5C66200185_49D245770337_var*
//#UC END# *4A5C66200185_49D245770337_var*
begin
//#UC START# *4A5C66200185_49D245770337_impl*
 Result := GetReadOnly;
//#UC END# *4A5C66200185_49D245770337_impl*
end;//TevCursor.ReadOnly

function TevCursor.AsCursor(const aView: InevView): InevPoint;
//#UC START# *4A5C750E01F7_49D245770337_var*
//#UC END# *4A5C750E01F7_49D245770337_var*
begin
//#UC START# *4A5C750E01F7_49D245770337_impl*
 Result := Self;
//#UC END# *4A5C750E01F7_49D245770337_impl*
end;//TevCursor.AsCursor

{$If defined(evNeedMarkers)}
function TevCursor.Get_MarkersSource: IevMarkersSource;
//#UC START# *4A5C7D2F0079_49D245770337get_var*
//#UC END# *4A5C7D2F0079_49D245770337get_var*
begin
//#UC START# *4A5C7D2F0079_49D245770337get_impl*
 Result := MarkersSource;
//#UC END# *4A5C7D2F0079_49D245770337get_impl*
end;//TevCursor.Get_MarkersSource
{$IfEnd} //evNeedMarkers

function TevCursor.ProcessMessage(const aView: InevControlView;
  var aMessage: TMessage;
  aTime: Cardinal): Boolean;
//#UC START# *4A5C8A9D0324_49D245770337_var*
//#UC END# *4A5C8A9D0324_49D245770337_var*
begin
//#UC START# *4A5C8A9D0324_49D245770337_impl*
 Result := DoProcessMessage(aView, aMessage, aTime);
//#UC END# *4A5C8A9D0324_49D245770337_impl*
end;//TevCursor.ProcessMessage

function TevCursor.Get_Listner: InevPointListner;
//#UC START# *4A5C9138035D_49D245770337get_var*
//#UC END# *4A5C9138035D_49D245770337get_var*
begin
//#UC START# *4A5C9138035D_49D245770337get_impl*
 Result := Listner;
//#UC END# *4A5C9138035D_49D245770337get_impl*
end;//TevCursor.Get_Listner

function TevCursor.GetBlockLength: Integer;
//#UC START# *4A5C913F0235_49D245770337_var*
//#UC END# *4A5C913F0235_49D245770337_var*
begin
//#UC START# *4A5C913F0235_49D245770337_impl*
 Result := DoGetBlockLength;
//#UC END# *4A5C913F0235_49D245770337_impl*
end;//TevCursor.GetBlockLength

procedure TevCursor.MergeTo(const aView: InevView;
  const aBaseLine: InevBasePoint);
//#UC START# *4A810F81018E_49D245770337_var*
var
 l_Inner   : InevBasePoint;
 l_BLInner : InevBasePoint;
 l_Obj     : InevObject;
//#UC END# *4A810F81018E_49D245770337_var*
begin
//#UC START# *4A810F81018E_49D245770337_impl*
 l_BLInner := aBaseLine.Inner;
 l_Inner := GetInner;
 if (l_Inner <> nil) and (l_BLInner <> nil) then
 begin
  l_Obj := l_Inner.Obj^;
  if (l_BLInner.Obj.PID = l_Obj.PID) then
   l_Inner.MergeTo(aView, l_BLInner)
  else
   if l_Inner.HasBaseLine then
   begin
    if ((l_Obj.PID - l_BLInner.Obj.PID) <> 1) then
    begin
     l_BLInner := l_Obj.BaseLine4Print;
     l_Inner.MergeTo(aView, l_BLInner);
     aBaseLine.Inner := l_BLInner;
     l_BLInner.CompareWithOtherInner(aView);
    end; // if ((l_Obj.PID - l_BLInner.Obj.PID) <> 1) then
   end; // if l_Inner.HasBaseLine and (l_BLInner.PID > l_Inner.PID) then
 end; // if (l_Inner <> nil) and (l_BLInner <> nil) then
//#UC END# *4A810F81018E_49D245770337_impl*
end;//TevCursor.MergeTo

function TevCursor.InnerForChildThatNotAfterEnd(aFI: TnevFormatInfoPrim;
  aForDrawing: TnevInnerType): InevBasePoint;
//#UC START# *4AA76AE00147_49D245770337_var*
//#UC END# *4AA76AE00147_49D245770337_var*
begin
//#UC START# *4AA76AE00147_49D245770337_impl*
 Result := nil;
 Assert(false);
//#UC END# *4AA76AE00147_49D245770337_impl*
end;//TevCursor.InnerForChildThatNotAfterEnd

function TevCursor.HasBaseLine: Boolean;
//#UC START# *4AA76AF90174_49D245770337_var*
//#UC END# *4AA76AF90174_49D245770337_var*
begin
//#UC START# *4AA76AF90174_49D245770337_impl*
 Result := False;
//#UC END# *4AA76AF90174_49D245770337_impl*
end;//TevCursor.HasBaseLine

procedure TevCursor.AddInner(const aView: InevView;
  const anInner: InevBaseLine4Anchor;
  anIndex: Integer;
  var aFirst: Boolean;
  aMode: TnevAddInnerMode);
//#UC START# *4B90DA600047_49D245770337_var*
//#UC END# *4B90DA600047_49D245770337_var*
begin
//#UC START# *4B90DA600047_49D245770337_impl*
 Assert(False);
//#UC END# *4B90DA600047_49D245770337_impl*
end;//TevCursor.AddInner

procedure TevCursor.CompareWithOtherInner(const aView: InevView);
//#UC START# *4B9623150178_49D245770337_var*
//#UC END# *4B9623150178_49D245770337_var*
begin
//#UC START# *4B9623150178_49D245770337_impl*
 Assert(False);
//#UC END# *4B9623150178_49D245770337_impl*
end;//TevCursor.CompareWithOtherInner

function TevCursor.InnerHead(aPID: Integer): InevBasePoint;
//#UC START# *4C456C8E027F_49D245770337_var*
//#UC END# *4C456C8E027F_49D245770337_var*
begin
//#UC START# *4C456C8E027F_49D245770337_impl*
 Result := nil;
//#UC END# *4C456C8E027F_49D245770337_impl*
end;//TevCursor.InnerHead

function TevCursor.HasHeadPart: Boolean;
//#UC START# *4C456CEA01DE_49D245770337_var*
//#UC END# *4C456CEA01DE_49D245770337_var*
begin
//#UC START# *4C456CEA01DE_49D245770337_impl*
 Result := False;
//#UC END# *4C456CEA01DE_49D245770337_impl*
end;//TevCursor.HasHeadPart

procedure TevCursor.AddHeadInner(const aHeadInner: InevBasePoint);
//#UC START# *4C456D220317_49D245770337_var*
//#UC END# *4C456D220317_49D245770337_var*
begin
//#UC START# *4C456D220317_49D245770337_impl*
//#UC END# *4C456D220317_49D245770337_impl*
end;//TevCursor.AddHeadInner

procedure TevCursor.CopyHeadParts(const aFrom: InevBasePoint);
//#UC START# *4C457D0502E1_49D245770337_var*
//#UC END# *4C457D0502E1_49D245770337_var*
begin
//#UC START# *4C457D0502E1_49D245770337_impl*
//#UC END# *4C457D0502E1_49D245770337_impl*
end;//TevCursor.CopyHeadParts

procedure TevCursor.InitByCursor(const aView: InevView;
  const anInnerPoint: InevBasePoint);
//#UC START# *4C735E600112_49D245770337_var*
//#UC END# *4C735E600112_49D245770337_var*
begin
//#UC START# *4C735E600112_49D245770337_impl*
//#UC END# *4C735E600112_49D245770337_impl*
end;//TevCursor.InitByCursor

procedure TevCursor.InitBaseLineInner(const aView: InevView;
  const anItem: InevPara);
//#UC START# *4D9C113C0320_49D245770337_var*
//#UC END# *4D9C113C0320_49D245770337_var*
begin
//#UC START# *4D9C113C0320_49D245770337_impl*
 Assert(False); 
//#UC END# *4D9C113C0320_49D245770337_impl*
end;//TevCursor.InitBaseLineInner

function TevCursor.InnerTop(const aChild: InevObject): InevBasePoint;
//#UC START# *4DDCD59301D5_49D245770337_var*
//#UC END# *4DDCD59301D5_49D245770337_var*
begin
//#UC START# *4DDCD59301D5_49D245770337_impl*
 Result := nil;
//#UC END# *4DDCD59301D5_49D245770337_impl*
end;//TevCursor.InnerTop

function TevCursor.pm_GetBeforeStart: Boolean;
//#UC START# *4EC3B0330271_49D245770337get_var*
//#UC END# *4EC3B0330271_49D245770337get_var*
begin
//#UC START# *4EC3B0330271_49D245770337get_impl*
 Result := False;
//#UC END# *4EC3B0330271_49D245770337get_impl*
end;//TevCursor.pm_GetBeforeStart

procedure TevCursor.CorrectMoveRight(const aView: InevView;
  const aPoint: InevBasePoint;
  const anOp: InevOp);
//#UC START# *50DAA7010050_49D245770337_var*
//#UC END# *50DAA7010050_49D245770337_var*
begin
//#UC START# *50DAA7010050_49D245770337_impl*
 DoCorrectMoveRight(aView, aPoint, anOp);
//#UC END# *50DAA7010050_49D245770337_impl*
end;//TevCursor.CorrectMoveRight

function TevCursor.DoMovePrim(const aView: InevView;
  aCode: Integer;
  const anOp: InevOp;
  aCount: Integer): TnevMoveResult;
//#UC START# *49E31657038E_49D245770337_var*
//#UC END# *49E31657038E_49D245770337_var*
begin
//#UC START# *49E31657038E_49D245770337_impl*
 Case aCode of
  ev_ocTopLeft,
  ev_ocListHome :
  begin
   SetEntryPoint(0, anOp);
   if Self.HasInner then
    Self.GetInner.DoMove(aView, aCode, anOp, aCount);
   Result := ev_dcDoneOk;
  end;{ev_ocTopLeft}
  ev_ocBottomRight,
  ev_ocListEnd,
  ev_ocBottomRightIgnoreMergedCell :
  begin
   SetEntryPoint(High(Integer), anOp);
   if Self.HasInner then
    Self.GetInner.DoMove(aView, aCode, anOp, aCount);
   Result := ev_dcDoneOk;
  end;{ev_ocBottomRight}
  else
   Result := inherited DoMovePrim(aView, aCode, anOp, aCount);
 end;//Case aCode
//#UC END# *49E31657038E_49D245770337_impl*
end;//TevCursor.DoMovePrim

end.