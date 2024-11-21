% Define a predicate to determine the longest sequences of consecutive even numbers (if exist more maximal sequences one of them).
% Tranform every sublist in a heterogeneous list in its longest sequences of consecutive even numbers (if exist more maximal sequences one of them).
:- discontiguous mainLongestConsEven/2.
:- discontiguous modify/2.
:- discontiguous longestConsEven/4.

% add helper function
% (i,i,o)
add([], E, [E]).
add([H|T], E, [H|R]) :-
  add(T, E, R).

% returns the first even element in a list
% (i,o)
even([],[]).
even([H|_],R):-
  H mod 2 =:=0,!,
  R=[H].
even([_|T],R):-
  even(T,R).

% lengthList(L-list, C - result counter)
% (i,o)
lengthList([],0).
lengthList([_|T],C):-
  lengthList(T,Cnew),
  C is Cnew+1.


% longestConsEven(L-list, seqL - sequence list, maxSeqL- maxim sequence list, RES-result list)
% flow model(i,i,i,o)

longestConsEven([],SEQL,MAXSEQL,RES):-
  lengthList(MAXSEQL,LMAX),
  lengthList(SEQL,LCURRENT),
  LMAX < LCURRENT,!,
  RES=SEQL.
longestConsEven([],_,MAXSEQL,MAXSEQL).

longestConsEven([_],SEQL,MAXSEQL,RES):-
  longestConsEven([],SEQL,MAXSEQL,RES).

longestConsEven([H1,H2],SEQL,MAXSEQL,RES):-
  H2-H1=:=2,
  H1 mod 2 =:=0,!,
  add(SEQL,H1,R),
  add(R,H2,R2),
  longestConsEven([],R2,MAXSEQL,RES).

longestConsEven([_,_],SEQL,MAXSEQL,RES):-
     longestConsEven([],SEQL,MAXSEQL,RES).

longestConsEven([H1,H2,H3|T],SEQL,MAXSEQL,RES):-
  H2-H1=:=2,
  H3-H2=:=2,
  H1 mod 2 =:=0,
  add(SEQL,H1,R),
  longestConsEven([H2,H3|T],R,MAXSEQL,RES).

longestConsEven([H1,H2,H3|T],SEQL,MAXSEQL,RES):-
  H2-H1=:=2,
  H1 mod 2 =:=0,
  H3-H2=\=2,
  lengthList(MAXSEQL,LMAX),
  add(SEQL,H1,R),
  add(R,H2,R2),
  lengthList(R2,LCURRENT),
  LMAX < LCURRENT,
  longestConsEven([H3|T],[],R2,RES).

longestConsEven([H1,H2,H3|T],SEQL,MAXSEQL,RES):-
  H2-H1=:=2,
  H1 mod 2 =:=0,
  H3-H2=\=2,
  lengthList(MAXSEQL,LMAX),
  add(SEQL,H1,R),
  add(R,H2,R2),
  lengthList(R2,LCURRENT),
  \+ LMAX < LCURRENT,
  longestConsEven([H3|T],[],MAXSEQL,RES).

longestConsEven([H1,H2,H3|T],SEQL,MAXSEQL,RES):-
  (H2-H1=\=2;
  (H2 mod 2 =\= 0 , H1 mod 2 =\= 0)),
  longestConsEven([H2,H3|T],SEQL,MAXSEQL,RES).


% the longest sequences of consecutive even numbers - MAIN FUNCTION FOR FIRST REQUIREMENT
mainLongestConsEven(L,Res2):-
  longestConsEven(L,[],[],Res),
  Res == [],!,
  even(L,Res2).
mainLongestConsEven(L,Res2):-
  longestConsEven(L,[],[],Res2).



% modify(L-list, R-list)
% flow model(i,o)

% THIS IS THE MAIN FUNCTION for the second requirement
modify([],[]).
modify([H|T],[S|R]):-
  is_list(H),!,
  mainLongestConsEven(H,S),
  modify(T,R).
modify([H|T],[H|R]):-
  modify(T,R).

testLongestConsEven():-
  mainLongestConsEven([2,1,4,6,7,5,2,4,6,8,5,2,4],[2,4,6,8]).
  mainLongestConsEven([2,1,4,6],[4,6]).
  mainLongestConsEven([],[]).
  mainLongestConsEven([1,2,4,6,7,8,8,10,12,14,16,18,20],[8, 10, 12, 14, 16, 18, 20]).

testModify():-
  modify([1, [2, 1, 4, 6, 7], 5, [1, 2, 3, 4], 2, [1, 4, 6, 8, 3], 2, [1, 5], 3],[1, [4, 6], 5, [2], 2, [ 4,6, 8], 2, [], 3] ),
  modify([],[]),
  modify([1,2,3,[2,4],[1],[2,1,4,6,7,5,2,4,6,8,5,2,4]],[1, 2, 3, [2, 4], [], [2, 4, 6,8]]).


% consult("longestConsEvenClear.pl").
% testModify().
% modify([1,2,3,[2,4],[1],[2,1,4,6,7,5,2,4,6,8,5,2,4]],R).
