object dmCust: TdmCust
  Height = 315
  Width = 427
  object FDConnChinook: TFDConnection
    Params.Strings = (
      'Database=.\Chinook.db'
      'DriverID=SQLite')
    ConnectedStoredUsage = [auDesignTime]
    LoginPrompt = False
    Left = 136
    Top = 104
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 144
    Top = 176
  end
  object tblCustomers: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'CustomerId'
    Connection = FDConnChinook
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'Customer'
    Left = 240
    Top = 136
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
      'SELECT FirstName, LastName, EmployeeID, Title'
      'FROM Employee'
      'WHERE Upper(FirstName) = Upper(:FName)'
      '  AND :Password = EmployeeId || LastName;')
    Left = 240
    Top = 56
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
      'select count(1) as CustCount from customer')
    Left = 288
    Top = 216
    object qryCustCountCustCount: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CustCount'
      Origin = 'CustCount'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
