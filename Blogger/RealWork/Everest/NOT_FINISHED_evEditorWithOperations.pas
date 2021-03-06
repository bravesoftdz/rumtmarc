unit NOT_FINISHED_evEditorWithOperations;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/NOT_FINISHED_evEditorWithOperations.pas"
// �����: 25.11.2004 11:08
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<GuiControl::Class>> Shared Delphi::Everest::Editors::TevEditorWithOperations
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ���� ���� ������������ ������ ��� �������������, � �� ��� ����������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  l3Interfaces
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3InternalInterfaces,
  evCustomEditor
  ;

type
 TevEditorProvideOperationType = (
  {* �������� ������� ��������� ��������. }
   potEdit // �������������� ������
 , potTable // ������ � ���������
 , potFontStyle // ����� ������
 , potPrint // �������� ������
 , potText
 );//TevEditorProvideOperationType

 TevEditorProvideOperationTypes = set of TevEditorProvideOperationType;

 TevEditorWithOperations = class(TevCustomEditor {$If not defined(NoVCM)}, IvcmOperationsProvider{$IfEnd} //not NoVCM
 , Il3CommandPublisherInfo)
 private
 // private fields
   f_ProvideOperationTypes : TevEditorProvideOperationTypes;
   f_Published : Boolean;
 protected
 // realized methods
   {$If not defined(NoVCM)}
   procedure ProvideOps(const aPublisher: IvcmOperationsPublisher);
     {* ������������ ������ ��������� ��������. }
   {$IfEnd} //not NoVCM
   function IsCommandPublished(Cmd: Tl3OperationCode): Boolean;
 protected
 // protected methods
   function DefineProvideOperations: TevEditorProvideOperationTypes; virtual;
     {* ����� �������� ����������� �����������. }
   {$If not defined(NoVCM)}
   procedure OpSelectAll(const aParams: IvcmExecuteParamsPrim); virtual;
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   procedure TestSelectAll(const aParams: IvcmTestParamsPrim); virtual;
   {$IfEnd} //not NoVCM
   function IsCommandPublished(Cmd: Tl3OperationCode): Boolean; virtual;
 end;//TevEditorWithOperations

implementation

// start class TevEditorWithOperations

function TevEditorWithOperations.DefineProvideOperations: TevEditorProvideOperationTypes;
//#UC START# *48735C4A03C3_4829D85C03C1_var*
//#UC END# *48735C4A03C3_4829D85C03C1_var*
begin
//#UC START# *48735C4A03C3_4829D85C03C1_impl*
 !!! Needs to be implemented !!!
//#UC END# *48735C4A03C3_4829D85C03C1_impl*
end;//TevEditorWithOperations.DefineProvideOperations

{$If not defined(NoVCM)}
procedure TevEditorWithOperations.OpSelectAll(const aParams: IvcmExecuteParamsPrim);
//#UC START# *48E228CC0396_4829D85C03C1_var*
//#UC END# *48E228CC0396_4829D85C03C1_var*
begin
//#UC START# *48E228CC0396_4829D85C03C1_impl*
 !!! Needs to be implemented !!!
//#UC END# *48E228CC0396_4829D85C03C1_impl*
end;//TevEditorWithOperations.OpSelectAll
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TevEditorWithOperations.TestSelectAll(const aParams: IvcmTestParamsPrim);
//#UC START# *48E228DB0194_4829D85C03C1_var*
//#UC END# *48E228DB0194_4829D85C03C1_var*
begin
//#UC START# *48E228DB0194_4829D85C03C1_impl*
 !!! Needs to be implemented !!!
//#UC END# *48E228DB0194_4829D85C03C1_impl*
end;//TevEditorWithOperations.TestSelectAll
{$IfEnd} //not NoVCM

function TevEditorWithOperations.IsCommandPublished(Cmd: Tl3OperationCode): Boolean;
//#UC START# *4B309684022A_4829D85C03C1_var*
//#UC END# *4B309684022A_4829D85C03C1_var*
begin
//#UC START# *4B309684022A_4829D85C03C1_impl*
 !!! Needs to be implemented !!!
//#UC END# *4B309684022A_4829D85C03C1_impl*
end;//TevEditorWithOperations.IsCommandPublished

{$If not defined(NoVCM)}
procedure TevEditorWithOperations.ProvideOps(const aPublisher: IvcmOperationsPublisher);
//#UC START# *4769552100DD_4829D85C03C1_var*
//#UC END# *4769552100DD_4829D85C03C1_var*
begin
//#UC START# *4769552100DD_4829D85C03C1_impl*
 !!! Needs to be implemented !!!
//#UC END# *4769552100DD_4829D85C03C1_impl*
end;//TevEditorWithOperations.ProvideOps
{$IfEnd} //not NoVCM

function TevEditorWithOperations.IsCommandPublished(Cmd: Tl3OperationCode): Boolean;
//#UC START# *476BFD420341_4829D85C03C1_var*
//#UC END# *476BFD420341_4829D85C03C1_var*
begin
//#UC START# *476BFD420341_4829D85C03C1_impl*
 !!! Needs to be implemented !!!
//#UC END# *476BFD420341_4829D85C03C1_impl*
end;//TevEditorWithOperations.IsCommandPublished

end.