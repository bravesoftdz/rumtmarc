unit k2ParentedTypedHugeLeafTag;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "K2"
// �����: ����� �.�.
// ������: "w:/common/components/rtl/Garant/K2/k2ParentedTypedHugeLeafTag.pas"
// �����: 28.09.2011 20:13
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::K2::k2CoreObjects::Tk2ParentedTypedHugeLeafTag
//
// ��������� ��� � ������� ����������� �����, ������� ������ �� �������� � ������� ����� ����� 32
// (������������) ���������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\K2\k2Define.inc}

interface

uses
  l3BitArr,
  k2Base,
  l3DataContainerWithoutIUnknown,
  Classes,
  l3Interfaces,
  k2Interfaces,
  l3Types,
  k2Prim,
  k2BaseStruct,
  k2PureMixIns,
  k2BaseTypes
  ;

 {$Define k2Tag_No_f_TagType}

type
 _HashType_ = Tl3PtrHash;
 _k2HashTag_Parent_ = Tl3DataContainerWithoutIUnknown;
 {$Include ..\K2\k2HashTag.imp.pas}
 _k2ParentedTagObject_Parent_ = _k2HashTag_;
 {$Include ..\K2\k2ParentedTagObject.imp.pas}
 Tk2ParentedTypedHugeLeafTag = class(_k2ParentedTagObject_)
  {* ��������� ��� � ������� ����������� �����, ������� ������ �� �������� � ������� ����� ����� 32 (������������) ��������� }
 public
 // public methods
   function TagType: Tk2Type; virtual; abstract;
 end;//Tk2ParentedTypedHugeLeafTag

implementation

uses
  SysUtils,
  k2TagList,
  k2List,
  k2Tags,
  l3Dict,
  k2Const,
  l3Const,
  l3String,
  k2Except,
  k2Strings,
  TypInfo,
  l3Stream,
  l3Base,
  k2Facade
  ;

type _Instance_R_ = Tk2ParentedTypedHugeLeafTag;

{$Include ..\K2\k2HashTag.imp.pas}


{$Include ..\K2\k2ParentedTagObject.imp.pas}

end.