% remove first occurence of element in a list

delete1([],_,[]).
delete1([H|T],E,R):-
   H=:=E,
   R=T.
delete1([H|T],E,R):-
  H=\=E,
  R=[H|RT],
  delete1(T,E,RT).

% consult("removeFirstOccurence.pl").
% delete1([1,2,3,4,1,2,3,1],1,R).