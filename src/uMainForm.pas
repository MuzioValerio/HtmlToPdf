// -------------------------------------------------------------------------------------------------
// Demo program for Html2Pdf.pas.
// You must have HTMLVIEW components by L. David Baldwin installed to open this in IDE.
// This demo origin was written by Pawel Stroinski on 2010/07/07 and is public domain.
// Revisioned by Muzio Valerio on 2019/07/01 and is public domain.
// -------------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------------
// New implementation 2021/04/24
// written by Muzio Valerio
// -------------------------------------------------------------------------------------------------

unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, vmHtmlToPdf, Vcl.StdCtrls, htmlview, System.IniFiles, Winapi.ShellAPI, Vcl.Printers, HTMLUn2,
  framview, FramBrwz, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.ExtCtrls, System.StrUtils, System.IOUtils, System.UITypes;

type
  TMainForm = class(TForm)
    OpenDialog: TOpenDialog;
    Viewer: THTMLViewer;
    btnSave: TButton;
    btnSaveAs: TButton;
    lPDF: TLabel;
    SaveDialog: TSaveDialog;
    cxOpenAfterSave: TCheckBox;
    edMarginLeft: TEdit;
    edMarginTop: TEdit;
    edMarginRight: TEdit;
    edMarginBottom: TEdit;
    cxScaleToFit: TCheckBox;
    cbOrientation: TComboBox;
    cbPaperSize: TComboBox;
    btnSynopse: TButton;
    cxPrintPage: TCheckBox;
    btnSave2: TButton;
    lbMargins: TLabel;
    lPageFormat: TLabel;
    lPageOrientation: TLabel;
    lLeft: TLabel;
    lTop: TLabel;
    lRight: TLabel;
    lBottom: TLabel;
    lPageNumberPosition: TLabel;
    cbPositionPrint: TComboBox;
    btnHtmlViewer: TButton;
    btnLoadHtml: TButton;
    edtFileHtml: TButtonedEdit;
    ImgColl: TImageCollection;
    VirtualImgLst: TVirtualImageList;
    procedure FormCreate(Sender: TObject);
    procedure btnSave2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnSaveAsClick(Sender: TObject);
  procedure btnSynopseClick(Sender: TObject);
    procedure btnHtmlViewerClick(Sender: TObject);
    procedure btnLoadHtmlClick(Sender: TObject);
    procedure edtFileHtmlRightButtonClick(Sender: TObject);
  private
    { Private declarations }
    FFoglioStile: string;
    FSaveTo: Integer;
    FSettings: TMemIniFile;
  public
    { Public declarations }
  end;

var
    MainForm: TMainForm;

implementation

uses SynPdf;

{$R *.dfm}

{$R Vista.res}

procedure TMainForm.btnSave2Click(Sender: TObject);
var
  lFileName: TFileName;
  lHtmlToPdf: TvmHtmlToPdfGDI;
begin
  if lPDF.Caption = '' then
  begin
    FSaveTo := 2;
    btnSaveAsClick(nil);
  end
  else
  begin
    lFileName := lPDF.Caption;
    lHtmlToPdf := TvmHtmlToPdfGDI.Create();
    try
      lHtmlToPdf.PDFMarginLeft := StrToFloat(edMarginLeft.Text);
      lHtmlToPdf.PDFMarginTop := StrToFloat(edMarginTop.Text);
      lHtmlToPdf.PDFMarginRight := StrToFloat(edMarginRight.Text);
      lHtmlToPdf.PDFMarginBottom := StrToFloat(edMarginBottom.Text);
      lHtmlToPdf.PDFScaleToFit := cxScaleToFit.Checked;
      lHtmlToPdf.PrintOrientation := TPrinterOrientation(cbOrientation.ItemIndex);
      lHtmlToPdf.DefaultPaperSize := TPDFPaperSize(cbPaperSize.ItemIndex);

      lHtmlToPdf.SrcViewer := Self.Viewer;

      lHtmlToPdf.PrintPageNumber := cxPrintPage.Checked;
      lHtmlToPdf.TextPageNumber := ExtractFileName(edtFileHtml.Text) + ' - Page %d/%d';
      case cbPositionPrint.ItemIndex of
        0: lHtmlToPdf.PageNumberPositionPrint := ppBottom;
        1: lHtmlToPdf.PageNumberPositionPrint := ppTop;
      end;

      lHtmlToPdf.Execute;
      lHtmlToPdf.SaveToFile(lFileName);
    finally
      lHtmlToPdf.Free;
    end;

    if cxOpenAfterSave.Checked then
      ShellExecute(Handle, 'open', PChar(lFileName), nil, nil, SW_SHOWNORMAL)
  end;
end;

procedure TMainForm.btnSaveAsClick(Sender: TObject);
begin
  SaveDialog.InitialDir := ExtractFileDir(lPDF.Caption);
  SaveDialog.FileName := ChangeFileExt(ExtractFileName(edtFileHtml.Text), '');
  if SaveDialog.Execute then
  begin
    lPDF.Caption := SaveDialog.FileName;
    case FSaveTo of
      1: btnSaveClick(nil);
      2: btnSave2Click(nil);
    end;
  end;
end;

procedure TMainForm.btnSaveClick(Sender: TObject);
var
  FN: TFileName;
  lHtml2Pdf: TvmHtmlToPdf;
begin
  if lPDF.Caption = '' then
  begin
    FSaveTo := 1;
    btnSaveAsClick(nil);
  end
  else
  begin
    FN := lPDF.Caption;
    lHtml2Pdf := TvmHtmlToPdf.Create();
    try
      lHtml2Pdf.PDFMarginLeft := StrToFloat(edMarginLeft.Text);
      lHtml2Pdf.PDFMarginTop := StrToFloat(edMarginTop.Text);
      lHtml2Pdf.PDFMarginRight := StrToFloat(edMarginRight.Text);
      lHtml2Pdf.PDFMarginBottom := StrToFloat(edMarginBottom.Text);
      lHtml2Pdf.PDFScaleToFit := cxScaleToFit.Checked;
      lHtml2Pdf.PrintOrientation := TPrinterOrientation(cbOrientation.ItemIndex);
      lHtml2Pdf.DefaultPaperSize := TPDFPaperSize(cbPaperSize.ItemIndex);

      lHtml2Pdf.SrcViewer := Self.Viewer;

      lHtml2Pdf.PrintPageNumber := cxPrintPage.Checked;
      lHtml2Pdf.TextPageNumber := ExtractFileName(edtFileHtml.Text)+ ' - Page %d/%d';

      case cbPositionPrint.ItemIndex of
        0: lHtml2Pdf.PageNumberPositionPrint := ppBottom;
        1: lHtml2Pdf.PageNumberPositionPrint := ppTop;
      end;

      lHtml2Pdf.Execute;
      lHtml2Pdf.SaveToFile(FN);
    finally
      lHtml2Pdf.Free;
    end;

    if cxOpenAfterSave.Checked then
      ShellExecute(Handle, 'open', PChar(FN), nil, nil, SW_SHOWNORMAL)
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FSettings := TMemIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  edtFileHtml.Text := FSettings.ReadString('Settings', 'HTML', '');
  lPDF.Caption := FSettings.ReadString('Settings', 'PDF', '');

  cxOpenAfterSave.Checked := FSettings.ReadBool('Settings', 'OpenAfterSave', True);
  cxScaleToFit.Checked := FSettings.ReadBool('Settings', 'ScaleToFit', False);
  cbOrientation.ItemIndex := FSettings.ReadInteger('Settings', 'Orientation', 0);
  cbPaperSize.ItemIndex := FSettings.ReadInteger('Settings', 'PaperSize', 0);

  edMarginLeft.Text := FloatToStr(FSettings.ReadFloat('Margins', 'Left', 1));
  edMarginTop.Text := FloatToStr(FSettings.ReadFloat('Margins', 'Top', 1));
  edMarginRight.Text := FloatToStr(FSettings.ReadFloat('Margins', 'Right', 1));
  edMarginBottom.Text := FloatToStr(FSettings.ReadFloat('Margins', 'Bottom', 1));
  cxPrintPage.Checked := FSettings.ReadBool('Margins', 'PrintPage', False);
  cbPositionPrint.ItemIndex := FSettings.ReadInteger('Margins', 'PositionPage', 0);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FSettings.WriteString('Settings', 'HTML', edtFileHtml.Text);
  FSettings.WriteString('Settings', 'PDF', lPDF.Caption);
  FSettings.WriteBool('Settings', 'OpenAfterSave', cxOpenAfterSave.Checked);
  FSettings.WriteBool('Settings', 'ScaleToFit', cxScaleToFit.Checked);
  FSettings.WriteInteger('Settings', 'Orientation', cbOrientation.ItemIndex);
  FSettings.WriteInteger('Settings', 'PaperSize', cbPaperSize.ItemIndex);

  FSettings.WriteFloat('Margins', 'Left', StrToFloat(edMarginLeft.Text));
  FSettings.WriteFloat('Margins', 'Top', StrToFloat(edMarginTop.Text));
  FSettings.WriteFloat('Margins', 'Right', StrToFloat(edMarginRight.Text));
  FSettings.WriteFloat('Margins', 'Bottom', StrToFloat(edMarginBottom.Text));
  FSettings.WriteBool('Margins','PrintPage', cxPrintPage.Checked);
  FSettings.WriteInteger('Margins', 'PositionPage', cbPositionPrint.ItemIndex);

  FSettings.UpdateFile;
  FreeAndNil(FSettings);
end;

procedure TMainForm.btnSynopseClick(Sender: TObject);
begin
  ShellExecute(Handle,'open','http://synopse.info',nil,nil,SW_SHOWNORMAL);
end;

procedure TMainForm.btnHtmlViewerClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://github.com/BerndGabriel/HtmlViewer', nil, nil, SW_SHOWNORMAL);
end;

procedure TMainForm.btnLoadHtmlClick(Sender: TObject);
var
  SrcFileExt: string;
begin
  if Trim(edtFileHtml.Text) = '' then
  begin
    MessageDlg('selezionare un file da caricare', mtInformation, [mbOK], -1);
    Exit;
  end;

  SrcFileExt := ExtractFileExt(edtFileHtml.Text).ToLower;

  case IndexText(SrcFileExt, ['.html', '.htm']) of
    0..1: Viewer.LoadFromFile(edtFileHtml.Text);
  end;
end;

procedure TMainForm.edtFileHtmlRightButtonClick(Sender: TObject);
begin
  OpenDialog.InitialDir := ExtractFileDir(edtFileHtml.Text);
  OpenDialog.FileName := ExtractFileName(edtFileHtml.Text);
  if OpenDialog.Execute then
    edtFileHtml.Text := OpenDialog.FileName;
end;

end.

