% a. Write a predicate to determine the sum of two numbers written in list representation.
% b. For a heterogeneous list, formed from integer numbers and list of digits, write a predicate to compute the 
% sum of all numbers represented as sublists.
% Eg.: [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] => [8, 2, 2].

add_begin([],E,[E]).
add_begin([H|T],E,[E,H|T]).

% revers(L-list, C-coll list, R-res list) (i,i,o)
revers([],C,C).
revers([H|T],C,R):-
  add_begin(C,H,RES),
  revers(T,RES,R).


% transform a list in a number
% listToN(L-list,N-number,P-decimal pointer, RN-result number)

listToN([],N,_,N).
listToN([H|T],N,P,RN):-
  N1 is N+H*P,
  P1 is P*10,
  listToN(T,N1,P1,RN).

% nToList(N-number, C-col list, L-list)
nToList(0,C,C).
nToList(N,C,L):-
  UC is (N mod 10),
  add_begin(C,UC,RES),
  N1 is N//10,
  nToList(N1,RES,L).



% sum2Lists(L1-list , L2-list, R-result list)

% MAIN PREDICATE a.
sum2Lists(L1,L2,R):-
  revers(L1,[],L1R),
  revers(L2,[],L2R),
  listToN(L1R,0,1,N1),
  listToN(L2R,0,1,N2),
  S is N1+N2,
  nToList(S,[],R).




% sumAllHet(HL-heterogeneous list, LAST-last list sum (=[0]), R-result list)
sumAllHet([H],LAST,SUM):-
  is_list(H),!,
  sum2Lists(H,LAST,SUM).

sumAllHet([_],LAST,LAST).

sumAllHet([H|T],LAST,R):-
  is_list(H),!,
  sum2Lists(H,LAST,SUM),
  sumAllHet(T,SUM,R).

sumAllHet([_|T],LAST,R):-
  sumAllHet(T,LAST,R).

% MAIN PREDICATE b.
mainSumAllHet(L,R):-sumAllHet(L,[0],R).


% consult("sumAsList.pl").
% revers([1,2,3,4],[],R). 
% listToN([1,2,3,4],0,1,R). 
% nToList(123,[],L).
% sum2Lists([1,2,3],[5,6,7],R).
% mainSumAllHet([1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6],R).
