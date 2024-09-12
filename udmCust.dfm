object dmCust: TdmCust
  Height = 394
  Width = 534
  PixelsPerInch = 120
  object FDConnChinook: TFDConnection
    Params.Strings = (
      'Database=V:\webstencils-demo\chinook.db'
      'DriverID=SQLite')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 170
    Top = 130
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 180
    Top = 220
  end
  object tblCustomers: TFDTable
    ActiveStoredUsage = [auDesignTime]
    Filter = 'CustomerId = 16'
    IndexFieldNames = 'CustomerId'
    Connection = FDConnChinook
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'Customers'
    Left = 300
    Top = 170
    object tblCustomersCustomerId: TIntegerField
      FieldName = 'CustomerId'
      Origin = 'CustomerId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tblCustomersFirstName: TWideStringField
      FieldName = 'FirstName'
      Origin = 'FirstName'
      Required = True
      Size = 40
    end
    object tblCustomersLastName: TWideStringField
      FieldName = 'LastName'
      Origin = 'LastName'
      Required = True
    end
    object tblCustomersCompany: TWideStringField
      FieldName = 'Company'
      Origin = 'Company'
      Size = 80
    end
    object tblCustomersAddress: TWideStringField
      FieldName = 'Address'
      Origin = 'Address'
      Size = 70
    end
    object tblCustomersCity: TWideStringField
      FieldName = 'City'
      Origin = 'City'
      Size = 40
    end
    object tblCustomersState: TWideStringField
      FieldName = 'State'
      Origin = 'State'
      Size = 40
    end
    object tblCustomersCountry: TWideStringField
      FieldName = 'Country'
      Origin = 'Country'
      Size = 40
    end
    object tblCustomersPostalCode: TWideStringField
      FieldName = 'PostalCode'
      Origin = 'PostalCode'
      Size = 10
    end
    object tblCustomersPhone: TWideStringField
      FieldName = 'Phone'
      Origin = 'Phone'
      Size = 24
    end
    object tblCustomersFax: TWideStringField
      FieldName = 'Fax'
      Origin = 'Fax'
      Size = 24
    end
    object tblCustomersEmail: TWideStringField
      FieldName = 'Email'
      Origin = 'Email'
      Required = True
      Size = 60
    end
    object tblCustomersSupportRepId: TIntegerField
      FieldName = 'SupportRepId'
      Origin = 'SupportRepId'
    end
  end
  object qryUserVerify: TFDQuery
    Connection = FDConnChinook
    SQL.Strings = (
      'SELECT FirstName, LastName, EmployeeID'
      'FROM Employees'
      'WHERE Upper(FirstName) = Upper(:FName)'
      '  AND :Password = EmployeeId || LastName;')
    Left = 300
    Top = 70
    ParamData = <
      item
        Name = 'FNAME'
        DataType = ftString
        ParamType = ptInput
        Value = 'andrew'
      end
      item
        Name = 'PASSWORD'
        DataType = ftString
        ParamType = ptInput
        Value = '1Adams'
      end>
  end
  object qryCustCount: TFDQuery
    Connection = FDConnChinook
    SQL.Strings = (
      'select count(1) as CustCount from customers')
    Left = 360
    Top = 270
    object qryCustCountCustCount: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CustCount'
      Origin = 'CustCount'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
