// ���������� : "���������� ���������� ������� �������"
// �����      : �. �������
// �����      : 07.12.2006
// ���������� : ��������� ���������� � ��������� ��� ������� �������
// ������     : $Id: nscPageControl.inc,v 1.8 2012/10/26 15:46:11 lulin Exp $

// $Log: nscPageControl.inc,v $
// Revision 1.8  2012/10/26 15:46:11  lulin
// {RequestLink:406489593}
//
// Revision 1.7  2012/10/26 14:48:54  lulin
// {RequestLink:406489593}
//
// Revision 1.6  2009/01/21 15:30:16  lulin
// - ������� �� ��������.
//
// Revision 1.5  2009/01/21 14:43:49  lulin
// - ������� � ������������ ������� (����������� � ������).
//
// Revision 1.4  2007/08/20 10:32:03  mmorozov
// - bugfix: ��������� ������� �������;
//
// Revision 1.3  2007/08/20 09:06:07  mmorozov
// - new: ����������� �� ��������� �������� ������� (CQ: OIT5-26352);
//
// Revision 1.2  2006/12/08 10:21:52  mmorozov
// - new: ������� ����� ��� ������� ������ afwHackFont;
//
// Revision 1.1  2006/12/07 14:23:11  mmorozov
// - new: ���������� ������ ��������� ��� ���������� � ��������� (CQ: OIT5-23819);
//

{$IfNDef nscPageControlImpl}

  {$Define nscPageControlImpl}
  
  _nscPageControl_ = class(_nscDestPageControl_)
  protected
  // methods
    procedure Change;
      override;
      {-}
  public
  // methods
    constructor Create(AOwner: TComponent);
      override;
      {-}
    protected
      property ParentFont
        default false;
        {-}    
      property UseActiveTabFont
        default true;
        {-}
  end;//_nscPageControl_

{$ELSE nscPageControlImpl}

{ _nscPageControl_ }

constructor _nscPageControl_.Create(AOwner: TComponent);
  // override;
  {-}
begin
 inherited;
 // Properties
 ParentFont := False;
 ActiveTabColor := clWindow;
 HotTrack := True;
 Style := etsFlatTabs;
 DrawFocusRect := True;
 Flat := True;
 UseXPThemes := False;
 UseActiveTabFont := True;
 // HotTrackFont
 afwHackFont(FHotTrackFont, TnscHotTrackFont);
 // ActiveTabFont
 afwHackFont(FActiveTabFont, TnscActivePageFont);
 // Font
 afwHackControlFont(Self, TnscTabFont);
end;//Create

procedure _nscPageControl_.Change;
  // override;
  {-}

 {$IfDef Nemesis}
 {$IfNDef DesignTimeLibrary}
  procedure lp_NotifyControls(const aParent: TWinControl);
  var
   l_Index        : Integer;
   l_Notification : InscPageControlNotification;
  begin
   if aParent <> nil then
    with aParent do
     for l_Index := 0 to Pred(ControlCount) do
     begin
      if Supports(Controls[l_Index],
                  InscPageControlNotification,
                  l_Notification) then
      try
       l_Notification.TabActivate;
      finally
       l_Notification := nil;
      end;//try..finally
      if Controls[l_Index] is TWinControl then
       lp_NotifyControls(TWinControl(Controls[l_Index]));
     end;//for l_Index := 0 to Pred(ControlCount) do
  end;//lp_NotifyControls
 {$EndIf DesignTimeLibrary}
 {$EndIf Nemesis}

begin
 {$IfNDef NoVCM}
 {$IfNDef DesignTimeLibrary}
 // ��� �������� �� ������� ���������� ������� �� �����������, � ��������
 // �������� ����� ��������� �������� �������, ��� �� ����� ��������� �
 // ���������������� ���������:
 if (g_Dispatcher <> nil) and (g_Dispatcher.History <> nil) and
   not g_Dispatcher.History.InBF then
  lp_NotifyControls(ActivePage);
 {$EndIf DesignTimeLibrary}
 {$EndIf NoVCM}
 inherited;
end;//Change

{$EndIf nscPageControlImpl}