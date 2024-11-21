% Write a predicate to add a value v after 1-st, 2-nd, 4-th, 8-th, … element in a list.

% 1,2,4,8,16...

ins3([],_,P,_,[]):-P>1.
ins3([],E,P,_,[E]):-P=:=1.
ins3([H|T],E,P,OP,[H,E|R]):-
   P=:=1, % we go on adding
   NextP is OP * 2,   % -1
   ins3(T,E,OP,NextP,R).
ins3([H|T],E,P,OP,[H|R]):-
   P>1,
   P1 is P-1,
   ins3(T,E,P1,OP,R).

% THIS IS THE MAIN FUNCTION 
ins3Main(L,E,R):-ins3(L,E,1,1,R).

% consult("addAfterPowersOf2Position.pl").
% ins3Main([1,2,3,4,5,6,7],66,R).