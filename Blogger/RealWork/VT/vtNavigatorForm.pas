unit vtNavigatorForm;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "VT"
// ������: "w:/common/components/gui/Garant/VT/vtNavigatorForm.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::VT::vtNavigator::TvtNavigatorForm
//
// ������� ������  ���� ����������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\VT\vtDefine.inc}

interface

uses
  Classes
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3ProtoObject
  ;

type
 TvtNavigatorForm = class(Tl3ProtoObject)
  {* ������� ������  ���� ����������. }
 private
 // private fields
   f_CloseHandler : IvcmFormHandler;
    {* ���� ��� �������� CloseHandler}
 protected
 // property methods
   function pm_GetCloseHandler: IvcmFormHandler; virtual;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure ClearFields; override;
 public
 // public methods
   constructor Create(const aCloseHandler: IvcmFormHandler); reintroduce;
     {* ����������� ������. }
 public
 // public properties
   property CloseHandler: IvcmFormHandler
     read pm_GetCloseHandler;
     {* ���������� ������� �����. }
 end;//TvtNavigatorForm

implementation

// start class TvtNavigatorForm

function TvtNavigatorForm.pm_GetCloseHandler: IvcmFormHandler;
//#UC START# *47D0FB460226_47CD0E4E001Fget_var*
//#UC END# *47D0FB460226_47CD0E4E001Fget_var*
begin
//#UC START# *47D0FB460226_47CD0E4E001Fget_impl*
 Result := f_CloseHandler;
//#UC END# *47D0FB460226_47CD0E4E001Fget_impl*
end;//TvtNavigatorForm.pm_GetCloseHandler

constructor TvtNavigatorForm.Create(const aCloseHandler: IvcmFormHandler);
//#UC START# *47CE93D9033B_47CD0E4E001F_var*
//#UC END# *47CE93D9033B_47CD0E4E001F_var*
begin
//#UC START# *47CE93D9033B_47CD0E4E001F_impl*
 inherited Create;
 f_CloseHandler := aCloseHandler;
//#UC END# *47CE93D9033B_47CD0E4E001F_impl*
end;//TvtNavigatorForm.Create

procedure TvtNavigatorForm.Cleanup;
//#UC START# *479731C50290_47CD0E4E001F_var*
//#UC END# *479731C50290_47CD0E4E001F_var*
begin
//#UC START# *479731C50290_47CD0E4E001F_impl*
 f_CloseHandler := nil;
 inherited;
//#UC END# *479731C50290_47CD0E4E001F_impl*
end;//TvtNavigatorForm.Cleanup

procedure TvtNavigatorForm.ClearFields;
 {-}
begin
 f_CloseHandler := nil;
 inherited;
end;//TvtNavigatorForm.ClearFields

end.