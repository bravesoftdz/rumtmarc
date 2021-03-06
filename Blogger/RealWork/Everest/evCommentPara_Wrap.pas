unit evCommentPara_Wrap;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evCommentPara_Wrap.pas"
// �����: 24.11.2010 18:32
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Wrapper::Class>> Shared Delphi::Everest::Standard::WevCommentPara
//
// ������ ��� CommentPara
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  k2Interfaces,
  evPara_Wrap,
  CommentPara_Const
  ;

type
 TevCommentStorer = class
  {* ������ ������� ��������� ����������� }
 protected
 // protected methods
   class procedure ForceStore(const aTag: Ik2Tag); virtual;
 end;//TevCommentStorer

 RevCommentStorer = class of TevCommentStorer;

 TevCommentModifier = class(TevdParaModifier)
 end;//TevCommentModifier

 RevCommentModifier = class of TevCommentModifier;

 WevCommentPara = class(WevPara)
  {* ������ ��� CommentPara }
 public
 // overridden public methods
   procedure ForceStore(const aTag: Ik2Tag); override;
   function MarkModified(const aTag: Ik2Tag): Boolean; override;
 end;//WevCommentPara

var
   g_CommentStorer : RevCommentStorer = nil;
var
   g_CommentModifier : RevCommentModifier = nil;

implementation

// start class TevCommentStorer

class procedure TevCommentStorer.ForceStore(const aTag: Ik2Tag);
//#UC START# *4CED30D901C7_4CED304B0270_var*
//#UC END# *4CED30D901C7_4CED304B0270_var*
begin
//#UC START# *4CED30D901C7_4CED304B0270_impl*
 // - ������ �� ������, ���������� �� ��������
//#UC END# *4CED30D901C7_4CED304B0270_impl*
end;//TevCommentStorer.ForceStore
// start class WevCommentPara

procedure WevCommentPara.ForceStore(const aTag: Ik2Tag);
//#UC START# *4CED2E7E010A_4CED2FED0255_var*
//#UC END# *4CED2E7E010A_4CED2FED0255_var*
begin
//#UC START# *4CED2E7E010A_4CED2FED0255_impl*
 inherited;
 if (g_CommentStorer = nil) then
  TevCommentStorer.ForceStore(aTag)
 else
  g_CommentStorer.ForceStore(aTag);
//#UC END# *4CED2E7E010A_4CED2FED0255_impl*
end;//WevCommentPara.ForceStore

function WevCommentPara.MarkModified(const aTag: Ik2Tag): Boolean;
//#UC START# *4CEE5D3002FC_4CED2FED0255_var*
//#UC END# *4CEE5D3002FC_4CED2FED0255_var*
begin
//#UC START# *4CEE5D3002FC_4CED2FED0255_impl*
 if (g_CommentModifier = nil) then
  Result := TevCommentModifier.MarkModified(aTag)
 else
  Result := g_CommentModifier.MarkModified(aTag);
//#UC END# *4CEE5D3002FC_4CED2FED0255_impl*
end;//WevCommentPara.MarkModified

end.