unit uwebCustListWebBroker;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Web.HTTPProd, Web.DBWeb, Web.DBXpressWeb;

type
  TwebCustListWebBroker = class(TWebModule)
    ppIndex: TPageProducer;
    ppCustList: TPageProducer;
    ppLoginFailed: TPageProducer;
    ppPageFooter: TPageProducer;
    ppPageHeader: TPageProducer;
    pptblCustomers: TDataSetTableProducer;
    ppAccessDenied: TPageProducer;
    procedure webCustListWebBrokerwaLoginVerifyAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure ppAllHTMLTags(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings;
      var ReplaceText: string);
    procedure pptblCustomersCreateContent(Sender: TObject; var Continue: Boolean);
    procedure WebModuleCreate(Sender: TObject);
    procedure webCustListWebBrokerwaListCustomersAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
  private
    const
      APP_NAME = 'Customer List for WebBroker';
      APP_VERSION = '0.4';
    var
      FIsLoggedIn: Boolean;
    property IsLoggedIn: Boolean read FIsLoggedIn write FIsLoggedIn;
  end;

var
  WebModuleClass: TComponentClass = TwebCustListWebBroker;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  udmCust;

procedure TwebCustListWebBroker.ppAllHTMLTags(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings;
  var ReplaceText: string);
begin
  if SameText(TagString, 'AppName') then
    ReplaceText := APP_NAME
  else if SameText(TagString, 'AppVersion') then
    ReplaceText := APP_VERSION
  else if SameText(TagString, 'Header') then
    ReplaceText := ppPageHeader.Content
  else if SameText(TagString, 'Footer') then
    ReplaceText := ppPageFooter.Content
  else if SameText(TagString, 'Customers') then
    ReplaceText := pptblCustomers.Content;
end;

procedure TwebCustListWebBroker.pptblCustomersCreateContent(Sender: TObject; var Continue: Boolean);
begin
  pptblCustomers.MaxRows := dmCust.CustCount;
  Continue := True;
end;

procedure TwebCustListWebBroker.webCustListWebBrokerwaListCustomersAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
begin
  if not IsLoggedIn then
    Response.Content := ppAccessDenied.Content
  else
    Response.Content := ppCustList.Content;

  Handled := True;
end;

procedure TwebCustListWebBroker.webCustListWebBrokerwaLoginVerifyAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
var
  Username, Password: string;
begin
  Username := Request.ContentFields.Values['uname'];
  Password := Request.ContentFields.Values['psw'];
  if dmCust.LoginCheck(Username, Password) then
  begin
    FIsLoggedIn := True;
    Response.SendRedirect('/custlist');
  end else
    Response.Content := ppLoginFailed.Content;

  Handled := True;
end;

procedure TwebCustListWebBroker.WebModuleCreate(Sender: TObject);
begin
  FIsLoggedIn := False;
end;

end.
