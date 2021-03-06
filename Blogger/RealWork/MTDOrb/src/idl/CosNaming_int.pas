// ***************************************************************************
//                                                                            
// Generated by the MTDORB IDL-to-Pascal Translator (1.0.1b1), 21.09.2010 13:25
//                                                                            
// Copyright (c) 2002 - 2004                                                  
// Millennium Group.                                                          
// Samara, Russia                                                             
//                                                                            
// All Rights Reserved                                                        
//                                                                            
// ***************************************************************************
// Compiled with parameters: " -without-prefix -i..\..\idl ..\..\idl\CosNaming.idl" 
//                                                                            
unit CosNaming_int;

{$MINENUMSIZE 4}

interface

uses
  orbtypes, code_int, orb_int, except_int;

type

  INamingContext = interface;

  IBindingIterator = interface;

// module CosNaming types

  TIstring = AnsiString;

  TNameComponent = record
    id : TIstring;
    kind : TIstring;
  end;

  TName = Array of TNameComponent;

  TBindingType = (
    nobject,
    ncontext
  );

  TBinding = record
    binding_name : TName;
    binding_type : TBindingType;
  end;

  TBindingList = Array of TBinding;

  TNotFoundReason = (
    missing_node,
    not_context,
    not_object
  );

  INotFound = interface(IUserException)
  ['{590F97F9-374D-43C8-8A27-1214492A25AC}']
    function why: TNotFoundReason; overload;
    procedure why(const val : TNotFoundReason); overload;
    function rest_of_name: TName; overload;
    procedure rest_of_name(const val : TName); overload;
  end;

  ICannotProceed = interface(IUserException)
  ['{D62449F8-32F3-4B8D-B18A-B0E13A11A612}']
    function cxt: INamingContext; overload;
    procedure cxt(const val : INamingContext); overload;
    function rest_of_name: TName; overload;
    procedure rest_of_name(const val : TName); overload;
  end;

  IInvalidName = interface(IUserException)
  ['{C9C69AF3-60A2-40C4-B924-8F10C35A1A42}']
  end;

  IAlreadyBound = interface(IUserException)
  ['{96640AEA-ED21-4B41-A5A1-21E1F9BF3A82}']
  end;

  INotEmpty = interface(IUserException)
  ['{49ADE4E7-0594-4BFA-9360-BC333DEF2E4F}']
  end;

  INamingContext = interface
  ['{DE96A95D-9574-46FC-A67C-6674E4672A27}']
    procedure bind(const n: TName; const obj: IORBObject);
    procedure rebind(const n: TName; const obj: IORBObject);
    procedure bind_context(const n: TName; const nc: INamingContext);
    procedure rebind_context(const n: TName; const nc: INamingContext);
    function resolve(const n: TName): IORBObject;
    procedure unbind(const n: TName);
    function new_context: INamingContext;
    function bind_new_context(const n: TName): INamingContext;
    procedure _destroy;
    procedure list(const how_many: _ulong; out bl: TBindingList; out bi: IBindingIterator);
  end;

  IBindingIterator = interface
  ['{012B571A-E371-4983-BF4C-1BD9C9081FAE}']
    function next_one(out b: TBinding): Boolean;
    function next_n(const how_many: _ulong; out bl: TBindingList): Boolean;
    procedure _destroy;
  end;

  TStringName = AnsiString;

  TAddress = AnsiString;

  TURLString = AnsiString;

  IInvalidAddress = interface(IUserException)
  ['{71C8271C-65F4-4CAE-A8EB-A1C141FF2D4E}']
  end;

  INamingContextExt = interface(INamingContext)
  ['{B708F554-945E-4BE8-8E26-2DA189713FE5}']
    function to_string(const n: TName): TStringName;
    function to_name(const sn: TStringName): TName;
    function to_url(const addr: TAddress; const sn: TStringName): TURLString;
    function resolve_str(const n: TStringName): IORBObject;
  end;

implementation

end.
