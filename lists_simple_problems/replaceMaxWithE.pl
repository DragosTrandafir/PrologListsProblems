% replace every element E in a list with the maximum from that list

% add_end(L-list, E-elem, R-result) (i,i,o)

add_end([],E,[E]).
add_end([H|T],E,R):-
  R=[H|RT],
  add_end(T,E,RT).


% maxx(L-list, C-collector(=-1000),R-result maxim) (i,i,o)

maxx([],C,C).
maxx([H|T],C,R):-
  H>C,!,
  C1 is H,
  maxx(T,C1,R).
maxx([_|T],C,R):-
  maxx(T,C,R).

% replaceEwMax(L-list, E -elem, NEWE- element to replace with, C-collector list, R-result list)

replaceEwMax([],_,_,C,C).
replaceEwMax([H|T],E,NEWE,C,R):-
  H=:=E,!,
  add_end(C,NEWE,C1),
  replaceEwMax(T,E,NEWE,C1,R).
replaceEwMax([H|T],E,NEWE,C,R):-
  add_end(C,H,C1),
  replaceEwMax(T,E,NEWE,C1,R).

% THIS IS THE MAIN FUNCTION 
mainReplace(L,E,R):-
  maxx(L,-1000,MAX),
  replaceEwMax(L,E,MAX,[],R).

% consult("replaceMaxWithE.pl").
% maxx([1,2,3,2,3,1],-1000,R).
% replaceEwMax([1,2,3,2,3,1,4,5,6,1],1,-1,[],R).
% mainReplace([1,2,3,4,5,1,2,9],1,R).