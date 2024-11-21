add_end([],E,[E]).
add_end([H|T],E,[H|R]):-
  add_end(T,E,R).

% Merge two sorted lists with removing the double values

% merge(L1-list, L2-list, R-result list) (i,i,o)

merge(L1,[],L1).
merge(L1,[H|T],R):-
  add_end(L1,H,NEW),
  merge(NEW,T,R).



% search(L-list, E-list) (i,i)
search([H],E):-
  H=:=E.
search([H|_],E):-
  H=:=E.
search([H|T],E):-
  H=\=E,
  search(T,E).

% listToSet(L-list, C-collector, S-result)


listToSet([],C,C).
listToSet([H|T],C,S):-
  search(T,H),
  listToSet(T,C,S).
listToSet([H|T],C,S):-
  \+ search(T,H),
  add_end(C,H,CNEW),
  listToSet(T,CNEW,S).

% THIS IS THE MAIN PREDICATE
mergeAndMakeSet(L1,L2,R):-
  merge(L1,L2,RES),
  listToSet(RES,[],R).

% consult("mergeAndMakeSet.pl").
% merge([2,3,3],[1,4,6],R).
% search([1,2,3,4],4,0).
% listToSet([1,2,3,4,5,1,3,5,2],[],S).
% mergeAndMakeSet([2,3,3],[1,4,6],R).

