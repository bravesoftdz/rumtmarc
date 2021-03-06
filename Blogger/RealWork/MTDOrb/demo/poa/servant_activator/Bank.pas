// ***************************************************************************
//                                                                            
// Generated by the MTDORB IDL-to-Pascal Translator (1.0.1b1), 21.09.2010 13:27
//                                                                            
// Copyright (c) 2002 - 2004                                                  
// Millennium Group.                                                          
// Samara, Russia                                                             
//                                                                            
// All Rights Reserved                                                        
//                                                                            
// ***************************************************************************
// Compiled with parameters: " -i../../..//idl -i./ ./\Bank.idl" 
//                                                                            
unit Bank;

interface

uses
  Classes, orb_int, orb, req_int, code_int, env_int, stdstat, std_seq,imr, imr_int, 
  orbtypes, exceptions, except_int, Bank_int, poa_int, poa;

type

  {** IDL:Bank/Account:1.0 } 
  TBank_Account = class(TORBObject,IBank_Account)
  protected
    function balance: Float; virtual; abstract;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    class function _narrow(const obj : IORBObject): IBank_Account;
    class function narrow_helper2(const obj: IORBObject): Boolean;
  end;

  {** stub for interface IDL:Bank/Account:1.0} 
  TBank_Account_stub = class(TBank_Account)
  protected
    function balance: Float; override;
  end;

  {** POA stub for interface IDL:Bank/Account:1.0} 
  TBank_Account_stub_clp = class(TPOAStub,IPOAStub,IBank_Account)
  protected
    function balance: Float; virtual;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  end;

  {** servant for interface IDL:Bank/Account:1.0} 
  TBank_Account_serv = class(TPOAStaticImplementation,IPOAStaticImplementation,IServant,IBank_Account)
  protected
    function balance: Float; virtual; abstract;
    function _primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID; override;
    function _make_stub(const poa: IPOA; const obj : IORBObject): IORBObject; override;
    function _is_a(const repoid: RepositoryID): Boolean; override;
    procedure invoke(const serv: IStaticServerRequest); override;
    function _dispatch(const req: IStaticServerRequest): Boolean;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    function _this(): IBank_Account;
    class function _narrow(const srv : IServant): IBank_Account;
  end;

  TBank_Account_marshaller = class(TAbstractStat,IStaticTypeInfo)
  protected
    procedure _assign(dst,src: Pointer); override;
    function demarshal(dec: IDecoder;const addr : Pointer): Boolean;
    procedure marshal(enc: IEncoder; const addr : Pointer);
    procedure _create(var addr: Pointer); override;
    procedure _free(var addr: Pointer);
    function typecode: ITypeCode; override;
  end;

  {** IDL:Bank/AccountManager:1.0 } 
  TBank_AccountManager = class(TORBObject,IBank_AccountManager)
  protected
    function open(const name: AnsiString): IBank_Account; virtual; abstract;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    class function _narrow(const obj : IORBObject): IBank_AccountManager;
    class function narrow_helper2(const obj: IORBObject): Boolean;
  end;

  {** stub for interface IDL:Bank/AccountManager:1.0} 
  TBank_AccountManager_stub = class(TBank_AccountManager)
  protected
    function open(const name: AnsiString): IBank_Account; override;
  end;

  {** POA stub for interface IDL:Bank/AccountManager:1.0} 
  TBank_AccountManager_stub_clp = class(TPOAStub,IPOAStub,IBank_AccountManager)
  protected
    function open(const name: AnsiString): IBank_Account; virtual;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  end;

  {** servant for interface IDL:Bank/AccountManager:1.0} 
  TBank_AccountManager_serv = class(TPOAStaticImplementation,IPOAStaticImplementation,IServant,IBank_AccountManager)
  protected
    function open(const name: AnsiString): IBank_Account; virtual; abstract;
    function _primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID; override;
    function _make_stub(const poa: IPOA; const obj : IORBObject): IORBObject; override;
    function _is_a(const repoid: RepositoryID): Boolean; override;
    procedure invoke(const serv: IStaticServerRequest); override;
    function _dispatch(const req: IStaticServerRequest): Boolean;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    function _this(): IBank_AccountManager;
    class function _narrow(const srv : IServant): IBank_AccountManager;
  end;

  TBank_AccountManager_marshaller = class(TAbstractStat,IStaticTypeInfo)
  protected
    procedure _assign(dst,src: Pointer); override;
    function demarshal(dec: IDecoder;const addr : Pointer): Boolean;
    procedure marshal(enc: IEncoder; const addr : Pointer);
    procedure _create(var addr: Pointer); override;
    procedure _free(var addr: Pointer);
    function typecode: ITypeCode; override;
  end;

var
  Bank_Account_marshaller : IStaticTypeInfo;
  Bank_AccountManager_marshaller : IStaticTypeInfo;
  _tc_Bank_Account : ITypeCodeConst;
  _tc_Bank_AccountManager : ITypeCodeConst;

implementation

uses
  SysUtils, any, tcode, static, throw;

//***********************************************************
// TBank_Account
//***********************************************************
function TBank_Account.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:Bank/Account:1.0' then
    begin
      result := Pointer(self as IBank_Account);
      exit;
    end;
end;

class function TBank_Account._narrow(const obj : IORBObject): IBank_Account;
var
  p: Pointer;
  stub: TBank_Account_stub;
begin
  result := nil;
  if obj = nil then exit;
  p := obj.narrow_helper('IDL:Bank/Account:1.0');
  if p <> nil then
    result := IBank_Account(p)
  else
    begin
      if narrow_helper2(obj) or obj._is_a_remote('IDL:Bank/Account:1.0') then
        begin
          stub := TBank_Account_stub.Create();
          stub.assign(obj);
          result := stub;
        end;
    end;
end;

class function TBank_Account.narrow_helper2(const obj: IORBObject): Boolean;
begin
  result := obj._repoid = 'IDL:Bank/Account:1.0'
end;

//***********************************************************
// TBank_Account_stub
//***********************************************************
function TBank_Account_stub.balance: Float;
var
  req: IStaticRequest;
  _result: IStaticAny;
begin
  _result := StaticAny(stat_float, @result);
  req := StaticRequest(self,'balance');
  req.set_result(_result);
  req.invoke;
  dorb_static_throw(req);
end;

//***********************************************************
// TBank_Account_stub_clp
//***********************************************************
function TBank_Account_stub_clp.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:Bank/Account:1.0' then
    begin
      result := Pointer(self as IBank_Account);
      exit;
  end;
end;

function TBank_Account_stub_clp.balance: Float;
var
  _srv: IServant;
  srv: IBank_Account;
begin
  result := 0;
  _srv := _preinvoke();
  if _srv <> nil then
    begin
      srv := TBank_Account_serv._narrow(_srv);
      if srv <> nil then
        result := srv.balance
    end;
  _postinvoke();
end;

//***********************************************************
// TBank_Account_serv
//***********************************************************
function TBank_Account_serv._this(): IBank_Account;
var
  obj: IORBObject;
begin
  obj := this();
  result := TBank_Account._narrow(obj);
end;

function TBank_Account_serv._is_a(const repoid: RepositoryID): Boolean;
begin
  result := repoid = 'IDL:Bank/Account:1.0';
end;

function TBank_Account_serv._primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID;
begin
  result := 'IDL:Bank/Account:1.0';
end;

function TBank_Account_serv._make_stub(const poa: IPOA; const obj : IORBObject): IORBObject;
begin
  result := TBank_Account_stub_clp.Create(poa,obj);
end;

procedure TBank_Account_serv.invoke(const serv: IStaticServerRequest);
begin
  if not _dispatch(serv) then
    begin
      serv.set_exception(BAD_OPERATION.Create(0, COMPLETED_NO) as IORBException);
      serv.write_results();
    end;
end;

function TBank_Account_serv.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:Bank/Account:1.0' then
    begin
      result := Pointer(IBank_Account(self));
      exit;
    end;
end;

class function TBank_Account_serv._narrow(const srv : IServant): IBank_Account;
var
  p: Pointer;
begin
  result := nil;
  if srv = nil then exit;
  p := srv.narrow_helper('IDL:Bank/Account:1.0');
  if p <> nil then
    result := IBank_Account(p)
end;

function TBank_Account_serv._dispatch(const req: IStaticServerRequest): Boolean;
var
  balance_result: Float;
begin
  result := true;
  if req.op_name = 'balance' then
    begin
      req.set_result(StaticAny(stat_float,@balance_result) as IStaticAny);
      if not req.read_args() then  exit;
      balance_result := balance;
      req.write_results();
      exit;
    end;
  result := false;
end;

//***********************************************************
// TBank_Account_marshaller
//***********************************************************
function TBank_Account_marshaller.demarshal(dec: IDecoder;const addr : Pointer): Boolean;
var
  obj: IORBObject;
begin
  result := false;
  if not stat_Object.demarshal(dec,@obj) then exit;
  IBank_Account(addr^) := TBank_Account._narrow(obj);
  result := (obj = nil) or (Pointer(addr^) <> nil);
end;

procedure TBank_Account_marshaller.marshal(enc: IEncoder;const addr : Pointer);
var
  obj: IORBObject;
begin
  obj := IBank_Account(addr^) as IORBObject;
  stat_Object.marshal(enc,@Pointer(obj));
end;

procedure TBank_Account_marshaller._free(var addr: Pointer);
begin
  IBank_Account(addr^) := nil;
end;

procedure TBank_Account_marshaller._create(var addr: Pointer);
begin
  IBank_Account(addr^) := TBank_Account_stub.Create();
end;

procedure TBank_Account_marshaller._assign(dst, src: Pointer);
begin
  IBank_Account(dst^) := IBank_Account(src^);
end;

function TBank_Account_marshaller.typecode: ITypeCode;
begin
  result := _tc_Bank_Account.typecode;
end;

//***********************************************************
// TBank_AccountManager
//***********************************************************
function TBank_AccountManager.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:Bank/AccountManager:1.0' then
    begin
      result := Pointer(self as IBank_AccountManager);
      exit;
    end;
end;

class function TBank_AccountManager._narrow(const obj : IORBObject): IBank_AccountManager;
var
  p: Pointer;
  stub: TBank_AccountManager_stub;
begin
  result := nil;
  if obj = nil then exit;
  p := obj.narrow_helper('IDL:Bank/AccountManager:1.0');
  if p <> nil then
    result := IBank_AccountManager(p)
  else
    begin
      if narrow_helper2(obj) or obj._is_a_remote('IDL:Bank/AccountManager:1.0') then
        begin
          stub := TBank_AccountManager_stub.Create();
          stub.assign(obj);
          result := stub;
        end;
    end;
end;

class function TBank_AccountManager.narrow_helper2(const obj: IORBObject): Boolean;
begin
  result := obj._repoid = 'IDL:Bank/AccountManager:1.0'
end;

//***********************************************************
// TBank_AccountManager_stub
//***********************************************************
function TBank_AccountManager_stub.open(const name: AnsiString): IBank_Account;
var
  req: IStaticRequest;
  _name: IStaticAny;
  _result: IStaticAny;
begin
  _name := StaticAny(stat_string,@name);
  _result := StaticAny(Bank_Account_marshaller, @result);
  req := StaticRequest(self,'open');
  req.add_in_arg(_name);
  req.set_result(_result);
  req.invoke;
  dorb_static_throw(req);
end;

//***********************************************************
// TBank_AccountManager_stub_clp
//***********************************************************
function TBank_AccountManager_stub_clp.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:Bank/AccountManager:1.0' then
    begin
      result := Pointer(self as IBank_AccountManager);
      exit;
  end;
end;

function TBank_AccountManager_stub_clp.open(const name: AnsiString): IBank_Account;
var
  _srv: IServant;
  srv: IBank_AccountManager;
begin
  result := nil;
  _srv := _preinvoke();
  if _srv <> nil then
    begin
      srv := TBank_AccountManager_serv._narrow(_srv);
      if srv <> nil then
        result := srv.open(name)
    end;
  _postinvoke();
end;

//***********************************************************
// TBank_AccountManager_serv
//***********************************************************
function TBank_AccountManager_serv._this(): IBank_AccountManager;
var
  obj: IORBObject;
begin
  obj := this();
  result := TBank_AccountManager._narrow(obj);
end;

function TBank_AccountManager_serv._is_a(const repoid: RepositoryID): Boolean;
begin
  result := repoid = 'IDL:Bank/AccountManager:1.0';
end;

function TBank_AccountManager_serv._primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID;
begin
  result := 'IDL:Bank/AccountManager:1.0';
end;

function TBank_AccountManager_serv._make_stub(const poa: IPOA; const obj : IORBObject): IORBObject;
begin
  result := TBank_AccountManager_stub_clp.Create(poa,obj);
end;

procedure TBank_AccountManager_serv.invoke(const serv: IStaticServerRequest);
begin
  if not _dispatch(serv) then
    begin
      serv.set_exception(BAD_OPERATION.Create(0, COMPLETED_NO) as IORBException);
      serv.write_results();
    end;
end;

function TBank_AccountManager_serv.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:Bank/AccountManager:1.0' then
    begin
      result := Pointer(IBank_AccountManager(self));
      exit;
    end;
end;

class function TBank_AccountManager_serv._narrow(const srv : IServant): IBank_AccountManager;
var
  p: Pointer;
begin
  result := nil;
  if srv = nil then exit;
  p := srv.narrow_helper('IDL:Bank/AccountManager:1.0');
  if p <> nil then
    result := IBank_AccountManager(p)
end;

function TBank_AccountManager_serv._dispatch(const req: IStaticServerRequest): Boolean;
var
  open_result: IBank_Account;
  open_name: AnsiString;
begin
  result := true;
  if req.op_name = 'open' then
    begin
      req.add_in_arg(StaticAny(stat_string,@open_name) as IStaticAny);
      req.set_result(StaticAny(Bank_Account_marshaller,@open_result) as IStaticAny);
      if not req.read_args() then  exit;
      open_result := open(open_name);
      req.write_results();
      exit;
    end;
  result := false;
end;

//***********************************************************
// TBank_AccountManager_marshaller
//***********************************************************
function TBank_AccountManager_marshaller.demarshal(dec: IDecoder;const addr : Pointer): Boolean;
var
  obj: IORBObject;
begin
  result := false;
  if not stat_Object.demarshal(dec,@obj) then exit;
  IBank_AccountManager(addr^) := TBank_AccountManager._narrow(obj);
  result := (obj = nil) or (Pointer(addr^) <> nil);
end;

procedure TBank_AccountManager_marshaller.marshal(enc: IEncoder;const addr : Pointer);
var
  obj: IORBObject;
begin
  obj := IBank_AccountManager(addr^) as IORBObject;
  stat_Object.marshal(enc,@Pointer(obj));
end;

procedure TBank_AccountManager_marshaller._free(var addr: Pointer);
begin
  IBank_AccountManager(addr^) := nil;
end;

procedure TBank_AccountManager_marshaller._create(var addr: Pointer);
begin
  IBank_AccountManager(addr^) := TBank_AccountManager_stub.Create();
end;

procedure TBank_AccountManager_marshaller._assign(dst, src: Pointer);
begin
  IBank_AccountManager(dst^) := IBank_AccountManager(src^);
end;

function TBank_AccountManager_marshaller.typecode: ITypeCode;
begin
  result := _tc_Bank_AccountManager.typecode;
end;

initialization
  Bank_Account_marshaller := TBank_Account_marshaller.Create();
  Bank_AccountManager_marshaller := TBank_AccountManager_marshaller.Create();
  _tc_Bank_Account := CreateTypeCodeConst('010000000e0000002c000000010000001500000049444c3a42616e6b2f4163636f756e743a312e3000000000080000004163636f756e7400');
  _tc_Bank_AccountManager := CreateTypeCodeConst('010000000e00000037000000010000001c00000049444c3a42616e6b2f4163636f756e744d616e616765723a312e30000f000000416363'+
    '6f756e744d616e6167657200');
end.
