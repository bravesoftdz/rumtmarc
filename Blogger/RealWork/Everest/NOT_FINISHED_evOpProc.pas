unit NOT_FINISHED_evOpProc;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/NOT_FINISHED_evOpProc.pas"
// �����: 07.10.1997 15:22
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi::Everest::Processors::evOpProc
//
// ����������� ��������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ���� ���� ������������ ������ ��� �������������, � �� ��� ����������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  l3Types,
  nevBase,
  l3_Base,
  nevTools,
  k2Prim,
  l3Interfaces
  ;

type
 TevCustomProcessor = class(Tl3_Base, InevDocumentLimits, InevDocumentInfo)
  {* ���������� ��������. }
 protected
 // realized methods
   function pm_GetBruttoCharLimit: Integer;
   procedure pm_SetBruttoCharLimit(aValue: Integer);
   function pm_GetTextParaLimit: Integer;
   procedure pm_SetTextParaLimit(aValue: Integer);
   procedure ClearStat;
   function pm_GetTextParaCount: Integer;
   function pm_GetBruttoCharCount: Integer;
   function pm_GetNettoCharCount: Integer;
   function pm_GetBitmapParaCount: Integer;
 protected
 // protected methods
   procedure BeepOnParaLimit; virtual;
 end;//TevCustomProcessor

 TevCustomUndoProcessor = class(TevCustomProcessor, Il3OpPackMode, InevProcessor)
  {* ���������� �������� � ������������ Undo & Redo. }
 protected
 // realized methods
   procedure Subscribe(const aRecipient: Il3Notify);
     {* �������� �� ���������. }
   procedure Unsubscribe(const aRecipient: Il3Notify);
     {* "�������" �� ���������. }
   function StartOp(OpCode: Integer = 0;
    DoLock: Boolean = true): Il3OpPack;
     {* ������ ��������. }
   function FinishOp(anOp: TObject): Boolean;
     {* ��������� ��������. }
   function LastOp: Il3OpPack;
     {* ���������� ��������. }
   function InOp: Boolean;
     {* ����� �������� �������. }
   procedure Lock;
     {* �������. }
   procedure Unlock;
     {* �������. }
   function Undo: Boolean;
     {* �������� ���������� ��������. }
   function Redo: Boolean;
     {* ������� ���������� ��������. }
   procedure CheckInsert(const aParent: IUnknown;
    var aChild: IUnknown;
    var anIndex: Integer);
     {* ��������� �������� � ����������. }
   procedure CheckDelete(const aParent: IUnknown;
    const aChild: IUnknown;
    anIndex: Integer);
     {* ��������� �������� � ����������. }
   procedure NotifyCompleted(const aList: IUnknown;
    const aChild: IUnknown);
   procedure NotifyInsert(const aList: IUnknown;
    aProp: TObject;
    const aChild: IUnknown;
    anIndex: Integer;
    const anOpPack: Il3OpPack);
   procedure NotifyDelete(const aList: IUnknown;
    aProp: TObject;
    const aChild: IUnknown;
    anIndex: Integer;
    const anOpPack: Il3OpPack);
   function pm_GetDefaultStyle: Tl3StyleId;
   procedure pm_SetDefaultStyle(aValue: Tl3StyleId);
   function pm_GetCanUndo: Boolean;
   function pm_GetCanRedo: Boolean;
   procedure MarkModified(const aTarget: IUnknown);
   procedure InvertModified;
   function GetModified: Boolean;
   function Get_InUndo: Boolean;
   function Get_SaveUndo: Boolean;
   procedure Set_SaveUndo(aValue: Boolean);
   function pm_GetDeleteMapped: Boolean;
   procedure pm_SetDeleteMapped(aValue: Boolean);
   function pm_GetOptimize: Boolean;
   procedure pm_SetOptimize(aValue: Boolean);
   function pm_GetInIOProcess: Boolean;
   procedure pm_SetInIOProcess(aValue: Boolean);
   function pm_GetProcessor: Ik2Processor;
   function NeedReplaceQuotes: Boolean;
     {* ���������� - ����� �� �������� ������� ��� �����. }
   procedure CheckReadOnly;
   procedure DisableReadonly;
     {* ��������� ����� �������� ReadOnly }
   procedure EnableReadOnly;
     {* �������� ����� �������� ReadOnly }
   procedure pm_SetReadOnly(aValue: Boolean);
   function Get_UndoBuffer: Ik2UndoBuffer;
   procedure NotifyPropChanged(aProp: Tk2CustomPropertyPrim;
    const aValues;
    const anOp: Ik2Op);
     {* �������� �� ��������� �������� ������� }
   procedure CheckOn;
   procedure CheckOff;
   function IsCheckOff: Boolean;
 protected
 // protected methods
   function GetNeedReplaceQuotes: Boolean; virtual;
   procedure DoCheckParaOp(const aParent: InevTag;
    var aChild: InevTag;
    anOp: Tl3Operation;
    anIndex: TnevParaIndex); virtual;
     {* ��������� �������� � ���������� }
   procedure DoAfterUndoRedo; virtual;
   procedure DoParaOp(const Parent: InevTag;
    const Child: InevTag;
    Op: Tl3Operation); virtual;
     {* ��������� �������� � ���������� }
 end;//TevCustomUndoProcessor

implementation

// start class TevCustomProcessor

procedure TevCustomProcessor.BeepOnParaLimit;
//#UC START# *482D91730258_47F351E50367_var*
//#UC END# *482D91730258_47F351E50367_var*
begin
//#UC START# *482D91730258_47F351E50367_impl*
 !!! Needs to be implemented !!!
//#UC END# *482D91730258_47F351E50367_impl*
end;//TevCustomProcessor.BeepOnParaLimit

function TevCustomProcessor.pm_GetBruttoCharLimit: Integer;
//#UC START# *47C6AD3B02E8_47F351E50367get_var*
//#UC END# *47C6AD3B02E8_47F351E50367get_var*
begin
//#UC START# *47C6AD3B02E8_47F351E50367get_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6AD3B02E8_47F351E50367get_impl*
end;//TevCustomProcessor.pm_GetBruttoCharLimit

procedure TevCustomProcessor.pm_SetBruttoCharLimit(aValue: Integer);
//#UC START# *47C6AD3B02E8_47F351E50367set_var*
//#UC END# *47C6AD3B02E8_47F351E50367set_var*
begin
//#UC START# *47C6AD3B02E8_47F351E50367set_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6AD3B02E8_47F351E50367set_impl*
end;//TevCustomProcessor.pm_SetBruttoCharLimit

function TevCustomProcessor.pm_GetTextParaLimit: Integer;
//#UC START# *47C6AD4F02BE_47F351E50367get_var*
//#UC END# *47C6AD4F02BE_47F351E50367get_var*
begin
//#UC START# *47C6AD4F02BE_47F351E50367get_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6AD4F02BE_47F351E50367get_impl*
end;//TevCustomProcessor.pm_GetTextParaLimit

procedure TevCustomProcessor.pm_SetTextParaLimit(aValue: Integer);
//#UC START# *47C6AD4F02BE_47F351E50367set_var*
//#UC END# *47C6AD4F02BE_47F351E50367set_var*
begin
//#UC START# *47C6AD4F02BE_47F351E50367set_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6AD4F02BE_47F351E50367set_impl*
end;//TevCustomProcessor.pm_SetTextParaLimit

procedure TevCustomProcessor.ClearStat;
//#UC START# *47C6AD7E0136_47F351E50367_var*
//#UC END# *47C6AD7E0136_47F351E50367_var*
begin
//#UC START# *47C6AD7E0136_47F351E50367_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6AD7E0136_47F351E50367_impl*
end;//TevCustomProcessor.ClearStat

function TevCustomProcessor.pm_GetTextParaCount: Integer;
//#UC START# *47C6AD8C01C2_47F351E50367get_var*
//#UC END# *47C6AD8C01C2_47F351E50367get_var*
begin
//#UC START# *47C6AD8C01C2_47F351E50367get_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6AD8C01C2_47F351E50367get_impl*
end;//TevCustomProcessor.pm_GetTextParaCount

function TevCustomProcessor.pm_GetBruttoCharCount: Integer;
//#UC START# *47C6ADA101B8_47F351E50367get_var*
//#UC END# *47C6ADA101B8_47F351E50367get_var*
begin
//#UC START# *47C6ADA101B8_47F351E50367get_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6ADA101B8_47F351E50367get_impl*
end;//TevCustomProcessor.pm_GetBruttoCharCount

function TevCustomProcessor.pm_GetNettoCharCount: Integer;
//#UC START# *47C6ADAE0303_47F351E50367get_var*
//#UC END# *47C6ADAE0303_47F351E50367get_var*
begin
//#UC START# *47C6ADAE0303_47F351E50367get_impl*
 !!! Needs to be implemented !!!
//#UC END# *47C6ADAE0303_47F351E50367get_impl*
end;//TevCustomProcessor.pm_GetNettoCharCount

function TevCustomProcessor.pm_GetBitmapParaCount: Integer;
//#UC START# *4D077BE80280_47F351E50367get_var*
//#UC END# *4D077BE80280_47F351E50367get_var*
begin
//#UC START# *4D077BE80280_47F351E50367get_impl*
 !!! Needs to be implemented !!!
//#UC END# *4D077BE80280_47F351E50367get_impl*
end;//TevCustomProcessor.pm_GetBitmapParaCount
// start class TevCustomUndoProcessor

function TevCustomUndoProcessor.GetNeedReplaceQuotes: Boolean;
//#UC START# *4843D3020153_47F3521002C7_var*
//#UC END# *4843D3020153_47F3521002C7_var*
begin
//#UC START# *4843D3020153_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *4843D3020153_47F3521002C7_impl*
end;//TevCustomUndoProcessor.GetNeedReplaceQuotes

procedure TevCustomUndoProcessor.DoCheckParaOp(const aParent: InevTag;
  var aChild: InevTag;
  anOp: Tl3Operation;
  anIndex: TnevParaIndex);
//#UC START# *48E4CB990000_47F3521002C7_var*
//#UC END# *48E4CB990000_47F3521002C7_var*
begin
//#UC START# *48E4CB990000_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *48E4CB990000_47F3521002C7_impl*
end;//TevCustomUndoProcessor.DoCheckParaOp

procedure TevCustomUndoProcessor.DoAfterUndoRedo;
//#UC START# *48E4CBD6038B_47F3521002C7_var*
//#UC END# *48E4CBD6038B_47F3521002C7_var*
begin
//#UC START# *48E4CBD6038B_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *48E4CBD6038B_47F3521002C7_impl*
end;//TevCustomUndoProcessor.DoAfterUndoRedo

procedure TevCustomUndoProcessor.DoParaOp(const Parent: InevTag;
  const Child: InevTag;
  Op: Tl3Operation);
//#UC START# *48E4CBE8018B_47F3521002C7_var*
//#UC END# *48E4CBE8018B_47F3521002C7_var*
begin
//#UC START# *48E4CBE8018B_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *48E4CBE8018B_47F3521002C7_impl*
end;//TevCustomUndoProcessor.DoParaOp

procedure TevCustomUndoProcessor.Subscribe(const aRecipient: Il3Notify);
//#UC START# *46A44F6B035E_47F3521002C7_var*
//#UC END# *46A44F6B035E_47F3521002C7_var*
begin
//#UC START# *46A44F6B035E_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A44F6B035E_47F3521002C7_impl*
end;//TevCustomUndoProcessor.Subscribe

procedure TevCustomUndoProcessor.Unsubscribe(const aRecipient: Il3Notify);
//#UC START# *46A44FFE0143_47F3521002C7_var*
//#UC END# *46A44FFE0143_47F3521002C7_var*
begin
//#UC START# *46A44FFE0143_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A44FFE0143_47F3521002C7_impl*
end;//TevCustomUndoProcessor.Unsubscribe

function TevCustomUndoProcessor.StartOp(OpCode: Integer = 0;
  DoLock: Boolean = true): Il3OpPack;
//#UC START# *46A5BC28010A_47F3521002C7_var*
//#UC END# *46A5BC28010A_47F3521002C7_var*
begin
//#UC START# *46A5BC28010A_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BC28010A_47F3521002C7_impl*
end;//TevCustomUndoProcessor.StartOp

function TevCustomUndoProcessor.FinishOp(anOp: TObject): Boolean;
//#UC START# *46A5BC7F0065_47F3521002C7_var*
//#UC END# *46A5BC7F0065_47F3521002C7_var*
begin
//#UC START# *46A5BC7F0065_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BC7F0065_47F3521002C7_impl*
end;//TevCustomUndoProcessor.FinishOp

function TevCustomUndoProcessor.LastOp: Il3OpPack;
//#UC START# *46A5BCC4008C_47F3521002C7_var*
//#UC END# *46A5BCC4008C_47F3521002C7_var*
begin
//#UC START# *46A5BCC4008C_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BCC4008C_47F3521002C7_impl*
end;//TevCustomUndoProcessor.LastOp

function TevCustomUndoProcessor.InOp: Boolean;
//#UC START# *46A5BCF5008C_47F3521002C7_var*
//#UC END# *46A5BCF5008C_47F3521002C7_var*
begin
//#UC START# *46A5BCF5008C_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BCF5008C_47F3521002C7_impl*
end;//TevCustomUndoProcessor.InOp

procedure TevCustomUndoProcessor.Lock;
//#UC START# *46A5BD1103B8_47F3521002C7_var*
//#UC END# *46A5BD1103B8_47F3521002C7_var*
begin
//#UC START# *46A5BD1103B8_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BD1103B8_47F3521002C7_impl*
end;//TevCustomUndoProcessor.Lock

procedure TevCustomUndoProcessor.Unlock;
//#UC START# *46A5BD22025E_47F3521002C7_var*
//#UC END# *46A5BD22025E_47F3521002C7_var*
begin
//#UC START# *46A5BD22025E_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BD22025E_47F3521002C7_impl*
end;//TevCustomUndoProcessor.Unlock

function TevCustomUndoProcessor.Undo: Boolean;
//#UC START# *46A5BD3B0390_47F3521002C7_var*
//#UC END# *46A5BD3B0390_47F3521002C7_var*
begin
//#UC START# *46A5BD3B0390_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BD3B0390_47F3521002C7_impl*
end;//TevCustomUndoProcessor.Undo

function TevCustomUndoProcessor.Redo: Boolean;
//#UC START# *46A5BD570141_47F3521002C7_var*
//#UC END# *46A5BD570141_47F3521002C7_var*
begin
//#UC START# *46A5BD570141_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BD570141_47F3521002C7_impl*
end;//TevCustomUndoProcessor.Redo

procedure TevCustomUndoProcessor.CheckInsert(const aParent: IUnknown;
  var aChild: IUnknown;
  var anIndex: Integer);
//#UC START# *46A5BD730033_47F3521002C7_var*
//#UC END# *46A5BD730033_47F3521002C7_var*
begin
//#UC START# *46A5BD730033_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BD730033_47F3521002C7_impl*
end;//TevCustomUndoProcessor.CheckInsert

procedure TevCustomUndoProcessor.CheckDelete(const aParent: IUnknown;
  const aChild: IUnknown;
  anIndex: Integer);
//#UC START# *46A5BE7101DD_47F3521002C7_var*
//#UC END# *46A5BE7101DD_47F3521002C7_var*
begin
//#UC START# *46A5BE7101DD_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BE7101DD_47F3521002C7_impl*
end;//TevCustomUndoProcessor.CheckDelete

procedure TevCustomUndoProcessor.NotifyCompleted(const aList: IUnknown;
  const aChild: IUnknown);
//#UC START# *46A5BEA30171_47F3521002C7_var*
//#UC END# *46A5BEA30171_47F3521002C7_var*
begin
//#UC START# *46A5BEA30171_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BEA30171_47F3521002C7_impl*
end;//TevCustomUndoProcessor.NotifyCompleted

procedure TevCustomUndoProcessor.NotifyInsert(const aList: IUnknown;
  aProp: TObject;
  const aChild: IUnknown;
  anIndex: Integer;
  const anOpPack: Il3OpPack);
//#UC START# *46A5BEBE0116_47F3521002C7_var*
//#UC END# *46A5BEBE0116_47F3521002C7_var*
begin
//#UC START# *46A5BEBE0116_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BEBE0116_47F3521002C7_impl*
end;//TevCustomUndoProcessor.NotifyInsert

procedure TevCustomUndoProcessor.NotifyDelete(const aList: IUnknown;
  aProp: TObject;
  const aChild: IUnknown;
  anIndex: Integer;
  const anOpPack: Il3OpPack);
//#UC START# *46A5BEF7038F_47F3521002C7_var*
//#UC END# *46A5BEF7038F_47F3521002C7_var*
begin
//#UC START# *46A5BEF7038F_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5BEF7038F_47F3521002C7_impl*
end;//TevCustomUndoProcessor.NotifyDelete

function TevCustomUndoProcessor.pm_GetDefaultStyle: Tl3StyleId;
//#UC START# *46A5CD010120_47F3521002C7get_var*
//#UC END# *46A5CD010120_47F3521002C7get_var*
begin
//#UC START# *46A5CD010120_47F3521002C7get_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CD010120_47F3521002C7get_impl*
end;//TevCustomUndoProcessor.pm_GetDefaultStyle

procedure TevCustomUndoProcessor.pm_SetDefaultStyle(aValue: Tl3StyleId);
//#UC START# *46A5CD010120_47F3521002C7set_var*
//#UC END# *46A5CD010120_47F3521002C7set_var*
begin
//#UC START# *46A5CD010120_47F3521002C7set_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CD010120_47F3521002C7set_impl*
end;//TevCustomUndoProcessor.pm_SetDefaultStyle

function TevCustomUndoProcessor.pm_GetCanUndo: Boolean;
//#UC START# *46A5CD2E0161_47F3521002C7get_var*
//#UC END# *46A5CD2E0161_47F3521002C7get_var*
begin
//#UC START# *46A5CD2E0161_47F3521002C7get_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CD2E0161_47F3521002C7get_impl*
end;//TevCustomUndoProcessor.pm_GetCanUndo

function TevCustomUndoProcessor.pm_GetCanRedo: Boolean;
//#UC START# *46A5CD5102A2_47F3521002C7get_var*
//#UC END# *46A5CD5102A2_47F3521002C7get_var*
begin
//#UC START# *46A5CD5102A2_47F3521002C7get_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CD5102A2_47F3521002C7get_impl*
end;//TevCustomUndoProcessor.pm_GetCanRedo

procedure TevCustomUndoProcessor.MarkModified(const aTarget: IUnknown);
//#UC START# *46A5CE3E009A_47F3521002C7_var*
//#UC END# *46A5CE3E009A_47F3521002C7_var*
begin
//#UC START# *46A5CE3E009A_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CE3E009A_47F3521002C7_impl*
end;//TevCustomUndoProcessor.MarkModified

procedure TevCustomUndoProcessor.InvertModified;
//#UC START# *46A5CE5C0057_47F3521002C7_var*
//#UC END# *46A5CE5C0057_47F3521002C7_var*
begin
//#UC START# *46A5CE5C0057_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CE5C0057_47F3521002C7_impl*
end;//TevCustomUndoProcessor.InvertModified

function TevCustomUndoProcessor.GetModified: Boolean;
//#UC START# *46A5CE6A00BB_47F3521002C7_var*
//#UC END# *46A5CE6A00BB_47F3521002C7_var*
begin
//#UC START# *46A5CE6A00BB_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CE6A00BB_47F3521002C7_impl*
end;//TevCustomUndoProcessor.GetModified

function TevCustomUndoProcessor.Get_InUndo: Boolean;
//#UC START# *46A5CE840343_47F3521002C7get_var*
//#UC END# *46A5CE840343_47F3521002C7get_var*
begin
//#UC START# *46A5CE840343_47F3521002C7get_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CE840343_47F3521002C7get_impl*
end;//TevCustomUndoProcessor.Get_InUndo

function TevCustomUndoProcessor.Get_SaveUndo: Boolean;
//#UC START# *46A5CE9A03B3_47F3521002C7get_var*
//#UC END# *46A5CE9A03B3_47F3521002C7get_var*
begin
//#UC START# *46A5CE9A03B3_47F3521002C7get_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CE9A03B3_47F3521002C7get_impl*
end;//TevCustomUndoProcessor.Get_SaveUndo

procedure TevCustomUndoProcessor.Set_SaveUndo(aValue: Boolean);
//#UC START# *46A5CE9A03B3_47F3521002C7set_var*
//#UC END# *46A5CE9A03B3_47F3521002C7set_var*
begin
//#UC START# *46A5CE9A03B3_47F3521002C7set_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CE9A03B3_47F3521002C7set_impl*
end;//TevCustomUndoProcessor.Set_SaveUndo

function TevCustomUndoProcessor.pm_GetDeleteMapped: Boolean;
//#UC START# *46A5CEB0018E_47F3521002C7get_var*
//#UC END# *46A5CEB0018E_47F3521002C7get_var*
begin
//#UC START# *46A5CEB0018E_47F3521002C7get_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CEB0018E_47F3521002C7get_impl*
end;//TevCustomUndoProcessor.pm_GetDeleteMapped

procedure TevCustomUndoProcessor.pm_SetDeleteMapped(aValue: Boolean);
//#UC START# *46A5CEB0018E_47F3521002C7set_var*
//#UC END# *46A5CEB0018E_47F3521002C7set_var*
begin
//#UC START# *46A5CEB0018E_47F3521002C7set_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CEB0018E_47F3521002C7set_impl*
end;//TevCustomUndoProcessor.pm_SetDeleteMapped

function TevCustomUndoProcessor.pm_GetOptimize: Boolean;
//#UC START# *46A5CEC900F4_47F3521002C7get_var*
//#UC END# *46A5CEC900F4_47F3521002C7get_var*
begin
//#UC START# *46A5CEC900F4_47F3521002C7get_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CEC900F4_47F3521002C7get_impl*
end;//TevCustomUndoProcessor.pm_GetOptimize

procedure TevCustomUndoProcessor.pm_SetOptimize(aValue: Boolean);
//#UC START# *46A5CEC900F4_47F3521002C7set_var*
//#UC END# *46A5CEC900F4_47F3521002C7set_var*
begin
//#UC START# *46A5CEC900F4_47F3521002C7set_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CEC900F4_47F3521002C7set_impl*
end;//TevCustomUndoProcessor.pm_SetOptimize

function TevCustomUndoProcessor.pm_GetInIOProcess: Boolean;
//#UC START# *46A5CEF30267_47F3521002C7get_var*
//#UC END# *46A5CEF30267_47F3521002C7get_var*
begin
//#UC START# *46A5CEF30267_47F3521002C7get_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CEF30267_47F3521002C7get_impl*
end;//TevCustomUndoProcessor.pm_GetInIOProcess

procedure TevCustomUndoProcessor.pm_SetInIOProcess(aValue: Boolean);
//#UC START# *46A5CEF30267_47F3521002C7set_var*
//#UC END# *46A5CEF30267_47F3521002C7set_var*
begin
//#UC START# *46A5CEF30267_47F3521002C7set_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CEF30267_47F3521002C7set_impl*
end;//TevCustomUndoProcessor.pm_SetInIOProcess

function TevCustomUndoProcessor.pm_GetProcessor: Ik2Processor;
//#UC START# *46A5CF0902C3_47F3521002C7get_var*
//#UC END# *46A5CF0902C3_47F3521002C7get_var*
begin
//#UC START# *46A5CF0902C3_47F3521002C7get_impl*
 !!! Needs to be implemented !!!
//#UC END# *46A5CF0902C3_47F3521002C7get_impl*
end;//TevCustomUndoProcessor.pm_GetProcessor

function TevCustomUndoProcessor.NeedReplaceQuotes: Boolean;
//#UC START# *4843CBDB0253_47F3521002C7_var*
//#UC END# *4843CBDB0253_47F3521002C7_var*
begin
//#UC START# *4843CBDB0253_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *4843CBDB0253_47F3521002C7_impl*
end;//TevCustomUndoProcessor.NeedReplaceQuotes

procedure TevCustomUndoProcessor.CheckReadOnly;
//#UC START# *48A4297E0341_47F3521002C7_var*
//#UC END# *48A4297E0341_47F3521002C7_var*
begin
//#UC START# *48A4297E0341_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *48A4297E0341_47F3521002C7_impl*
end;//TevCustomUndoProcessor.CheckReadOnly

procedure TevCustomUndoProcessor.DisableReadonly;
//#UC START# *48A564120005_47F3521002C7_var*
//#UC END# *48A564120005_47F3521002C7_var*
begin
//#UC START# *48A564120005_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *48A564120005_47F3521002C7_impl*
end;//TevCustomUndoProcessor.DisableReadonly

procedure TevCustomUndoProcessor.EnableReadOnly;
//#UC START# *48A564160056_47F3521002C7_var*
//#UC END# *48A564160056_47F3521002C7_var*
begin
//#UC START# *48A564160056_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *48A564160056_47F3521002C7_impl*
end;//TevCustomUndoProcessor.EnableReadOnly

procedure TevCustomUndoProcessor.pm_SetReadOnly(aValue: Boolean);
//#UC START# *48A570180217_47F3521002C7set_var*
//#UC END# *48A570180217_47F3521002C7set_var*
begin
//#UC START# *48A570180217_47F3521002C7set_impl*
 !!! Needs to be implemented !!!
//#UC END# *48A570180217_47F3521002C7set_impl*
end;//TevCustomUndoProcessor.pm_SetReadOnly

function TevCustomUndoProcessor.Get_UndoBuffer: Ik2UndoBuffer;
//#UC START# *4919465D0139_47F3521002C7get_var*
//#UC END# *4919465D0139_47F3521002C7get_var*
begin
//#UC START# *4919465D0139_47F3521002C7get_impl*
 !!! Needs to be implemented !!!
//#UC END# *4919465D0139_47F3521002C7get_impl*
end;//TevCustomUndoProcessor.Get_UndoBuffer

procedure TevCustomUndoProcessor.NotifyPropChanged(aProp: Tk2CustomPropertyPrim;
  const aValues;
  const anOp: Ik2Op);
//#UC START# *4A68941501A3_47F3521002C7_var*
//#UC END# *4A68941501A3_47F3521002C7_var*
begin
//#UC START# *4A68941501A3_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *4A68941501A3_47F3521002C7_impl*
end;//TevCustomUndoProcessor.NotifyPropChanged

procedure TevCustomUndoProcessor.CheckOn;
//#UC START# *4CEBD62101DA_47F3521002C7_var*
//#UC END# *4CEBD62101DA_47F3521002C7_var*
begin
//#UC START# *4CEBD62101DA_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *4CEBD62101DA_47F3521002C7_impl*
end;//TevCustomUndoProcessor.CheckOn

procedure TevCustomUndoProcessor.CheckOff;
//#UC START# *4CEBD62D01E8_47F3521002C7_var*
//#UC END# *4CEBD62D01E8_47F3521002C7_var*
begin
//#UC START# *4CEBD62D01E8_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *4CEBD62D01E8_47F3521002C7_impl*
end;//TevCustomUndoProcessor.CheckOff

function TevCustomUndoProcessor.IsCheckOff: Boolean;
//#UC START# *4CECE9470154_47F3521002C7_var*
//#UC END# *4CECE9470154_47F3521002C7_var*
begin
//#UC START# *4CECE9470154_47F3521002C7_impl*
 !!! Needs to be implemented !!!
//#UC END# *4CECE9470154_47F3521002C7_impl*
end;//TevCustomUndoProcessor.IsCheckOff

end.