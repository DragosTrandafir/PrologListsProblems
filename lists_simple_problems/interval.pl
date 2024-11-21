% transform an interval in a list ,example: [1,7] -> [1,2,3,4,5,6,7]

add_end([],E,[E]).
add_end([H|T],E,R):-
   R = [H|RT],
   add_end(T,E,RT).

% THIS IS THE MAIN FUNCTION 
% interval(M- number, N-number, CL - collector list, R -result list)
% (i,i,i,o)
interval(M,N,CL,CL):-
  N1 is N+1,
  M=:=N1.
interval(M,N,CL,R):-
  (M<N ; M=:=N),
  add_end(CL,M,CLR),
  M1 is M+1,
  interval(M1,N,CLR,R).

% consult("interval.pl").
% interval(2,9,[],R).
