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
// Compiled with parameters: " -notabs -impl -i../..//idl -i./ ./\bench.idl" 
//                                                                            
unit bench_int;

{$MINENUMSIZE 4}

interface

uses
  orbtypes, code_int, orb_int;

type

  IBench = interface
  ['{DF063334-2D8B-4884-95DF-108650912152}']
    procedure f;
    procedure sync;
    procedure g;
    procedure connect(const b: IBench; const level: long);
  end;

implementation

end.
