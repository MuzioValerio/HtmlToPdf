program HtmlToPDF_Demo;

uses
  Vcl.Forms,
  vmHtmlToPdf in '..\src\Common\vmHtmlToPdf.pas',
  uMainForm in '..\src\uMainForm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  System.ReportMemoryLeaksOnShutdown := True;
  Application.Run;
end.
