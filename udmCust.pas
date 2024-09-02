unit udmCust;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet;

type
  TdmCust = class(TDataModule)
    FDConnChinook: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    tblCustomers: TFDTable;
    tblCustomersCustomerId: TIntegerField;
    tblCustomersFirstName: TWideStringField;
    tblCustomersLastName: TWideStringField;
    tblCustomersCompany: TWideStringField;
    tblCustomersAddress: TWideStringField;
    tblCustomersCity: TWideStringField;
    tblCustomersState: TWideStringField;
    tblCustomersCountry: TWideStringField;
    tblCustomersPostalCode: TWideStringField;
    tblCustomersPhone: TWideStringField;
    tblCustomersFax: TWideStringField;
    tblCustomersEmail: TWideStringField;
    tblCustomersSupportRepId: TIntegerField;
    qryUserVerify: TFDQuery;
    qryCustCount: TFDQuery;
    qryCustCountCustCount: TLargeintField;
  public
    function LoginCheck(const Username, Password: string): Boolean;
    function CustCount: Integer;
  end;

var
  dmCust: TdmCust;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCust }

function TdmCust.CustCount: Integer;
begin
  qryCustCount.Open;
  Result := qryCustCountCustCount.AsInteger;
  qryCustCount.Close;
end;

function TdmCust.LoginCheck(const Username, Password: string): Boolean;
begin
  qryUserVerify.ParamByName('FName').AsString := UpperCase(Username);
  qryUserVerify.ParamByName('Password').AsString := Password;
  qryUserVerify.Open;
  Result := qryUserVerify.RecordCount > 0;
  qryUserVerify.Close;
end;

end.
