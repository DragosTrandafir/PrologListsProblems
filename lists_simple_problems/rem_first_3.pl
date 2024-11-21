% remove the first NR occurances of the element E in the list


% add_end(L-list, E- elem, R- result list) 
% flow model (i,i,o)
add_end([],E,[E]).
add_end([H|T],E,R):-
   R = [H|RT], % add the first element to the recursive tail 
   add_end(T,E,RT).

% rem(L-list, NR- nr occ, E- element, C-collector, R-result list)
% i,i,i,i,o
% 3 4 5 3 4 2 1 3

rem([],_,_,C,C).
rem([H|T],NR,E,C,R):-
  H=:=E,
  NR>0,
  NR1 is NR-1,
  rem(T,NR1,E,C,R).
rem([H|T],NR,E,C,R):-
  H=:=E,
  NR=:=0,
  add_end(C,H,RZ),
  rem(T,NR,E,RZ,R).
rem([H|T],NR,E,C,R):-
  H=\=E,
  add_end(C,H,RZ),
  rem(T,NR,E,RZ,R).

% THIS IS THE MAIN FUNCTION 
mainRem(L,NR,E,R):-rem(L,NR,E,[],R).

% consult("rem_first_3.pl").
% mainRem([1,2,3],3,1,R).

