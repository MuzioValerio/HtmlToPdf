object MainForm: TMainForm
  Left = 152
  Top = 180
  Caption = 'HtmlToPdf'
  ClientHeight = 661
  ClientWidth = 1008
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    1008
    661)
  PixelsPerInch = 96
  TextHeight = 13
  object lPDF: TLabel
    Left = 254
    Top = 610
    Width = 611
    Height = 15
    Alignment = taCenter
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lbMargins: TLabel
    Left = 268
    Top = 559
    Width = 133
    Height = 13
    Caption = 'Page Margins on centimeter'
  end
  object lPageFormat: TLabel
    Left = 8
    Top = 559
    Width = 61
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Page Format'
  end
  object lPageOrientation: TLabel
    Left = 83
    Top = 559
    Width = 81
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Page Orientation'
  end
  object lLeft: TLabel
    Left = 268
    Top = 582
    Width = 19
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Left'
  end
  object lTop: TLabel
    Left = 347
    Top = 582
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Top'
  end
  object lRight: TLabel
    Left = 425
    Top = 582
    Width = 25
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Right'
  end
  object lBottom: TLabel
    Left = 510
    Top = 582
    Width = 34
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Bottom'
  end
  object lPageNumberPosition: TLabel
    Left = 732
    Top = 559
    Width = 104
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Page Number Position'
  end
  object Viewer: THtmlViewer
    Left = 8
    Top = 39
    Width = 992
    Height = 514
    Cursor = crDefault
    BorderStyle = htSingle
    DefBackground = clWindow
    DefFontName = 'Times New Roman'
    DefPreFontName = 'Courier New'
    HistoryMaxCount = 0
    NoSelect = True
    PrintMarginBottom = 2.000000000000000000
    PrintMarginLeft = 2.000000000000000000
    PrintMarginRight = 2.000000000000000000
    PrintMarginTop = 2.000000000000000000
    PrintScale = 1.000000000000000000
    Text = ''
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Touch.InteractiveGestures = [igPan]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia]
  end
  object btnSave: TButton
    Left = 89
    Top = 606
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Save 1'
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object btnSaveAs: TButton
    Left = 8
    Top = 606
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Save As'
    TabOrder = 2
    OnClick = btnSaveAsClick
  end
  object cxOpenAfterSave: TCheckBox
    Left = 8
    Top = 636
    Width = 156
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Open after save'
    TabOrder = 3
  end
  object edMarginLeft: TEdit
    Left = 293
    Top = 579
    Width = 48
    Height = 21
    Anchors = [akRight, akBottom]
    TabOrder = 4
  end
  object edMarginTop: TEdit
    Left = 371
    Top = 579
    Width = 48
    Height = 21
    Anchors = [akRight, akBottom]
    TabOrder = 5
  end
  object edMarginRight: TEdit
    Left = 456
    Top = 579
    Width = 48
    Height = 21
    Anchors = [akRight, akBottom]
    TabOrder = 6
  end
  object edMarginBottom: TEdit
    Left = 550
    Top = 579
    Width = 48
    Height = 21
    Anchors = [akRight, akBottom]
    TabOrder = 7
  end
  object cxScaleToFit: TCheckBox
    Left = 184
    Top = 581
    Width = 72
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Scale to fit'
    TabOrder = 8
  end
  object cbOrientation: TComboBox
    Left = 83
    Top = 579
    Width = 85
    Height = 21
    Style = csDropDownList
    Anchors = [akRight, akBottom]
    ItemIndex = 0
    TabOrder = 9
    Text = 'Portrait'
    Items.Strings = (
      'Portrait'
      'Landscape')
  end
  object cbPaperSize: TComboBox
    Left = 8
    Top = 579
    Width = 63
    Height = 21
    Style = csDropDownList
    Anchors = [akRight, akBottom]
    ItemIndex = 0
    TabOrder = 10
    Text = 'A4'
    Items.Strings = (
      'A4'
      'A5'
      'A3'
      'Letter'
      'Legal')
  end
  object btnSynopse: TButton
    Left = 879
    Top = 628
    Width = 121
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'http://synopse.info'
    TabOrder = 11
    OnClick = btnSynopseClick
  end
  object cxPrintPage: TCheckBox
    Left = 604
    Top = 581
    Width = 122
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'with Page Number #'
    TabOrder = 12
  end
  object btnSave2: TButton
    Left = 170
    Top = 606
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Save 2'
    TabOrder = 13
    OnClick = btnSave2Click
  end
  object cbPositionPrint: TComboBox
    Left = 732
    Top = 579
    Width = 104
    Height = 21
    Style = csDropDownList
    Anchors = [akRight, akBottom]
    ItemIndex = 0
    TabOrder = 14
    Text = 'On Bottom'
    Items.Strings = (
      'On Bottom'
      'On Top'
      '')
  end
  object btnHtmlViewer: TButton
    Left = 879
    Top = 597
    Width = 121
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'HtmlViewer Info'
    TabOrder = 15
    OnClick = btnHtmlViewerClick
  end
  object btnLoadHtml: TButton
    Left = 925
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 16
    OnClick = btnLoadHtmlClick
  end
  object edtFileHtml: TButtonedEdit
    Left = 8
    Top = 12
    Width = 911
    Height = 21
    Images = VirtualImgLst
    RightButton.DisabledImageIndex = 0
    RightButton.Hint = 'seleziona il file html'
    RightButton.HotImageIndex = 0
    RightButton.ImageIndex = 0
    RightButton.PressedImageIndex = 0
    RightButton.Visible = True
    TabOrder = 17
    Text = 'edtFileHtml'
    OnRightButtonClick = edtFileHtmlRightButtonClick
  end
  object OpenDialog: TOpenDialog
    Filter = 'HTML Files|*.htm?|XML Files|*.xml?'
    Left = 24
    Top = 48
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.pdf'
    Filter = 'PDF Files|*.pdf'
    Left = 90
    Top = 48
  end
  object ImgColl: TImageCollection
    Images = <
      item
        Name = 'ic_folder_open_black_48dp'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000C0000000C00804000000F8D5A4
              8C000000206348524D00007A26000080840000FA00000080E8000075300000EA
              6000003A98000017709CBA513C00000002624B474400FF878FCCBF0000000970
              48597300000B1300000B1301009A9C18000002FD4944415478DAEDDDCD8B4D71
              1CC7F1CF7818E361CA43214A191624662B2C6441D9B1B396FFC14A6C84F20788
              AD6C64E72135C546B19A6B210B0F3B49E32933642CC6C6468D39E7DE33D739DD
              F37ADDE55C4CDFB7EFF99D7B4649000000000000000000000080761ACDA95CCF
              B34C6536737D7E9D37EEBFEDCC8D7CEFFBD82598D7482EFF87BFF312FCC3F64C
              D6307C09FED89377B58D7F80132C2DF9BE6D799C2DB57EA7873394476D0D309C
              07D955FBF73AA009CA3857EBC5A7F567C1D6FC684C805626B8DAA0F1B730C170
              A61A16A065098E356EFC0395A0F82EE84C0E35F0FB6ED11DD1FD466E408B2E44
              2F1B1BA02509DE3538C00024182A7CC754367810B6805FF99AB7E9642277F3AD
              1F013E66BD2997F23DB77229AFBAFB454BCC6DD1ACCAE9BCC8958CD8807A3DCF
              C9BCB601F5D99727195FBC004326DAB58D79981D36A0DE0477CA9D0502F4EF42
              7461710EE14F59679A3D7E42D85D7C18DB80FE599EB38BB1019FB3D62C7B3493
              CD99B601F5599DE32E41F53A2240BDC605A8D7984FC2F52ABC815956F98F687B
              A0B905BF3AEC12D470020820806BBC0D10000104C0212C000208803340000410
              0001047008DB00011040001CC2360001044000873036400004100087B00D4000
              017006D800041000011CC2D800011040001CC236000104400087303640000410
              0087B00D4000017006D800041000011CC202188100022080000E611B20000208
              800002208000FC1FC5FF9FF0AF2C5FF0EB7386B880D9EA1BF0D5142BF8523DC0
              5B53ACE04DF5001D53ACA0533DC08429565038BDE2679DA3799F5526D993996C
              CA4CD50DF8965B26D9A39B45E32FF7B47F675E14DC8A32FF2DE8EEE243786989
              DFE8534673D03CBB7625B78BDF54EEE75D2BF3347B4DB42B93D99F9FC56F2BF7
              28E2474EE4839976E17D4E96197FF96741AF7354822EC67FACEC07D8F20FE33A
              3990E7665BEAE2D3B7498DE4726633E7F5CFD7CF5CCC8AFEF6DD91EB9936EA79
              5ED3B996B16EC7D9DBBFFA5993E33992F18C656D865B7FB7FF256FD2C944EE15
              7FEC02000000000000000000000006D16F2572DF56647ACCBF0000000049454E
              44AE426082}
          end>
      end>
    Left = 153
    Top = 48
  end
  object VirtualImgLst: TVirtualImageList
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'ic_folder_open_black_48dp'
        Disabled = False
        Name = 'ic_folder_open_black_48dp'
      end>
    ImageCollection = ImgColl
    Left = 214
    Top = 50
  end
end
