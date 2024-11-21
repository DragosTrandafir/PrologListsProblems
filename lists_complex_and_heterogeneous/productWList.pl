% Determine the product of a number represented as digits in a list to a given digit. 
% Eg.: [1 9 3 5 9 9] * 2 => [3 8 7 1 9 8]


% add_begin(L-list,R-result) (i,o)

add_begin([],E,[E]).
add_begin([H|T],E,[E,H|T]).

% rev_list(L-list , C-collector, R -result) (i,i,o) 

rev_list([],C,C).
rev_list([H|T],C,R):-
  add_begin(C,H,RES),
  rev_list(T,RES,R).



% listToN(L-list, C-collector, P-decimal index, N-number) (i,i,i,o)
listToN([],C,_,C).
listToN([H|T],C,P,N):-
  C1 is C+H*P,
  P1 is P*10,
  listToN(T,C1,P1,N).

% nToList(N-number, C-collector, R-result) (i,i,o)
nToList(0,C,C).
nToList(N,C,R):-
  UC is N mod 10,
  N1 is N//10,
  add_begin(C,UC,CNEW),
  nToList(N1,CNEW,R).

% productL(L-list, K-product quantifier, R-result) (i,i,o)

% THIS IS THE MAIN PREDICATE 
productL(L,K,R):-
  rev_list(L,[],RES),
  listToN(RES,0,1,LN),
  P is LN*K,
  nToList(P,[],R).



% consult("productWList.pl").
% rev_list([1,2,3,4],[],R).
% listToN([1,2,3,4],0,1,R).
% nToList(1234,[],R).
% productL([1, 9, 3, 5, 9, 9],10,R ).