% Sort a list with removing the double values. E.g.: [4 2 6 2 3 4] --> [2 3 4 6]

% remove doubles (keep only the last occ)

% add end
add_end([],E,[E]).
add_end([H|T],E,[H|R]):-
  add_end(T,E,R).

% determine minn(L-list, CM - current minim ,M- value of min)

minn([],CM,CM).
minn([H|T],CM,M):-
  H<CM,!,
  minn(T,H,M).
minn([_|T],CM,M):-
  minn(T,CM,M).
mainMinn(L,M):-minn(L,10000,M).



% remove(L-list, V-value, C-collector list, R-result list)
remove([],_,C,C).
remove([H|T],V,C,R):-
  H=:=V,!,
  remove(T,V,C,R).
remove([H|T],V,C,R):-
  add_end(C,H,RES),
  remove(T,V,RES,R).
mainRemove(L,V,R):-remove(L,V,[],R).

% search(L-list, E-list) (i,i)
search([H],E):-
  H=:=E.
search([H|_],E):-
  H=:=E.
search([H|T],E):-
  H=\=E,
  search(T,E).

% listToSet(L-list, C-collector, R- list set)

listToSet([],C,C).
listToSet([H|T],C,R):-
  search(T,H),
  listToSet(T,C,R).
listToSet([H|T],C,R):-
  \+ search(T,H),
  add_end(C,H,CNEW),
  listToSet(T,CNEW,R).


% sorting a set (ascendingly)
% sortL(L-collector,C-collector list, R-result list)
sortL([],C,C).
sortL(L,C,R):-
  mainMinn(L,M),
  mainRemove(L,M,RES),
  add_end(C,M,CNEW),
  sortL(RES,CNEW,R).

% THIS IS THE MAIN FUNCTION 
mainOfMains(L,R):-
  listToSet(L,[],SET),
  sortL(SET,[],R).

% consult("sortAndMakeSet.pl").
% mainMinn([1,2,4,7,8,1,2,1],R).
% mainRemove([1,2,3,4,5],1,R).
% sortL([3,2,4,1,6,7],[],R).
% search([1,2,3],4).
% listToSet([4,2,6,2,3,4],[],R).
% mainOfMains([1,1,1],R). 
