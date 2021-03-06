unit DocInfoInterfaces;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "BusinessInterfaces"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/BusinessInterfaces/DocInfoInterfaces.pas"
// �����: 29.12.2010 21:19
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<ControllerInterfaces::Category>> F1 Core::Common::BusinessInterfaces::DocInfoInterfaces
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
  DynamicDocListUnit,
  DynamicTreeUnit,
  ExternalObjectUnit,
  l3Types,
  bsTypes,
  bsInterfaces,
  DocumentAndListInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmControllers
  {$IfEnd} //not NoVCM
  ,
  BaseDocumentWithAttributesInterfaces,
  vcmInterfaces {a}
  ;

type
 IbsFlash = interface
  {* ������ ������ }
   ['{A1BA80BA-19A5-4FAD-B9E4-E613FF3B9F5B}']
   function pm_GetFlashData: IExternalObject;
   property FlashData: IExternalObject
     read pm_GetFlashData;
     {* ������ ������ }
 end;//IbsFlash

 IsdsDocInfo = interface(IsdsBaseDocumentWithAttributes{, IbsFlash})
   ['{BE860412-EE8F-4EE3-9949-BDB397D6BCFE}']
   function pm_GetDsRelatedDoc: IdsDocument;
   function pm_GetdsRelatedDocRef: IvcmViewAreaControllerRef;
   function pm_GetDsRespondents: IdsDocumentList;
   function pm_GetdsRespondentsRef: IvcmViewAreaControllerRef;
   function pm_GetDsCorrespondents: IdsDocumentList;
   function pm_GetdsCorrespondentsRef: IvcmViewAreaControllerRef;
   function pm_GetDsUserCR1: IdsDocumentList;
   function pm_GetdsUserCR1Ref: IvcmViewAreaControllerRef;
   function pm_GetDsUserCR2: IdsDocumentList;
   function pm_GetdsUserCR2Ref: IvcmViewAreaControllerRef;
   function pm_GetDsDocumentWithFlash: IdsDocumentWithFlash;
   function pm_GetdsDocumentWithFlashRef: IvcmViewAreaControllerRef;
   function pm_GetDsAnnotation: IdsDocument;
   function pm_GetdsAnnotationRef: IvcmViewAreaControllerRef;
   function pm_GetDsTranslation: IdsDocument;
   function pm_GetdsTranslationRef: IvcmViewAreaControllerRef;
   function pm_GetDsSimilarDocuments: IdsDocumentList;
   function pm_GetdsSimilarDocumentsRef: IvcmViewAreaControllerRef;
   function pm_GetIsUnderControl: Boolean;
   function pm_GetUserCRListInfo(aId: TnsUserCRListId): IbsUserCRListInfo;
   procedure OpenCorrespondents;
     {* �������������� }
   procedure OpenRespondents;
     {* ����������� }
   function ChangeCRType(const aNode: INodeBase;
    aType: TlstCRType;
    IsCRToPart: Boolean = false): Boolean;
     {* ���������� ��� ��������� ���� ���������������/������������ }
   procedure AddToControl;
     {* ��������� �������� �� �������� }
   procedure DelFromControl;
     {* ����� � �������� }
   procedure ResetCacheAfterUpdate;
     {* ����� �������������� ���������� ����� ���������� ���� ���������� }
   function IsTypedCRSelected(aSheetNumber: TnsUserCRListId): Boolean;
     {* �������� ����, ��� ������������ �������� ��������������� ������� ��� }
   function HasTypedCRinBigBase(aSheetNumber: TnsUserCRListId): Boolean;
     {* �������� �������� �������������� ��� � ������ ���� }
   function pm_GetHasRelatedDoc: Boolean;
   function pm_GetHasRespondents: Boolean;
   function pm_GetHasCorrespondents: Boolean;
   function pm_GetHasAnnotation: Boolean;
   function pm_GetHasTranslation: Boolean;
   function pm_GetHasSimilarDocuments: Boolean;
   property dsRelatedDoc: IdsDocument
     read pm_GetDsRelatedDoc;
     {* ������� � ��������� }
   property dsRelatedDocRef: IvcmViewAreaControllerRef
     read pm_GetdsRelatedDocRef;
     {* ������ �� "������� � ���������" }
   property dsRespondents: IdsDocumentList
     read pm_GetDsRespondents;
     {* ��� ����������� ��������� }
   property dsRespondentsRef: IvcmViewAreaControllerRef
     read pm_GetdsRespondentsRef;
     {* ������ �� "��� ����������� ���������" }
   property dsCorrespondents: IdsDocumentList
     read pm_GetDsCorrespondents;
     {* ��� �������������� ��������� }
   property dsCorrespondentsRef: IvcmViewAreaControllerRef
     read pm_GetdsCorrespondentsRef;
     {* ������ �� "��� �������������� ���������" }
   property dsUserCR1: IdsDocumentList
     read pm_GetDsUserCR1;
     {* ��� ���������������� ���1 }
   property dsUserCR1Ref: IvcmViewAreaControllerRef
     read pm_GetdsUserCR1Ref;
     {* ������ �� "��� ���������������� ���1" }
   property dsUserCR2: IdsDocumentList
     read pm_GetDsUserCR2;
     {* ��� ���������������� ���2 }
   property dsUserCR2Ref: IvcmViewAreaControllerRef
     read pm_GetdsUserCR2Ref;
     {* ������ �� "��� ���������������� ���2" }
   property dsDocumentWithFlash: IdsDocumentWithFlash
     read pm_GetDsDocumentWithFlash;
     {* ��������-����� }
   property dsDocumentWithFlashRef: IvcmViewAreaControllerRef
     read pm_GetdsDocumentWithFlashRef;
     {* ������ �� "��������-�����" }
   property dsAnnotation: IdsDocument
     read pm_GetDsAnnotation;
     {* ��������� � ��������� }
   property dsAnnotationRef: IvcmViewAreaControllerRef
     read pm_GetdsAnnotationRef;
     {* ������ �� "��������� � ���������" }
   property dsTranslation: IdsDocument
     read pm_GetDsTranslation;
     {* ��� �������� ��������� }
   property dsTranslationRef: IvcmViewAreaControllerRef
     read pm_GetdsTranslationRef;
     {* ������ �� "��� �������� ���������" }
   property dsSimilarDocuments: IdsDocumentList
     read pm_GetDsSimilarDocuments;
     {* ��� ������� ��������� }
   property dsSimilarDocumentsRef: IvcmViewAreaControllerRef
     read pm_GetdsSimilarDocumentsRef;
     {* ������ �� "��� ������� ���������" }
   property IsUnderControl: Boolean
     read pm_GetIsUnderControl;
     {* ��������� �� �������� �� �������� }
   property UserCRListInfo[aId: TnsUserCRListId]: IbsUserCRListInfo
     read pm_GetUserCRListInfo;
     {* ���������� � ���������������� ����� �������, � ��� ����� ��� }
   property HasRelatedDoc: Boolean
     read pm_GetHasRelatedDoc;
     {* ���������� ��� ���� ������ ��� "������� � ���������" }
   property HasRespondents: Boolean
     read pm_GetHasRespondents;
     {* ���������� ��� ���� ������ ��� "��� ����������� ���������" }
   property HasCorrespondents: Boolean
     read pm_GetHasCorrespondents;
     {* ���������� ��� ���� ������ ��� "��� �������������� ���������" }
   property HasAnnotation: Boolean
     read pm_GetHasAnnotation;
     {* ���������� ��� ���� ������ ��� "��������� � ���������" }
   property HasTranslation: Boolean
     read pm_GetHasTranslation;
     {* ���������� ��� ���� ������ ��� "��� �������� ���������" }
   property HasSimilarDocuments: Boolean
     read pm_GetHasSimilarDocuments;
     {* ���������� ��� ���� ������ ��� "��� ������� ���������" }
  // ������ �������������� � ����������� �����������
   function As_IbsFlash: IbsFlash;
 end;//IsdsDocInfo

 IdDocInfo = interface(IdBaseDocumentWithAttributes)
  {* ������ ���������� ���������� � ��������� }
   ['{70F8D50C-F370-4AB7-8D96-126C717D23BD}']
   function pm_GetCorrType: IbsFrozenNode;
   procedure pm_SetCorrType(const aValue: IbsFrozenNode);
   function pm_GetCorrList: IDynList;
   procedure pm_SetCorrList(const aValue: IDynList);
   function pm_GetRespType: IbsFrozenNode;
   procedure pm_SetRespType(const aValue: IbsFrozenNode);
   function pm_GetRespList: IDynList;
   procedure pm_SetRespList(const aValue: IDynList);
   function pm_GetUserCRListInfo(aValue: TnsUserCRListId): IbsUserCRListInfoModify;
   function pm_GetDsRelatedDocRef: IvcmFormDataSourceRef;
   function pm_GetHasRelatedDoc: Tl3Bool;
   procedure pm_SetHasRelatedDoc(aValue: Tl3Bool);
   function pm_GetDsRespondentsRef: IvcmFormDataSourceRef;
   function pm_GetHasRespondents: Tl3Bool;
   procedure pm_SetHasRespondents(aValue: Tl3Bool);
   function pm_GetDsCorrespondentsRef: IvcmFormDataSourceRef;
   function pm_GetHasCorrespondents: Tl3Bool;
   procedure pm_SetHasCorrespondents(aValue: Tl3Bool);
   function pm_GetDsUserCR1Ref: IvcmFormDataSourceRef;
   function pm_GetDsUserCR2Ref: IvcmFormDataSourceRef;
   function pm_GetDsDocumentWithFlashRef: IvcmFormDataSourceRef;
   function pm_GetDsAnnotationRef: IvcmFormDataSourceRef;
   function pm_GetHasAnnotation: Tl3Bool;
   procedure pm_SetHasAnnotation(aValue: Tl3Bool);
   function pm_GetDsTranslationRef: IvcmFormDataSourceRef;
   function pm_GetHasTranslation: Tl3Bool;
   procedure pm_SetHasTranslation(aValue: Tl3Bool);
   function pm_GetDsSimilarDocumentsRef: IvcmFormDataSourceRef;
   function pm_GetHasSimilarDocuments: Tl3Bool;
   procedure pm_SetHasSimilarDocuments(aValue: Tl3Bool);
   function pm_GetIsUnderControl: Tl3Bool;
   procedure pm_SetIsUnderControl(aValue: Tl3Bool);
   function pm_GetFlashData: IExternalObject;
   procedure pm_SetFlashData(const aValue: IExternalObject);
   property CorrType: IbsFrozenNode
     read pm_GetCorrType
     write pm_SetCorrType;
   property CorrList: IDynList
     read pm_GetCorrList
     write pm_SetCorrList;
     {* ������ ��� ��������������� }
   property RespType: IbsFrozenNode
     read pm_GetRespType
     write pm_SetRespType;
   property RespList: IDynList
     read pm_GetRespList
     write pm_SetRespList;
   property UserCRListInfo[aValue: TnsUserCRListId]: IbsUserCRListInfoModify
     read pm_GetUserCRListInfo;
   property dsRelatedDocRef: IvcmFormDataSourceRef
     read pm_GetDsRelatedDocRef;
     {* ������ �� "������� � ���������" }
   property HasRelatedDoc: Tl3Bool
     read pm_GetHasRelatedDoc
     write pm_SetHasRelatedDoc;
     {* ���� �� "������� � ���������" }
   property dsRespondentsRef: IvcmFormDataSourceRef
     read pm_GetDsRespondentsRef;
     {* ������ �� "��� ����������� ���������" }
   property HasRespondents: Tl3Bool
     read pm_GetHasRespondents
     write pm_SetHasRespondents;
     {* ���� �� "��� ����������� ���������" }
   property dsCorrespondentsRef: IvcmFormDataSourceRef
     read pm_GetDsCorrespondentsRef;
     {* ������ �� "��� �������������� ���������" }
   property HasCorrespondents: Tl3Bool
     read pm_GetHasCorrespondents
     write pm_SetHasCorrespondents;
     {* ���� �� "��� �������������� ���������" }
   property dsUserCR1Ref: IvcmFormDataSourceRef
     read pm_GetDsUserCR1Ref;
     {* ������ �� "��� ���������������� ���1" }
   property dsUserCR2Ref: IvcmFormDataSourceRef
     read pm_GetDsUserCR2Ref;
     {* ������ �� "��� ���������������� ���2" }
   property dsDocumentWithFlashRef: IvcmFormDataSourceRef
     read pm_GetDsDocumentWithFlashRef;
     {* ������ �� "��������-�����" }
   property dsAnnotationRef: IvcmFormDataSourceRef
     read pm_GetDsAnnotationRef;
     {* ������ �� "��������� � ���������" }
   property HasAnnotation: Tl3Bool
     read pm_GetHasAnnotation
     write pm_SetHasAnnotation;
     {* ���� �� "��������� � ���������" }
   property dsTranslationRef: IvcmFormDataSourceRef
     read pm_GetDsTranslationRef;
     {* ������ �� "��� �������� ���������" }
   property HasTranslation: Tl3Bool
     read pm_GetHasTranslation
     write pm_SetHasTranslation;
     {* ���� �� "��� �������� ���������" }
   property dsSimilarDocumentsRef: IvcmFormDataSourceRef
     read pm_GetDsSimilarDocumentsRef;
     {* ������ �� "��� ������� ���������" }
   property HasSimilarDocuments: Tl3Bool
     read pm_GetHasSimilarDocuments
     write pm_SetHasSimilarDocuments;
     {* ���� �� "��� ������� ���������" }
   property IsUnderControl: Tl3Bool
     read pm_GetIsUnderControl
     write pm_SetIsUnderControl;
     {* ��������� �� �������� �� �������� }
   property FlashData: IExternalObject
     read pm_GetFlashData
     write pm_SetFlashData;
     {* ������ ������ }
 end;//IdDocInfo
{$IfEnd} //not Admin AND not Monitorings

implementation

end.