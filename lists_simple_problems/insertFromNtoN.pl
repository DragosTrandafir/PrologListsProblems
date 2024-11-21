% insert from n to n positions in a list

% ins2(L-list, E-elem, P- pos, OP- original position, R-result list)
% din k in k pozitii
ins2([],_,P,_,[]):-P>1.
ins2([],E,P,_,[E]):-P=:=1.
ins2(L,E,P,OP,R):-
   P=:=1,
   R=[E|RT], % we go on adding
   ins2(L,E,OP,OP,RT).
ins2([H|T],E,P,OP,R):-
   P>1,
   P1 is P-1,
   R=[H|RT],
   ins2(T,E,P1,OP,RT).

% THIS IS THE MAIN FUNCTION 
ins2Main(L,E,P,R):-ins2(L,E,P,P,R).


% consult("insertFromNToN.pl").
% ins2Main([1,2,3,4,5,6,7],66,2,R).