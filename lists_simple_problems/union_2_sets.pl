% union of 2 sets


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

% add to the first list, the second list
add_tail(C,[],C).
add_tail(C,[H2|T2],R):- % C -list
   add_end(C,H2,CN),
   add_tail(CN,T2,R).

% remove doubles - keep only last occurence
% rem(L-list,C-collector list, R-result list)

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




% THIS IS THE MAIN FUNCTION 
union(A,B,RZ):-
  add_tail(A,B,R),
  rem(R,[],RZ).

% consult("union_2_sets.pl").
% rem([1,2,3,4,5,1,2,3,6,7,8],[],R).