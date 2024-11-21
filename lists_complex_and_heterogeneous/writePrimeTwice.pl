% a. For a list of integer numbers, define a predicate to write twice in list every prime number.

% isPrime(N-number, D-divisor, F-flag (0 or 1), R -result)

isPrime(_,1,F,F).
isPrime(N,D,_,0):-
  N mod D =:=0.
isPrime(N,D,F,R):-
  N mod D =\=0,
  D1 is D-1,
  isPrime(N,D1,F,R).

isPrimeMain(N,R):-
  D1 is N//2,
  D1 =:=0,
  R=0.
isPrimeMain(N,R):-
  D1 is N//2,
  D1 =\=0,
  isPrime(N,D1,1,R).

% add end
add_end([],E,[E]).
add_end([H|T],E,[H|R]):-
  add_end(T,E,R).

% THIS IS THE MAIN PREDICATE
transform([],C,C).
transform([H|T],C,R):-
  isPrimeMain(H,RES),
  RES =:=1,
  add_end(C,H,CNEW1),
  add_end(CNEW1,H,CNEW2),
  transform(T,CNEW2,R).
transform([H|T],C,R):-
  isPrimeMain(H,RES),
  RES =:= 0,
  add_end(C,H,CNEW1),
  transform(T,CNEW1,R).

% consult("writePrimeTwice.pl"). isPrimeMain(1,R). 
% transform([2,3,1,4,6],[],R).

