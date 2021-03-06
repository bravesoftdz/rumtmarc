unit PrimListInfoOptions_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/List/Forms/PrimListInfoOptions_Form.pas"
// �����: 09.09.2010 15:56
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 ������ � ���������� � ������� ����������::WorkWithList::View::List::PrimListInfoOptions
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
  OfficeLike_Usual_Controls,
  OfficeLike_Text_Controls,
  PrimListInfo_Form,
  vcmExternalInterfaces {a},
  vcmInterfaces {a},
  vcmEntityForm {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TPrimListInfoOptionsForm = {form} class(TPrimListInfoForm)
 protected
  procedure InitEntities; override;
 protected
 // realized methods
   procedure Edit_Copy_Test(const aParams: IvcmTestParamsPrim);
     {* ���������� }
   procedure Edit_Copy_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ���������� }
   procedure File_Print_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������ }
   procedure File_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������... }
   procedure File_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ��������������� �������� }
 end;//TPrimListInfoOptionsForm

 TvcmEntityFormRef = TPrimListInfoOptionsForm;
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  afwInterfaces,
  afwFacade,
  StdRes {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

// start class TPrimListInfoOptionsForm

procedure TPrimListInfoOptionsForm.Edit_Copy_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4951284902BD_4C88CB3E009Ctest_var*
//#UC END# *4951284902BD_4C88CB3E009Ctest_var*
begin
//#UC START# *4951284902BD_4C88CB3E009Ctest_impl*
 if not aParams.CallControl then
  aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4951284902BD_4C88CB3E009Ctest_impl*
end;//TPrimListInfoOptionsForm.Edit_Copy_Test

procedure TPrimListInfoOptionsForm.Edit_Copy_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4951284902BD_4C88CB3E009Cexec_var*
//#UC END# *4951284902BD_4C88CB3E009Cexec_var*
begin
//#UC START# *4951284902BD_4C88CB3E009Cexec_impl*
 aParams.CallControl;
//#UC END# *4951284902BD_4C88CB3E009Cexec_impl*
end;//TPrimListInfoOptionsForm.Edit_Copy_Execute

procedure TPrimListInfoOptionsForm.File_Print_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *49521D8E0295_4C88CB3E009Cexec_var*
var
 l_Preview : IafwComplexDocumentPreview;
//#UC END# *49521D8E0295_4C88CB3E009Cexec_var*
begin
//#UC START# *49521D8E0295_4C88CB3E009Cexec_impl*
 l_Preview := MakePreview;
 if (l_Preview <> nil) then
  l_Preview.Print;
//#UC END# *49521D8E0295_4C88CB3E009Cexec_impl*
end;//TPrimListInfoOptionsForm.File_Print_Execute

procedure TPrimListInfoOptionsForm.File_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *495220DE0298_4C88CB3E009Cexec_var*
//#UC END# *495220DE0298_4C88CB3E009Cexec_var*
begin
//#UC START# *495220DE0298_4C88CB3E009Cexec_impl*
 if (afw.Application <> nil) AND (afw.Application.PrintManager <> nil) then
  afw.Application.PrintManager.PrintDialog(MakePreview);
//#UC END# *495220DE0298_4C88CB3E009Cexec_impl*
end;//TPrimListInfoOptionsForm.File_PrintDialog_Execute

procedure TPrimListInfoOptionsForm.File_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *495220F2033A_4C88CB3E009Cexec_var*
//#UC END# *495220F2033A_4C88CB3E009Cexec_var*
begin
//#UC START# *495220F2033A_4C88CB3E009Cexec_impl*
 TdmStdRes.MakePreview(MakePreview);
//#UC END# *495220F2033A_4C88CB3E009Cexec_impl*
end;//TPrimListInfoOptionsForm.File_PrintPreview_Execute

procedure TPrimListInfoOptionsForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Edit, nil);
  PublishFormEntity(en_File, nil);
  PublishOp(en_Edit, op_Copy, Edit_Copy_Execute, Edit_Copy_Test, nil);
  ShowInContextMenu(en_Edit, op_Copy, true);
  ShowInToolbar(en_Edit, op_Copy, false);
  PublishOp(en_File, op_Print, File_Print_Execute, nil, nil);
  ShowInContextMenu(en_File, op_Print, true);
  ShowInToolbar(en_File, op_Print, false);
  PublishOp(en_File, op_PrintDialog, File_PrintDialog_Execute, nil, nil);
  ShowInContextMenu(en_File, op_PrintDialog, true);
  ShowInToolbar(en_File, op_PrintDialog, false);
  PublishOp(en_File, op_PrintPreview, File_PrintPreview_Execute, nil, nil);
  ShowInContextMenu(en_File, op_PrintPreview, true);
  ShowInToolbar(en_File, op_PrintPreview, false);
  PublishOp(en_Edit, op_Paste, nil, nil, nil);
  ShowInContextMenu(en_Edit, op_Paste, true);
  ShowInToolbar(en_Edit, op_Paste, false);
 end;//with Entities.Entities
end;

{$IfEnd} //not Admin AND not Monitorings

end.