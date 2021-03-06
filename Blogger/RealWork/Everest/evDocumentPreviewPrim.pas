unit evDocumentPreviewPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evDocumentPreviewPrim.pas"
// �����: 10.12.2004 17:36
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Printing::TevDocumentPreviewPrim
//
// ��������������� �������� ������ ���������
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
  afwInterfaces,
  l3Core,
  l3Units,
  afwTypes,
  afwPreviewCanvas,
  Classes,
  nevTools,
  l3TimeEstimation,
  k2DocumentBuffer,
  k2TagGen,
  afwPreviewNotifierPtrList,
  nevObjectHolderPrim,
  evExcept,
  Windows,
  nevRealTools
  ;

type
 _afwSettingChanged_Parent_ = TnevObjectHolderPrim;
 {$Include w:\common\components\gui\Garant\AFW\implementation\afwSettingChanged.imp.pas}
 _afwSettingsReplace_Parent_ = _afwSettingChanged_;
 {$Include w:\common\components\gui\Garant\AFW\implementation\afwSettingsReplace.imp.pas}
 _afwStatusElement_Parent_ = _afwSettingsReplace_;
 {$Include w:\common\components\gui\Garant\AFW\implementation\afwStatusElement.imp.pas}
 TevDocumentPreviewPrim = class(_afwStatusElement_, IafwDocumentPreview, IafwPreviewNotificationSource, IevDocumentPreviewInfo)
  {* ��������������� �������� ������ ��������� }
 private
 // private fields
   f_MakingCanvas : Boolean;
   f_Stopped : Boolean;
   f_InAquareText : Boolean;
   f_AbortFilter : IafwAbortableProcess;
   f_PrinterIndex : Integer;
   f_InPagesCounting : Boolean;
   f_HAF : IafwHAFPainter;
   f_CacheKey : TevPreviewCacheKey;
   f_CurrentPagePara : Integer;
   f_OriginalCurrentPage : Integer;
   f_CurrentPageNumber : Integer;
   f_CalcCurrentPageByPara : Boolean;
   f_Counter : IafwPreviewCanvas;
   f_Panel : IafwPreviewPanel;
   f_MaxPages : Integer;
   f_PreviewResetting : Boolean;
   f_WndToClose : THandle;
   f_Msg : Il3CString;
   f_Max : Integer;
   f_Current : Integer;
   f_InUpdate : Boolean;
   f_InPrinting : Boolean;
   f_CurrentPage : IUnknown;
   f_Time : Tl3TimeEstimation;
   f_PreviewSubscribers : TafwPreviewNotifierPtrList;
   f_OriginalText : InevDocumentProvider;
   f_TextOwner : TObject;
    {* �������� ������, �������� �� ���}
   f_Preview : IafwPreviewCanvas;
    {* ���� ��� �������� Preview}
   f_Text : InevObject;
    {* ���� ��� �������� Text}
   f_Printer : IafwPrinter;
    {* ���� ��� �������� Printer}
   f_Processor : InevProcessor;
    {* ���� ��� �������� Processor}
   f_PagesInfo : TafwPagesInfo;
    {* ���� ��� �������� PagesInfo}
 private
 // private methods
   function GetText: InevObject;
     {* �������� ����� ��������� ��� ��������� }
   function GetPreviewCanvas(const aPagesInfo: TafwPagesInfo;
     aCounter: Boolean): IafwPreviewCanvas;
     {* �������������� ����������� ����� }
   procedure TryClose;
     {* �������� �������� ������ � ������� ���� }
   procedure AbortPreviewPrepare;
     {* ���������� ���������� � �������� ������ - ���-�� ���������� � ���� ��� ������������ ������ }
   function CurrentPageForUpdate: Integer;
   function GetPreviewForCurrentPage: IafwPreviewCanvas;
   procedure NotifyPreviewSubscribers;
   procedure DoSetFilters(var theGenerator: Tk2TagGenerator);
   function HasPreviewBuilder: Boolean;
 protected
 // property methods
   function pm_GetPreview: IafwPreviewCanvas;
   function pm_GetText: InevObject;
   function pm_GetPrinter: IafwPrinter;
   procedure pm_SetPrinter(const aValue: IafwPrinter);
   function pm_GetProcessor: InevProcessor;
   function pm_GetPagesInfo: TafwPagesInfo;
 protected
 // realized methods
   function DocumentName: IafwCString;
     {* ��� ��������� ��� preview. }
   function InProcess: Boolean;
     {* ���� �������? }
   function InPagesCounting: Boolean;
     {* ������ � �������� �������� �������? }
   function InUpdate: Boolean;
     {* ��������� � �������� ���������� preview? }
   function InPrinting: Boolean;
     {* ��������� � �������� ���������� ������? }
   procedure Update(const aPanel: IafwPreviewPanel);
     {* ���������� preview �� ������ ��� �����������. }
   procedure Print(anInterval: TafwPagesInterval = afw_piAll;
    const aRange: Il3RangeManager = nil;
    aCopies: Integer = 1;
    const aFileName: AnsiString = '';
    aCollate: Boolean = True);
     {* ���������� �� �������. }
   procedure Stop(aWnd: THandle = 0);
     {* ��������� ������� ���������� preview/������. }
   function Stopped: Boolean;
     {* ������� ����������? }
   function CloseRequested: Boolean;
     {* ��� ��������� �������� ��� ������ �� �������� ������ }
   function PreviewResetting: Boolean;
     {* ����� �����������, �� ����� �������������� }
   procedure SetCurrentPage(const aCursor: IUnknown);
     {* ������������� ������ �� ������� ��������. }
   procedure SetCurrentPagePara(aParaID: Integer);
     {* ������������� ������ �� ������� ��������. }
   procedure SetCurrentPageNumber(aPageNumber: Integer);
     {* ������������� ������ �� ������� ��������. }
   function CurrentPage: Integer;
     {* ������� �������� ��� ������. }
   function HasCurrentPage: Boolean;
     {* ����������� �� ������� ��������. }
   function pm_GetHasText: Boolean;
   procedure Subscribe(const aNotifier: IafwPreviewNotifier);
   procedure UnSubscribe(const aNotifier: IafwPreviewNotifier);
   function pm_GetHAFMacroReplacer: IafwHAFMacroReplacer;
   function Get_Preview: IafwDocumentPreview;
   procedure DoInvalidateShape(const aShape: InevObject;
    aParts: TnevShapeParts); override;
   function GetTagReader: InevTagReader; override;
   function GetTagWriter: InevTagWriter; override;
   function Get_CacheKey: TevPreviewCacheKey;
   procedure DoGetStatusInfo(out theString: IafwCString;
    out theNeedProgress: Boolean); override;
     {* ���������� ������� ��������� ���������� }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   function SettingChanged(const aSettingId: TafwSettingId): Boolean; override;
   procedure SettingsReplaceFinish; override;
   function GetObj: InevObject; override;
   procedure UnformatAll; override;
   function NeedUpdateOnUnsubscribe: Boolean; override;
   {$If not defined(DesignTimeLibrary)}
   procedure DoStyleTableChanged; override;
   {$IfEnd} //not DesignTimeLibrary
   procedure ClearFields; override;
 protected
 // protected methods
   function DoPrint(const aCanvas: InevCanvas;
     const aPagesArray: TafwPrintPagesArray = nil): Boolean; // can raise EevInvalidPrintMargins
     {* ���������� ������� ������ }
   procedure UnformatView(const aView: InevView);
     {* ���������� ���������� � �������������� ��� ����������� View }
   procedure SetFilters(var theGenerator: Tk2TagGenerator); virtual;
   procedure ClearPreview;
   function InClose: Boolean;
   function PrePrint(anIndex: Integer): TafwPagesInfo;
   procedure ProgressProcEv(aState: Byte;
    aValue: Integer;
    const aMsg: AnsiString);
   procedure CheckAborted(var Aborted: Boolean);
   function IsSettingAffectsUs(const aSettingId: TafwSettingId): Boolean; virtual;
   procedure AfterPrint; virtual;
   function NeedAddBlockNames: Boolean; virtual;
     {* ����� �� ��������� ����� ������ }
 public
 // public methods
   constructor Create(const aText: InevStorable;
     const aKey: TevPreviewCacheKey;
     const aHAF: IafwHAFPainter = nil); reintroduce; overload; 
   constructor Create(const aText: InevDocumentProvider;
     const aKey: TevPreviewCacheKey;
     const aHAF: IafwHAFPainter = nil); overload; 
 public
 // public properties
   property Preview: IafwPreviewCanvas
     read pm_GetPreview;
   property Text: InevObject
     read pm_GetText;
   property Printer: IafwPrinter
     read pm_GetPrinter
     write pm_SetPrinter;
   property Processor: InevProcessor
     read pm_GetProcessor;
   property PagesInfo: TafwPagesInfo
     read pm_GetPagesInfo;
 end;//TevDocumentPreviewPrim

implementation

uses
  k2Tags,
  SectionBreak_Const,
  evSectionPara,
  PageBreak_Const,
  Table_Const,
  k2Except,
  Forms,
  afwCanvasEx,
  nevPrintView,
  l3Prg,
  evAbortFilter,
  SysUtils,
  l3Except,
  evMsgCode,
  Messages,
  evHiddenFilter,
  evdPageParamsFilter,
  afwFacade,
  l3Printer,
  evPreviewProcessor,
  l3Base,
  l3MinMax,
  nevInterfaces,
  l3String,
  l3Math,
  l3InternalInterfaces,
  l3Defaults,
  l3Const,
  evParaDrawTools,
  Graphics,
  l3SimpleObject,
  evdBlockNameAdder,
  nevDocumentProvider,
  evPreviewForTestsTuning,
  l3CBase
  {$If defined(nsTest)}
  ,
  PrintRowHeightsSpy
  {$IfEnd} //nsTest
  ,
  l3FileUtils
  {$If defined(InsiderTest)}
  ,
  evCustomPrintDataSaver
  {$IfEnd} //InsiderTest
  
  ;

{$Include w:\common\components\gui\Garant\AFW\implementation\afwSettingChanged.imp.pas}

{$Include w:\common\components\gui\Garant\AFW\implementation\afwSettingsReplace.imp.pas}

{$Include w:\common\components\gui\Garant\AFW\implementation\afwStatusElement.imp.pas}

type
  TPersistentHack = class(TPersistent)
  end;//TPersistentHack

// start class TevDocumentPreviewPrim

function TevDocumentPreviewPrim.GetText: InevObject;
//#UC START# *49CBC3B1026E_47EA97410130_var*
var
 l_O : TObject; 
//#UC END# *49CBC3B1026E_47EA97410130_var*
var
 l_Buffer : Tk2DocumentBuffer; // ����� ���������
 l_Generator : Tk2TagGenerator; // ��������� ���������
 l_Pack : InevOp; // ����� ��������
begin
//#UC START# *49CBC3B1026E_47EA97410130_impl*
 if (f_Text = nil) AND (f_OriginalText <> nil) then
 begin
  if f_OriginalText.CanProvideOriginalDocument then
  begin
   if not f_OriginalText.OriginalDocument.QT(InevObject, f_Text, Processor) then
    Assert(false);
   l_O := f_Text.AsObject;
   if (l_O Is Tl3CBase) then
    f_TextOwner := Tl3CBase(l_O).Owner
   else
    f_TextOwner := TPersistentHack((l_O As TPersistent)).GetOwner;
   Assert(f_TextOwner <> nil); 
   // - �.�. ��� ����� �� Assert, � ������� ��������� ���� � �������� Owner'� ���� �������� ����
  end//f_OriginalText.CanProvideOriginalText
  else
  begin
   f_InAquareText := True;
   if Assigned(Status) then
    Status.Update;
   try
    l_Buffer := Tk2DocumentBuffer.Create;
    try
     l_Pack := Processor.StartOp(ev_msgInsertBlock, true);
     try
      l_Pack.InIOProcess := true;
      l_Pack.SaveUndo := false;
      l_Pack.DeleteMapped := false;
      if (l_Buffer <> nil) then
      begin
       l_Buffer.Context := l_Pack;
       l_Generator := l_Buffer.Use;
       try
        SetFilters(l_Generator);
        TevAbortFilter.SetTo(l_Generator);
        Supports(l_Generator, IafwAbortableProcess, f_AbortFilter);
        try
         l_Generator.Start;
         try
          try
           f_OriginalText.Store(nil, l_Generator, []);
          except
           on El3AbortLoad do
           begin
            f_Text := nil;
            if not f_Stopped then
             Stop;
            l_Generator.RollBack;
            NotifyPreviewSubscribers;
           end;
          end;
         finally
          if not f_Stopped then
           l_Generator.Finish;
         end;//try..finally
        finally
         f_AbortFilter := nil;
        end;//try..finally
       finally
        FreeAndNil(l_Generator);
       end;//try..finally
       if not f_Stopped then
       begin
        if (l_Buffer.Root = nil) then
        begin
         f_Text := nil;
         Stop;
         // - �� ������� �������� �����
        end//l_Buffer.Root = nil
        else
        if not l_Buffer.Root.QT(InevObject, f_Text, Processor) then
         Assert(false);
        f_Text.Owner := Self;
        //(f_Text.AsObject As _Tl3SimpleObject).Owner := Self;
       end;//not f_Stopped
      end;//l_Buffer <> nil
     finally
      l_Pack := nil;
     end;//try..finally
    finally
     FreeAndNil(l_Buffer);
    end;//try..finally
   finally
    f_InAquareText := False;
    if Assigned(Status) then
     Status.Update;
   end;//try..finally
  end;//f_OriginalText.CanProvideOriginalText 
 end;//f_Text = nil
 Result := f_Text;
//#UC END# *49CBC3B1026E_47EA97410130_impl*
end;//TevDocumentPreviewPrim.GetText

function TevDocumentPreviewPrim.GetPreviewCanvas(const aPagesInfo: TafwPagesInfo;
  aCounter: Boolean): IafwPreviewCanvas;
//#UC START# *49CBC90C017F_47EA97410130_var*
//#UC END# *49CBC90C017F_47EA97410130_var*
var
 l_Max : Integer;
 l_PageHeight : Integer;
 l_PreviewCanvas : TafwPreviewCanvas; // ����������� �����
 l_Text : InevObject; // �����
begin
//#UC START# *49CBC90C017F_47EA97410130_impl*
 f_PreviewResetting := false;
 l_Text := Text;
 if (l_Text = nil) then
  Result := nil
 else
 begin
  if not aCounter AND not aPagesInfo.IsValid then
   Result := nil
  else
  begin
   l_PreviewCanvas := TafwPreviewCanvas.Create(Printer, aCounter, aPagesInfo);
   try
    if aCounter then
     f_Counter := l_PreviewCanvas
    else
     f_Preview := l_PreviewCanvas;
    if (f_Panel <> nil) then
     f_Panel.PreviewCanvas := l_PreviewCanvas;
    l_Max := aPagesInfo.rPagesCount;
    if (l_Max <= 0) then
     l_Max := High(Integer);
    if (l_Max = High(Integer)) then
    begin
     l_PageHeight := l_PreviewCanvas.PageSetup.PaperHeight;
     if (l_PageHeight > 0) then
     begin
      l_Max := (l_Text.ToList.LeafShapeCount * nev_ParaListFakeParaEx.Y div l_PageHeight) + 3;
      // - ����������� ��� � ����
      if (l_Max > 20) then
       l_Max := l_Max div 2;
     end;//l_PageHeight > 0
    end;//l_Max := High(Integer)
    f_MaxPages := l_Max;
    if (f_Time <> nil) then
     FreeAndNil(f_Time);
    f_Time := Tl3TimeEstimation.Create(l_Max, 7);
    try
     if DoPrint(l_PreviewCanvas) then
      Result := l_PreviewCanvas
     else
      Result := nil;
    finally
     FreeAndNil(f_Time);
    end;//try..finally
   finally
    FreeAndNil(l_PreviewCanvas);
   end;//try..finally
  end;//not aCounter..
 end;//l_Text = nil
//#UC END# *49CBC90C017F_47EA97410130_impl*
end;//TevDocumentPreviewPrim.GetPreviewCanvas

procedure TevDocumentPreviewPrim.TryClose;
//#UC START# *49CBCAB8037B_47EA97410130_var*
//#UC END# *49CBCAB8037B_47EA97410130_var*
var
 l_Wnd : THandle; // ���� ��� ��������
begin
//#UC START# *49CBCAB8037B_47EA97410130_impl*
 if InClose then
 begin
  l_Wnd := f_WndToClose;
  f_WndToClose := 0;
  PostMessage(l_Wnd, WM_Close, 0, 0);
 end;//f_WndToClose <> 0
//#UC END# *49CBCAB8037B_47EA97410130_impl*
end;//TevDocumentPreviewPrim.TryClose

procedure TevDocumentPreviewPrim.AbortPreviewPrepare;
//#UC START# *49CCF80301C7_47EA97410130_var*
//#UC END# *49CCF80301C7_47EA97410130_var*
begin
//#UC START# *49CCF80301C7_47EA97410130_impl*
 {$IfNDef DesignTimeLibrary}
 inherited DoStyleTableChanged;
 // ��� ����� �������� ��� ��������������, ����� ������ - http://mdp.garant.ru/pages/viewpage.action?pageId=115802894
 {$EndIf}
 if InProcess then
  Stop;
 f_Text := nil;
 f_TextOwner := nil;
 f_PreviewResetting := Assigned(f_Preview) and HasPreviewBuilder;
 ClearPreview;
 NotifyPreviewSubscribers;
//#UC END# *49CCF80301C7_47EA97410130_impl*
end;//TevDocumentPreviewPrim.AbortPreviewPrepare

function TevDocumentPreviewPrim.CurrentPageForUpdate: Integer;
//#UC START# *49CCF962005D_47EA97410130_var*
//#UC END# *49CCF962005D_47EA97410130_var*
var
 l_Preview : IafwPreviewCanvas;
begin
//#UC START# *49CCF962005D_47EA97410130_impl*
 Result := 0;
 if f_OriginalCurrentPage <> 0 then
 begin
  l_Preview := GetPreviewForCurrentPage;
  if Assigned(l_Preview) then
   Result := l_Preview.GetPageByObject(f_OriginalCurrentPage);
 end;
//#UC END# *49CCF962005D_47EA97410130_impl*
end;//TevDocumentPreviewPrim.CurrentPageForUpdate

function TevDocumentPreviewPrim.GetPreviewForCurrentPage: IafwPreviewCanvas;
//#UC START# *49CCFAD0019C_47EA97410130_var*
//#UC END# *49CCFAD0019C_47EA97410130_var*
var
 l_Index : Integer;
begin
//#UC START# *49CCFAD0019C_47EA97410130_impl*
 Result := Nil;
 l_Index := Printer.PrinterIndex;
 if (l_Index <> f_PrinterIndex) then
  ClearPreview;
 Result := f_Preview;
 if (Result = nil) then
  Result := f_Counter;
 if (Result = nil) then
 begin
  PrePrint(l_Index);
  Result := f_Counter;
 end;//l_Preview = nil
//#UC END# *49CCFAD0019C_47EA97410130_impl*
end;//TevDocumentPreviewPrim.GetPreviewForCurrentPage

procedure TevDocumentPreviewPrim.NotifyPreviewSubscribers;
//#UC START# *49CCFC8403A6_47EA97410130_var*
//#UC END# *49CCFC8403A6_47EA97410130_var*
var
 l_Idx : Integer;
begin
//#UC START# *49CCFC8403A6_47EA97410130_impl*
 if Assigned(f_PreviewSubscribers) then
  for l_Idx := f_PreviewSubscribers.Hi downto f_PreviewSubscribers.Lo do
   f_PreviewSubscribers[l_Idx].ContentChanged;
//#UC END# *49CCFC8403A6_47EA97410130_impl*
end;//TevDocumentPreviewPrim.NotifyPreviewSubscribers

procedure TevDocumentPreviewPrim.DoSetFilters(var theGenerator: Tk2TagGenerator);
//#UC START# *49CCFF22004A_47EA97410130_var*
//#UC END# *49CCFF22004A_47EA97410130_var*
begin
//#UC START# *49CCFF22004A_47EA97410130_impl*
 if NeedAddBlockNames then
  TevdBlockNameAdder.SetTo(theGenerator);
 if (f_OriginalText.PageSetup <> nil) then
  TevdPageParamsFilter.SetTo(f_OriginalText.PageSetup, Printer, theGenerator)
 else
 if (afw.Application <> nil) AND
    (afw.Application.PrintManager <> nil) then
  TevdPageParamsFilter.SetTo(afw.Application.PrintManager.PageSetup, Printer, theGenerator);
 TevHiddenFilter.SetTo(f_CacheKey.HiddenStyles, false, theGenerator);
//#UC END# *49CCFF22004A_47EA97410130_impl*
end;//TevDocumentPreviewPrim.DoSetFilters

function TevDocumentPreviewPrim.HasPreviewBuilder: Boolean;
//#UC START# *4B7E6CC30112_47EA97410130_var*
var
 l_IDX: Integer;
//#UC END# *4B7E6CC30112_47EA97410130_var*
begin
//#UC START# *4B7E6CC30112_47EA97410130_impl*
 Result := True;
 if Assigned(f_PreviewSubscribers) then
  for l_IDX := 0 to f_PreviewSubscribers.Count - 1 do
   if Supports(f_PreviewSubscribers[l_IDX], IafwPreviewPanel) then
    Exit;
 Result := False;
//#UC END# *4B7E6CC30112_47EA97410130_impl*
end;//TevDocumentPreviewPrim.HasPreviewBuilder

function TevDocumentPreviewPrim.DoPrint(const aCanvas: InevCanvas;
  const aPagesArray: TafwPrintPagesArray = nil): Boolean; // can raise EevInvalidPrintMargins

 procedure DocumentPrint(const anArea: TnevShapeArea;
   const aDocument: InevObject;
   const aProgress: Il3Progress);

  function PrintPara(const aPara: InevObject;
    const aTop: InevBasePoint;
    aPrevHeight: Integer): TnevShapeInfo;
  //#UC START# *49CB7CF103B6__var*
  //#UC END# *49CB7CF103B6__var*
  begin
  //#UC START# *49CB7CF103B6__impl*
   Result := evDrawPara(anArea, aPara, aTop, aPara.Range, aPrevHeight);
  //#UC END# *49CB7CF103B6__impl*
  end;//PrintPara

  function DocumentHeight: Integer;
  //#UC START# *49CB8C8B02C7__var*
  //#UC END# *49CB8C8B02C7__var*
  begin
  //#UC START# *49CB8C8B02C7__impl*
   Result := aDocument.ToList.LeafShapeCount * nev_ParaListFakeParaEx.Y;
  //#UC END# *49CB8C8B02C7__impl*
  end;//DocumentHeight

 var
  l_Anchor : InevAnchor; // ����� �� ������ ���������

  procedure CheckSectionBreak;

   procedure SkipSectionBreak;
   //#UC START# *49CB8FF602C5__var*
   //#UC END# *49CB8FF602C5__var*
   var
    l_Line : Integer;
   begin
   //#UC START# *49CB8FF602C5__impl*
    l_Line := 1;
    l_Anchor.IncLine(anArea.rView.As_InevView, l_Line, False);
   //#UC END# *49CB8FF602C5__impl*
   end;//SkipSectionBreak

  //#UC START# *49CB8D7B02A2__var*
  //#UC END# *49CB8D7B02A2__var*
  var
   l_Para : InevObject; // ������� ��������
  begin
  //#UC START# *49CB8D7B02A2__impl*
   l_Para := l_Anchor.MostInner.Obj^;
   with l_Para do
    if InheritsFrom(k2_idSectionBreak) then
    begin
     anArea.rCanvas.SectionExtent := evSectionExtent(l_Para);
     SkipSectionBreak;
    end//InheritsFrom(k2_idSectionBreak)
    else
     anArea.rCanvas.SectionExtent := l3Point(aDocument.IntA[k2_tiWidth],
                                             anArea.rCanvas.SectionExtent.Y);
  //#UC END# *49CB8D7B02A2__impl*
  end;//CheckSectionBreak

 //#UC START# *49CB801A037F__var*
 var
  l_PageSetup : IafwPageSetup;
  l_Margins   : Tl3_Rect;
 //#UC END# *49CB801A037F__var*
 var
  l_Aborted : Boolean; // ������ ��������
  l_PaperWidth : Integer; // ������ ������
  l_Info : TnevShapeInfo; // ���������� ��� ���������
  l_Width2Print : Integer; // ������ ���������� ������
  l_PrintableWidth : Integer; // ������ ����������� �����
  l_Top : Tl3Point; // �������� �������� �����
  l_NextPage : InevBasePoint; // ����� �� ��������� ��������
  l_PageHeight : Integer; // ������ ��������
  l_SomethingPrinted : Boolean; // ���������� �� ���� �� �������� �����
  l_BottomPoint : InevBasePoint; // ����� ������ ����� ��� ������ �� ������.
  l_PrevHeight : Integer; // ������ ����������� �� ���������� ��������
  l_DisableUnformat : Boolean; // http://mdp.garant.ru/pages/viewpage.action?pageId=210043454&focusedCommentId=210436611#comment-210436611
  l_WidthExtent : Tl3Point; // �� ������
  l_HeightExtent : Tl3Point; // ���������� ��������
 begin
 //#UC START# *49CB801A037F__impl*
  if (aProgress <> nil) then
   aProgress.ChangeIO(True);
  try
   with anArea.rCanvas do
   begin
    DrawEnabled := True;
    if (aProgress <> nil) then
     aProgress.Start(DocumentHeight, str_nevpmPrinting.AsCStr);
    try
     l_Top := l3Point0;
     l_Anchor := aDocument.MakeAnchor;
     CheckSectionBreak;
     l_NextPage := l_Anchor;

     l_PageSetup := f_OriginalText.PageSetup;
     {$IF not Defined(Archi) and not Defined(EverestLite)}
     // http://mdp.garant.ru/pages/viewpage.action?pageId=252512973
     Assert({$IfDef nsTest}
            OldBehaviourForK235875079 OR
            {$EndIf nsTest}
            (l_PageSetup <> nil));
     {$IfEnd}//{$IF not Defined(Archi) and not Defined(EverestLite)}
     if (l_PageSetup <> nil) then
      l_Margins := l_PageSetup.Margins
     else
     {$If Defined(nsTest) OR Defined(Archi) or Defined(EverestLite)}
      with Text.Attr[k2_tiParas] do
       l_Margins := l3Rect(IntA[k2_tiLeftIndent],
                           IntA[k2_tiSpaceBefore],
                           IntA[k2_tiRightIndent],
                           IntA[k2_tiSpaceAfter]);
     {$Else}//Defined(nsTest) OR Defined(Archi)
     begin
      l3FillChar(l_Margins, SizeOf(l_Margins));
      Assert(false);
     end;//l_PageSetup <> nil
     {$IfEnd}//Defined(nsTest) OR Defined(Archi)
     with PageSetup do
     begin
      if (Min(PaperWidth, PaperHeight) -
         (l_Margins.Top + l_Margins.Bottom)) <
         (def_inchMinPrintArea - l3Epsilon) then
       raise EevInvalidPrintMargins.Create(ev_warInvalidMargins);
      Margins := l_Margins;
     end;//with PageSetup
     BackColor := clWhite;
     try
      BeginPaint;
     except
      on Ek2ConversionError do
      begin
       // - �������� ������ - ���� ��������� ��� ����������
       EndPaint;
       Exit;
      end;//on Ek2ConversionError
     end;//try..except
      try
       l_Aborted := False;
       CheckAborted(l_Aborted);
       if l_Aborted then
        Exit;
       l_HeightExtent := anArea.rCanvas.SectionExtent;
       repeat
        // - ���� �� ��������� � ������
        with PageSetup do
        begin
         // - ����� ��������� �������� �������
         l_PaperWidth := PaperWidth;
         l_PrintableWidth := Width;
        end;//with PageSetup
        l_PageHeight := 0;
        l_Width2Print := SectionExtent.X;
        l_Top.X := 0;

        l_BottomPoint := nil;
        l_PrevHeight := 0;
        l_WidthExtent := l_HeightExtent;
        repeat
         // - ���� �� ��������� � ������
         MoveWindowOrg(l3PointX(l_Top.X));
         l_Info := PrintPara(aDocument, l_NextPage, l_PrevHeight);
         // V- http://mdp.garant.ru/pages/viewpage.action?pageId=330700128
         l_HeightExtent := anArea.rCanvas.SectionExtent; // - ����� ����� ���� ������ ������ �� �������� �����, ���� ��� ������ �������!
         if (l_PageHeight = 0) then
          l_PageHeight := l_Info.rMap.Bounds.Bottom;
         CheckAborted(l_Aborted);
         Dec(l_Width2Print, l_PaperWidth);
         if (l_BottomPoint = nil) or l_BottomPoint.AfterEnd then
          l_BottomPoint := l_Info.rBottom
         else
          begin
           l_BottomPoint.MergeTo(anArea.rView.As_InevView, l_Info.rBottom);
           l_BottomPoint := l_Info.rBottom;
          end;
         if l_Aborted or (l_Width2Print <= l3Epsilon) then
          Break
         else
         begin
          Inc(l_Top.P.X, l_PrintableWidth);
          NewPage(True);
          // V- http://mdp.garant.ru/pages/viewpage.action?pageId=330700128
          anArea.rCanvas.SectionExtent := l_WidthExtent; // - ��� ����� ������ ������ �� �������� �����, � �� �� �������� �����!
         end;//l_Aborted..
         if l_Info.rCalculatedHeight <> 0 then
          l_PrevHeight := l_Info.rCalculatedHeight;
        until False;
        anArea.rCanvas.SectionExtent := l_HeightExtent;
        {$IFDEF nsTest}
        if TPrintRowHeightsSpy.Exists then
         TPrintRowHeightsSpy.Instance.ClearData;
        {$ENDIF nsTest}
        Inc(l_Top.P.Y, l_PageHeight);
        if (aProgress <> nil) then
         aProgress.Progress(l_Top.Y);
        if l_Aborted OR Printed then
         Break
        else
        if not NewPage then
         Break;
        l_Top.X := 0;
        // ��������� �� ����� � �������� �������� ��������� ��������?
        try
         l_DisableUnformat := l_BottomPoint.MostInner.Owner.InheritsFrom(k2_idTable) AND
                              l_BottomPoint.MostInner.Owner.Box.IsSame(l_NextPage.MostInner.Owner.Box);
         l_SomethingPrinted := l_NextPage.Diff(anArea.rView.As_InevView,
                                               l_Info.rBottom,
                                               anArea.rView.RootMap.FI){$IfOpt D-} <> {$Else} < {$EndIf} 0;
         l_NextPage := l_BottomPoint;//l_Info.rBottom;
         if l_NextPage.AtEnd(anArea.rView.As_InevView) AND
            l_NextPage.MostInner.InheritsFrom(k2_idPageBreak) then
         // - ������ �������� ������ ��������
          Break;
         // ���� ����� �� ��������� � �� ����� �� ����� - �����������..
         if not l_SomethingPrinted then
         begin
          try
           {$IfDef nsTest}
           f_Stopped := true;
           {$Else  nsTest}
           {$IfOpt D-}
           f_Stopped := true;
           {$EndIf D-}
           {$EndIf nsTest}
           Assert(False,'Cycling on printing');
           raise EevInvalidPrintMargins.Create(ev_warInvalidMargins);
          except
           {$IfDef nsTest}
           raise;
           {$Else  nsTest}
           {$IfOpt D+}
           break;
           {$Else}
           raise;
           {$EndIf}
           {$EndIf nsTest}
          end;//try..except
         end;//not l_SomethingPrinted
         anArea.rView.ClearShapes;
         if not l_DisableUnformat then
          UnformatView(anArea.rView.As_InevView);
         // - ���������� ���������� � ��������������, �.�. ������ � ����� ��������� ����� ��������� LimitWidth
        except
         on EnevMaybeBaseSwitched do
         // http://mdp.garant.ru/pages/viewpage.action?pageId=258608212
         begin
          f_Stopped := true;
          break;
         end;//on EnevMaybeBaseSwitched
        end;//try..except
       until False;
     finally
      EndPaint;
     end;//try..finally
    finally
     if (aProgress <> nil) then
      aProgress.Finish;
    end;//try..finally
   end;//with anArea.rCanvas
  finally
   if (aProgress <> nil) then
    aProgress.ChangeIO(False);
  end;//try..finally
 //#UC END# *49CB801A037F__impl*
 end;//DocumentPrint

//#UC START# *49CB4BD701C9_47EA97410130_var*
(*var
 l_F : Tl3FileStream;
 l_W : TevdNativeWriter;*)
//#UC END# *49CB4BD701C9_47EA97410130_var*
var
 l_Width : Integer; // ������������ ������ ���������
 l_Area : TnevShapeAreaEx;
 l_Ind : InevProgress;
 l_Canvas : InevCanvas;
 l_Printer : Il3Printer;
 l_View : InevPrintView;
 l_Text : InevObject;
begin
//#UC START# *49CB4BD701C9_47EA97410130_impl*
 Result := false;
 l_Text := Text;
 if (l_Text <> nil) then
 begin
(*  l_F := Tl3FileStream.Create('c:\xxx.evd', l3_fmWrite);
  try
   l_W := TevdNativeWriter.Create;
   try
    l_W.Filer.Stream := l_F;
    l_W.Start;
    l_W.StartChild(k2_idDocument);
    l_Text.Write(l_W);
    l_W.Finish;
    l_W.Finish;
    l_W.Filer.Stream := nil;
   finally
    FreeAndNil(l_W);
   end;//try.finally
  finally
   FreeAndNil(l_F);
  end;//try..finally*)
  if not f_InPagesCounting AND (f_HAF <> nil) then
   f_HAF.SetPagesCount(PagesInfo.rPagesCount);
  try
   l_Printer := Printer;
   l_Printer.Title := l3CStr(Application.Title);
   if (aCanvas = nil) then
    l_Canvas := TafwCanvasEx.Make(l_Printer, aPagesArray)
   else
    l_Canvas := aCanvas;
   try
    l_View := TnevPrintView.Make(l_Text, l_Canvas, f_CacheKey.HiddenStyles);
    try
     try
      Result := true;
      // - ����� �����������
      if (aCanvas = nil) then
       l_Ind := Tl3ProgressIndicator.Make
      else
       l_Ind := Tl3ProgressIndicator.Make(ProgressProcEv);
      try
       l_Width := l_Text.IntA[k2_tiWidth];
       try
        l_Canvas.Painter := f_HAF;
        l_Area.Init(l_View, l_Canvas, true);
        try
         DocumentPrint(l_Area{$IfDef XE4}.rTnevShapeArea{$EndIf}, l_Text, l_Ind);
        finally
         l_Area.Free;
        end;//try..finally
       finally
        l_Text.IntA[k2_tiWidth] := l_Width;
       end;//try..finally
      finally
       l_View.ClearShapes;
      end;//try..finally
     finally
      UnformatView(l_View);
      // - ���������� ���������� � ��������������, �.�. ������ � ����� ��������� ����� ��������� LimitWidth,
      //   � ����� ���������� �������� http://mdp.garant.ru/pages/viewpage.action?pageId=139436530&focusedCommentId=139438485#comment-139438485
     end;//try..finally
    finally
     l_View := nil;
    end;//try..finally
   finally
    l_Canvas := nil;
   end;//try..finally
  except
   on Ek2ConversionError do
   begin
    // - �������� ������ - ���� ��������� ��� ����������
    Result := false;
   end;//on Ek2ConversionError
  end;//try..except
 end;//l_Text <> nil
//#UC END# *49CB4BD701C9_47EA97410130_impl*
end;//TevDocumentPreviewPrim.DoPrint

constructor TevDocumentPreviewPrim.Create(const aText: InevStorable;
  const aKey: TevPreviewCacheKey;
  const aHAF: IafwHAFPainter = nil);
//#UC START# *4CB57D480244_47EA97410130_var*
//#UC END# *4CB57D480244_47EA97410130_var*
begin
//#UC START# *4CB57D480244_47EA97410130_impl*
 Create(TnevDocumentProvider.Make(aText), aKey, aHAF);
//#UC END# *4CB57D480244_47EA97410130_impl*
end;//TevDocumentPreviewPrim.Create

constructor TevDocumentPreviewPrim.Create(const aText: InevDocumentProvider;
  const aKey: TevPreviewCacheKey;
  const aHAF: IafwHAFPainter = nil);
//#UC START# *4CB57D6601C4_47EA97410130_var*
//#UC END# *4CB57D6601C4_47EA97410130_var*
begin
//#UC START# *4CB57D6601C4_47EA97410130_impl*
 inherited Create;
 f_CacheKey := aKey;
 f_OriginalText := aText;
 f_PagesInfo := TafwPagesInfo_E;
 f_PrinterIndex := -1;
 f_HAF := aHAF;
 f_CurrentPagePara := 0;
 f_OriginalCurrentPage := 0;
 f_CurrentPageNumber := -1;
 f_CalcCurrentPageByPara := true;
//#UC END# *4CB57D6601C4_47EA97410130_impl*
end;//TevDocumentPreviewPrim.Create

procedure TevDocumentPreviewPrim.UnformatView(const aView: InevView);
//#UC START# *4CB5E99001D6_47EA97410130_var*
var
 l_H : InevObjectHolder;
 l_Pool : InevFormatPool;
//#UC END# *4CB5E99001D6_47EA97410130_var*
begin
//#UC START# *4CB5E99001D6_47EA97410130_impl*
 if (f_TextOwner = nil) then
  UnformatAll
 else
 if (aView <> nil) then
 begin
  if Supports(f_TextOwner, InevObjectHolder, l_H) then
   try
    l_Pool := l_H.FormatPool;
    if (l_Pool <> nil) then
    begin
     l_Pool.ClearFormatInfoForView(aView);
    end;//l_Pool <> nil
   finally
    l_H := nil;
   end;//try,,finally
 end;//f_TextOwner = nil
//#UC END# *4CB5E99001D6_47EA97410130_impl*
end;//TevDocumentPreviewPrim.UnformatView

function TevDocumentPreviewPrim.pm_GetPreview: IafwPreviewCanvas;
//#UC START# *47EB82040062_47EA97410130get_var*
var
 l_Count : TafwPagesInfo;
//#UC END# *47EB82040062_47EA97410130get_var*
begin
//#UC START# *47EB82040062_47EA97410130get_impl*
 if (f_Preview = nil) then
 begin
  f_MakingCanvas := True;
  try
   l_Count := PagesInfo;
   if not Stopped then
   begin
    DoSubscribe;
    try
     f_Preview := GetPreviewCanvas(l_Count, false);
    finally
     DoUnSubscribe;
    end;//try..finally
   end;//not Stopped
  finally
   f_MakingCanvas := False;
  end;
 end;//f_Preview = nil
 Result := f_Preview;
//#UC END# *47EB82040062_47EA97410130get_impl*
end;//TevDocumentPreviewPrim.pm_GetPreview

function TevDocumentPreviewPrim.pm_GetText: InevObject;
//#UC START# *47EB8227023D_47EA97410130get_var*
//#UC END# *47EB8227023D_47EA97410130get_var*
begin
//#UC START# *47EB8227023D_47EA97410130get_impl*
 Result := GetText;
//#UC END# *47EB8227023D_47EA97410130get_impl*
end;//TevDocumentPreviewPrim.pm_GetText

function TevDocumentPreviewPrim.pm_GetPrinter: IafwPrinter;
//#UC START# *47EB823F010A_47EA97410130get_var*
//#UC END# *47EB823F010A_47EA97410130get_var*
begin
//#UC START# *47EB823F010A_47EA97410130get_impl*
 if (f_Printer = nil) then
  f_Printer := Tl3Printer.Make;
 Result := f_Printer;
//#UC END# *47EB823F010A_47EA97410130get_impl*
end;//TevDocumentPreviewPrim.pm_GetPrinter

procedure TevDocumentPreviewPrim.pm_SetPrinter(const aValue: IafwPrinter);
//#UC START# *47EB823F010A_47EA97410130set_var*
//#UC END# *47EB823F010A_47EA97410130set_var*
begin
//#UC START# *47EB823F010A_47EA97410130set_impl*
 if (f_Printer <> aValue) then
 begin
  f_Printer := aValue;
  ClearPreview;
 end;//f_Printer <> aValue
//#UC END# *47EB823F010A_47EA97410130set_impl*
end;//TevDocumentPreviewPrim.pm_SetPrinter

function TevDocumentPreviewPrim.pm_GetProcessor: InevProcessor;
//#UC START# *47EB8280024B_47EA97410130get_var*
//#UC END# *47EB8280024B_47EA97410130get_var*
begin
//#UC START# *47EB8280024B_47EA97410130get_impl*
 if (f_Processor = nil) then
  f_Processor := TevPreviewProcessor.Make(Self);
 Result := f_Processor;
//#UC END# *47EB8280024B_47EA97410130get_impl*
end;//TevDocumentPreviewPrim.pm_GetProcessor

function TevDocumentPreviewPrim.pm_GetPagesInfo: TafwPagesInfo;
//#UC START# *4CC6A35900D0_47EA97410130get_var*
var
 l_Index : Integer;
//#UC END# *4CC6A35900D0_47EA97410130get_var*
begin
//#UC START# *4CC6A35900D0_47EA97410130get_impl*
 l_Index := Printer.PrinterIndex;
 if (l_Index <> f_PrinterIndex) then
  ClearPreview;
 if not f_PagesInfo.IsValid then
 begin
  if f_InPagesCounting OR InClose then
   Result := f_PagesInfo
  else
  begin
   if (f_HAF = nil) OR not f_HAF.NeedPagesCount then
   begin
    f_PagesInfo := TafwPagesInfo_H;
    Result := f_PagesInfo;
    f_PrinterIndex := l_Index;
   end//f_HAF = nil..
   else
    Result := PrePrint(l_Index);
  end;//f_InPagesCounting
 end//f_PagesCount <= 0
 else
  Result := f_PagesInfo;
//#UC END# *4CC6A35900D0_47EA97410130get_impl*
end;//TevDocumentPreviewPrim.pm_GetPagesInfo

procedure TevDocumentPreviewPrim.SetFilters(var theGenerator: Tk2TagGenerator);
//#UC START# *47ECAB7602A2_47EA97410130_var*
//#UC END# *47ECAB7602A2_47EA97410130_var*
begin
//#UC START# *47ECAB7602A2_47EA97410130_impl*
 DoSetFilters(theGenerator);
//#UC END# *47ECAB7602A2_47EA97410130_impl*
end;//TevDocumentPreviewPrim.SetFilters

procedure TevDocumentPreviewPrim.ClearPreview;
//#UC START# *47ECAE160005_47EA97410130_var*
//#UC END# *47ECAE160005_47EA97410130_var*
begin
//#UC START# *47ECAE160005_47EA97410130_impl*
 f_PagesInfo := TafwPagesInfo_E;
 f_Counter := nil;
 f_Preview := nil;
//#UC END# *47ECAE160005_47EA97410130_impl*
end;//TevDocumentPreviewPrim.ClearPreview

function TevDocumentPreviewPrim.InClose: Boolean;
//#UC START# *47ECAE6D0036_47EA97410130_var*
//#UC END# *47ECAE6D0036_47EA97410130_var*
begin
//#UC START# *47ECAE6D0036_47EA97410130_impl*
 Result := (f_WndToClose <> 0);
//#UC END# *47ECAE6D0036_47EA97410130_impl*
end;//TevDocumentPreviewPrim.InClose

function TevDocumentPreviewPrim.PrePrint(anIndex: Integer): TafwPagesInfo;
//#UC START# *47ECAFF802EA_47EA97410130_var*
var
 l_Preview : IafwPreviewCanvas;
//#UC END# *47ECAFF802EA_47EA97410130_var*
begin
//#UC START# *47ECAFF802EA_47EA97410130_impl*
 afw.BeginOp;
 try
  // ��������:
  // ����� ����� ���������� �� ����� �������. ���� �������� ������ �� �����
  // �������� ������� � ����� ������� CurrentPage (Preprint), � ����������
  // ��������� "�����" ������, ���� �����, �� ��������� ���� �������.
  // �� � �� PreviewPanel �� ������, �� ��� ������ ��������� (������ �������
  // ������ � �� �������). ���� �������� ������������� (��� ���������� ��������
  // ������� �� ������� CurrentPage. ���� ����� ���� ��������������� (� �.�. ����������)
  // ������ ���� ����� f_Stopped.
  f_Stopped := false;
  try
   f_InPagesCounting := true;
   try
    DoSubscribe;
    try
     l_Preview := GetPreviewCanvas(TafwPagesInfo_E, true);
     if (l_Preview = nil) then
      Result := TafwPagesInfo_E
     else
     begin
      Result := l_Preview.PagesInfo;
      if (Result.rPagesCount <= 0) then
       Result.rPagesCount := l_Preview.GetPagesCount;
     end;//l_Preview = nil
     f_PagesInfo := Result;
     f_PrinterIndex := anIndex;
    finally
     DoUnSubscribe
    end;//try..finally
   finally
    if Stopped then
    begin
     f_PrinterIndex := -1;
     f_PagesInfo := TafwPagesInfo_E;
     Result := f_PagesInfo;
     TryClose;
    end;//Stopped
   end;//try..finally
  finally
   f_InPagesCounting := false;
  end;//try..finally
 finally
  afw.EndOp;
 end;//try..finally
//#UC END# *47ECAFF802EA_47EA97410130_impl*
end;//TevDocumentPreviewPrim.PrePrint

procedure TevDocumentPreviewPrim.ProgressProcEv(aState: Byte;
  aValue: Integer;
  const aMsg: AnsiString);
//#UC START# *47ECDB670389_47EA97410130_var*
//#UC END# *47ECDB670389_47EA97410130_var*
begin
//#UC START# *47ECDB670389_47EA97410130_impl*
 if (aMsg <> '') then
  f_Msg := l3CStr(aMsg);
 if (Status <> nil) then
  Status.Update;
 if (aState = piStart) then
  f_Max := aValue
 else
 if (aState = piCurrent) then
 begin
  f_Current := aValue;
  if (f_Panel <> nil) then
  begin
   if (aValue = 1) OR (aValue mod 10 = 0) then
    f_Panel.Invalidate;
  end;//f_Panel <> nil
  {$IFDEF InsiderTest}
  if g_PrintDataSaver.IsWaitingPrint then
   if (aValue = 1) OR (aValue mod 10 = 0) then
    g_PrintDataSaver.GetPanel.Invalidate;
  {$ENDIF InsiderTest}
 end//aState = piCurrent
 else
 if (aState = piEnd) then
 begin
  f_Msg := nil;
  if (f_Panel <> nil) then
   f_Panel.Invalidate;
  {$IFDEF InsiderTest}
  if g_PrintDataSaver.IsWaitingPrint then
   g_PrintDataSaver.GetPanel.Invalidate;
  {$ENDIF InsiderTest}
 end;//aState = piEnd
//#UC END# *47ECDB670389_47EA97410130_impl*
end;//TevDocumentPreviewPrim.ProgressProcEv

procedure TevDocumentPreviewPrim.CheckAborted(var Aborted: Boolean);
//#UC START# *47ECE7EC02A0_47EA97410130_var*
//#UC END# *47ECE7EC02A0_47EA97410130_var*
begin
//#UC START# *47ECE7EC02A0_47EA97410130_impl*
 if Stopped then
  Aborted := true;
//#UC END# *47ECE7EC02A0_47EA97410130_impl*
end;//TevDocumentPreviewPrim.CheckAborted

function TevDocumentPreviewPrim.IsSettingAffectsUs(const aSettingId: TafwSettingId): Boolean;
//#UC START# *47ECFAD101B9_47EA97410130_var*
//#UC END# *47ECFAD101B9_47EA97410130_var*
begin
//#UC START# *47ECFAD101B9_47EA97410130_impl*
 Result := false;
//#UC END# *47ECFAD101B9_47EA97410130_impl*
end;//TevDocumentPreviewPrim.IsSettingAffectsUs

procedure TevDocumentPreviewPrim.AfterPrint;
//#UC START# *48FD8A1C0307_47EA97410130_var*
//#UC END# *48FD8A1C0307_47EA97410130_var*
begin
//#UC START# *48FD8A1C0307_47EA97410130_impl*
 // Do nothing
//#UC END# *48FD8A1C0307_47EA97410130_impl*
end;//TevDocumentPreviewPrim.AfterPrint

function TevDocumentPreviewPrim.NeedAddBlockNames: Boolean;
//#UC START# *4A2E97A4021B_47EA97410130_var*
//#UC END# *4A2E97A4021B_47EA97410130_var*
begin
//#UC START# *4A2E97A4021B_47EA97410130_impl*
 Result := false;
//#UC END# *4A2E97A4021B_47EA97410130_impl*
end;//TevDocumentPreviewPrim.NeedAddBlockNames

function TevDocumentPreviewPrim.DocumentName: IafwCString;
//#UC START# *473D8C450198_47EA97410130_var*
//#UC END# *473D8C450198_47EA97410130_var*
begin
//#UC START# *473D8C450198_47EA97410130_impl*
 if (f_HAF = nil) then
  Result := nil
 else
  Result := f_HAF.DocumentName;
//#UC END# *473D8C450198_47EA97410130_impl*
end;//TevDocumentPreviewPrim.DocumentName

function TevDocumentPreviewPrim.InProcess: Boolean;
//#UC START# *473D8C5C0187_47EA97410130_var*
//#UC END# *473D8C5C0187_47EA97410130_var*
begin
//#UC START# *473D8C5C0187_47EA97410130_impl*
 Result := InUpdate OR InPagesCounting or InPrinting;
//#UC END# *473D8C5C0187_47EA97410130_impl*
end;//TevDocumentPreviewPrim.InProcess

function TevDocumentPreviewPrim.InPagesCounting: Boolean;
//#UC START# *473D8C6C0266_47EA97410130_var*
//#UC END# *473D8C6C0266_47EA97410130_var*
begin
//#UC START# *473D8C6C0266_47EA97410130_impl*
 Result := f_InPagesCounting;
//#UC END# *473D8C6C0266_47EA97410130_impl*
end;//TevDocumentPreviewPrim.InPagesCounting

function TevDocumentPreviewPrim.InUpdate: Boolean;
//#UC START# *473D8C7C01B5_47EA97410130_var*
//#UC END# *473D8C7C01B5_47EA97410130_var*
begin
//#UC START# *473D8C7C01B5_47EA97410130_impl*
 Result := f_InUpdate;
//#UC END# *473D8C7C01B5_47EA97410130_impl*
end;//TevDocumentPreviewPrim.InUpdate

function TevDocumentPreviewPrim.InPrinting: Boolean;
//#UC START# *473D8C90022C_47EA97410130_var*
//#UC END# *473D8C90022C_47EA97410130_var*
begin
//#UC START# *473D8C90022C_47EA97410130_impl*
 Result := f_InPrinting;
//#UC END# *473D8C90022C_47EA97410130_impl*
end;//TevDocumentPreviewPrim.InPrinting

procedure TevDocumentPreviewPrim.Update(const aPanel: IafwPreviewPanel);
//#UC START# *473D8CA002D9_47EA97410130_var*
var
 l_Panel: IafwPreviewPanel;
//#UC END# *473D8CA002D9_47EA97410130_var*
begin
//#UC START# *473D8CA002D9_47EA97410130_impl*
 {$IFDEF InsiderTest}
 if g_PrintDataSaver.IsWaitingPrint and (aPanel = nil) then // ��� ������ � ����
  l_Panel := g_PrintDataSaver.GetPanel
 else
 {$ENDIF InsiderTest}
  l_Panel := aPanel;
 try
  if (l_Panel <> nil) then
  begin
   if not f_InUpdate AND not InClose and not f_InPrinting then
   begin
    Use;
    try
     if RefCount <= 1 then
      Exit;
     afw.BeginOp;
     try
      f_Stopped := false;
      try
       f_InUpdate := true;
       try
        f_Panel := l_Panel;
        try
         l_Panel.PreviewCanvas := Preview;
         // ��������:
         // ���� ���� ���������� ������ ��� ��� �������� => preprint ������� ������ ������...
         if not f_Stopped or InClose then
          f_Panel.SetCurrentPage(CurrentPageForUpdate);
        finally
         f_Panel := nil;
        end;//try..finally
       finally
        f_InUpdate := false;
       end;//try..finally
      finally
       if f_Stopped then
       begin
        l_Panel.PreviewCanvas := nil;
        f_Preview := nil;
        TryClose;
       end;//f_Stopped
      end;//try..finally
      l_Panel.Done;
     {$IFDEF InsiderTest}
     if g_PrintDataSaver.IsWaitingPrint then
      g_PrintDataSaver.GetPanel.Done;
     {$ENDIF InsiderTest}
     finally
      afw.EndOp;
     end;//afw.BeginOp;
    finally
     Free;
    end;//Use
   end;//not f_InUpdate
  end//l_Panel <> nil
 finally
  l_Panel := nil;
 end;
//#UC END# *473D8CA002D9_47EA97410130_impl*
end;//TevDocumentPreviewPrim.Update

procedure TevDocumentPreviewPrim.Print(anInterval: TafwPagesInterval = afw_piAll;
  const aRange: Il3RangeManager = nil;
  aCopies: Integer = 1;
  const aFileName: AnsiString = '';
  aCollate: Boolean = True);
//#UC START# *473D8CAF028B_47EA97410130_var*
var
 l_PagesCount : TafwPagesInfo;
 l_Pages      : TafwPrintPagesArray;
//#UC END# *473D8CAF028B_47EA97410130_var*
begin
//#UC START# *473D8CAF028B_47EA97410130_impl*
 if (Printer = nil) OR (Printer.Printers.Count = 0) then
  Exit;
 f_InPrinting := true;
 try
  l_Pages := nil;
  // - ��� ����� ���������� �� ����������
  l_PagesCount := PagesInfo;
  // - ��� ���� ��� �������� ����� �������
  if l_PagesCount.IsValid then
  begin
   {$If defined(InsiderTest) AND defined(nsTest)}
   if (aFileName = '') then
    Printer.FileName := l3GetTempFileName('print')
    // - ����� � ������ �� �������� �� �������� �������
   else
   {$IfEnd}
    Printer.FileName := aFileName;
   // �������� �� ����� - �������� ���
   if (aRange = nil) and (f_Counter = nil) then
    l_Pages := nil
   else
   begin
    // �������� ����� - ���� ����������� ��������
    if f_Counter = nil then
     PrePrint(f_PrinterIndex);
    l_Pages := f_Counter.GetIntervalPages(anInterval, aRange);
    if ((anInterval <> afw_piAll) or Assigned(aRange)) AND (Length(l_Pages) <= 0) then
    {$IFDEF NEMESIS}
     raise EevNothingToPrint.Create('');
    {$ELSE}
     Exit;
    {$ENDIF}
     // - �������� ������
   end;//(aRange = nil) and (f_Counter = nil)
   Printer.Copies := Max(1, aCopies);
   Printer.Collate := aCollate;
   try
    DoPrint(nil, l_Pages);
    AfterPrint;
   finally
    Printer.Copies := 1;
   end;//try..finally
  end;//l_PagesCount > 0
 finally
  f_InPrinting := false;
 end;
//#UC END# *473D8CAF028B_47EA97410130_impl*
end;//TevDocumentPreviewPrim.Print

procedure TevDocumentPreviewPrim.Stop(aWnd: THandle = 0);
//#UC START# *473D8CE9007C_47EA97410130_var*
//#UC END# *473D8CE9007C_47EA97410130_var*
begin
//#UC START# *473D8CE9007C_47EA97410130_impl*
 f_Stopped := true;
 f_WndToClose := aWnd;
 DoUnsubscribe;
 if Assigned(f_AbortFilter) then
  f_AbortFilter.Abort;
//#UC END# *473D8CE9007C_47EA97410130_impl*
end;//TevDocumentPreviewPrim.Stop

function TevDocumentPreviewPrim.Stopped: Boolean;
//#UC START# *473D8CF80037_47EA97410130_var*
//#UC END# *473D8CF80037_47EA97410130_var*
begin
//#UC START# *473D8CF80037_47EA97410130_impl*
 Result := f_Stopped OR InClose OR (f_InUpdate and (RefCount <= 1))
   {$IFDEF nsTest}
   OR ((f_Panel <> nil) AND f_Panel.ShouldStop)
   {$ENDIF};
 {$IFDEF InsiderTest}
 if not Result and g_PrintDataSaver.IsWaitingPrint then
  Result := g_PrintDataSaver.GetPanel.ShouldStop;
 {$ENDIF InsiderTest} 
//#UC END# *473D8CF80037_47EA97410130_impl*
end;//TevDocumentPreviewPrim.Stopped

function TevDocumentPreviewPrim.CloseRequested: Boolean;
//#UC START# *473D8D0A01D7_47EA97410130_var*
//#UC END# *473D8D0A01D7_47EA97410130_var*
begin
//#UC START# *473D8D0A01D7_47EA97410130_impl*
 Result := InClose;
//#UC END# *473D8D0A01D7_47EA97410130_impl*
end;//TevDocumentPreviewPrim.CloseRequested

function TevDocumentPreviewPrim.PreviewResetting: Boolean;
//#UC START# *473D8D1E01B8_47EA97410130_var*
//#UC END# *473D8D1E01B8_47EA97410130_var*
begin
//#UC START# *473D8D1E01B8_47EA97410130_impl*
 Result := f_PreviewResetting;
//#UC END# *473D8D1E01B8_47EA97410130_impl*
end;//TevDocumentPreviewPrim.PreviewResetting

procedure TevDocumentPreviewPrim.SetCurrentPage(const aCursor: IUnknown);
//#UC START# *473D8D3800B1_47EA97410130_var*
var
 l_Target    : InevPara;
 l_OldTarget : InevPara;
 l_NewParaID : Integer;
//#UC END# *473D8D3800B1_47EA97410130_var*
begin
//#UC START# *473D8D3800B1_47EA97410130_impl*
 if (f_CurrentPage <> aCursor) then
 begin
  Supports(aCursor, InevPara, l_Target);
  try
   if Supports(f_CurrentPage, InevPara, l_OldTarget) then
    try
     if (l_OldTarget <> nil) and (l_Target <> nil) AND l_Target.IsSame(l_OldTarget) then
      Exit;
       // - �� ���� ������ �������
    finally
     l_OldTarget := nil;
    end;//try..finally
   f_CurrentPage := aCursor;
   if (l_Target <> nil) then
   begin
    l_NewParaID := l_Target.IntA[k2_tiHandle];
    Assert(l_NewParaID <> 0);
   end//l_Target <> nil
   else
    l_NewParaID := 0;
  finally
   l_Target := nil;
  end;//try..finally
  f_CurrentPagePara := l_NewParaID;
  f_OriginalCurrentPage := l_NewParaID;
  f_CurrentPageNumber := -1;
  f_CalcCurrentPageByPara := true;
 end;//f_CurrentPage <> aCursor
//#UC END# *473D8D3800B1_47EA97410130_impl*
end;//TevDocumentPreviewPrim.SetCurrentPage

procedure TevDocumentPreviewPrim.SetCurrentPagePara(aParaID: Integer);
//#UC START# *473D8D4A019D_47EA97410130_var*
//#UC END# *473D8D4A019D_47EA97410130_var*
begin
//#UC START# *473D8D4A019D_47EA97410130_impl*
 f_CurrentPage := nil;
 f_CurrentPagePara := aParaID;
 f_OriginalCurrentPage := aParaID;
 f_CurrentPageNumber := -1;
 f_CalcCurrentPageByPara := true;
//#UC END# *473D8D4A019D_47EA97410130_impl*
end;//TevDocumentPreviewPrim.SetCurrentPagePara

procedure TevDocumentPreviewPrim.SetCurrentPageNumber(aPageNumber: Integer);
//#UC START# *473D8D5D032B_47EA97410130_var*
//#UC END# *473D8D5D032B_47EA97410130_var*
begin
//#UC START# *473D8D5D032B_47EA97410130_impl*
 f_CurrentPage := nil;
 f_CurrentPagePara := 0;
 f_CurrentPageNumber := aPageNumber;
 f_CalcCurrentPageByPara := false;
//#UC END# *473D8D5D032B_47EA97410130_impl*
end;//TevDocumentPreviewPrim.SetCurrentPageNumber

function TevDocumentPreviewPrim.CurrentPage: Integer;
//#UC START# *473D8D72010F_47EA97410130_var*
var
 l_Preview : IafwPreviewCanvas;
//#UC END# *473D8D72010F_47EA97410130_var*
begin
//#UC START# *473D8D72010F_47EA97410130_impl*
 Result := 0;
 if HasCurrentPage then
 begin
  l_Preview := GetPreviewForCurrentPage;
  if (l_Preview = nil) then
   Result := 0
  else
   if f_CalcCurrentPageByPara then
    Result := l_Preview.GetPageByObject(f_CurrentPagePara)
   else
    Result := f_CurrentPageNumber;
 end;//HasCurrentPage
//#UC END# *473D8D72010F_47EA97410130_impl*
end;//TevDocumentPreviewPrim.CurrentPage

function TevDocumentPreviewPrim.HasCurrentPage: Boolean;
//#UC START# *473D8D830163_47EA97410130_var*
//#UC END# *473D8D830163_47EA97410130_var*
begin
//#UC START# *473D8D830163_47EA97410130_impl*
 if f_CalcCurrentPageByPara then
  Result := (f_CurrentPagePara <> 0)
 else
  Result := (f_CurrentPageNumber <> -1);
//#UC END# *473D8D830163_47EA97410130_impl*
end;//TevDocumentPreviewPrim.HasCurrentPage

function TevDocumentPreviewPrim.pm_GetHasText: Boolean;
//#UC START# *473D8DB10141_47EA97410130get_var*
//#UC END# *473D8DB10141_47EA97410130get_var*
begin
//#UC START# *473D8DB10141_47EA97410130get_impl*
 Result := (f_OriginalText <> nil);
//#UC END# *473D8DB10141_47EA97410130get_impl*
end;//TevDocumentPreviewPrim.pm_GetHasText

procedure TevDocumentPreviewPrim.Subscribe(const aNotifier: IafwPreviewNotifier);
//#UC START# *475E827F01CB_47EA97410130_var*
//#UC END# *475E827F01CB_47EA97410130_var*
begin
//#UC START# *475E827F01CB_47EA97410130_impl*
 if f_PreviewSubscribers = nil then
  f_PreviewSubscribers := TafwPreviewNotifierPtrList.Make;
 f_PreviewSubscribers.Add(aNotifier);
//#UC END# *475E827F01CB_47EA97410130_impl*
end;//TevDocumentPreviewPrim.Subscribe

procedure TevDocumentPreviewPrim.UnSubscribe(const aNotifier: IafwPreviewNotifier);
//#UC START# *475E828B0231_47EA97410130_var*
//#UC END# *475E828B0231_47EA97410130_var*
begin
//#UC START# *475E828B0231_47EA97410130_impl*
 f_PreviewSubscribers.Remove(aNotifier);
 if f_PreviewSubscribers.Count = 0 then
  FreeAndNil(f_PreviewSubscribers);
//#UC END# *475E828B0231_47EA97410130_impl*
end;//TevDocumentPreviewPrim.UnSubscribe

function TevDocumentPreviewPrim.pm_GetHAFMacroReplacer: IafwHAFMacroReplacer;
//#UC START# *47EA993A0208_47EA97410130get_var*
//#UC END# *47EA993A0208_47EA97410130get_var*
begin
//#UC START# *47EA993A0208_47EA97410130get_impl*
 Result := f_HAF.MacroReplacer;
//#UC END# *47EA993A0208_47EA97410130get_impl*
end;//TevDocumentPreviewPrim.pm_GetHAFMacroReplacer

function TevDocumentPreviewPrim.Get_Preview: IafwDocumentPreview;
//#UC START# *47ED128D02A7_47EA97410130get_var*
//#UC END# *47ED128D02A7_47EA97410130get_var*
begin
//#UC START# *47ED128D02A7_47EA97410130get_impl*
 Result := Self;
//#UC END# *47ED128D02A7_47EA97410130get_impl*
end;//TevDocumentPreviewPrim.Get_Preview

procedure TevDocumentPreviewPrim.DoInvalidateShape(const aShape: InevObject;
  aParts: TnevShapeParts);
//#UC START# *4918253C0297_47EA97410130_var*
//#UC END# *4918253C0297_47EA97410130_var*
begin
//#UC START# *4918253C0297_47EA97410130_impl*
 Assert(false);
//#UC END# *4918253C0297_47EA97410130_impl*
end;//TevDocumentPreviewPrim.DoInvalidateShape

function TevDocumentPreviewPrim.GetTagReader: InevTagReader;
//#UC START# *491829480128_47EA97410130_var*
//#UC END# *491829480128_47EA97410130_var*
begin
//#UC START# *491829480128_47EA97410130_impl*
 Result := nil;
 Assert(false);
//#UC END# *491829480128_47EA97410130_impl*
end;//TevDocumentPreviewPrim.GetTagReader

function TevDocumentPreviewPrim.GetTagWriter: InevTagWriter;
//#UC START# *491829620101_47EA97410130_var*
//#UC END# *491829620101_47EA97410130_var*
begin
//#UC START# *491829620101_47EA97410130_impl*
 Result := nil;
 Assert(false);
//#UC END# *491829620101_47EA97410130_impl*
end;//TevDocumentPreviewPrim.GetTagWriter

function TevDocumentPreviewPrim.Get_CacheKey: TevPreviewCacheKey;
//#UC START# *494F76F60234_47EA97410130get_var*
//#UC END# *494F76F60234_47EA97410130get_var*
begin
//#UC START# *494F76F60234_47EA97410130get_impl*
 Result := f_CacheKey;
//#UC END# *494F76F60234_47EA97410130get_impl*
end;//TevDocumentPreviewPrim.Get_CacheKey

procedure TevDocumentPreviewPrim.DoGetStatusInfo(out theString: IafwCString;
  out theNeedProgress: Boolean);
//#UC START# *49CCA2480360_47EA97410130_var*
var
 l_Count   : Integer;
 l_Counted : Integer;
 l_Secs    : Int64;
 l_Left    : Il3CString;
 l_S       : String;
//#UC END# *49CCA2480360_47EA97410130_var*
begin
//#UC START# *49CCA2480360_47EA97410130_impl*
 if Stopped then
 begin
  theString := nil;
  theNeedProgress := False;
  Exit;
 end;
 theNeedProgress := f_MakingCanvas and ((f_Panel = nil) or not f_Panel.Painted);
 l_Left := nil;
 if f_InAquareText then
  theString := str_nevpmProcessText.AsCStr 
 else
 begin
  if InPagesCounting AND (f_Counter <> nil) then
   l_Count := f_Counter.GetPagesCount
  else
  if InUpdate AND (f_Preview <> nil) then
   l_Count := f_Preview.GetPagesCount
  else
   l_Count := 0;
  if (f_Time <> nil) then
  begin
   f_Time.CurrentValue(l_Count);
   if f_Time.LeftToFinish(l_Secs) then
   l_Left := l3Fmt(str_nevpmTimeLeft.AsCStr, [l_Secs]);
  end;//f_Time <> nil
  if (l_Count = 0) then
  begin
   theString := f_Msg;
   if (f_Max > 0) AND (theString <> nil) AND (f_Current <= f_Max) then
    theString := l3Cat([theString, l3Fmt(' %d%%', [l3MulDiv(f_Current, 100, f_Max)])]);
  end//l_Count = 0
  else
  begin
   if InPagesCounting then
    theString := l3Fmt(str_nevpmCounting.AsCStr, [l_Count, f_MaxPages])
   else
   if InUpdate AND (f_Preview <> nil) then
   begin
    l_Counted := f_Preview.PagesInfo.rPagesCount;
    if (l_Counted = High(l_Counted)) then
    begin
     l_Counted := f_MaxPages;
     l_S := '~';
    end
    else
     l_S := '';
    if (l_Counted = High(l_Counted)) then
     theString := l3Fmt(str_nevpmPreparing.AsCStr, [l_Count])
    else
     theString := l3Fmt(str_nevpmPreparingExt.AsCStr, [l_Count, l_S, l_Counted]);
   end//InUpdate AND (f_Preview <> nil)
   else
    theString := nil;
  end;//l_Count = 0
 end;
 if f_MakingCanvas and l3IsNil(theString ) then
  theString := str_nevpmProcessPreview.AsCStr;
 if not l3IsNil(theString) AND not l3IsNil(l_Left) then
  theString := l3Cat([theString, l_Left]);
//#UC END# *49CCA2480360_47EA97410130_impl*
end;//TevDocumentPreviewPrim.DoGetStatusInfo

procedure TevDocumentPreviewPrim.Cleanup;
//#UC START# *479731C50290_47EA97410130_var*
//#UC END# *479731C50290_47EA97410130_var*
begin
//#UC START# *479731C50290_47EA97410130_impl*
 Assert(not f_InUpdate);
 f_Stopped := False;
 DoUnsubscribe;
 l3Free(f_PreviewSubscribers);
 l3Free(f_Time);
 f_CurrentPage := nil;
 f_HAF := nil;
 f_Panel := nil;
 f_Printer := nil;
 f_OriginalText := nil;
 f_Text := nil;
 f_TextOwner := nil;
 f_Counter := nil;
 f_Preview := nil;
 f_Processor := nil;
 f_Msg := nil;
 f_AbortFilter := nil;
 inherited;
//#UC END# *479731C50290_47EA97410130_impl*
end;//TevDocumentPreviewPrim.Cleanup

function TevDocumentPreviewPrim.SettingChanged(const aSettingId: TafwSettingId): Boolean;
//#UC START# *47EA863A035C_47EA97410130_var*
var
 l_SL: IafwSettingListener;
//#UC END# *47EA863A035C_47EA97410130_var*
begin
//#UC START# *47EA863A035C_47EA97410130_impl*
 Result := false;
 if Supports(f_HAF, IafwSettingListener, l_SL) then
  try
   if l_SL.Changed(aSettingId) then
    Result := true;
  finally
   l_SL := nil;
  end;//try..finally
 if not Result then
  Result := IsSettingAffectsUs(aSettingId);
 if Result then
  AbortPreviewPrepare;
//#UC END# *47EA863A035C_47EA97410130_impl*
end;//TevDocumentPreviewPrim.SettingChanged

procedure TevDocumentPreviewPrim.SettingsReplaceFinish;
//#UC START# *47EA8B9601FE_47EA97410130_var*
var
 l_SL: IafwSettingsReplaceListener;
//#UC END# *47EA8B9601FE_47EA97410130_var*
begin
//#UC START# *47EA8B9601FE_47EA97410130_impl*
 if Supports(f_HAF, IafwSettingsReplaceListener, l_SL) then
  try
   l_SL.Finish;
  finally
   l_SL := nil;
  end;//try..finally
 AbortPreviewPrepare;
//#UC END# *47EA8B9601FE_47EA97410130_impl*
end;//TevDocumentPreviewPrim.SettingsReplaceFinish

function TevDocumentPreviewPrim.GetObj: InevObject;
//#UC START# *48185EEB0234_47EA97410130_var*
//#UC END# *48185EEB0234_47EA97410130_var*
begin
//#UC START# *48185EEB0234_47EA97410130_impl*
 Result := Text;
//#UC END# *48185EEB0234_47EA97410130_impl*
end;//TevDocumentPreviewPrim.GetObj

procedure TevDocumentPreviewPrim.UnformatAll;
//#UC START# *49182CD402C9_47EA97410130_var*
//#UC END# *49182CD402C9_47EA97410130_var*
begin
//#UC START# *49182CD402C9_47EA97410130_impl*
 inherited;
//#UC END# *49182CD402C9_47EA97410130_impl*
end;//TevDocumentPreviewPrim.UnformatAll

function TevDocumentPreviewPrim.NeedUpdateOnUnsubscribe: Boolean;
//#UC START# *49CCA4C90343_47EA97410130_var*
//#UC END# *49CCA4C90343_47EA97410130_var*
begin
//#UC START# *49CCA4C90343_47EA97410130_impl*
 Result := Stopped;
//#UC END# *49CCA4C90343_47EA97410130_impl*
end;//TevDocumentPreviewPrim.NeedUpdateOnUnsubscribe

{$If not defined(DesignTimeLibrary)}
procedure TevDocumentPreviewPrim.DoStyleTableChanged;
//#UC START# *4A485B710126_47EA97410130_var*
//#UC END# *4A485B710126_47EA97410130_var*
begin
//#UC START# *4A485B710126_47EA97410130_impl*
 AbortPreviewPrepare;
 // - ���, ����� ����� ������������������. � ������������� �������.
 inherited;
//#UC END# *4A485B710126_47EA97410130_impl*
end;//TevDocumentPreviewPrim.DoStyleTableChanged
{$IfEnd} //not DesignTimeLibrary

procedure TevDocumentPreviewPrim.ClearFields;
 {-}
begin
 f_OriginalText := nil;
 f_Preview := nil;
 f_Text := nil;
 Printer := nil;
 f_Processor := nil;
 Finalize(f_PagesInfo);
 inherited;
end;//TevDocumentPreviewPrim.ClearFields

end.