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
unit bench_impl;

interface

uses
  orb_int, orb, req_int, code_int, imr, imr_int, env_int, except_int, orbtypes,
  exceptions, stdstat, std_seq, Classes, bench_int, bench, poa_int;

type

  TBench_impl = class(TBench_serv)
    procedure f; override;
    procedure sync; override;
    procedure g; override;
    procedure connect(const b: IBench; const level: long); override;
  end;

implementation

//***********************************************************
// Bench_impl
//***********************************************************
procedure TBench_impl.f;
begin
  // TODO
end;

procedure TBench_impl.sync;
begin
  // TODO
end;

procedure TBench_impl.g;
begin
  // TODO
end;

procedure TBench_impl.connect(const b: IBench; const level: long);
begin
  // TODO
end;

end.
