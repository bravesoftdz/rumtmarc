// **********************************************************************
//                                                                       
// Generated by the MTDORB IDL-to-Pascal Translator, 26.11.2001 19:03
//                                                                       
// Copyright (c) 2001                                                    
// Millennium Group.                                                     
// Samara, Russia                                                        
//                                                                       
// All Rights Reserved                                                   
//                                                                       
// **********************************************************************
unit bootmanager_int;

{$MINENUMSIZE 4}

interface

uses
  code_int, orb_int, orbtypes, except_int, iior_int;

type
  IBootLocator = interface;

  INotFound = interface(IUserException)
  ['{3836EE96-2FEF-472A-8E92-70571169DB90}']
  end;

  IAlreadyExists = interface(IUserException)
  ['{6262BFB3-2851-4944-8CAC-32D03B7B24D7}']
  end;

  IBootManager = interface
  ['{D2B3C356-AEAF-495C-A0B3-1A213937B563}']
    procedure add_binding(const oid: ObjectId; const obj: IORBObject);
    procedure remove_binding(const oid: ObjectId);
    procedure set_locator(const locator: IBootLocator);
    function locate(const oid: ObjectId): IORBObject;//IIOR;
  end;

  IBootLocator = interface
  ['{6637BEB4-A26C-4D1B-B214-045644A4F5F2}']
    procedure locate(const oid: ObjectId; out obj: IORBObject; out add: boolean);
  end;

implementation

end.
