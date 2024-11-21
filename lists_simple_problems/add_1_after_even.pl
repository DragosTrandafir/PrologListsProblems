% add element 1 after every even element

add([],E,[E]).
add([H|T],E,[H|R]):-
  add(T,E,R).

% addEven(L-list, C- collector list, R-result list)
% fm(i,i,o)

addEven([],C,C).
addEven([H|T],C,R):-
  H mod 2 =\=0,!,
  add(C,H,CN),
  addEven(T,CN,R).
addEven([H|T],C,R):-
  add(C,H,CN),
  add(CN,1,CN1),
  addEven(T,CN1,R).

% THIS IS THE MAIN FUNCTION 
mainAddEven(L,R):-addEven(L,[],R).

% consult("add_1_after_even.pl").
% mainAddEven([1,5,7,8,88,888],R).
