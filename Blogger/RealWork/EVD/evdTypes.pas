unit evdTypes;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "EVD"
// �����: ����� �.�.
// ������: "w:/common/components/rtl/Garant/EVD/evdTypes.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Interfaces::Category>> Shared Delphi::EVD::Types
//
// ������� ����, ������������ �������� EVD.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\EVD\evdDefine.inc}

interface

type
 TevIndentType = (
  {* ������������ ������� �� �����������. }
   ev_itLeft // �� ������ ����.
 , ev_itRight // �� ������� ����.
 , ev_itCenter // �� ������.
 , ev_itWidth // �� ������.
 , ev_itPreformatted // "������������������".
 , ev_itNone
 );//TevIndentType

 TevPageOrientation = (
  {* ���������� ��������. }
   ev_poPortrait // �������.
 , ev_poLandscape // ���������.
 );//TevPageOrientation

 TevMergeStatus = (
  {* ������� ����������� �����. }
   ev_msNone
 , ev_msHead
 , ev_msContinue
 );//TevMergeStatus

 TevVerticalAligment = (
  {* ������������ ������� �� ���������. }
   ev_valTop
 , ev_valCenter
 , ev_valBottom
 );//TevVerticalAligment

 TevControlType = (
  {* ��� ��������. }
   ev_ctLabel // ����� � �������� � ���� �����
 , ev_ctEdit // ������� ��������
 , ev_ctCombo // ���������� ������
 , ev_ctButton // ������
 , ev_ctSpinedit // �������� � ������������ �������������� �����
 , ev_ctCheckEdit // �������� � CheckBox
 , ev_ctEllipsesEdit // �������� � �������
 , ev_ctRadioEdit // �������� � RadioButton
 , ev_ctCalEdit // �������� � ���������� ���������
 , ev_ctCollapsedPanel // ������������� ������
 , ev_ctStateButton // ������ � ���������� ���������
 , ev_ctEmailEdit // �������� ��� ����� E-mail ������ (� ���������)
 , ev_ctMemoEdit // ������������� ���� ����� (�� ������������)
 , ev_ctPictureLabel // ����� ���������� � ���������
 , ev_ctTextParaLabel // ����� � ������� ��������
 , ev_ctPhoneEdit
 , ev_ctUnknown // ����������� ��� ��������
 );//TevControlType

 TevReqKind = (
  {* ��� ���������. }
   ev_rkSimple // ������� ��������, ����������� ������������� (���������� � ������) (ev_rkSimple).
 , ev_rkContext // ����������� �������, ����������� �������������� (���������� � ������)(ev_rkContext).
 , ev_rkDescription // �������������� ������� (�� �������� � ������ (ev_rkDescription).
 );//TevReqKind

 TevSubPlace = (
   ev_spNoWhere
 , ev_spOnlyInContents
 , ev_spInContentsAndOnSubPanel
 , ev_spOnlyOnSubPanel
 );//TevSubPlace

const
  { Hyperlink Const }
 CI_TOPIC = 65537;
  { ��� ���� ������ �� ��������� }
 CI_BLOB = 65538;
  { ��� ������ �� �������� ������� }
 CI_MULT = 65539;
  { ��� ������������ �� ���������/�������� ������� }
 CI_REF = 65540;
  { ��� ������ �� ������� ��������-������� }
 CI_FolderLink = 65544;
 CI_ExternalOperation = 65545;
 CI_PHARM_MULTI = 65547;
  { ��� ������������ �� ��������� ������� }
 CI_PIC = 65541;
  { ��� ������ �� ������� �������� }
 CI_SCRIPT = 65552;
  { Address Defaults }
 ev_NullAddressType = 0;
 ev_defAddressType = CI_TOPIC;

type
 TevLinkViewKind = (
   ev_lvkUnknown // ����������
 , ev_lvkInternalValid // ������ �������. ����������
 , ev_lvkInternalInvalid // ������ �������. �� ������������� ����������
 , ev_lvkExternal // ������
 , ev_lvkInternalAbolished // ������ �������. �� ���������� ���� ��������
 , ev_lvkInternalPreactive // ������ �������. �� �� ���������� � ���� ��������
 , ev_lvkExternalENO // ������� ����������
 , ev_lvkInternalEdition // �������� ���������
 );//TevLinkViewKind

const
  { ���� �����. }
 ev_sbtNone = 0;
  { �������������� ���� �����. }
 ev_sbtSub = 1;
  { ���� Sub'��. }
 ev_sbtMarker = 2;
  { ���� ��������. }
 ev_sbtBookmark = 3;
  { ���� ����������� �������� (����������������). }
 ev_sbtMark = 4;
  { ���� ��������������� ������� (����������������). }
 ev_sbtPara = 10;
  { �������� (����������). }
 ev_sbtDocumentPlace = 11;
  { ����� � ��������� (����������) ��. [TevDocumentPlace]. }
 ev_sbtHyperlink = 12;
  { ������ (����������). }
 ev_sbtBySearcher = 14;
  { ������� �� Searcher'� (����������). }

type
 TevSubHandle = ev_sbtNone..ev_sbtBySearcher;
  {* ���� �����. }

 TevSubHandles = set of TevSubHandle;
  {* ���� �����. }

 TevDocumentPlace = (
  {* ����� � ���������. }
   ev_dpNone // �����.
 , ev_dpEnd // � �����.
 );//TevDocumentPlace

const
  { Sub Flags }
 ev_cUserCommentFlags = 2;
  { ����� ���������������� ������������ }
 ev_cCommentsFlag = 1;
  { ����� ������������ ������� }
 ev_cVersionCommentsFlag = 4;
  { ����� ���������� ������������ }

type
 TevHFType = (
  {* ��� ����������� }
   evd_hftOrdinal
 , evd_hftLeft
 , evd_hftRight
 , evd_hftFirst
 );//TevHFType

const
 ev_spInContents = [ev_spOnlyInContents, ev_spInContentsAndOnSubPanel];
  {* ����� ������ � ���������� }
  { ���� ��������� ���������� }
 ev_slSuperposition = 0;
  { ���� ������������ ���������. }
 ev_slView = 1;
  { ���� ����������. }
 ev_slHyperlinks = 2;
  { ���� �����������. }
 ev_slFoundWords = 3;
  { ���� ���� ��������� �� ���������. }
 ev_slFound = 4;
  { ���� ��������� ���� (����������������). }
 ev_slObjects = 5;
  { ���� ��������, ����������� � ��������. }
 ev_slMistakes = 6;
  { ���� ��������� ��� �������� ��������. }
 ev_slDiff = 7;
  { ������� ���� ������������ ���������� }

type
 TevNormalSegLayerHandleP = ev_slView..ev_slMistakes;

 TevNormalSegLayerHandleSet = set of TevNormalSegLayerHandleP;

const
  { Sub Const }
 POSITION_TYPE_PARA_ID = 2147483648;

type
 TevBlockViewKind = (
   ev_bvkNone
 , ev_bvkLeft
 , ev_bvkRight
 );//TevBlockViewKind

implementation

end.