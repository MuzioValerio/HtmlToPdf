unit vmXMLToHTML;

interface

uses
  System.SysUtils, System.Classes, Winapi.msxml, Xml.XMLDoc, Xml.XMLIntf, Xml.xmldom
  , Xml.Win.msxmldom;

type
  IvmXMLToHTML = interface(IInterface)
  ['{1EF5429C-EF6C-4C02-A6F5-BE92B48CEB3E}']
    function ExecuteToString(const aXMLDocument, aXSLDocument: string): string;
    function ExecuteToStream(const aXMLDocument, aXSLDocument: string): TStream;
  end;

  TvmXMLToHTML = class(TInterfacedObject, IvmXMLToHTML)
  strict private
    FDocXML: TXMLDocument;
    FDocXSL: TXMLDocument;
    FFileNameXML: string;
    FFileHTML: WideString;
    FFileNameXSL: string;
    procedure TransformDocument;
    function TransformDocumentToStream: TStream;
    procedure DefineXSLStyle;
  public
    constructor Create;
    destructor Destroy; override;
    function ExecuteToString(const aXMLDocument, aXSLDocument: string): string;
    function ExecuteToStream(const aXMLDocument, aXSLDocument: string): TStream;
  end;

implementation

{ TvmXMLToHTML }

constructor TvmXMLToHTML.Create;
begin
  inherited Create;
end;

procedure TvmXMLToHTML.DefineXSLStyle;
begin

end;

destructor TvmXMLToHTML.Destroy;
begin
  FDocXML.Free;
  FDocXSL.Free;
  inherited Destroy;
end;

function TvmXMLToHTML.ExecuteToString(const aXMLDocument, aXSLDocument: string): string;
begin
  FFileNameXML := aXMLDocument;
  FFileNameXSL := aXSLDocument;

  TransformDocument;

  Result := FFileHTML;
end;

function TvmXMLToHTML.ExecuteToStream(const aXMLDocument, aXSLDocument: string): TStream;
begin
  FFileNameXML := aXMLDocument;
  FFileNameXSL := aXSLDocument;

  Result := TransformDocumentToStream;
end;

procedure TvmXMLToHTML.TransformDocument;
begin
  FDocXML := TXMLDocument.Create(nil);
  FDocXSL := TXMLDocument.Create(nil);
  FDocXSL.DOMVendor := MSXML_DOM;

  FDocXML.LoadFromFile(FFileNameXML);
  FDocXSL.LoadFromFile(FFileNameXSL);

  FDocXML.DocumentElement.TransformNode(FDocXSL.DocumentElement, FFileHTML);
end;

function TvmXMLToHTML.TransformDocumentToStream: TStream;
begin
  TransformDocument;

  if Length(FFileHTML) = 0 then
    Exit(nil);

  Result := TStringStream.Create(FFileHTML);
  Result.Position := 0;
end;

end.
