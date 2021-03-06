unit NOT_FINISHED_k2DocumentGenerator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "K2"
// �����: ����� �.�.
// ������: "w:/common/components/rtl/Garant/K2/NOT_FINISHED_k2DocumentGenerator.pas"
// �����: 18.05.98 15:19
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::K2::Generators::Tk2DocumentGenerator
//
// ��������� ������ ��������� � ����������� ������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ���� ���� ������������ ������ ��� �������������, � �� ��� ����������. !

{$Include ..\K2\k2Define.inc}

interface

uses
  k2Interfaces,
  k2Types,
  k2BaseStackGenerator
  ;

type
 Tk2StackAtom = record
 end;//Tk2StackAtom

 Tk2DocumentGenerator = class(Tk2BaseStackGenerator)
  {* ��������� ������ ��������� � ����������� ������. }
 protected
 // protected methods
   procedure DoStartAtom(var Atom: Tk2StackAtom); virtual;
   procedure DoFinishAtom(var anAtom: Tk2StackAtom); virtual;
   function DoBeforeFinishAtom(var Atom: Tk2StackAtom): Boolean; virtual;
   procedure DoAddAtom(const Atom: Tk2StackAtom;
    Prop: Integer;
    TK: Tk2TypeKind;
    const Source); virtual;
   function AddChild(var aChild: Tk2StackAtom): Integer; virtual;
   function DeleteChild(const aChild: Tk2StackAtom): Boolean; virtual;
   function NeedPreAddChild(const aChild: Tk2StackAtom): Boolean; virtual;
   procedure ChildWasPreAdded(const aChild: Ik2Tag); virtual;
 end;//Tk2DocumentGenerator

implementation

// start class Tk2DocumentGenerator

procedure Tk2DocumentGenerator.DoStartAtom(var Atom: Tk2StackAtom);
//#UC START# *4836B39C025E_47F226C7001F_var*
//#UC END# *4836B39C025E_47F226C7001F_var*
begin
//#UC START# *4836B39C025E_47F226C7001F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4836B39C025E_47F226C7001F_impl*
end;//Tk2DocumentGenerator.DoStartAtom

procedure Tk2DocumentGenerator.DoFinishAtom(var anAtom: Tk2StackAtom);
//#UC START# *4836B3A70291_47F226C7001F_var*
//#UC END# *4836B3A70291_47F226C7001F_var*
begin
//#UC START# *4836B3A70291_47F226C7001F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4836B3A70291_47F226C7001F_impl*
end;//Tk2DocumentGenerator.DoFinishAtom

function Tk2DocumentGenerator.DoBeforeFinishAtom(var Atom: Tk2StackAtom): Boolean;
//#UC START# *4836B3B80074_47F226C7001F_var*
//#UC END# *4836B3B80074_47F226C7001F_var*
begin
//#UC START# *4836B3B80074_47F226C7001F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4836B3B80074_47F226C7001F_impl*
end;//Tk2DocumentGenerator.DoBeforeFinishAtom

procedure Tk2DocumentGenerator.DoAddAtom(const Atom: Tk2StackAtom;
  Prop: Integer;
  TK: Tk2TypeKind;
  const Source);
//#UC START# *4836B3DB01C9_47F226C7001F_var*
//#UC END# *4836B3DB01C9_47F226C7001F_var*
begin
//#UC START# *4836B3DB01C9_47F226C7001F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4836B3DB01C9_47F226C7001F_impl*
end;//Tk2DocumentGenerator.DoAddAtom

function Tk2DocumentGenerator.AddChild(var aChild: Tk2StackAtom): Integer;
//#UC START# *4836B3FC032A_47F226C7001F_var*
//#UC END# *4836B3FC032A_47F226C7001F_var*
begin
//#UC START# *4836B3FC032A_47F226C7001F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4836B3FC032A_47F226C7001F_impl*
end;//Tk2DocumentGenerator.AddChild

function Tk2DocumentGenerator.DeleteChild(const aChild: Tk2StackAtom): Boolean;
//#UC START# *4836B4080275_47F226C7001F_var*
//#UC END# *4836B4080275_47F226C7001F_var*
begin
//#UC START# *4836B4080275_47F226C7001F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4836B4080275_47F226C7001F_impl*
end;//Tk2DocumentGenerator.DeleteChild

function Tk2DocumentGenerator.NeedPreAddChild(const aChild: Tk2StackAtom): Boolean;
//#UC START# *4836B42200AF_47F226C7001F_var*
//#UC END# *4836B42200AF_47F226C7001F_var*
begin
//#UC START# *4836B42200AF_47F226C7001F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4836B42200AF_47F226C7001F_impl*
end;//Tk2DocumentGenerator.NeedPreAddChild

procedure Tk2DocumentGenerator.ChildWasPreAdded(const aChild: Ik2Tag);
//#UC START# *4836B43300D7_47F226C7001F_var*
//#UC END# *4836B43300D7_47F226C7001F_var*
begin
//#UC START# *4836B43300D7_47F226C7001F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4836B43300D7_47F226C7001F_impl*
end;//Tk2DocumentGenerator.ChildWasPreAdded

end.