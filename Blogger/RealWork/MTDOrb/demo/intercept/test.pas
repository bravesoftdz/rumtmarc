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
// Compiled with parameters: " -i../..//idl -i./ ./\test.idl" 
//                                                                            
unit test;

interface

uses
  Classes, orb_int, orb, req_int, code_int, env_int, stdstat, std_seq,imr, imr_int, 
  orbtypes, exceptions, except_int, test_int, poa_int, poa;

type

  {** IDL:MyTest:1.0 } 
  TMyTest = class(TORBObject,IMyTest)
  protected
    procedure Foo(var str: AnsiString); virtual; abstract;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    class function _narrow(const obj : IORBObject): IMyTest;
    class function narrow_helper2(const obj: IORBObject): Boolean;
  end;

  {** stub for interface IDL:MyTest:1.0} 
  TMyTest_stub = class(TMyTest)
  protected
    procedure Foo(var str: AnsiString); override;
  end;

  {** POA stub for interface IDL:MyTest:1.0} 
  TMyTest_stub_clp = class(TPOAStub,IPOAStub,IMyTest)
  protected
    procedure Foo(var str: AnsiString); virtual;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  end;

  {** servant for interface IDL:MyTest:1.0} 
  TMyTest_serv = class(TPOAStaticImplementation,IPOAStaticImplementation,IServant,IMyTest)
  protected
    procedure Foo(var str: AnsiString); virtual; abstract;
    function _primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID; override;
    function _make_stub(const poa: IPOA; const obj : IORBObject): IORBObject; override;
    function _is_a(const repoid: RepositoryID): Boolean; override;
    procedure invoke(const serv: IStaticServerRequest); override;
    function _dispatch(const req: IStaticServerRequest): Boolean;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    function _this(): IMyTest;
    class function _narrow(const srv : IServant): IMyTest;
  end;

  TMyTest_marshaller = class(TAbstractStat,IStaticTypeInfo)
  protected
    procedure _assign(dst,src: Pointer); override;
    function demarshal(dec: IDecoder;const addr : Pointer): Boolean;
    procedure marshal(enc: IEncoder; const addr : Pointer);
    procedure _create(var addr: Pointer); override;
    procedure _free(var addr: Pointer);
    function typecode: ITypeCode; override;
  end;

var
  MyTest_marshaller : IStaticTypeInfo;
  _tc_MyTest : ITypeCodeConst;

implementation

uses
  SysUtils, any, tcode, static, throw;

//***********************************************************
// TMyTest
//***********************************************************
function TMyTest.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:MyTest:1.0' then
    begin
      result := Pointer(self as IMyTest);
      exit;
    end;
end;

class function TMyTest._narrow(const obj : IORBObject): IMyTest;
var
  p: Pointer;
  stub: TMyTest_stub;
begin
  result := nil;
  if obj = nil then exit;
  p := obj.narrow_helper('IDL:MyTest:1.0');
  if p <> nil then
    result := IMyTest(p)
  else
    begin
      if narrow_helper2(obj) or obj._is_a_remote('IDL:MyTest:1.0') then
        begin
          stub := TMyTest_stub.Create();
          stub.assign(obj);
          result := stub;
        end;
    end;
end;

class function TMyTest.narrow_helper2(const obj: IORBObject): Boolean;
begin
  result := obj._repoid = 'IDL:MyTest:1.0'
end;

//***********************************************************
// TMyTest_stub
//***********************************************************
procedure TMyTest_stub.Foo(var str: AnsiString);
var
  req: IStaticRequest;
  _str: IStaticAny;
begin
  _str := StaticAny(stat_string,@str);
  req := StaticRequest(self,'Foo');
  req.add_inout_arg(_str);
  req.invoke;
  dorb_static_throw(req);
end;

//***********************************************************
// TMyTest_stub_clp
//***********************************************************
function TMyTest_stub_clp.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:MyTest:1.0' then
    begin
      result := Pointer(self as IMyTest);
      exit;
  end;
end;

procedure TMyTest_stub_clp.Foo(var str: AnsiString);
var
  _srv: IServant;
  srv: IMyTest;
begin
  _srv := _preinvoke();
  if _srv <> nil then
    begin
      srv := TMyTest_serv._narrow(_srv);
      if srv <> nil then
        srv.Foo(str)
    end;
  _postinvoke();
end;

//***********************************************************
// TMyTest_serv
//***********************************************************
function TMyTest_serv._this(): IMyTest;
var
  obj: IORBObject;
begin
  obj := this();
  result := TMyTest._narrow(obj);
end;

function TMyTest_serv._is_a(const repoid: RepositoryID): Boolean;
begin
  result := repoid = 'IDL:MyTest:1.0';
end;

function TMyTest_serv._primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID;
begin
  result := 'IDL:MyTest:1.0';
end;

function TMyTest_serv._make_stub(const poa: IPOA; const obj : IORBObject): IORBObject;
begin
  result := TMyTest_stub_clp.Create(poa,obj);
end;

procedure TMyTest_serv.invoke(const serv: IStaticServerRequest);
begin
  if not _dispatch(serv) then
    begin
      serv.set_exception(BAD_OPERATION.Create(0, COMPLETED_NO) as IORBException);
      serv.write_results();
    end;
end;

function TMyTest_serv.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:MyTest:1.0' then
    begin
      result := Pointer(IMyTest(self));
      exit;
    end;
end;

class function TMyTest_serv._narrow(const srv : IServant): IMyTest;
var
  p: Pointer;
begin
  result := nil;
  if srv = nil then exit;
  p := srv.narrow_helper('IDL:MyTest:1.0');
  if p <> nil then
    result := IMyTest(p)
end;

function TMyTest_serv._dispatch(const req: IStaticServerRequest): Boolean;
var
  Foo_str: AnsiString;
begin
  result := true;
  if req.op_name = 'Foo' then
    begin
      req.add_inout_arg(StaticAny(stat_string,@Foo_str) as IStaticAny);
      if not req.read_args() then  exit;
      Foo(Foo_str);
      req.write_results();
      exit;
    end;
  result := false;
end;

//***********************************************************
// TMyTest_marshaller
//***********************************************************
function TMyTest_marshaller.demarshal(dec: IDecoder;const addr : Pointer): Boolean;
var
  obj: IORBObject;
begin
  result := false;
  if not stat_Object.demarshal(dec,@obj) then exit;
  IMyTest(addr^) := TMyTest._narrow(obj);
  result := (obj = nil) or (Pointer(addr^) <> nil);
end;

procedure TMyTest_marshaller.marshal(enc: IEncoder;const addr : Pointer);
var
  obj: IORBObject;
begin
  obj := IMyTest(addr^) as IORBObject;
  stat_Object.marshal(enc,@Pointer(obj));
end;

procedure TMyTest_marshaller._free(var addr: Pointer);
begin
  IMyTest(addr^) := nil;
end;

procedure TMyTest_marshaller._create(var addr: Pointer);
begin
  IMyTest(addr^) := TMyTest_stub.Create();
end;

procedure TMyTest_marshaller._assign(dst, src: Pointer);
begin
  IMyTest(dst^) := IMyTest(src^);
end;

function TMyTest_marshaller.typecode: ITypeCode;
begin
  result := _tc_MyTest.typecode;
end;

initialization
  MyTest_marshaller := TMyTest_marshaller.Create();
  _tc_MyTest := CreateTypeCodeConst('010000000e00000023000000010000000f00000049444c3a4d79546573743a312e300000070000004d795465737400');
end.
