% replace every element E from a list with a certain list


% add_end(L-list, E-elem, R-result) (i,i,o)
add_end([],E,[E]).
add_end([H|T],E,[H|R]):-
  add_end(T,E,R).

% addListToList(L1-list1, L2-list2, R -result) (i,i,o)
addListToList(L1,[],L1).
addListToList(L1,[H|T],R):-
  add_end(L1,H,L1N),
  addListToList(L1N,T,R).


% replace(L-list, E- elem to be replaced, LR-list to replace with, C-collector, R-result) (i,i,i,i,o)
replace([],_,_,C,C).
replace([H|T],E,LR,C,R):-
  H=:=E,!,
  addListToList(C,LR,NEWC),
  replace(T,E,LR,NEWC,R).
replace([H|T],E,LR,C,R):-
  add_end(C,H,NEWC),
  replace(T,E,LR,NEWC,R).

% THIS IS THE MAIN FUNCTION 
mainReplace(L,E,LR,R):-replace(L,E,LR,[],R).

test():-
  mainReplace([1,2,2,1,3,1,2],1,[0,0],[0,0,2,2,0,0,3,0,0,2]),
  mainReplace([],1,[],[]).

% consult("replaceElemWithList.pl").
% addListToList([1,2,3,4],[7,6,5],R).
% replace([1,2,2,1,3,1,2],1,[0,0],[],R).
% mainReplace([1,2,2,1,3,1,2],1,[0,0],R).
% test().