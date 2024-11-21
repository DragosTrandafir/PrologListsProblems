% transform a list in the set considering the first occurance of elements

% add_begin(L-list, E -element, R -result list)

add_begin([],E,[E]).
add_begin([H|T],E,R):-
  R=[E,H|T].


% search(E-elem, L-list, R- 0 or 1)
% fm(i,i,o)

search(_,[],0).
search(E,[H|T],R):- % R = 0 first
  H=\=E,!,
  search(E,T,R).
search(_,[_|_],R):-
  R=1.

add([],E,[E]).
add([H|T],E,[H|R]):-
  add(T,E,R).

% reverse list(L-list, C-collector list, R -result list)
revs([],C,C).
revs([H|T],C,R):-
  add_begin(C,H,RZ),
  revs(T,RZ,R).

rem([],C,C).
rem([H|T],C,R):-
  search(H,T,RZ),
  RZ =:= 0,
  add(C,H,CN),
  rem(T,CN,R).
rem([H|T],C,R):-
  search(H,T,RZ),
  RZ =:= 1,
  rem(T,C,R).

% remove doubles - keep only first occurence
% rem2(L-list, R-result list)

% THIS IS THE MAIN FUNCTION 
rem2([],[]).
rem2([H|T],RZ2):-
  revs([H|T],[],RZ),
  rem(RZ,[],RZ1),
  revs(RZ1,[],RZ2).

% consult("toSet_firstOcc.pl").
% add_begin([1,2,3,4],88,R).
% revs([1,2,3,4,5],[],R).
% revs([],[],R).
% rem2([1,2,3,4,2,3,4,9],R).