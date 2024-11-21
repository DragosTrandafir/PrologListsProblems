% Sort a list with keeping double values in resulted list. E.g.: [4 2 6 2 3 4] --> [2 2 3 4 4 6]


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



% remove2(L-list, V-value, C-collector list, F- flag(1-not removed, 0-removed), R-result list) - only first occ
remove2([],_,C,_,C).
remove2([H|T],V,C,F,R):-
  H=:=V,
  F=:=1,
  remove2(T,V,C,0,R).
remove2([H|T],V,C,F,R):-
  ((H=:=V, F=:=0);H=\=V),
  add_end(C,H,RES),
  remove2(T,V,RES,F,R).
mainRemove(L,V,R):-remove2(L,V,[],1,R).

% sorting a set (ascendingly)
% sortL(L-collector,C-collector list, R-result list)

% THIS IS THE MAIN FUNCTION 
sortL([],C,C).
sortL(L,C,R):-
  mainMinn(L,M),
  mainRemove(L,M,RES),
  add_end(C,M,CNEW),
  sortL(RES,CNEW,R).

% consult("sortAndKeepDoubles.pl").
% mainMinn([1,2,4,7,8,1,2,1],R).
% mainRemove([1,2,3,4,5],1,R).
% sortL([3,2,4,1,6,7,3,2,1],[],R).
% sortL([1,1,1],[],R).