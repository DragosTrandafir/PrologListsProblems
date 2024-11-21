% a. Define a predicate to add after every element from a list, the divisors of that number.
% b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to add in 
% every sublist the divisors of every element.
% Eg.: [1, [2, 5, 7], 4, 5, [1, 4], 3, 2, [6, 2, 1], 4, [7, 2, 8, 1], 2] =>
% [1, [2, 5, 7], 4, 5, [1, 4, 2], 3, 2, [6, 2, 3, 2, 1], 4, [7, 2, 8, 2, 4, 1], 2]


% add end
add_end([],E,[E]).
add_end([H|T],E,[H|R]):-
  add_end(T,E,R).

% divisors of N (divizori proprii)
% divisors(N-number, D-divisor(=N//2), C-collector list, R-result list) (i,i,i,o)
divisors(_,1,C,C).
divisors(N,D,C,R):-
  N mod D =:=0,!,
  add_end(C,D,CR),
  D1 is D-1,
  divisors(N,D1,CR,R).
divisors(N,D,C,R):-
  D1 is D-1,
  divisors(N,D1,C,R).

mainDivisors(-1,R):-
  divisors(_,1,[],R).
mainDivisors(0,R):-
  divisors(_,1,[],R).
mainDivisors(1,R):-
  divisors(_,1,[],R).
mainDivisors(N,R):-
  N1 is N//2,
  divisors(N,N1,[],R).

add_all([],C,C).
add_all([H|T],C,R):-
  add_end(C,H,CR),
  add_all(T,CR,R).

% add_divisors(L-list,C-collectors list, R-result list)
add_divisors([],C,C).
add_divisors([H|T],C,R):-
  add_end(C,H,CR),
  mainDivisors(H,DIVS),
  add_all(DIVS,CR,RZ),
  add_divisors(T,RZ,R).

% MAIN PREDICATE a.
mainAdd_divisors(L,R):-add_divisors(L,[],R).

% consult("addDivisorsAfterElems.pl").
% mainDivisors(12,R).
% mainAdd_divisors([7,2,8,1],R).
% transform([[6, 2, 1], 4, [7, 2, 8, 1], 2] ,[],R).

% MAIN PREDICATE b.
% for h list
transform([],C,C).
transform([H|T],C,R):-
  is_list(H),!,
  mainAdd_divisors(H,RES),
  add_end(C,RES,CNEW),
  transform(T,CNEW,R).
transform([H|T],C,R):-
  add_end(C,H,CNEW),
  transform(T,CNEW,R).