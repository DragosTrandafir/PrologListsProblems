%  For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to replace 
% every sublist with the position of the maximum element from that sublist.
% [1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
% [1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7]

add_end([],E,[E]).
add_end([H|T],E,[H|R]):-
  add_end(T,E,R).

% maxx(L-list, C-collector(=-1000), R-res) (i,i,o)

maxx([],C,C).
maxx([H|T],C,R):-
  H>C,
  C1 is H,
  maxx(T,C1,R).
maxx([H|T],C,R):-
  \+ H>C,
  maxx(T,C,R).



% 1st det maximum
% search it and det position

% positionsE(L-list,E-element, N-position counter(=1),  C-collector([]),R-result) (i,i,i,i,o)

positionsE([],_,_,C,C).
positionsE([H|T],E,N,C,R):-
  H=:=E,!,
  add_end(C,N,CNEW),
  N1 is N+1,
  positionsE(T,E,N1,CNEW,R).
positionsE([_|T],E,N,C,R):-
  N1 is N+1,
  positionsE(T,E,N1,C,R).

mainPositionsE(L,E,R):-positionsE(L,E,1,[],R).



transform(L,R):-
  maxx(L,-1000,MAX),
  mainPositionsE(L,MAX,R).

% THIS IS THE MAIN PREDICATE
transformH([],C,C).
transformH([H|T],C,R):-
  is_list(H),!,
  transform(H,RES),
  add_end(C,RES,CNEW),
  transformH(T,CNEW,R).
transformH([H|T],C,R):-
  add_end(C,H,CNEW),
  transformH(T,CNEW,R).

% consult("replacePositionMax.pl").
% maxx([1,2,5,2,8,9,199,4,-1,0],-1000,R).
% mainPositionsE([1,1,1],1,R).
% transform([7, 10, 1, 3, 9],R).
% transformH([1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] ,[],R).