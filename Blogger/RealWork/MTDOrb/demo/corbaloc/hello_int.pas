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
// Compiled with parameters: " -i../..//idl -i./ ./\hello.idl" 
//                                                                            
unit hello_int;

{$MINENUMSIZE 4}

interface

uses
  orbtypes, code_int, orb_int;

type

  IHello = interface
  ['{39F96C0A-7A83-4696-A90C-1E8D493F4FBA}']
    procedure hello;
  end;

implementation

end.
