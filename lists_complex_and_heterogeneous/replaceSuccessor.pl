%  For a heterogeneous list, formed from integer numbers and list of numbers, determine the successor of a 
% sublist considered as a number.
% [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] => 
% [1, [2, 4], 4, 5, [6, 8, 0], 10, 11, [1, 2, 1], 6]


addEnd([],E,[E]).
addEnd([H|T],E,[H|R]):-
  addEnd(T,E,R).

add_begin([],E,[E]).
add_begin([H|T],E,[E,H|T]).

% reverseList(L-list, C-collector, R-reversedlist) (i,i,o) 1
revList([],C,C).
revList([H|T],C,R):-
  add_begin(C,H,RES),
  revList(T,RES,R).



% listToN(L-list, C-collector(=0),P-quantifier(=1), N-number) (i,i,o)

listToN([],C,_,C).
listToN([H|T],C,P,N):-
  C1 is C+P*H,
  P1 is P*10,
  listToN(T,C1,P1,N).


% nToList(N-number, C-collector([]), R-list)

nToList(0,C,C).
nToList(N,C,R):-
  UC is N mod 10,
  N1 is N//10,
  add_begin(C,UC,RES),
  nToList(N1,RES,R).
  
% successorL(L-list, R-result list successor) (i,o)

successor(L,R):-
  revList(L,[],REV),
  listToN(REV,0,1,N),
  N1 is N+1,
  nToList(N1,[],R).

% THIS IS THE MAIN PREDICATE
transform([],C,C).
transform([H|T],C,R):-
  is_list(H),!,
  successor(H,SUC),
  addEnd(C,SUC,CNEW),
  transform(T,CNEW,R).
transform([H|T],C,R):-
  addEnd(C,H,CNEW),
  transform(T,CNEW,R).

% consult("replaceSuccessor.pl"). add_begin([1,2,3],1,R).
% consult("replaceSuccessor.pl"). revList([12,3,4],[],C).
% consult("replaceSuccessor.pl"). listToN([0,3,1],0,1,N).
% consult("replaceSuccessor.pl"). nToList(780,[],R).
% consult("replaceSuccessor.pl"). successor( [1,2,0],R).
% consult("replaceSuccessor.pl"). transform([1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6],[],R).