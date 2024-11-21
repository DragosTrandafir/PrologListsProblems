% insert at a certain position in a list

ins([],_,P,[]):=P>1.
ins([],E,P,[E]):-P=:=1.
ins(L,E,P,R):-
   P=:=1,
   R=[E|L].
ins([H|T],E,P,R):-
   P>1,
   R=[H|RT],
   P1 is P-1,
   ins(T,E,P1,RT).

% consult("insertAtPos.pl").
% ins([1,2,3,4],77,2,R).
