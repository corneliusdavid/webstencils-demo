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
  Height = 331
  Width = 415
  object wspIndex: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'index-wStencils.html'
    Left = 104
    Top = 104
  end
  object wsEngineCustList: TWebStencilsEngine
    PathTemplates = <>
    OnError = wsEngineCustListError
    Left = 64
    Top = 32
  end
  object wspLoginFailed: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'loginfailed-wStencils.html'
    Left = 104
    Top = 168
  end
  object wspCustList: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'custlist-wStencils.html'
    Left = 208
    Top = 128
  end
  object wspAccessDenied: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'accessdenied-wStencils.html'
    Left = 112
    Top = 232
  end
  object wspCustEdit: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'custedit-wStencils.html'
    Left = 208
    Top = 192
  end
end
