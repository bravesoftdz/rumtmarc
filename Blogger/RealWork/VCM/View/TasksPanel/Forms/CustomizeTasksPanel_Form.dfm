object vcmCustomizeTasksPanelForm: TvcmCustomizeTasksPanelForm
  Left = 444
  Top = 105
  Width = 739
  Height = 597
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1087#1072#1085#1077#1083#1080' '#1079#1072#1076#1072#1095
  Color = clBtnFace
  ZoneType = vcm_ztManualModal
  OnInit = vcmEntityFormInit
  PixelsPerInch = 96
  TextHeight = 13
  object spRight: TvtSplitter
    Left = 329
    Top = 41
    Width = 4
    Height = 471
    Cursor = crHSplit
    Beveled = True
  end
  object pnlBottom: TvtPanel
    Left = 0
    Top = 512
    Width = 723
    Height = 49
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      723
      49)
    object lblConfirmSave: TvtLabel
      Left = 8
      Top = 16
      Width = 300
      Height = 16
      Caption = #1054#1073#1098#1077#1082#1090' '#1089#1080#1089#1090#1077#1084#1099' '#1080#1079#1084#1077#1085#1077#1085'. '#1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103'?'
      Visible = False
    end
    object lblAvailableOpsCaption: TvtLabel
      Left = 16
      Top = 24
      Width = 316
      Height = 16
      Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1076#1086#1089#1090#1091#1087#1085#1099#1093' '#1086#1087#1077#1088#1072#1094#1080#1081' '#1087#1072#1085#1077#1083#1080' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074
      Visible = False
    end
    object btOk: TButton
      Left = 449
      Top = 14
      Width = 81
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1082
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btOkClick
    end
    object btCancel: TButton
      Left = 539
      Top = 14
      Width = 79
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object btApply: TButton
      Left = 631
      Top = 14
      Width = 81
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = btApplyClick
    end
  end
  object pnlLeft: TvtPanel
    Left = 333
    Top = 41
    Width = 40
    Height = 471
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object btnMoveOpToPanel: TBitBtn
      Left = 8
      Top = 73
      Width = 25
      Height = 25
      Enabled = False
      TabOrder = 0
      OnClick = btnMoveOpToPanelClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000808000000000C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000000000000000
        0000808000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000808000808000808000808000808000808000808000000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080800080800080
        8000808000808000808000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000808000808000808000808000808000808000808000000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000000000000000
        0000808000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000808000000000C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
    end
    object btnMoveOpToRep: TBitBtn
      Left = 8
      Top = 105
      Width = 25
      Height = 25
      Enabled = False
      TabOrder = 1
      OnClick = btnMoveOpToRepClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0000000808000000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080
        8000000000000000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C00000008080008080008080008080008080008080008080000000
        00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080800080800080
        8000808000808000808000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C00000008080008080008080008080008080008080008080000000
        00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080
        8000000000000000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0000000808000000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
    end
    object btnMoveGroupToPanel: TBitBtn
      Left = 7
      Top = 321
      Width = 25
      Height = 25
      Enabled = False
      TabOrder = 2
      OnClick = btnMoveGroupToPanelClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000808000000000C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000000000000000
        0000808000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000808000808000808000808000808000808000808000000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080800080800080
        8000808000808000808000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000808000808000808000808000808000808000808000000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000000000000000
        0000808000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000808000000000C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
    end
    object btnMoveGroupToRep: TBitBtn
      Left = 7
      Top = 353
      Width = 25
      Height = 25
      Enabled = False
      TabOrder = 3
      OnClick = btnMoveGroupToRepClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0000000808000000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080
        8000000000000000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C00000008080008080008080008080008080008080008080000000
        00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080800080800080
        8000808000808000808000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C00000008080008080008080008080008080008080008080000000
        00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080
        8000000000000000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0000000808000000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
    end
  end
  object pnlTasksPanel: TvtPanel
    Left = 373
    Top = 41
    Width = 350
    Height = 471
    Align = alClient
    Caption = 'pnlTasksPanel'
    TabOrder = 2
    object gbTasksPanel: TvtGroupBox
      Left = 1
      Top = 1
      Width = 308
      Height = 469
      Align = alClient
      Caption = ' '#1058#1077#1082#1091#1097#1072#1103' '#1087#1072#1085#1077#1083#1100' '#1079#1072#1076#1072#1095': '
      TabOrder = 0
      object tvTasksPanel: TeeTreeView
        Left = 2
        Top = 18
        Width = 304
        Height = 346
        Align = alClient
        TabOrder = 0
        ViewOptions = [voShowIcons, voShowExpandable]
        OnGetItemImage = tvTasksPanelGetItemImage
        OnCurrentChanged = tvTasksPanelCurrentChanged
      end
      object vtGroupBox3: TvtGroupBox
        Left = 2
        Top = 364
        Width = 304
        Height = 103
        Align = alBottom
        Caption = ' '#1058#1077#1082#1091#1097#1080#1081' '#1101#1083#1077#1084#1077#1085#1090': '
        TabOrder = 1
        DesignSize = (
          304
          103)
        object lblCaption: TvtLabel
          Left = 9
          Top = 21
          Width = 61
          Height = 16
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
        end
        object edChange: TvtComboBox
          Left = 10
          Top = 40
          Width = 208
          Height = 21
          Style = csSimple
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
        end
        object cbForAllUseCases: TeeCheckBox
          Left = 9
          Top = 72
          Width = 168
          Height = 17
          Caption = #1044#1083#1103' '#1074#1089#1077#1093' '#1087#1072#1085#1077#1083#1077#1081' '#1079#1072#1076#1072#1095
          TabOrder = 1
          OnClick = cbForAllUseCasesClick
        end
        object btnChangeItem: TeeButton
          Left = 222
          Top = 37
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          Enabled = False
          TabOrder = 2
          OnClick = btnChangeItemClick
        end
      end
    end
    object pnlOperationPos: TvtPanel
      Left = 309
      Top = 1
      Width = 40
      Height = 469
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object UpBitBtn: TBitBtn
        Left = 8
        Top = 162
        Width = 24
        Height = 25
        Enabled = False
        TabOrder = 0
        OnClick = UpBitBtnClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000
          0000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0000000808000808000808000000000C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080
          8000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0000000808000808000808000000000C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000000000000080800080
          8000808000000000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0000000808000808000808000808000808000808000808000000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080800080
          8000808000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0000000808000808000808000000000C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080
          8000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
      end
      object DownBitBtn: TBitBtn
        Left = 8
        Top = 193
        Width = 24
        Height = 25
        Enabled = False
        TabOrder = 1
        OnClick = DownBitBtnClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080
          8000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0000000808000808000808000000000C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080800080
          8000808000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0000000808000808000808000808000808000808000808000000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000000000000080800080
          8000808000000000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0000000808000808000808000000000C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080
          8000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0000000808000808000808000000000C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000
          0000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
      end
    end
  end
  object pnlRep: TvtPanel
    Left = 0
    Top = 41
    Width = 329
    Height = 471
    Align = alLeft
    TabOrder = 3
    object splRep: TvtSplitter
      Left = 1
      Top = 226
      Width = 327
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Beveled = True
    end
    object gbAvailableOperations: TvtGroupBox
      Left = 1
      Top = 1
      Width = 327
      Height = 225
      Align = alTop
      BiDiMode = bdLeftToRight
      Caption = ' '#1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080': '
      ParentBiDiMode = False
      TabOrder = 0
      object tvRepOps: TeeTreeView
        Left = 2
        Top = 18
        Width = 323
        Height = 205
        Align = alClient
        TabOrder = 0
        OnGetItemImage = tvRepOpsGetItemImage
        OnCurrentChanged = tvRepOpsCurrentChanged
      end
    end
    object gbAvailableGroups: TvtGroupBox
      Left = 1
      Top = 230
      Width = 327
      Height = 240
      Align = alClient
      Caption = ' '#1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1075#1088#1091#1087#1087#1099': '
      TabOrder = 1
      object tvRepGroups: TeeTreeView
        Left = 2
        Top = 18
        Width = 323
        Height = 149
        Align = alClient
        TabOrder = 0
        ViewOptions = [voShowIcons, voShowExpandable, voShowOpenChip]
        OnMakeTreeSource = tvRepGroupsMakeTreeSource
        OnCurrentChanged = tvRepGroupsCurrentChanged
      end
      object vtPanel1: TvtPanel
        Left = 2
        Top = 167
        Width = 323
        Height = 71
        Align = alBottom
        TabOrder = 1
        DesignSize = (
          323
          71)
        object cbGroupName: TvtComboBox
          Left = 4
          Top = 9
          Width = 310
          Height = 21
          Style = csSimple
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = cbGroupNameChange
        end
        object btnAddGroup: TeeButton
          Left = 66
          Top = 38
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          Enabled = False
          TabOrder = 1
          OnClick = btnAddGroupClick
        end
        object btnChangeGroup: TeeButton
          Left = 153
          Top = 38
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          Enabled = False
          TabOrder = 2
          OnClick = btnChangeGroupClick
        end
        object btnDeleteGroup: TeeButton
          Left = 238
          Top = 38
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1059#1076#1072#1083#1080#1090#1100
          Enabled = False
          TabOrder = 3
          OnClick = btnDeleteGroupClick
        end
      end
    end
  end
  object pnlForms: TvtPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 41
    Align = alTop
    TabOrder = 4
    DesignSize = (
      723
      41)
    object lblForms: TvtLabel
      Left = 17
      Top = 11
      Width = 105
      Height = 16
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1086#1088#1084#1091':'
    end
    object cbForms: TComboBox
      Left = 136
      Top = 7
      Width = 544
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 16
      TabOrder = 0
      OnChange = cbFormsChange
    end
  end
  object Entities: TvcmEntities
    Entities = <
      item
        Name = 'enEdit'
        Operations = <
          item
            Name = 'opPaste'
          end
          item
            Name = 'opCopy'
          end
          item
            Name = 'opCut'
          end
          item
            Name = 'opDelete'
          end>
      end>
    Left = 114
    Top = 58
  end
end
