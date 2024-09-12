object webCustListWebStencil: TwebCustListWebStencil
  OnCreate = WebModuleCreate
  Actions = <
    item
      Default = True
      MethodType = mtGet
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = webCustListWebStencilDefaultHandlerAction
    end
    item
      MethodType = mtPost
      Name = 'waLoginVerify'
      PathInfo = '/login'
      OnAction = webCustListWebStencilwaLoginVerifyAction
    end
    item
      MethodType = mtGet
      Name = 'waListCustomers'
      PathInfo = '/custlist'
      OnAction = webCustListWebStencilwaListCustomersAction
    end
    item
      MethodType = mtGet
      Name = 'waEditCustomer'
      PathInfo = '/custedit'
      OnAction = webCustListWebStencilwaEditCustomerAction
    end>
  Height = 414
  Width = 519
  PixelsPerInch = 120
  object wspIndex: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'index-wStencils.html'
    Left = 130
    Top = 130
  end
  object wsEngineCustList: TWebStencilsEngine
    PathTemplates = <>
    OnError = wsEngineCustListError
    Left = 80
    Top = 40
  end
  object wspLoginFailed: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'loginfailed-wStencils.html'
    Left = 130
    Top = 210
  end
  object wspCustList: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'custlist-wStencils.html'
    Left = 260
    Top = 160
  end
  object wspAccessDenied: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'accessdenied-wStencils.html'
    Left = 140
    Top = 290
  end
  object wspCustEdit: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'custedit-wStencils.html'
    Left = 260
    Top = 240
  end
end
