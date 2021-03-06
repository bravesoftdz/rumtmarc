unit f1QueryDocumentContainer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "QueryCardProcessing"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/QueryCardProcessing/f1QueryDocumentContainer.pas"
// �����: 01.11.2010 15:05
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 Common For Shell And Monitoring::Search::QueryCardProcessing::Containers::Tf1QueryDocumentContainer
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If not defined(Admin)}
uses
  IOUnit,
  SearchUnit,
  l3Interfaces,
  ActiveX,
  nevTools,
  evQueryCardInt,
  evQueryDocumentContainer,
  lgTypes,
  nevBase,
  afwInterfaces,
  k2Base
  ;
{$IfEnd} //not Admin

{$If not defined(Admin)}
type
 Tf1QueryDocumentContainer = class(TevQueryDocumentContainer)
 private
 // private fields
   f_CardType : TlgQueryType;
    {* ��� ��������}
 public
 // public methods
   constructor Create(aCardType: TlgQueryType;
     const aModel: IevAdapterModel); reintroduce;
   class function Make(aCardType: TlgQueryType;
     const aModel: IevAdapterModel): InevDocumentContainer; reintroduce;
     {* ��������� ������� Tf1QueryDocumentContainer.Make }
 end;//Tf1QueryDocumentContainer
{$IfEnd} //not Admin

implementation

{$If not defined(Admin)}
uses
  k2String_Const,
  l3Types,
  k2IUnknown_Const,
  SysUtils,
  l3TreeInterfaces,
  DynamicTreeUnit,
  nsTreeUtils,
  nsAttributeTreeStruct,
  nsINodeWrap,
  nsTypes,
  l3String,
  DataAdapter,
  evTypes,
  k2Tags,
  nsSearchClasses,
  Table_Const,
  ReqRow_Const,
  ControlsBlock_Const,
  evdTypes
  ;
{$IfEnd} //not Admin

{$If not defined(Admin)}

// start class Tf1QueryDocumentContainer

constructor Tf1QueryDocumentContainer.Create(aCardType: TlgQueryType;
  const aModel: IevAdapterModel);
var
 l_L : IAttributeList;

 function ProcessRow(const aRow: InevTag): Boolean;

  procedure TuneReq(const aTagName: Il3CString;
    const aReq: InevTag;
    const anInfo: IFullAttributeInfo);
  //#UC START# *4CCED25603D7__var*

   procedure GetOps(const anAttrInfo : IAttributeInfo);
   
    function LogicOperation2ImgIndex(Value: TQueryLogicOperation): Integer;
      {* - ������� � �������, ��������� � ��. }
    begin//LogicOperation2ImgIndex
     case Value of
      QLO_AND:
       Result := 1;
      QLO_OR:
       Result := 0;
      QLO_AND_NOT:
       Result := 2;
      else
       Result := 0;
     end;//case Value
    end;//LogicOperation2ImgIndex

   var
    l_Ops      : Byte;
    l_AvLOList : TQueryLogicOperations absolute l_Ops;
    i          : Integer;
    l_Op       : TQueryLogicOperation;
    l_AvList   : IOperationList;
   begin//GetOps
    Assert(SizeOf(l_Ops) = SizeOf(l_AvLOList));
    l_Ops := 0;
    anAttrInfo.GetAvailableOperations(l_AvList);
    if Assigned(l_AvList) then
     try
      for i := 0 to l_AvList.Count - 1 do
      begin
       l_Op := l_AvList[i];
       if (i = 0) then
        aReq.IntA[k2_tiStateIndex] := LogicOperation2ImgIndex(l_Op);
       Include(l_AvLOList, l_Op);
      end;//for i
      aReq.IntA[k2_tiOperations] := l_Ops;
     finally
      l_AvList := nil;
     end;//try..finally
   end;//GetOps

   procedure LoadDefContext(const Attr : IQueryAttribute);

    procedure DoSet(const aStr: Tl3WString);
    begin//DoSet
     aReq.Attr[k2_tiDefaultText] := k2_typString.PCharLenToTag(Tl3PCharLen(aStr));
    end;//DoSet

    procedure DoSetI(const aStr: Il3CString);
    begin//DoSetI
     DoSet(Tl3PCharLen(nsWStr(aStr)));
    end;//DoSetI

   var
    l_Context : IQueryContextAttribute;
    l_List    : IContextValueList;
    l_Value   : TContextValue;
   begin//LoadDefContext
    if Supports(Attr, IQueryContextAttribute, l_Context) then
    try
     l_Context.GetValues(l_List);
     try
      if (l_List.Count > 0) then
      begin
       l_List.pm_GetItem(0, l_Value);
       DoSetI(nsCStr(l_Value.rContext));
       Exit;
      end;//l_List.GetCount > 0
     finally
      l_List := nil;
     end;//try..finally
    finally
     l_Context := nil;
    end;//try..finally
    if aReq.Attr[k2_tiDefaultNode].IsValid then
    // http://mdp.garant.ru/pages/viewpage.action?pageId=301697078&focusedCommentId=303858397#comment-303858397
     DoSet((aReq.Attr[k2_tiDefaultNode] As Il3SimpleNode).Text);
   end;//LoadDefContext
   
   procedure LoadDefNode(const aAttr    : IQueryAttribute;
                         const aTagName : Il3CString);
   var
    l_Node     : INodeBase;
    l_NodeAttr : IQueryNodeAttribute;
    l_NodeList : INodeValueList;
    l_NodeValue: TQueryNodeValue;
    {$IFNDEF NEW_TREE}
    l_ST       : Il3SimpleTree;
    {$EndIF  NEW_TREE}
    l_N        : Il3SimpleNode;
   begin//LoadDefNode
    if Supports(aAttr, IQueryNodeAttribute, l_NodeAttr) then
    try
     l_NodeAttr.GetValues(l_NodeList);
     l_NodeList.pm_GetItem(0, l_NodeValue);
     with l_NodeValue do
     begin
      {$IFDEF NEW_TREE}
      l_Node := rNode;
      {$ELSE}
      l_ST := aModel.GetTreeFromAdapter(aTagName);
      // ����������� ���� � IQuery � ���� � ������
      // l_Node := GetTwinNode(l_Mgr.ComboBox.TreeStruct, NodeBase);
      // !! ����� ���� � ������, ���������� � ���, ��� ���� � View � IQuery - ������
      // ��������� ����� ������ ���� � ������
      l_Node := GetTwinNode(TnsAttributeTreeStruct.Make(aTagName, l_ST.ShowRoot), rNode);
      {$ENDIF NEW_TREE}
      try
       l_N := TnsINodeWrap.Make(l_Node);
       try
        aReq.Attr[k2_tiDefaultNode] := k2_typIUnknown.IUnknownToTag(l_N);
       finally
        l_N := nil;
       end;//try..finally
      finally
       l_Node := nil;
      end;//try..finally
     end;//with l_NodeList.GetDataPtr(0)^
    finally
     l_NodeAttr := nil;
    end;//try..finally
   end;//LoadDefNode

  var
   l_Attr : IQueryAttribute;
  //#UC END# *4CCED25603D7__var*
  begin
  //#UC START# *4CCED25603D7__impl*
   try
    anInfo.GetDefaultValue(l_Attr);
    try
     if (l_Attr <> nil) AND (l_Attr.GetTag <> nil) AND (l_Attr.GetTag <> '') then
     // http://mdp.garant.ru/pages/viewpage.action?pageId=237994238&focusedCommentId=238944511#comment-238944511
     begin
      LoadDefNode(l_Attr, aTagName);
      if not l3SomeOf(aTagName, cReqWithoutDefText) then
       LoadDefContext(l_Attr);
     end;//l_Attr <> nil
    finally
     l_Attr := nil;
    end;//try..finally
   except
    on ENoDefaultValue do ;
   end;//try..except
   if not l3SomeOf(aTagName, cReqWithoutDefText) then
    GetOps(anInfo);
  //#UC END# *4CCED25603D7__impl*
  end;//TuneReq

 //#UC START# *4CCEC43A01AB__var*
 var
  l_Index : Integer;
 //#UC END# *4CCEC43A01AB__var*
 var
  l_A : IFullAttributeInfo;
  l_T : IString;
  l_TN : Il3CString;
 begin
 //#UC START# *4CCEC43A01AB__impl*
  if aRow.InheritsFrom(k2_idReqRow) then
  begin
   Result := false;
   // - �� ����������
   if (TevReqKind(aRow.IntA[k2_tiReqKind]) = ev_rkDescription) then
    Result := true
   else
   if Supports(aRow.Attr[k2_tiReqID], Il3CString, l_TN) then
    try
     for l_Index := 0 to Pred(l_L.Count) do
     begin
      l_L.pm_GetItem(l_Index, l_A);
      Assert(l_A <> nil);
      try
       l_A.GetTag(l_T);
       Assert(l_T <> nil);
       try
        l_TN := l3Trim(l_TN);
        // - ������ ������ ������ � ������� ���������
        if l3Same(l_TN, nsWStr(l_T)) then
        begin
         if not l3Same(aRow.PCharLenA[k2_tiReqID], l_TN) then
         // - ������ ������ ������ � ������� ���������
          aRow.PCharLenA[k2_tiReqID] := l3PCharLen(l_TN);
         TuneReq(l_TN, aRow, l_A);
         Result := true;
         Exit;
        end;//l3Same(l_TN, nsWStr(l_T))
       finally
        l_T := nil;
       end;//try..finally
      finally
       l_A := nil;
      end;//try..finally
     end;//for l_Index
    finally
     l_TN := nil;
    end;//try..finally
  end//aRow.InheritsFrom(k2_idReqRow)
  else
   Result := true;
 //#UC END# *4CCEC43A01AB__impl*
 end;//ProcessRow

//#UC START# *4CCEADD30141_4CCEACEC0101_var*
var
 l_Info : IQueryCardInfo;
 l_T : Integer;
 l_R : Integer;
 l_B : Integer;
//#UC END# *4CCEADD30141_4CCEACEC0101_var*
var
 l_S : IStream;
begin
//#UC START# *4CCEADD30141_4CCEACEC0101_impl*
 inherited Create(nil);
 f_CardType := aCardType;
 Case f_CardType of
  lg_qtAttribute :
   l_Info := DefDataAdapter.NativeAdapter.CreateQueryCardInfo(QCT_ATTRIBUTE);
  lg_qtLegislationReview :
   l_Info := DefDataAdapter.NativeAdapter.CreateQueryCardInfo(QCT_REVIEW);
  lg_qtSendConsultation:
   l_Info := DefDataAdapter.NativeAdapter.CreateQueryCardInfo(QCT_CONSULTING);
  lg_qtInpharmSearch:
   l_Info := DefDataAdapter.NativeAdapter.CreateQueryCardInfo(QCT_PHARM);
  lg_qtPostingOrder:
   {$IfDef Monitorings}
   l_Info := DefDataAdapter.NativeAdapter.CreateQueryCardInfo(QCT_PRIME);
   {$Else  Monitorings}
   Assert(false);
   {$EndIf Monitorings}
  else
   Assert(false);
 end;//Case f_CardType
 try
  l_Info.GetEvdCard(l_S);
  Assert(l_S <> nil);
  try
   Self.WriteTag(nil, cf_EverestBin, l_S, nil);
  finally
   l_S := nil;
  end;//try..finally
  l_Info.GetExistAttrs(l_L);
  Assert(l_L <> nil);
  try
   with Document do
    for l_B := 0 to Pred(ChildrenCount) do
     with Child[l_B] do
      if InheritsFrom(k2_idControlsBlock) then
      begin
       for l_T := 0 to Pred(ChildrenCount) do
        with Child[l_T] do
         if InheritsFrom(k2_idTable) then
         begin
          l_R := 0;
          while (l_R < ChildrenCount) do
          begin
           if not ProcessRow(Child[l_R]) then
           begin
            DeleteChild(l_R);
            continue;
           end//not ProcessRow(Child[l_R])
           else
            Inc(l_R);
          end;//l_R < ChildrenCount
         end;//InheritsFrom(k2_idTable)
      end;//InheritsFrom(k2_idControlsBlock)
  finally
   l_L := nil;
  end;//try..finally
 finally
  l_Info := nil;
 end;//try..finally
//#UC END# *4CCEADD30141_4CCEACEC0101_impl*
end;//Tf1QueryDocumentContainer.Create

class function Tf1QueryDocumentContainer.Make(aCardType: TlgQueryType;
  const aModel: IevAdapterModel): InevDocumentContainer;
var
 l_Inst : Tf1QueryDocumentContainer;
begin
 l_Inst := Create(aCardType, aModel);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

{$IfEnd} //not Admin

end.