// ***************************************************************************
//                                                                            
// Generated by the MTDORB IDL-to-Pascal Translator (1.0.1b1), 21.09.2010 13:26
//                                                                            
// Copyright (c) 2002 - 2004                                                  
// Millennium Group.                                                          
// Samara, Russia                                                             
//                                                                            
// All Rights Reserved                                                        
//                                                                            
// ***************************************************************************
// Compiled with parameters: " -i../..//idl -i./ ./\Test.idl" 
//                                                                            
unit Test_int;

{$MINENUMSIZE 4}

interface

uses
  orbtypes, code_int, orb_int;

type

  IClientObject = interface
  ['{0C8A7298-4B47-4187-A02A-AC572A542461}']
    procedure Foo;
  end;

  IServerObject = interface
  ['{95828207-F84A-450C-9023-02582112F9C0}']
    procedure set_client_object(const obj: IClientObject);
  end;

implementation

end.
