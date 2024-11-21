% transform a list in a set (considering the last occurence of elements)

% search(L-list, E- element,R-number)
% flow model (i,i,o)

search([],_,0).
search([H|T],E,B):-
    H=\=E,!,
    search(T,E,B).
search([_|_],_,B):-
    % H=:=E,  % we dont need to use this because cut ensures us we reach the point otherwise
    B is 1. 
     



% add_end(L-list, E- elem, R- result list) 
% flow model (i,i,o)
add_end([],E,[E]).
add_end([H|T],E,R):-
   R = [H|RT], % add the first element to the recursive tail 
   add_end(T,E,RT).



% listSet(L-list, C - collector, R -result list )
% flow model(i,i,o)

listSet([],C,C).
listSet([H|T],C,R):-
    search(T,H,B),
    B=:=0,         % search()=false -> add the element Cnew= new formed list
    add_end(C,H,Cnew),  % use the new list in the next call
    listSet(T,Cnew,R).
listSet([H|T],C,R):-
    search(T,H,B),  % search()=true -> next recursive call
    B=:=1,
    listSet(T,C,R).

% THIS IS THE MAIN FUNCTION 
mainListSet(L,R):-listSet(L,[],R).

testmainListSet():-
    mainListSet([1,2,3,2,1],[3,2,1]),
    mainListSet([],[]),
    mainListSet([15,2,5,7,8,-1,2,7,8,9],[15,5,-1,2,7,8,9]).

% consult("list_to_set.pl").
% testmainListSet().
% mainListSet([1,2,3,2,1],R).