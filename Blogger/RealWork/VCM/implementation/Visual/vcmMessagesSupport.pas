unit vcmMessagesSupport;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "VCM$Visual"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/VCM/implementation/Visual/vcmMessagesSupport.pas"
// �����: 22.06.2011 15:49
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi::VCM$Visual::Visual::vcmMessagesSupport
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If not defined(NoVCM)}
uses
  l3Interfaces,
  SysUtils,
  vcmGUI,
  Dialogs,
  l3StringIDEx,
  l3MessageID,
  vcmMessagesCollectionItem,
  Pl3StringIDExList
  ;

type
 EvcmDialogHasChoices = class(Exception)
 end;//EvcmDialogHasChoices

 EvcmInvalidWaitedButton = class(Exception)
 end;//EvcmInvalidWaitedButton

 EvcmUnwaitedDialog = class(Exception)
 end;//EvcmUnwaitedDialog

var g_HasMesssage : Boolean;
procedure vcmSay(const aMsg: Tl3StringIDEx;
  aDlgType: TMsgDlgType = mtError); overload; 
function vcmShowMessageDlg(const aMsg: Tl3Message;
  out theChecked: Boolean;
  aChoices: TPl3StringIDExList): Integer; overload; 
function vcmAsk(const aMsg: TvcmMessageID): Boolean; overload; 
function vcmMessageDlg(const aMsg: TvcmMessageID): Integer; overload; 
function vcmMessageDlg(const aMsg: TvcmMessageID;
  const aData: array of const): Integer; overload; 
procedure vcmSay(const aMsg: Tl3StringIDEx;
  const aData: array of const;
  aDlgType: TMsgDlgType = mtError); overload; 
procedure vcmSay(const aMsg: TvcmMessageID); overload; 
procedure vcmSay(const aMsg: TvcmMessageID;
  const aData: array of const); overload; 
function vcmAsk(const aMsg: TvcmMessageID;
  const aData: array of const): Boolean; overload; 
function vcmMessageDlg(const anItem: Tl3Message): Integer; overload; 
function vcmGetVisibleName(const aName: Il3CString;
  aChoices: TPl3StringIDExList;
  aDlgType: TMsgDlgType): Il3CString;
function vcmMessageIDToMessage(const aMsgID: TvcmMessageID;
  const aMessage: Il3CString): Tl3Message;
function vcmMessageDlg(const aMsgId: TvcmMessageID;
  const aMessage: Il3CString): Integer; overload; 
function vcmShowMessageDlg(const aMsg: Tl3Message): Integer; overload; 
function vcmAsk(const aMsg: Tl3MessageID;
  const aData: array of const): Boolean; overload; 
function vcmMessageDlg(const aMsg: Tl3MessageID;
  const aData: array of const): Integer; overload; 
{$IfEnd} //not NoVCM

implementation

{$If not defined(NoVCM)}
uses
  vcmInterfaces,
  Forms,
  vcmBase,
  l3VCLFormPtrList,
  l3String,
  Controls,
  vtDialogsResEx,
  vcmBaseMenuManager,
  vcmSettings,
  l3Bits,
  Classes
  {$If defined(nsTest)}
  ,
  afwAnswer
  {$IfEnd} //nsTest
  ,
  l3Base,
  vcmMessageQueuePrim,
  vcmForm,
  vcmMessageQueue
  {$If not defined(NoVCM) AND not defined(NoVGScene)}
  ,
  vcmDialogs
  {$IfEnd} //not NoVCM AND not NoVGScene
  
  ;

// unit methods

procedure vcmProcessMessageFromQueue;
//#UC START# *4E01EF000123_4E01D696020C_var*
var
 l_Item: TvcmMessageQueueItem;
//#UC END# *4E01EF000123_4E01D696020C_var*
begin
//#UC START# *4E01EF000123_4E01D696020C_impl*
 if TvcmMessageQueue.Exists then
  while (TvcmMessageQueue.Instance.Count > 0) do
  begin
   l_Item := TvcmMessageQueue.Instance.Items[0];
   TvcmMessageQueue.Instance.Delete(0);
   with l_Item do
    vcmMessageDlg(rMsgId, rMessage);
  end;//while (TvcmMessageQueue.Instance.Count > 0)
//#UC END# *4E01EF000123_4E01D696020C_impl*
end;//vcmProcessMessageFromQueue

function vcmAddMessageToQueue(aItem: TvcmMessagesCollectionItem;
  const aMsg: TvcmMessageID;
  const aData: array of const): Boolean;
//#UC START# *4E01EF180178_4E01D696020C_var*
var
 l_Item: TvcmMessageQueueItem;
//#UC END# *4E01EF180178_4E01D696020C_var*
begin
//#UC START# *4E01EF180178_4E01D696020C_impl*
 Result := False;
 if g_HasMesssage and (aItem.Buttons = [mbOK]) then
 begin
  with l_Item do
  begin
   rMsgId := aMsg;
   // ���������� ���������
   if (High(aData) >= 0) then
    rMessage := {aItem.GetVisibleName(}vcmFmt(aItem.Caption, aData){)}
   else
    rMessage := l3CStr(aItem.{Visible}Caption);
  end;//with l_Item
  TvcmMessageQueue.Instance.Add(l_Item);
  Result := True;
 end;//g_HasMesssage..
//#UC END# *4E01EF180178_4E01D696020C_impl*
end;//vcmAddMessageToQueue

procedure vcmSay(const aMsg: Tl3StringIDEx;
  aDlgType: TMsgDlgType = mtError);
//#UC START# *4A9D129E00FA_4E01D696020C_var*
//#UC END# *4A9D129E00FA_4E01D696020C_var*
begin
//#UC START# *4A9D129E00FA_4E01D696020C_impl*
 vcmShowMessageDlg(Tl3Message_C(aMsg, aDlgType));
//#UC END# *4A9D129E00FA_4E01D696020C_impl*
end;//vcmSay

function vcmShowMessageDlg(const aMsg: Tl3Message;
  out theChecked: Boolean;
  aChoices: TPl3StringIDExList): Integer;
//#UC START# *4A9D12BB00CC_4E01D696020C_var*
  
 function GetCurrentMainFormHWnd: HWnd;
 var
  l_Dispatcher: IvcmDispatcher;
  l_FormDispatcher: IvcmFormDispatcher;
  l_EntityForm: IvcmEntityForm;
  l_CustomForm: TWinControl;
 begin//GetCurrentMainFormHWnd
  Result := HWnd(0);
  l_Dispatcher := vcmDispatcher;
  if (l_Dispatcher <> nil) then
   try
    l_FormDispatcher := l_Dispatcher.FormDispatcher;
    if (l_FormDispatcher <> nil) then
     try
      l_EntityForm := l_FormDispatcher.CurrentMainForm;
      if (l_EntityForm <> nil) then
       try
        l_CustomForm := l_EntityForm.VCLWinControl;
        if (l_CustomForm <> nil) then
         Result := l_CustomForm.Handle;
       finally
        l_EntityForm := nil;
       end;//try..finally
     finally
      l_FormDispatcher := nil;
     end;//try..finally
   finally
    l_Dispatcher := nil;
   end;//try..finally
 end;//GetCurrentMainFormHWnd

var
 l_Form: IvcmEntityForm;
 l_Index: Integer;
 l_List: Tl3VCLFormPtrList;
 l_Dispatcher: IvcmDispatcher;
//#UC END# *4A9D12BB00CC_4E01D696020C_var*
begin
//#UC START# *4A9D12BB00CC_4E01D696020C_impl*
 g_MenuManager.BackupOpStatus;
 try
  if (g_Dispatcher <> nil) and (g_Dispatcher.FormDispatcher <> nil) then
   g_Dispatcher.FormDispatcher.BackupLockStatus;
  try
   l_List := Tl3VCLFormPtrList.Make;
   try
    // ����� ��� Floating �����
    l_Dispatcher := vcmDispatcher;
    if Assigned(l_Dispatcher) then
     with l_Dispatcher do
     for l_Index := 0 to EntitiesCount - 1 do
      if Supports(Entity[l_Index], IvcmEntityForm, l_Form) then
       if (l_Form.ZoneType = vcm_ztFloating) and
          l_Form.VCLWinControl.Visible then
       begin
        l_Form.VCLWinControl.Hide;
        l_List.Add(l_Form.VCLWinControl As TCustomForm);
       end;//l_Form.ZoneType = vcm_ztFloating
    {$IfNDef NoVGScene}
    Result := vcmMessageDlgPrim(aMsg,
                                theChecked,
                                taLeftJustify,
                                GetCurrentMainFormHWnd,
                                aChoices);
    {$Else  NoVGScene}
    Result := 0;
    Assert(false);
    {$EndIf  NoVGScene}
   for l_Index := 0 to l_List.Count - 1 do  // � ��������� �� �������
    l_List[l_Index].Show;
   finally
    FreeAndNil(l_List);
   end;//try..finally
  finally
   if (g_Dispatcher <> nil) and (g_Dispatcher.FormDispatcher <> nil) then
    g_Dispatcher.FormDispatcher.RestoreLockStatus;
  end;//try..finally
 finally
  g_MenuManager.RestoreOpStatus;
 end;//try..finally
//#UC END# *4A9D12BB00CC_4E01D696020C_impl*
end;//vcmShowMessageDlg

function vcmAsk(const aMsg: TvcmMessageID): Boolean;
//#UC START# *4AA13EB80322_4E01D696020C_var*
//#UC END# *4AA13EB80322_4E01D696020C_var*
begin
//#UC START# *4AA13EB80322_4E01D696020C_impl*
 Result := vcmAsk(aMsg, []);
//#UC END# *4AA13EB80322_4E01D696020C_impl*
end;//vcmAsk

function vcmMessageDlg(const aMsg: TvcmMessageID): Integer;
//#UC START# *4E01E08F0038_4E01D696020C_var*
//#UC END# *4E01E08F0038_4E01D696020C_var*
begin
//#UC START# *4E01E08F0038_4E01D696020C_impl*
 Result := vcmMessageDlg(aMsg, []);
//#UC END# *4E01E08F0038_4E01D696020C_impl*
end;//vcmMessageDlg

function vcmMessageDlg(const aMsg: TvcmMessageID;
  const aData: array of const): Integer;
//#UC START# *4E01E0B8018E_4E01D696020C_var*
var
 l_Str  : Il3CString;
 l_Item : TvcmMessagesCollectionItem;
//#UC END# *4E01E0B8018E_4E01D696020C_var*
begin
//#UC START# *4E01E0B8018E_4E01D696020C_impl*
 l_Item := TvcmMessagesCollectionItem(g_MenuManager.Messages.Items[aMsg.rM]);
 // ��������� �������� � �������
 if vcmAddMessageToQueue(l_Item, aMsg, aData) then
 begin
  Result := mrNone;
  Exit;
 end;//vcmAddMessageToQueue
 g_HasMesssage := True;
 try
  // ���������� ������ ���������
  if (High(aData) >= 0) then
   l_Str := {l_Item.GetVisibleName(}vcmFmt(l_Item.Caption, aData){)}
  else
   l_Str := l3CStr(l_Item.{Visible}Caption);
  Result := vcmMessageDlg(aMsg, l_Str);
 finally
  g_HasMesssage := False;
 end;//try..finally
 vcmProcessMessageFromQueue;
//#UC END# *4E01E0B8018E_4E01D696020C_impl*
end;//vcmMessageDlg

procedure vcmSay(const aMsg: Tl3StringIDEx;
  const aData: array of const;
  aDlgType: TMsgDlgType = mtError);
//#UC START# *4E01E11201EB_4E01D696020C_var*
//#UC END# *4E01E11201EB_4E01D696020C_var*
begin
//#UC START# *4E01E11201EB_4E01D696020C_impl*
 vcmShowMessageDlg(Tl3Message_C(vcmFmt(aMsg.AsCStr, aData), aMsg.rKey, aDlgType));
//#UC END# *4E01E11201EB_4E01D696020C_impl*
end;//vcmSay

procedure vcmSay(const aMsg: TvcmMessageID);
//#UC START# *4E01E14400AB_4E01D696020C_var*
//#UC END# *4E01E14400AB_4E01D696020C_var*
begin
//#UC START# *4E01E14400AB_4E01D696020C_impl*
 vcmMessageDlg(aMsg);
//#UC END# *4E01E14400AB_4E01D696020C_impl*
end;//vcmSay

procedure vcmSay(const aMsg: TvcmMessageID;
  const aData: array of const);
//#UC START# *4E01E15B03AA_4E01D696020C_var*
//#UC END# *4E01E15B03AA_4E01D696020C_var*
begin
//#UC START# *4E01E15B03AA_4E01D696020C_impl*
 vcmMessageDlg(aMsg, aData);
//#UC END# *4E01E15B03AA_4E01D696020C_impl*
end;//vcmSay

function vcmAsk(const aMsg: TvcmMessageID;
  const aData: array of const): Boolean;
//#UC START# *4E01E19B00CB_4E01D696020C_var*
var
 l_Result : Integer;
 l_Item   : TvcmMessagesCollectionItem;
//#UC END# *4E01E19B00CB_4E01D696020C_var*
begin
//#UC START# *4E01E19B00CB_4E01D696020C_impl*
 l_Item := TvcmMessagesCollectionItem(g_MenuManager.Messages.Items[aMsg.rM]);
 l_Result := vcmMessageDlg(aMsg, aData);
 Result := (l_Result = mrOk) or (l_Result = mrYes);
//#UC END# *4E01E19B00CB_4E01D696020C_impl*
end;//vcmAsk

function vcmMessageDlg(const anItem: Tl3Message): Integer;
//#UC START# *4E01E90202D0_4E01D696020C_var*

 function lp_GetDlgButtons(aModalResult: TModalResult): TMsgDlgButtons;
 var
  l_Idx: TMsgDlgBtn;
 begin//lp_GetDlgButtons
  Result := [];
  if (aModalResult <> mrNone) then
   for l_Idx := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
    if (vtGetDlgBtnResult(l_Idx) = aModalResult) then
     Include(Result, l_Idx);
 end;//lp_GetDlgButtons

var
 l_Checked   : Boolean;
 l_NeedSave  : Boolean;
 l_NewResult : integer;
 l_CheckStr  : Pl3StringIDEx;
 l_Buttons   : TMsgDlgButtons;
 l_Byte      : Byte absolute l_Buttons;
 l_Choices   : TPl3StringIDExList;
 l_Message   : Il3CString;
 l_NeedExit  : Boolean;
 l_Msg       : Tl3Message;
//#UC END# *4E01E90202D0_4E01D696020C_var*
begin
//#UC START# *4E01E90202D0_4E01D696020C_impl*
 l_CheckStr := nil;
 l_Msg := anItem;
 l_Message := vcmGetVisibleName(l_Msg.rMessage,
                                l_Msg.rData.rChoices,
                                l_Msg.rData.rDlgType);
 l_Buttons := l_Msg.rData.rButtons;
 l_Choices := l_Msg.rData.rChoices.Use;
 try
  if (l_Choices <> nil) then
  begin
   //(l_Choices As Il3StringsEx).Items.Text := l_Msg.rData.rChoices;
   {$IfNDef Nemesis}
    Assert(l_Msg.rData.rButtons = [mbOk, mbCancel]);
   {$EndIf}
  end;//l_Choices <> nil

  if l_Msg.rData.rNeedCheck then
  begin
   {$IfDef vcmUseSettings}
   if vcmLoadIntParam([vcmPathPair(l_Msg.rName)], Result, '') then
   begin
    l_NeedExit := false;
    try
     if (Result > 0) then
     begin
      if (l_Choices <> nil) then
      begin
       Assert((l_Choices.Count = 2) and (Result in [mrOk, mrYes, mrNo]));
       case Result of
        mrOk, mrYes: Result := -1;
        mrNo: Result := -2;
       end;
       if (-Result - 1) < l_Choices.Count then
       begin
        l_NeedExit := true;
        Exit;
       end;//-Result - 1
      end;//l_Choices <> nil
      if (Result <> mrNone) and
         ((lp_GetDlgButtons(Result) * l_Buttons) <> []) then
      begin
       l_NeedExit := true;
       Exit;
      end;//Result <> mrNone
     end//Result >= 0
     else
     if (Result <> mrNone) and
        (l_Choices <> nil) AND ((-Result - 1) < l_Choices.Count) then
     begin
      l_NeedExit := true;
      Exit;
     end;//Result <> mrNone..
    finally
     if l_NeedExit then
     begin
      {$IfDef InsiderTest}
      if g_BatchMode then
      begin
       Assert(Result = AfwGetAnswer);
       Inc(g_WasWait);
(*
 http://mdp.garant.ru/pages/viewpage.action?pageId=337513713
 ���� ��������, �� ��� ����� ���� ���� ����� ����������� ������� ������� �� �������� �:
   Inc(g_WasWait);
   Assert(vtGetDlgResultBtn(l_Answer) in aMsg.rData.rButtons);
   Assert((aChoices = nil) OR (aChoices.Count <= 0));
   Result := l_Answer;
   Exit;
*)
      end;//g_BatchMode
      {$EndIf InsiderTest}
     end;//l_NeedExit
    end;//try..finally
    if l_NeedExit then
     Exit;
   end;//vcmLoadIntParam
   {$EndIf vcmUseSettings}
   if (l_Msg.rData.rCheckCaption <> nil) then
    l_CheckStr := l_Msg.rData.rCheckCaption
   else
    l_CheckStr := @str_vcmRememberChoice;
  end//l_Msg.rNeedCheck
  else
  begin
   l_CheckStr := nil;
  end;//l_Msg.rNeedCheck
  if (l_CheckStr <> nil) then
  begin
   if (l_Choices = nil) OR (l_Choices.Count < 2) then
   begin
    if (l3BitCountF(l_Byte) < 3) then
     l_CheckStr := @str_vcmNotShowDlg;
   end;//l_Choices = nil
  end;//l_CheckStr <> nil
  l_Msg := l_Msg.ChangeCheckCaption(l_CheckStr^);
  l_Msg := l_Msg.ChangeMessage(l_Message);
  Result := vcmShowMessageDlg(l_Msg, l_Checked, l_Choices);
  l_NewResult := Result;
  if (Result = mrYes) then
  begin
   if (mbYes in l_Buttons) AND not (mbOk in l_Buttons) then
    l_NewResult := mrOk;
  end;//Result = mrYes
 {$IfDef Nemesis}
  if (l_NewResult < 0) and (l_NewResult = l_Msg.rData.rCustomChoice) then
   l_NewResult := vcm_mrCustomButton;
 {$EndIf}

  if l_Checked then
  begin
   if (Result < 0) OR (Result = mrYes) OR (Result = mrOk) then
    l_NeedSave := true
   else
   if (Result = mrNo) then
   begin
    l_NeedSave := (mbCancel in l_Buttons);
   end//ModalResult = mrNo
   else
    l_NeedSave := (Result <> mrCancel);
   if l_NeedSave then
   begin
    // - ����� � ��������� ���� ��������� Result
    {$IfDef vcmUseSettings}
    if (l_Msg.rData.rDefaultChoice = 0) then
     vcmSaveIntParam([vcmPathPair(l_Msg.rName)], Result, mrNone, '')
    else
     vcmSaveIntParam([vcmPathPair(l_Msg.rName)],
                     l_Msg.rData.rDefaultChoice, mrNone, '');
    {$EndIf vcmUseSettings}
   end;//l_NeedSave
  end;//l_Checked
  Result := l_NewResult;
 finally
  FreeAndNil(l_Choices);
 end;//try..finally
//#UC END# *4E01E90202D0_4E01D696020C_impl*
end;//vcmMessageDlg

function vcmGetVisibleName(const aName: Il3CString;
  aChoices: TPl3StringIDExList;
  aDlgType: TMsgDlgType): Il3CString;
//#UC START# *4E0890BE038F_4E01D696020C_var*
var
 l_Len : Integer;
//#UC END# *4E0890BE038F_4E01D696020C_var*
begin
//#UC START# *4E0890BE038F_4E01D696020C_impl*
 Result := aName;
 l_Len := l3Len(Result);
 if (l_Len > 0) then
 begin
  if l3IsChar(Result, l_Len - 1, ['.', '?', '!', ':']) then
   Exit;
  if (aChoices <> nil) AND (aChoices.Count > 1) then
   Result := l3Cat(Result, ':')
  else
   Case aDlgType of
    mtWarning,
    mtError :
     Result := l3Cat(Result, '!');
    mtCustom,
    mtInformation :
     Result := l3Cat(Result, '.');
    mtConfirmation :
     Result := l3Cat(Result, '?');
   end;//Case DlgType
 end;//l_Len > 0
//#UC END# *4E0890BE038F_4E01D696020C_impl*
end;//vcmGetVisibleName

function vcmMessageIDToMessage(const aMsgID: TvcmMessageID;
  const aMessage: Il3CString): Tl3Message;
//#UC START# *4E08A89601F5_4E01D696020C_var*
var
 l_Item : TvcmMessagesCollectionItem;
//#UC END# *4E08A89601F5_4E01D696020C_var*
begin
//#UC START# *4E08A89601F5_4E01D696020C_impl*
 l3FillChar(Result, SizeOf(Result));
 l_Item := TvcmMessagesCollectionItem(g_MenuManager.Messages.Items[aMsgId.rM]);
 Result.rName := l_Item.Name;
 Result.rMessage := aMessage;
 Result.rData.rDlgType := l_Item.DlgType;
 Result.rData.rButtons := l_Item.Buttons;
 Result.rData.rNeedCheck := l_Item.NeedCheck;
 Result.rData.rHelpCtx := l_Item.HelpCtx;
 Result.rData.rDefaultButton := l_Item.DefaultButton;
 Result.rData.rCancelButton := l_Item.CancelButton;
 Result.rData.rCustomButtonCaption := l_Item.CustomButtonCaption;
 Result.rData.rSettingsCaptionOld := l_Item.SettingsCaption;
 Result.rData.rLongHintOld := l_Item.LongHint;
//#UC END# *4E08A89601F5_4E01D696020C_impl*
end;//vcmMessageIDToMessage

function vcmMessageDlg(const aMsgId: TvcmMessageID;
  const aMessage: Il3CString): Integer;
//#UC START# *4E08A8FC038F_4E01D696020C_var*
//#UC END# *4E08A8FC038F_4E01D696020C_var*
begin
//#UC START# *4E08A8FC038F_4E01D696020C_impl*
 Result := vcmMessageDlg(vcmMessageIDToMessage(aMsgId, aMessage));
//#UC END# *4E08A8FC038F_4E01D696020C_impl*
end;//vcmMessageDlg

function vcmShowMessageDlg(const aMsg: Tl3Message): Integer;
//#UC START# *4E0B316101C7_4E01D696020C_var*
var
 l_Checked : Boolean;
//#UC END# *4E0B316101C7_4E01D696020C_var*
begin
//#UC START# *4E0B316101C7_4E01D696020C_impl*
 Result := vcmShowMessageDlg(aMsg, l_Checked, nil);
//#UC END# *4E0B316101C7_4E01D696020C_impl*
end;//vcmShowMessageDlg

function vcmAsk(const aMsg: Tl3MessageID;
  const aData: array of const): Boolean;
//#UC START# *4E7CA37100CD_4E01D696020C_var*
var
 l_Result : Integer;
//#UC END# *4E7CA37100CD_4E01D696020C_var*
begin
//#UC START# *4E7CA37100CD_4E01D696020C_impl*
 l_Result := vcmMessageDlg(aMsg.AsMessage.ChangeMessage(l3Fmt(aMsg.AsStr, aData)));
 Result := (l_Result = mrOk) or (l_Result = mrYes) or
           ((l_Result < 0) and (l_Result = aMsg.rData.rDefaultChoice));
//#UC END# *4E7CA37100CD_4E01D696020C_impl*
end;//vcmAsk

function vcmMessageDlg(const aMsg: Tl3MessageID;
  const aData: array of const): Integer;
//#UC START# *4E9E898302DC_4E01D696020C_var*
//#UC END# *4E9E898302DC_4E01D696020C_var*
begin
//#UC START# *4E9E898302DC_4E01D696020C_impl*
 Result := vcmMessageDlg(aMsg.AsMessage.ChangeMessage(l3Fmt(aMsg.AsStr, aData)));
//#UC END# *4E9E898302DC_4E01D696020C_impl*
end;//vcmMessageDlg
{$IfEnd} //not NoVCM

end.