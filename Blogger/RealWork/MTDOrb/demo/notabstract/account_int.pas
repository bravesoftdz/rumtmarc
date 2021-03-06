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
// Compiled with parameters: " -poa -notabs -i../..//idl -i./ ./\account.idl" 
//                                                                            
unit account_int;

{$MINENUMSIZE 4}

interface

uses
  orbtypes, code_int, orb_int;

type

// module Bank types

  IBank_Account = interface
  ['{11B51B76-7EF4-4F9B-B912-53CE3DF7B47F}']
    function balance: Float;
  end;

  IBank_AccountEx = interface(IBank_Account)
  ['{34435AD3-F390-4832-A638-FE9765BE05C1}']
    procedure debit(const value: Double);
    procedure credit(const value: Double);
  end;

implementation

end.
