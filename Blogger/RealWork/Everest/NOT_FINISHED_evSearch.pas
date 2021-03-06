unit NOT_FINISHED_evSearch;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/NOT_FINISHED_evSearch.pas"
// �����: 27.05.1998 14:39
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi::Everest::Searchers::evSearch
//
// ����������� ��� ������/������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ���� ���� ������������ ������ ��� �������������, � �� ��� ����������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  nevBase,
  l3CustomString,
  nevTools,
  l3ProtoObject,
  evTypes
  ;

type
 TevSearchTool = class(Tl3ProtoObject, IevSearchTool)
 protected
 // realized methods
   procedure Start;
     {* ������ ������. }
   procedure Finish(aCancel: Boolean;
     const aBlock: InevRange);
     {* ����� ������. }
   function pm_GetText: AnsiString;
   function pm_GetOptions: TevSearchOptionSet;
   procedure pm_SetOptions(aValue: TevSearchOptionSet);
 end;//TevSearchTool

 TevBaseSearcher = {abstract} class(TevSearchTool, IevSearcher)
 protected
 // realized methods
   function Check(const aView: InevView;
     const aBlock: InevRange;
     out theStart: InevBasePoint;
     out theFinish: InevBasePoint;
     const PrevBlock: InevRange): Boolean;
     {* ���������� �������� ������ ��������� (��� ���������). }
 public
 // public methods
   function DoCheckText(const aPara: InevTag;
     aText: Tl3CustomString;
     const aSel: TevPair;
     out theSel: TevPair): Boolean; virtual; abstract;
 end;//TevBaseSearcher

 TevParaByIDSearcher = class(TevBaseSearcher)
 protected
 // realized methods
   function DoCheckText(const aPara: InevTag;
     aText: Tl3CustomString;
     const aSel: TevPair;
     out theSel: TevPair): Boolean; override;
 end;//TevParaByIDSearcher

 TevStyleSearcher = class(TevBaseSearcher)
 protected
 // realized methods
   function DoCheckText(const aPara: InevTag;
     aText: Tl3CustomString;
     const aSel: TevPair;
     out theSel: TevPair): Boolean; override;
 protected
 // protected methods
   function IsStyleFound(const aStyle: InevTag): Boolean; virtual;
 end;//TevStyleSearcher

 TevORSearcher = class(TevBaseSearcher)
 protected
 // realized methods
   function DoCheckText(const aPara: InevTag;
     aText: Tl3CustomString;
     const aSel: TevPair;
     out theSel: TevPair): Boolean; override;
 end;//TevORSearcher

 TevStylesSearcher = class(TevORSearcher)
 end;//TevStylesSearcher

 TevRegExpMultipartSearcher = class
 end;//TevRegExpMultipartSearcher

 TevTextReplacer = class
 end;//TevTextReplacer

 TevMorphologySearcher = class
 end;//TevMorphologySearcher

 TevTextSearcher = {abstract} class(TevBaseSearcher)
 protected
 // realized methods
   function DoCheckText(const aPara: InevTag;
     aText: Tl3CustomString;
     const aSel: TevPair;
     out theSel: TevPair): Boolean; override;
 end;//TevTextSearcher

 TevBMTextSearcher = class(TevBaseSearcher)
  {* ����� ������������ ��� ������ ��������� ������� �����-���� }
 protected
 // realized methods
   function DoCheckText(const aPara: InevTag;
     aText: Tl3CustomString;
     const aSel: TevPair;
     out theSel: TevPair): Boolean; override;
 end;//TevBMTextSearcher

 TevBaseReplacer = {abstract} class(TevSearchTool, IevReplacer)
 protected
 // realized methods
   function Replace(const Container: InevOp;
     const aBlock: InevRange;
     const aConfirm: InevConfirm): Boolean;
   function NeedProgress: Boolean;
   function Get_Searcher: IevSearcher;
   procedure Set_Searcher(const aValue: IevSearcher);
   function Get_ReplaceCount: Integer;
 protected
 // protected methods
   function ReplaceFunc(const aView: InevView;
     const Container: InevOp;
     const aBlock: InevRange): Boolean; virtual; abstract;
     {* ����������� ������� ��� ������ ����� Block �� ���-�� ���.
             ���������� - ������ ����������� ������ ������� }
 end;//TevBaseReplacer

 TevFakeSearcher = class(TevBaseSearcher)
 protected
 // realized methods
   function DoCheckText(const aPara: InevTag;
     aText: Tl3CustomString;
     const aSel: TevPair;
     out theSel: TevPair): Boolean; override;
 end;//TevFakeSearcher

 TevAnyParagraphSearcher = class(TevFakeSearcher)
  {* ����� ��� ���������� ������ ���������. }
 end;//TevAnyParagraphSearcher

implementation

// start class TevSearchTool

procedure TevSearchTool.Start;
//#UC START# *47C6CA6B01E9_4ADC811B0204_var*
//#UC END# *47C6CA6B01E9_4ADC811B0204_var*
begin
//#UC START# *47C6CA6B01E9_4ADC811B0204_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6CA6B01E9_4ADC811B0204_impl*
end;//TevSearchTool.Start

procedure TevSearchTool.Finish(aCancel: Boolean;
  const aBlock: InevRange);
//#UC START# *47C6CA7A01CA_4ADC811B0204_var*
//#UC END# *47C6CA7A01CA_4ADC811B0204_var*
begin
//#UC START# *47C6CA7A01CA_4ADC811B0204_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6CA7A01CA_4ADC811B0204_impl*
end;//TevSearchTool.Finish

function TevSearchTool.pm_GetText: AnsiString;
//#UC START# *47C6CA9403C3_4ADC811B0204get_var*
//#UC END# *47C6CA9403C3_4ADC811B0204get_var*
begin
//#UC START# *47C6CA9403C3_4ADC811B0204get_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6CA9403C3_4ADC811B0204get_impl*
end;//TevSearchTool.pm_GetText

function TevSearchTool.pm_GetOptions: TevSearchOptionSet;
//#UC START# *47C6CB7D00C9_4ADC811B0204get_var*
//#UC END# *47C6CB7D00C9_4ADC811B0204get_var*
begin
//#UC START# *47C6CB7D00C9_4ADC811B0204get_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6CB7D00C9_4ADC811B0204get_impl*
end;//TevSearchTool.pm_GetOptions

procedure TevSearchTool.pm_SetOptions(aValue: TevSearchOptionSet);
//#UC START# *47C6CB7D00C9_4ADC811B0204set_var*
//#UC END# *47C6CB7D00C9_4ADC811B0204set_var*
begin
//#UC START# *47C6CB7D00C9_4ADC811B0204set_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6CB7D00C9_4ADC811B0204set_impl*
end;//TevSearchTool.pm_SetOptions
// start class TevBaseSearcher

function TevBaseSearcher.Check(const aView: InevView;
  const aBlock: InevRange;
  out theStart: InevBasePoint;
  out theFinish: InevBasePoint;
  const PrevBlock: InevRange): Boolean;
//#UC START# *47C7C6F8035C_4ADC80FF0104_var*
//#UC END# *47C7C6F8035C_4ADC80FF0104_var*
begin
//#UC START# *47C7C6F8035C_4ADC80FF0104_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C7C6F8035C_4ADC80FF0104_impl*
end;//TevBaseSearcher.Check
// start class TevParaByIDSearcher

function TevParaByIDSearcher.DoCheckText(const aPara: InevTag;
  aText: Tl3CustomString;
  const aSel: TevPair;
  out theSel: TevPair): Boolean;
//#UC START# *50751B680376_47F1F97F0328_var*
//#UC END# *50751B680376_47F1F97F0328_var*
begin
//#UC START# *50751B680376_47F1F97F0328_impl*
 !!! Needs to be implemented !!!
//#UC END# *50751B680376_47F1F97F0328_impl*
end;//TevParaByIDSearcher.DoCheckText
// start class TevStyleSearcher

function TevStyleSearcher.IsStyleFound(const aStyle: InevTag): Boolean;
//#UC START# *4ADC80DC013E_4ADC80C703AF_var*
//#UC END# *4ADC80DC013E_4ADC80C703AF_var*
begin
//#UC START# *4ADC80DC013E_4ADC80C703AF_impl*
 !!! Needs to be implemented !!!
//#UC END# *4ADC80DC013E_4ADC80C703AF_impl*
end;//TevStyleSearcher.IsStyleFound

function TevStyleSearcher.DoCheckText(const aPara: InevTag;
  aText: Tl3CustomString;
  const aSel: TevPair;
  out theSel: TevPair): Boolean;
//#UC START# *50751B680376_4ADC80C703AF_var*
//#UC END# *50751B680376_4ADC80C703AF_var*
begin
//#UC START# *50751B680376_4ADC80C703AF_impl*
 !!! Needs to be implemented !!!
//#UC END# *50751B680376_4ADC80C703AF_impl*
end;//TevStyleSearcher.DoCheckText
// start class TevORSearcher

function TevORSearcher.DoCheckText(const aPara: InevTag;
  aText: Tl3CustomString;
  const aSel: TevPair;
  out theSel: TevPair): Boolean;
//#UC START# *50751B680376_4ADC8513030A_var*
//#UC END# *50751B680376_4ADC8513030A_var*
begin
//#UC START# *50751B680376_4ADC8513030A_impl*
 !!! Needs to be implemented !!!
//#UC END# *50751B680376_4ADC8513030A_impl*
end;//TevORSearcher.DoCheckText
// start class TevTextSearcher

function TevTextSearcher.DoCheckText(const aPara: InevTag;
  aText: Tl3CustomString;
  const aSel: TevPair;
  out theSel: TevPair): Boolean;
//#UC START# *50751B680376_4D53D9910086_var*
//#UC END# *50751B680376_4D53D9910086_var*
begin
//#UC START# *50751B680376_4D53D9910086_impl*
 !!! Needs to be implemented !!!
//#UC END# *50751B680376_4D53D9910086_impl*
end;//TevTextSearcher.DoCheckText
// start class TevBMTextSearcher

function TevBMTextSearcher.DoCheckText(const aPara: InevTag;
  aText: Tl3CustomString;
  const aSel: TevPair;
  out theSel: TevPair): Boolean;
//#UC START# *50751B680376_4D53D9B70153_var*
//#UC END# *50751B680376_4D53D9B70153_var*
begin
//#UC START# *50751B680376_4D53D9B70153_impl*
 !!! Needs to be implemented !!!
//#UC END# *50751B680376_4D53D9B70153_impl*
end;//TevBMTextSearcher.DoCheckText
// start class TevBaseReplacer

function TevBaseReplacer.Replace(const Container: InevOp;
  const aBlock: InevRange;
  const aConfirm: InevConfirm): Boolean;
//#UC START# *47C7C8240348_4D553A4A005D_var*
//#UC END# *47C7C8240348_4D553A4A005D_var*
begin
//#UC START# *47C7C8240348_4D553A4A005D_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C7C8240348_4D553A4A005D_impl*
end;//TevBaseReplacer.Replace

function TevBaseReplacer.NeedProgress: Boolean;
//#UC START# *47C7C841004B_4D553A4A005D_var*
//#UC END# *47C7C841004B_4D553A4A005D_var*
begin
//#UC START# *47C7C841004B_4D553A4A005D_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C7C841004B_4D553A4A005D_impl*
end;//TevBaseReplacer.NeedProgress

function TevBaseReplacer.Get_Searcher: IevSearcher;
//#UC START# *47C7C895023C_4D553A4A005Dget_var*
//#UC END# *47C7C895023C_4D553A4A005Dget_var*
begin
//#UC START# *47C7C895023C_4D553A4A005Dget_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C7C895023C_4D553A4A005Dget_impl*
end;//TevBaseReplacer.Get_Searcher

procedure TevBaseReplacer.Set_Searcher(const aValue: IevSearcher);
//#UC START# *47C7C895023C_4D553A4A005Dset_var*
//#UC END# *47C7C895023C_4D553A4A005Dset_var*
begin
//#UC START# *47C7C895023C_4D553A4A005Dset_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C7C895023C_4D553A4A005Dset_impl*
end;//TevBaseReplacer.Set_Searcher

function TevBaseReplacer.Get_ReplaceCount: Integer;
//#UC START# *4D3EA8AD0147_4D553A4A005Dget_var*
//#UC END# *4D3EA8AD0147_4D553A4A005Dget_var*
begin
//#UC START# *4D3EA8AD0147_4D553A4A005Dget_impl*
 !!! Needs to be implemented !!!
//#UC END# *4D3EA8AD0147_4D553A4A005Dget_impl*
end;//TevBaseReplacer.Get_ReplaceCount
// start class TevFakeSearcher

function TevFakeSearcher.DoCheckText(const aPara: InevTag;
  aText: Tl3CustomString;
  const aSel: TevPair;
  out theSel: TevPair): Boolean;
//#UC START# *50751B680376_50751A7C01BC_var*
//#UC END# *50751B680376_50751A7C01BC_var*
begin
//#UC START# *50751B680376_50751A7C01BC_impl*
 !!! Needs to be implemented !!!
//#UC END# *50751B680376_50751A7C01BC_impl*
end;//TevFakeSearcher.DoCheckText
end.