% difference of 2 sets : (A\B) U (B\A)


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
   add(C,H2,CN),
   add_tail(CN,T2,R).


% aMinusB(A- list, B-list, C- collector list, R -result list)
% fm(i,i,o)
aMinusB([],[],_,[]).
aMinusB(A,[],_,A).
aMinusB([],_,C,C).
aMinusB([H1|T1],B,C,RZ):-
  search(H1,B,R),
  R=:=0,
  add(C,H1,CN),
  aMinusB(T1,B,CN,RZ).
aMinusB([H1|T1],B,C,RZ):-
  search(H1,B,R),
  R=:=1,
  aMinusB(T1,B,C,RZ).

% difference of 2 dif_2_sets

% THIS IS THE MAIN FUNCTION 
mainDifference(A,B,R):-
  aMinusB(A,B,[],RZ1),
  aMinusB(B,A,[],RZ2),
  add_tail(RZ1,RZ2,R1),
  R=R1.

% consult("dif_2_sets.pl").
% search(2,[1,3,4],R).
% aMinusB([1,2,3,4],[1,7,8,9,2],[],RZ).
% mainDifference([1,2,3,4],[1,7,8,9,2],R).
