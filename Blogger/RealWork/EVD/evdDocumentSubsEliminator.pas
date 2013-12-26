unit evdDocumentSubsEliminator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "EVD"
// �����: ����� �.�.
// ������: "w:/common/components/rtl/Garant/EVD/evdDocumentSubsEliminator.pas"
// �����: 07.09.2011 15:24
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::EVD::Generators::TevdDocumentSubsEliminator
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\EVD\evdDefine.inc}

interface

uses
  evdDocumentMarksEliminator,
  k2Interfaces
  ;

type
 TevdDocumentSubsEliminator = class(TevdDocumentMarksEliminator)
 protected
 // overridden protected methods
   function NeedWritePara(const aLeaf: Ik2Tag): Boolean; override;
     {* ���������� ����� �� ����������� ���������� ����� }
 end;//TevdDocumentSubsEliminator

implementation

uses
  evdTypes,
  k2Tags
  ;

// start class TevdDocumentSubsEliminator

function TevdDocumentSubsEliminator.NeedWritePara(const aLeaf: Ik2Tag): Boolean;
//#UC START# *49E48829016F_4E6756B3015E_var*
//#UC END# *49E48829016F_4E6756B3015E_var*
begin
//#UC START# *49E48829016F_4E6756B3015E_impl*
 Result := aLeaf.IntA[k2_tiHandle] <> ev_sbtSub;
//#UC END# *49E48829016F_4E6756B3015E_impl*
end;//TevdDocumentSubsEliminator.NeedWritePara

end.