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
// Compiled with parameters: " -i./ ./\inheritance.idl" 
//                                                                            
unit inheritance_int;

{$MINENUMSIZE 4}

interface

uses
  orbtypes, code_int, orb_int;

type

  IBase = interface
  ['{7B562A07-DD2A-4BA8-975D-4427F16A7873}']
    procedure op1;
  end;

  IDerived = interface(IBase)
  ['{F9AF7172-525A-4DE6-A902-0FBF4F294A8B}']
    procedure op2;
  end;

  IFinal = interface(IDerived)
  ['{87794EA0-9E6B-41C8-A56E-70D6EF58B3F7}']
    procedure op3;
  end;

implementation

end.
