unit evControlPara_Wrap;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evControlPara_Wrap.pas"
// �����: 02.11.2004 16:59
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Wrapper::Class>> Shared Delphi::Everest::EVDTuning::WevControlPara
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  evTextPara_Wrap,
  ControlPara_Const,
  k2Interfaces,
  k2Base
  ;

type
 WevControlPara = class(WevTextPara)
 protected
 // overridden protected methods
   function GetAtomData(const AE: Ik2Tag;
    aProp: Tk2CustomProperty;
    out Data: Integer): Boolean; override;
   function PreGetAtomData(const AE: Ik2Tag;
    aProp: Tk2CustomProperty;
    out Data: Integer): Boolean; override;
 end;//WevControlPara

implementation

uses
  evdTypes,
  nevTools,
  k2Tags,
  evControlParaConst,
  l3Const,
  evQueryCardInt,
  ReqRow_Const,
  l3TreeInterfaces,
  evParaTools,
  SysUtils,
  ReqGroup_Const
  ;

// start class WevControlPara

function WevControlPara.GetAtomData(const AE: Ik2Tag;
  aProp: Tk2CustomProperty;
  out Data: Integer): Boolean;
//#UC START# *4857A995029E_4857FECB0092_var*
var
 l_Container : InevDocumentContainer;
 l_Data      : IUnknown;
 l_Control   : IevControl;
var
 l_Req : InevTag;
 l_Def : InevTag;
 l_C   : IevEditorFieldWithTree;
 l_Mod : Boolean;
 l_RP  : IqaReqPrim;
//#UC END# *4857A995029E_4857FECB0092_var*
begin
//#UC START# *4857A995029E_4857FECB0092_impl*
 Result := inherited GetAtomData(AE, aProp, Data);
 if not Result then
  case aProp.TagIndex of
   k2_tiObject:
   begin
    // - ������ ���� ���� - ����� ����� ������� CallBack � �������� � ������������
    //   ��� �� ��� �����.
    if AE.Box.QT(IevControl, l_Control) then
    begin
     l_Container := l_Control.DocumentContainer;
     if (l_Container = nil) OR (l_Container.TextSource = nil) then
      l_Data := nil
     else
      l_Data := l_Container.TextSource.GetControlData(l_Control)
    end//AE.Box.QT(IevControl, l_Control)
    else
     l_Data := nil;
    if (l_Data <> nil) then
    begin
     Result := True;
     AE.Attr[aProp.TagIndex] := Tk2Type(aProp.AtomType).IUnknownToTag(l_Data);
     Data := Integer(l_Data);
    end;//l_Data <> nil
   end;//k2_tiObject
   k2_tiText:
   begin
    if (TevControlType(AE.IntA[k2_tiType]) in evEditControls) then
    begin
     if AE.QT(IevEditorFieldWithTree, l_C) then
      try
       if evInPara(AE, k2_idReqRow, l_Req) then
       begin
        l_Def := l_Req[k2_tiDefaultNode];
        if l_Def.IsValid then
        begin
         Supports(l_C.Req.ModelListner, IqaReqPrim, l_RP);
         if (l_RP <> nil) then
          l_Mod := l_RP.Modified;
         try
          l_C.ShowNode(l_Def As Il3SimpleNode);
         finally
          if (l_RP <> nil) then
           l_RP.Modified := l_Mod;
         end;//try..finally
         Result := AE.HasSubAtom(k2_tiText);
         if Result then
          Data := Integer(AE.Attr[k2_tiText].AsObject)
         else
          Data := 0; 
        end;//l_Def.IsValid
       end;//evInPara(Self, k2_idReqRow)
      finally
       l_C := nil;
      end;//try..finally
     if not Result then
     begin
      if evInPara(AE, k2_idReqRow, l_Req) then
      begin
       l_Def := l_Req[k2_tiDefaultText];
       if l_Def.IsValid then
       begin
        l_Def := l_Def.CloneTag;
        // - ����� �������������� �� ��������� �������� ��-���������
        AE.Attr[k2_tiText] := l_Def;
        Result := AE.HasSubAtom(k2_tiText);
        if Result then
         Data := Integer(l_Def.AsObject)
        else
         Data := 0;
 (*       if Result then
         Exclude(f_State, ns_nsDefaultsWasGot);
         // - ����� ������ ������ ������ ������������� �������� ��-���������*)
       end;//l_Def.IsValid
      end;//evInPara(Self, k2_idReqRow)
     end;//not Result
    end;//TevControlType(AE.IntA[k2_tiType]) in evEditControls
   end;//k2_tiText
  end;//case aProp.TagIndex of
//#UC END# *4857A995029E_4857FECB0092_impl*
end;//WevControlPara.GetAtomData

function WevControlPara.PreGetAtomData(const AE: Ik2Tag;
  aProp: Tk2CustomProperty;
  out Data: Integer): Boolean;
//#UC START# *48DD0CE60313_4857FECB0092_var*
var  
 l_Type : TevControlType;
 l_AlternateText: Ik2Tag;
 l_ReqGroup : Ik2Tag;
//#UC END# *48DD0CE60313_4857FECB0092_var*
begin
//#UC START# *48DD0CE60313_4857FECB0092_impl*
 Result := true;
 case aProp.TagIndex of
  k2_tiFirstLineIndent:
   Data := 0;
  k2_tiFirstIndent,
  k2_tiLeftIndent:
  begin
   l_Type := TevControlType(AE.IntA[k2_tiType]);
   if (l_Type = ev_ctPictureLabel) then
    Data := BefPictureLabel
   else
   if (l_Type in evFlatBTNControls) then
    Data := BefBtbSpase
   else
   if (l_Type = ev_ctMemoEdit) then
    Data := (BefUpSpase * 2) * 4
   else
   if (l_Type in evEditControls) then
    Data := BefUpSpase
   else
    Data := BefSpace;
  end;//k2_tiFirstIndent
  k2_tiRightIndent:
  begin
   l_Type := TevControlType(AE.IntA[k2_tiType]);
   if l_Type in evFlatBTNControls then
    Data := BefBtbSpase
   else
   if (l_Type = ev_ctCalEdit) then
    Data := BtnWidth
   else
   if (l_Type = ev_ctCombo) or (l_Type = ev_ctEllipsesEdit)
     or (l_Type = ev_ctSpinedit) then
    Data := ComboBtnWidth + l3Epsilon * 6
   else
   if (l_Type = ev_ctPictureLabel) then
    Data := AfterPictureLabel
   else
   if (l_Type = ev_ctMemoEdit) then
    Data := RightMemoSpase
   else
    Data := BefSpace;
  end;//k2_tiRightIndent
  k2_tiSpaceAfter,
  k2_tiSpaceBefore:
  begin
   l_Type := TevControlType(AE.IntA[k2_tiType]);
   if l_Type in (evFlatBTNControls + [ev_ctPictureLabel]) then
    Data := BefUpSpase
   else
   if l_Type = ev_ctCollapsedPanel then
    Data := HalfBefSpace
   else
    Data := BefUpSpase;
  end;//k2_tiSpaceAfter
  k2_tiText, k2_tiSegments:
   if AE.BoolA[k2_tiCollapsed] then
   begin
    l_AlternateText := AE.Attr[k2_tiAlternateText];
    if not l_AlternateText.IsValid then
    begin
     Data := 0;
     Result := false;
     // - ��� �����������, ����� � _k2Tag_.cAtom "��������" null
     //   ��. http://mdp.garant.ru/pages/viewpage.action?pageId=159351322
    end//not l_AlternateText
    else
    begin
     l_AlternateText := l_AlternateText.Attr[aProp.TagIndex];
     Result := l_AlternateText.IsValid;
     if Result then
      Data := l_AlternateText.IntRef
     else
     begin
      Data := 0{Result := inherited PreGetAtomData(AE, aProp, Data)};
      Result := true;
     end;//Result
    end;//not l_AlternateText
   end//AE.BoolA[k2_tiCollapsed]
   else
    Result := inherited PreGetAtomData(AE, aProp, Data);
  k2_tiEnabled :
  begin
   {$IfDef evReqGroupNeedsRadio}
   if evInPara(AE, k2_idReqGroup, l_ReqGroup) then
   begin
    if not l_ReqGroup.BoolA[k2_tiChecked] then
    begin
     Data := Ord(false);
     Result := true;
     Exit;
    end;//not l_ReqGroup.BoolA[k2_tiChecked]
   end;//evInPara(AE, k2_idReqGroup, l_ReqGroup)
   {$EndIf evReqGroupNeedsRadio}
   Result := inherited PreGetAtomData(AE, aProp, Data);
  end;//k2_tiEnabled
  else
   Result := inherited PreGetAtomData(AE, aProp, Data);
 end;//case aProp.TagIndex of
//#UC END# *48DD0CE60313_4857FECB0092_impl*
end;//WevControlPara.PreGetAtomData

end.