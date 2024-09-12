unit uwebCustListWebBroker;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Web.HTTPProd, Web.DBWeb, Web.DBXpressWeb, Web.DSProd;

type
  TwebCustListWebBroker = class(TWebModule)
    ppIndex: TPageProducer;
    ppCustList: TPageProducer;
    ppLoginFailed: TPageProducer;
    ppPageFooter: TPageProducer;
    ppPageHeader: TPageProducer;
    pptblCustomers: TDataSetTableProducer;
    ppAccessDenied: TPageProducer;
    ppCustEdit: TPageProducer;
    procedure webCustListWebBrokerwaLoginVerifyAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure ppAllHTMLTags(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings;
      var ReplaceText: string);
    procedure pptblCustomersCreateContent(Sender: TObject; var Continue: Boolean);
    procedure WebModuleCreate(Sender: TObject);
    procedure webCustListWebBrokerwaListCustomersAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure pptblCustomersFormatCell(Sender: TObject; CellRow, CellColumn: Integer; var BgColor: THTMLBgColor;
      var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs, CellData: string);
    procedure webCustListWebBrokerwaEditCustomerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure ppCustEditHTMLTag(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings;
      var ReplaceText: string);
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

procedure TwebCustListWebBroker.ppCustEditHTMLTag(Sender: TObject; Tag: TTag; const TagString: string;
  TagParams: TStrings; var ReplaceText: string);
begin
  if SameText(TagString, 'Company') then
    ReplaceText := dmCust.tblCustomersCompany.AsString
  else if SameText(TagString, 'FirstName') then
    ReplaceText := dmcust.tblCustomersFirstName.AsString
  else if SameText(TagString, 'LastName') then
    ReplaceText := dmCust.tblCustomersLastName.AsString
  else if SameText(TagString, 'Address') then
    ReplaceText := dmCust.tblCustomersAddress.AsString
  else if SameText(TagString, 'City') then
    ReplaceText := dmCust.tblCustomersCity.AsString
  else if SameText(TagString, 'State') then
    ReplaceText := dmCust.tblCustomersState.AsString
  else if SameText(TagString, 'Country') then
    ReplaceText := dmCust.tblCustomersCountry.AsString
  else if SameText(TagString, 'Zip') then
    ReplaceText := dmCust.tblCustomersPostalCode.AsString
  else if SameText(TagString, 'Email') then
    ReplaceText := dmCust.tblCustomersEmail.AsString
  else if SameText(TagString, 'Phone') then
    ReplaceText := dmCust.tblCustomersPhone.AsString
  else
    ppAllHTMLTags(Sender, Tag, TagString, TagParams, ReplaceText);
end;

procedure TwebCustListWebBroker.pptblCustomersCreateContent(Sender: TObject; var Continue: Boolean);
begin
  pptblCustomers.MaxRows := dmCust.CustCount;
  Continue := True;
end;

procedure TwebCustListWebBroker.pptblCustomersFormatCell(Sender: TObject; CellRow, CellColumn: Integer;
  var BgColor: THTMLBgColor; var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs, CellData: string);
begin
  if (CellColumn = 0) and (CellRow > 0) then
    CellData := Format('<a href="\custedit?cust_no=%s">%s</a>', [CellData, CellData]);
end;

procedure TwebCustListWebBroker.webCustListWebBrokerwaEditCustomerAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
var
  CustNo: string;
  CustNum: Integer;
begin
  if not IsLoggedIn then
    Response.Content := ppAccessDenied.Content
  else
  begin
    if Request.QueryFields.Count > 0 then
    begin
      CustNo := Request.QueryFields.Values['cust_no'];
      if TryStrToInt(CustNo, CustNum) then
      begin
        dmCust.tblCustomers.Filter := 'CustomerId = ' + CustNo;
        dmCust.tblCustomers.Filtered := True;
        dmCust.tblCustomers.Open;
        Response.Content := ppCustEdit.Content;
        dmCust.tblCustomers.Close;
      end;
    end;
  end;

  Handled := True;
end;

procedure TwebCustListWebBroker.webCustListWebBrokerwaListCustomersAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
begin
  if not IsLoggedIn then
    Response.Content := ppAccessDenied.Content
  else
  begin
    dmCust.tblCustomers.Filtered := False;
    Response.Content := ppCustList.Content;
  end;

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
