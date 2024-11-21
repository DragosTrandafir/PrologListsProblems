% determine the greatest common divisor from element in a list

% gcd(A-number, B-number, NR-result)
% flow model(i, i, o)
gcd(A,0,A).
gcd(A,B,NR):-
   B =\= 0,
   AUX is (A mod B),
   gcd(B,AUX,NR).


% gcdListC(L-list, C-collector, R-number)
% flow model (i,i,o)

gcdListC([H], C, R) :- 
    gcd(H, C, R). 
gcdListC([H|T],C,R):-
    gcd(H,C,NR),
    gcdListC(T,NR,R).

% THIS IS THE MAIN FUNCTION 
mainGcdList([H|T],R):-gcdListC([H|T],H,R).


testMainGcdList():-
    mainGcdList([12,3,24],3),
    mainGcdList([0,1],1),
    mainGcdList([14,2,5],1).

% consult("gcd.pl").
% testMainGcdList().
% mainGcdList([12,3,24],R).


