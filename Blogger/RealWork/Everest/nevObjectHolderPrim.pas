unit nevObjectHolderPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/nevObjectHolderPrim.pas"
// �����: 30.04.2008 15:47
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Document::TnevObjectHolderPrim
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  l3Interfaces,
  nevBase,
  k2Base,
  nevTools,
  nevFormatPool,
  nevSectionBreakList,
  nevDocumentContainerPrim,
  l3NotifyPtrList,
  afwInterfaces
  ;

type
 _l3Notifier_Parent_ = TnevDocumentContainerPrim;
 {$Include w:\common\components\rtl\Garant\L3\l3Notifier.imp.pas}
 _evStyleTableListner_Parent_ = _l3Notifier_;
 {$Include ..\Everest\evStyleTableListner.imp.pas}
 _nevDocumentContainerDecorationRules_Parent_ = _evStyleTableListner_;
 {$Include ..\Everest\nevDocumentContainerDecorationRules.imp.pas}
 TnevObjectHolderPrim = class(_nevDocumentContainerDecorationRules_, InevObjectHolder)
 private
 // private fields
   f_FormatPool : TnevFormatPool;
   f_SectionBreaks : TnevSectionBreakList;
   f_Modified : Boolean;
    {* ���� ��� �������� Modified}
 protected
 // property methods
   procedure pm_SetModified(aValue: Boolean); virtual;
 protected
 // realized methods
   function TagReader: InevTagReader;
   function TagWriter: InevTagWriter;
   function FindObjByID(aParaID: Integer;
    out aPara: InevObject): Boolean;
   function pm_GetObj: InevObject;
   function Get_Modified: Boolean;
   procedure Set_Modified(aValue: Boolean);
   function Get_FormatPool: InevFormatPool;
   function Get_ViewArea: InevViewArea;
   procedure ChildAdded(const aList: InevTag;
    aProp: Tk2ArrayProperty;
    const aChild: InevTag;
    anIndex: Integer;
    const anOpPack: InevOp);
   procedure ChildDeleted(const aList: InevTag;
    aProp: Tk2ArrayProperty;
    const aChild: InevTag;
    anIndex: Integer;
    const anOpPack: InevOp);
   procedure UpdatePreview;
   procedure PropChanged(Prop: Tk2Prop;
    const V: TnevValues;
    const anOpPack: InevOp);
   function Get_SubCache: IevSubCache;
   function Get_SectionBreaks: InevSectionBreaks;
   function pm_GetLock: Il3Lock;
   {$If not defined(DesignTimeLibrary)}
   procedure DoStyleTableChanged; override;
   {$IfEnd} //not DesignTimeLibrary
   procedure SectionBreakAdded(const anObject: InevObject);
     {* ��������� ������ ������� }
   function GetControlImg(const aControl: TnevControlInfo;
    out theImageInfo: TnevControlImageInfo): Boolean;
 public
 // realized methods
   procedure InvalidateShape(const aShape: InevObject;
    aParts: TnevShapeParts);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
 protected
 // protected methods
   function DoGetControlImg(const aControl: TnevControlInfo;
     var theImageInfo: TnevControlImageInfo): Boolean; virtual;
   function GetObj: InevObject; virtual;
   procedure DoInvalidateShape(const aShape: InevObject;
    aParts: TnevShapeParts); virtual; abstract;
   function GetTagReader: InevTagReader; virtual; abstract;
   function GetTagWriter: InevTagWriter; virtual; abstract;
   function DoFindObjByID(aParaID: Integer;
    out aPara: InevObject): Boolean; virtual;
   function GetViewArea: InevViewArea; virtual;
   procedure DoChildAdded(const aList: InevTag;
    const aChild: InevTag;
    anIndex: Integer;
    const anOpPack: InevOp); virtual;
   procedure DoChildDeleted(const aList: InevTag;
    const aChild: InevTag;
    anIndex: Integer;
    const anOpPack: InevOp); virtual;
   procedure UnformatAll; virtual;
   function GetLock: Il3Lock; virtual;
   procedure DoUpdatePreview; virtual;
   procedure DoPropChanged(Prop: Tk2Prop;
    const V: TnevValues;
    const anOpPack: InevOp); virtual;
   function GetSubCache: IevSubCache; virtual;
 protected
 // protected properties
   property Modified: Boolean
     read f_Modified
     write pm_SetModified;
 end;//TnevObjectHolderPrim

implementation

uses
  SysUtils,
  k2Tags,
  Para_Const,
  ObjectSegment_Const,
  SectionBreak_Const,
  l3Base
  {$If not defined(DesignTimeLibrary)}
  ,
  evStyleTableSpy
  {$IfEnd} //not DesignTimeLibrary
  
  ;

{$Include w:\common\components\rtl\Garant\L3\l3Notifier.imp.pas}

{$Include ..\Everest\evStyleTableListner.imp.pas}

{$Include ..\Everest\nevDocumentContainerDecorationRules.imp.pas}

// start class TnevObjectHolderPrim

function TnevObjectHolderPrim.DoGetControlImg(const aControl: TnevControlInfo;
  var theImageInfo: TnevControlImageInfo): Boolean;
//#UC START# *4E5E386A0119_48185C4002DC_var*
//#UC END# *4E5E386A0119_48185C4002DC_var*
begin
//#UC START# *4E5E386A0119_48185C4002DC_impl*
 Result := false;
//#UC END# *4E5E386A0119_48185C4002DC_impl*
end;//TnevObjectHolderPrim.DoGetControlImg

procedure TnevObjectHolderPrim.pm_SetModified(aValue: Boolean);
//#UC START# *4918285A0247_48185C4002DCset_var*
//#UC END# *4918285A0247_48185C4002DCset_var*
begin
//#UC START# *4918285A0247_48185C4002DCset_impl*
 f_Modified := aValue
//#UC END# *4918285A0247_48185C4002DCset_impl*
end;//TnevObjectHolderPrim.pm_SetModified

function TnevObjectHolderPrim.GetObj: InevObject;
//#UC START# *48185EEB0234_48185C4002DC_var*
//#UC END# *48185EEB0234_48185C4002DC_var*
begin
//#UC START# *48185EEB0234_48185C4002DC_impl*
 Result := nil;
//#UC END# *48185EEB0234_48185C4002DC_impl*
end;//TnevObjectHolderPrim.GetObj

function TnevObjectHolderPrim.DoFindObjByID(aParaID: Integer;
  out aPara: InevObject): Boolean;
//#UC START# *491829B003B9_48185C4002DC_var*
//#UC END# *491829B003B9_48185C4002DC_var*
begin
//#UC START# *491829B003B9_48185C4002DC_impl*
 Result := false;
 Assert(false);
//#UC END# *491829B003B9_48185C4002DC_impl*
end;//TnevObjectHolderPrim.DoFindObjByID

function TnevObjectHolderPrim.GetViewArea: InevViewArea;
//#UC START# *491829EC0312_48185C4002DC_var*
//#UC END# *491829EC0312_48185C4002DC_var*
begin
//#UC START# *491829EC0312_48185C4002DC_impl*
 Result := nil;
//#UC END# *491829EC0312_48185C4002DC_impl*
end;//TnevObjectHolderPrim.GetViewArea

procedure TnevObjectHolderPrim.DoChildAdded(const aList: InevTag;
  const aChild: InevTag;
  anIndex: Integer;
  const anOpPack: InevOp);
//#UC START# *49182BA9012A_48185C4002DC_var*
//#UC END# *49182BA9012A_48185C4002DC_var*
begin
//#UC START# *49182BA9012A_48185C4002DC_impl*
  // - ������ �� ������
//#UC END# *49182BA9012A_48185C4002DC_impl*
end;//TnevObjectHolderPrim.DoChildAdded

procedure TnevObjectHolderPrim.DoChildDeleted(const aList: InevTag;
  const aChild: InevTag;
  anIndex: Integer;
  const anOpPack: InevOp);
//#UC START# *49182BD6003A_48185C4002DC_var*
//#UC END# *49182BD6003A_48185C4002DC_var*
begin
//#UC START# *49182BD6003A_48185C4002DC_impl*
  // - ������ �� ������
//#UC END# *49182BD6003A_48185C4002DC_impl*
end;//TnevObjectHolderPrim.DoChildDeleted

procedure TnevObjectHolderPrim.UnformatAll;
//#UC START# *49182CD402C9_48185C4002DC_var*
//#UC END# *49182CD402C9_48185C4002DC_var*
begin
//#UC START# *49182CD402C9_48185C4002DC_impl*
 FreeAndNil(f_FormatPool);
//#UC END# *49182CD402C9_48185C4002DC_impl*
end;//TnevObjectHolderPrim.UnformatAll

function TnevObjectHolderPrim.GetLock: Il3Lock;
//#UC START# *491843CA02B6_48185C4002DC_var*
//#UC END# *491843CA02B6_48185C4002DC_var*
begin
//#UC START# *491843CA02B6_48185C4002DC_impl*
 Result := nil;
//#UC END# *491843CA02B6_48185C4002DC_impl*
end;//TnevObjectHolderPrim.GetLock

procedure TnevObjectHolderPrim.DoUpdatePreview;
//#UC START# *491846A703C6_48185C4002DC_var*
//#UC END# *491846A703C6_48185C4002DC_var*
begin
//#UC START# *491846A703C6_48185C4002DC_impl*
 // - ������ �� ������
//#UC END# *491846A703C6_48185C4002DC_impl*
end;//TnevObjectHolderPrim.DoUpdatePreview

procedure TnevObjectHolderPrim.DoPropChanged(Prop: Tk2Prop;
  const V: TnevValues;
  const anOpPack: InevOp);
//#UC START# *49184A180301_48185C4002DC_var*
//#UC END# *49184A180301_48185C4002DC_var*
begin
//#UC START# *49184A180301_48185C4002DC_impl*
 // ������ �� ������
//#UC END# *49184A180301_48185C4002DC_impl*
end;//TnevObjectHolderPrim.DoPropChanged

function TnevObjectHolderPrim.GetSubCache: IevSubCache;
//#UC START# *49184AEF0187_48185C4002DC_var*
//#UC END# *49184AEF0187_48185C4002DC_var*
begin
//#UC START# *49184AEF0187_48185C4002DC_impl*
 Result := nil;
//#UC END# *49184AEF0187_48185C4002DC_impl*
end;//TnevObjectHolderPrim.GetSubCache

function TnevObjectHolderPrim.TagReader: InevTagReader;
//#UC START# *47C6B2A20221_48185C4002DC_var*
//#UC END# *47C6B2A20221_48185C4002DC_var*
begin
//#UC START# *47C6B2A20221_48185C4002DC_impl*
 Result := GetTagReader;
//#UC END# *47C6B2A20221_48185C4002DC_impl*
end;//TnevObjectHolderPrim.TagReader

function TnevObjectHolderPrim.TagWriter: InevTagWriter;
//#UC START# *47C6B2AF033B_48185C4002DC_var*
//#UC END# *47C6B2AF033B_48185C4002DC_var*
begin
//#UC START# *47C6B2AF033B_48185C4002DC_impl*
 Result := GetTagWriter;
//#UC END# *47C6B2AF033B_48185C4002DC_impl*
end;//TnevObjectHolderPrim.TagWriter

function TnevObjectHolderPrim.FindObjByID(aParaID: Integer;
  out aPara: InevObject): Boolean;
//#UC START# *47C6B2B903D6_48185C4002DC_var*
//#UC END# *47C6B2B903D6_48185C4002DC_var*
begin
//#UC START# *47C6B2B903D6_48185C4002DC_impl*
 Result := DoFindObjByID(aParaID, aPara);
//#UC END# *47C6B2B903D6_48185C4002DC_impl*
end;//TnevObjectHolderPrim.FindObjByID

function TnevObjectHolderPrim.pm_GetObj: InevObject;
//#UC START# *47C6B2D10224_48185C4002DCget_var*
//#UC END# *47C6B2D10224_48185C4002DCget_var*
begin
//#UC START# *47C6B2D10224_48185C4002DCget_impl*
 Result := GetObj;
//#UC END# *47C6B2D10224_48185C4002DCget_impl*
end;//TnevObjectHolderPrim.pm_GetObj

function TnevObjectHolderPrim.Get_Modified: Boolean;
//#UC START# *47C6B2E00015_48185C4002DCget_var*
//#UC END# *47C6B2E00015_48185C4002DCget_var*
begin
//#UC START# *47C6B2E00015_48185C4002DCget_impl*
 Result := Modified;
//#UC END# *47C6B2E00015_48185C4002DCget_impl*
end;//TnevObjectHolderPrim.Get_Modified

procedure TnevObjectHolderPrim.Set_Modified(aValue: Boolean);
//#UC START# *47C6B2E00015_48185C4002DCset_var*
//#UC END# *47C6B2E00015_48185C4002DCset_var*
begin
//#UC START# *47C6B2E00015_48185C4002DCset_impl*
 Modified := aValue;
//#UC END# *47C6B2E00015_48185C4002DCset_impl*
end;//TnevObjectHolderPrim.Set_Modified

function TnevObjectHolderPrim.Get_FormatPool: InevFormatPool;
//#UC START# *4810D88D0195_48185C4002DCget_var*
//#UC END# *4810D88D0195_48185C4002DCget_var*
begin
//#UC START# *4810D88D0195_48185C4002DCget_impl*
 if (f_FormatPool = nil) then
  f_FormatPool := TnevFormatPool.Create(Self);
 Result := f_FormatPool;
//#UC END# *4810D88D0195_48185C4002DCget_impl*
end;//TnevObjectHolderPrim.Get_FormatPool

procedure TnevObjectHolderPrim.InvalidateShape(const aShape: InevObject;
  aParts: TnevShapeParts);
//#UC START# *4816E2B2004E_48185C4002DC_var*
//#UC END# *4816E2B2004E_48185C4002DC_var*
begin
//#UC START# *4816E2B2004E_48185C4002DC_impl*
 if (f_FormatPool <> nil) then
  f_FormatPool.InvalidateShape(aShape, aParts)
 else
  DoInvalidateShape(aShape, aParts);
//#UC END# *4816E2B2004E_48185C4002DC_impl*
end;//TnevObjectHolderPrim.InvalidateShape

function TnevObjectHolderPrim.Get_ViewArea: InevViewArea;
//#UC START# *481850DC002E_48185C4002DCget_var*
//#UC END# *481850DC002E_48185C4002DCget_var*
begin
//#UC START# *481850DC002E_48185C4002DCget_impl*
 Result := GetViewArea;
//#UC END# *481850DC002E_48185C4002DCget_impl*
end;//TnevObjectHolderPrim.Get_ViewArea

procedure TnevObjectHolderPrim.ChildAdded(const aList: InevTag;
  aProp: Tk2ArrayProperty;
  const aChild: InevTag;
  anIndex: Integer;
  const anOpPack: InevOp);
//#UC START# *491815640172_48185C4002DC_var*
var
 l_List : InevParaList;
 l_Obj  : InevObject;
//#UC END# *491815640172_48185C4002DC_var*
begin
//#UC START# *491815640172_48185C4002DC_impl*
 if aChild.InheritsFrom(k2_idPara) then
 begin
  if (f_FormatPool <> nil) then
  begin
   if (anOpPack = nil) OR not anOpPack.InIOProcess then
   begin
    if not aList.QT(InevParaList, l_List) then
     if aList.InheritsFrom(k2_idObjectSegment) or aList.InheritsFrom(k2_idObjectSegment_Children) then
      Exit
     else
      Assert(false);
    f_FormatPool.ChildAdded(l_List, l_List.Para[anIndex]);
   end//anOpPack = nil..
   else
    f_FormatPool.Clear;
    // - ��� �������� ����� �������
  end;//f_FormatPool <> nil
  if aChild.InheritsFrom(k2_idSectionBreak) then
  begin
   if not aChild.QT(InevObject, l_Obj) then
    Assert(false);
   SectionBreakAdded(l_Obj);
  end;//aChild.InheritsFrom(k2_idSectionBreak)
 end;//aChild.InheritsFrom(k2_idPara)
 DoChildAdded(aList, aChild, anIndex, anOpPack);
//#UC END# *491815640172_48185C4002DC_impl*
end;//TnevObjectHolderPrim.ChildAdded

procedure TnevObjectHolderPrim.ChildDeleted(const aList: InevTag;
  aProp: Tk2ArrayProperty;
  const aChild: InevTag;
  anIndex: Integer;
  const anOpPack: InevOp);
//#UC START# *4918157300FB_48185C4002DC_var*
var
 l_List : InevParaList;
 l_Obj  : InevObject;
//#UC END# *4918157300FB_48185C4002DC_var*
begin
//#UC START# *4918157300FB_48185C4002DC_impl*
 if aChild.InheritsFrom(k2_idPara) then
 begin
  if (f_FormatPool <> nil) then
  begin
   if (anOpPack = nil) OR not anOpPack.InIOProcess then
   begin
    if not aList.QT(InevParaList, l_List) then
     if aList.InheritsFrom(k2_idObjectSegment) or aList.InheritsFrom(k2_idObjectSegment_Children) then
      Exit
     else
      Assert(false);
    if (anIndex >= 0) then
    // - ��� ������ �� �������� ����������� � _TevDocumentPartGenerator.FinishInsertion
    //   �������� ��� ������� SBS �� Shift-Space.
     f_FormatPool.ChildDeleted(l_List, l_List.Para[anIndex])
    else
     f_FormatPool.InvalidateShape(l_List, [nev_spExtent]);
   end//anOpPack = nil..
   else
    f_FormatPool.Clear;
    // - ��� �������� ����� �������
  end;//f_FormatPool <> nil
  if aChild.InheritsFrom(k2_idSectionBreak) then
  begin
   if (f_SectionBreaks <> nil) then
   begin
    if not aChild.QT(InevObject, l_Obj) then
     Assert(false);
    f_SectionBreaks.Remove(l_Obj);
   end;//f_SectionBreaks <> nil
  end;//aChild.InheritsFrom(k2_idSectionBreak)
 end;//aChild.InheritsFrom(k2_idPara)
 DoChildDeleted(aList, aChild, anIndex, anOpPack);
//#UC END# *4918157300FB_48185C4002DC_impl*
end;//TnevObjectHolderPrim.ChildDeleted

procedure TnevObjectHolderPrim.UpdatePreview;
//#UC START# *4918466A021E_48185C4002DC_var*
//#UC END# *4918466A021E_48185C4002DC_var*
begin
//#UC START# *4918466A021E_48185C4002DC_impl*
 DoUpdatePreview;
//#UC END# *4918466A021E_48185C4002DC_impl*
end;//TnevObjectHolderPrim.UpdatePreview

procedure TnevObjectHolderPrim.PropChanged(Prop: Tk2Prop;
  const V: TnevValues;
  const anOpPack: InevOp);
//#UC START# *49184A0B0254_48185C4002DC_var*
//#UC END# *49184A0B0254_48185C4002DC_var*
begin
//#UC START# *49184A0B0254_48185C4002DC_impl*
 DoPropChanged(Prop, V, anOpPack);
//#UC END# *49184A0B0254_48185C4002DC_impl*
end;//TnevObjectHolderPrim.PropChanged

function TnevObjectHolderPrim.Get_SubCache: IevSubCache;
//#UC START# *49184AA5012F_48185C4002DCget_var*
//#UC END# *49184AA5012F_48185C4002DCget_var*
begin
//#UC START# *49184AA5012F_48185C4002DCget_impl*
 Result := GetSubCache;
//#UC END# *49184AA5012F_48185C4002DCget_impl*
end;//TnevObjectHolderPrim.Get_SubCache

function TnevObjectHolderPrim.Get_SectionBreaks: InevSectionBreaks;
//#UC START# *491878C5007B_48185C4002DCget_var*
//#UC END# *491878C5007B_48185C4002DCget_var*
begin
//#UC START# *491878C5007B_48185C4002DCget_impl*
 Result := f_SectionBreaks;
//#UC END# *491878C5007B_48185C4002DCget_impl*
end;//TnevObjectHolderPrim.Get_SectionBreaks

function TnevObjectHolderPrim.pm_GetLock: Il3Lock;
//#UC START# *49E705330213_48185C4002DCget_var*
//#UC END# *49E705330213_48185C4002DCget_var*
begin
//#UC START# *49E705330213_48185C4002DCget_impl*
 Result := GetLock;
//#UC END# *49E705330213_48185C4002DCget_impl*
end;//TnevObjectHolderPrim.pm_GetLock

{$If not defined(DesignTimeLibrary)}
procedure TnevObjectHolderPrim.DoStyleTableChanged;
//#UC START# *4A485B710126_48185C4002DC_var*
//#UC END# *4A485B710126_48185C4002DC_var*
begin
//#UC START# *4A485B710126_48185C4002DC_impl*
 UnformatAll;
//#UC END# *4A485B710126_48185C4002DC_impl*
end;//TnevObjectHolderPrim.DoStyleTableChanged
{$IfEnd} //not DesignTimeLibrary

procedure TnevObjectHolderPrim.SectionBreakAdded(const anObject: InevObject);
//#UC START# *4A70398B0307_48185C4002DC_var*
//#UC END# *4A70398B0307_48185C4002DC_var*
begin
//#UC START# *4A70398B0307_48185C4002DC_impl*
 if (f_SectionBreaks = nil) then
  f_SectionBreaks := TnevSectionBreakList.MakeSorted;
 Assert(anObject.PID >= 0);
 Assert(anObject.InheritsFrom(k2_idSectionBreak)); 
 f_SectionBreaks.Add(anObject);
 if (f_FormatPool <> nil) then
  f_FormatPool.AfterSectionBreakAdded;
//#UC END# *4A70398B0307_48185C4002DC_impl*
end;//TnevObjectHolderPrim.SectionBreakAdded

function TnevObjectHolderPrim.GetControlImg(const aControl: TnevControlInfo;
  out theImageInfo: TnevControlImageInfo): Boolean;
//#UC START# *4E5E25700033_48185C4002DC_var*
//#UC END# *4E5E25700033_48185C4002DC_var*
begin
//#UC START# *4E5E25700033_48185C4002DC_impl*
 theImageInfo.rFirstIndex := -1;
 theImageInfo.rLastIndex := -1;
 theImageInfo.rLeftIndent := 0;
 theImageInfo.rImageList := nil;
 Result := DoGetControlImg(aControl, theImageInfo);
//#UC END# *4E5E25700033_48185C4002DC_impl*
end;//TnevObjectHolderPrim.GetControlImg

procedure TnevObjectHolderPrim.Cleanup;
//#UC START# *479731C50290_48185C4002DC_var*
//#UC END# *479731C50290_48185C4002DC_var*
begin
//#UC START# *479731C50290_48185C4002DC_impl*
 FreeAndNil(f_FormatPool);
 FreeAndNil(f_SectionBreaks);
 inherited;
//#UC END# *479731C50290_48185C4002DC_impl*
end;//TnevObjectHolderPrim.Cleanup

end.