unit PrimQueryCardOptions_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View$For F1 and Monitorings"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Search/Forms/PrimQueryCardOptions_Form.pas"
// �����: 08.09.2010 21:21
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 Common For Shell And Monitoring::Search::View$For F1 and Monitorings::Search$Presentation for F1 and Monitorings::PrimQueryCardOptions
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If not defined(Admin)}
uses
  OfficeLike_Usual_Controls,
  OfficeLike_Text_Controls,
  PrimQueryCard_Form,
  Search_Strange_Controls,
  vcmExternalInterfaces {a},
  vcmInterfaces {a},
  vcmEntityForm {a}
  ;
{$IfEnd} //not Admin

{$If not defined(Admin)}
type
 TPrimQueryCardOptionsForm = {form} class(TPrimQueryCardForm)
 protected
  procedure InitEntities; override;
 protected
 // realized methods
   procedure File_Print_Test(const aParams: IvcmTestParamsPrim);
     {* ������ }
   procedure Edit_Paste_Test(const aParams: IvcmTestParamsPrim);
     {* ������� }
   procedure SubPanelSettings_ShowSpecial_Test(const aParams: IvcmTestParamsPrim);
     {* ���������� ����������� }
   procedure SubPanelSettings_ShowSpecial_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ���������� ����������� }
   procedure Edit_Copy_Test(const aParams: IvcmTestParamsPrim);
     {* ���������� }
   procedure Edit_Delete_Test(const aParams: IvcmTestParamsPrim);
     {* ������� }
   procedure Edit_Delete_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������� }
 end;//TPrimQueryCardOptionsForm

 TvcmEntityFormRef = TPrimQueryCardOptionsForm;
{$IfEnd} //not Admin

implementation

{$If not defined(Admin)}
uses
  DataAdapter,
  SysUtils,
  nsQueryInterfaces,
  evControlParaTools,
  l3String,
  evControlParaConst,
  afwFacade,
  evQueryCardInt,
  StdRes {a}
  ;
{$IfEnd} //not Admin

{$If not defined(Admin)}

// start class TPrimQueryCardOptionsForm

procedure TPrimQueryCardOptionsForm.File_Print_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *49521D8E0295_4C87C62302CFtest_var*
//#UC END# *49521D8E0295_4C87C62302CFtest_var*
begin
//#UC START# *49521D8E0295_4C87C62302CFtest_impl*
 File_PrintPreview_Test(aParams);
 {$IFDEF Monitorings}
 if aParams.Op.Flag[vcm_ofEnabled] then
  if (afw.Application = nil) OR (afw.Application.PrintManager = nil) OR
     not afw.Application.PrintManager.CanPrint then
   aParams.Op.Flag[vcm_ofEnabled] := false;
 {$ENDIF Monitorings}
//#UC END# *49521D8E0295_4C87C62302CFtest_impl*
end;//TPrimQueryCardOptionsForm.File_Print_Test

procedure TPrimQueryCardOptionsForm.Edit_Paste_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *49EDFA3701B0_4C87C62302CFtest_var*
var
 l_Control : IevCustomEditorControl;
//#UC END# *49EDFA3701B0_4C87C62302CFtest_var*
begin
//#UC START# *49EDFA3701B0_4C87C62302CFtest_impl*
 if aParams.CallControl and aParams.Op.Flag[vcm_ofEnabled] then
 begin
  l_Control := evGetCustomControl(Editor.Selection.Cursor.MostInner.Obj^);
  aParams.Op.Flag[vcm_ofEnabled] := Assigned(l_Control) and
   l_Control.Visible and (l_Control.ControlType in evEditControls);
 end;
//#UC END# *49EDFA3701B0_4C87C62302CFtest_impl*
end;//TPrimQueryCardOptionsForm.Edit_Paste_Test

procedure TPrimQueryCardOptionsForm.SubPanelSettings_ShowSpecial_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4A7C18B20241_4C87C62302CFtest_var*
//#UC END# *4A7C18B20241_4C87C62302CFtest_var*
begin
//#UC START# *4A7C18B20241_4C87C62302CFtest_impl*
 aParams.Op.Flag[vcm_ofVisible] := DefDataAdapter.IsInternal;
 aParams.Op.Flag[vcm_ofChecked] := Editor.Canvas.DrawSpecial;
//#UC END# *4A7C18B20241_4C87C62302CFtest_impl*
end;//TPrimQueryCardOptionsForm.SubPanelSettings_ShowSpecial_Test

procedure TPrimQueryCardOptionsForm.SubPanelSettings_ShowSpecial_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4A7C18B20241_4C87C62302CFexec_var*
//#UC END# *4A7C18B20241_4C87C62302CFexec_var*
begin
//#UC START# *4A7C18B20241_4C87C62302CFexec_impl*
 Editor.Canvas.DrawSpecial := not Editor.Canvas.DrawSpecial;
//#UC END# *4A7C18B20241_4C87C62302CFexec_impl*
end;//TPrimQueryCardOptionsForm.SubPanelSettings_ShowSpecial_Execute

procedure TPrimQueryCardOptionsForm.Edit_Copy_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7D0C7B0185_4C87C62302CFtest_var*
var
 l_Control : IevCustomEditorControl;
 l_Field   : IevEditorControlField; 
//#UC END# *4C7D0C7B0185_4C87C62302CFtest_var*
begin
//#UC START# *4C7D0C7B0185_4C87C62302CFtest_impl*
 if aParams.CallControl and aParams.Op.Flag[vcm_ofEnabled] then
 begin
  l_Control := evGetCustomControl(Editor.Selection.Cursor.MostInner.Obj^);
  if (l_Control <> nil) and l_Control.Visible then
   aParams.Op.Flag[vcm_ofEnabled] := (l_Control.ControlType in evEditControls)
    and Supports(l_Control, IevEditorControlField, l_Field)
    and not l_Field.IsFieldEmpty;
 end;//if Assigned(f_MgrSearch) then
//#UC END# *4C7D0C7B0185_4C87C62302CFtest_impl*
end;//TPrimQueryCardOptionsForm.Edit_Copy_Test

procedure TPrimQueryCardOptionsForm.Edit_Delete_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7D0CC90052_4C87C62302CFtest_var*
var
 l_Req: IqaReq; 

 function lp_CheckPanel: Boolean;
 begin//lp_CheckPanel
  aParams.Op.Flag[vcm_ofEnabled] := (evIsFieldSet(f_MgrSearch.GetCurrentField, true) or
   (l_Req.EditorReq.FieldsCount > 1));
  Result := True;
 end;//lp_CheckPanel

 function lp_CheckDatePanel : Boolean;
 begin
  Result := Supports(l_Req, IqaDateReq);
  if Result then
   aParams.Op.Flag[vcm_ofEnabled] := evIsSomeFieldFilled(f_MgrSearch.GetCurrentField.Req, true);
 end;

 function lp_CheckPhonePanel : Boolean;
 var
  l_PhoneReq : IqaPhoneReq;
 begin
  Result := Supports(l_Req, IqaPhoneReq, l_PhoneReq);
  if Result then
   aParams.Op.Flag[vcm_ofEnabled] := not l3IsNil(l_PhoneReq.Code) or
    not l3IsNil(l_PhoneReq.Number);
 end;

 function lp_CheckMemoPanel : Boolean;
 var
  l_Button  : IevEditorControlButton;
 begin
  Result := l_Req.EditorReq.FirstField.ControlType in evSimpleEditors;
  if Result then
  begin
   l_Button := f_MgrSearch.GetCurrentField.FindButton(ev_btDelete);
   if (l_Button <> nil) then
    aParams.Op.Flag[vcm_ofEnabled] := l_Button.Visible
   else
    aParams.Op.Flag[vcm_ofEnabled] := not l_Req.EditorReq.FirstField.IsFieldEmpty;
  end;//Result
 end;

//#UC END# *4C7D0CC90052_4C87C62302CFtest_var*
begin
//#UC START# *4C7D0CC90052_4C87C62302CFtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := False;
 if Assigned(f_MgrSearch) then
 begin
  l_Req := f_MgrSearch.GetCurrentReq;
  if l_Req <> nil then
   (* ��������� ����� ��������� ��� *)
   if not lp_CheckDatePanel then
   (* ������� *)
    if not lp_CheckPhonePanel then
    (* ������ ��������� ������� *)
     if not lp_CheckMemoPanel then
     (* ��������� ������� *)
      lp_CheckPanel;
 end;//if Assigned(f_MgrSearch) then   
//#UC END# *4C7D0CC90052_4C87C62302CFtest_impl*
end;//TPrimQueryCardOptionsForm.Edit_Delete_Test

procedure TPrimQueryCardOptionsForm.Edit_Delete_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7D0CC90052_4C87C62302CFexec_var*
//#UC END# *4C7D0CC90052_4C87C62302CFexec_var*
begin
//#UC START# *4C7D0CC90052_4C87C62302CFexec_impl*
 if Assigned(f_MgrSearch) then
  f_MgrSearch.DeleteValue(Editor.View);
//#UC END# *4C7D0CC90052_4C87C62302CFexec_impl*
end;//TPrimQueryCardOptionsForm.Edit_Delete_Execute

procedure TPrimQueryCardOptionsForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Edit, nil);
  PublishFormEntity(en_SubPanelSettings, nil);
  PublishOp(en_File, op_Print, nil, File_Print_Test, nil);
  PublishOp(en_Edit, op_Paste, nil, Edit_Paste_Test, nil);
  PublishOp(en_SubPanelSettings, op_ShowSpecial, SubPanelSettings_ShowSpecial_Execute, SubPanelSettings_ShowSpecial_Test, nil);
  ShowInContextMenu(en_SubPanelSettings, op_ShowSpecial, true);
  ShowInToolbar(en_SubPanelSettings, op_ShowSpecial, false);
  PublishOp(en_Edit, op_Copy, nil, Edit_Copy_Test, nil);
  PublishOp(en_Edit, op_Delete, Edit_Delete_Execute, Edit_Delete_Test, nil);
  ShowInContextMenu(en_Edit, op_Delete, true);
  ShowInToolbar(en_Edit, op_Delete, false);
  ShowInContextMenu(en_File, op_PrintDialog, false);
  ShowInToolbar(en_File, op_PrintDialog, true);
  
  ShowInContextMenu(en_File, op_PrintPreview, false);
  ShowInToolbar(en_File, op_PrintPreview, true);
  
  ShowInContextMenu(en_CardOperation, op_ExpandCollapse, true);
  ShowInToolbar(en_CardOperation, op_ExpandCollapse, false);
  
  ShowInContextMenu(en_CardOperation, op_DeleteAll, true);
  ShowInToolbar(en_CardOperation, op_DeleteAll, false);
  
  ShowInContextMenu(en_CardOperation, op_CreateAttr, true);
  ShowInToolbar(en_CardOperation, op_CreateAttr, false);
  
  ShowInContextMenu(en_CardOperation, op_OpenTreeSelection, true);
  ShowInToolbar(en_CardOperation, op_OpenTreeSelection, false);
 end;//with Entities.Entities
end;

{$IfEnd} //not Admin

end.