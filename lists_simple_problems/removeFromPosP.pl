% delete the element on a certain position in a list

% deleteNth(L-list, P- requested position, C - current position, R-result list)

deleteNth([],_,_,[]).
deleteNth([_|T],P,C,R):-
   P=:=C,
   R=T.
deleteNth([H|T],P,C,R):-
   P=\=C,
   C1 is C+1,
   R=[H|RT],
   deleteNth(T,P,C1,RT).

% THIS IS THE MAIN FUNCTION 
mainDeleteNth(L,P,R):-deleteNth(L,P,1,R).

% consult("removeFromPosP.pl").
% mainDeleteNth([1,2,3,4],6,R).