/*
* Program with some useful procedures for list manipulation
*/

tmember(H, [H|Tail]).					%Returns true if X is in list
tmember(X,[H|Tail]):-
    tmember(X,Tail).

tappend([],L2,L2).						%Appends X to list
tappend([H1|L1],L2,[H1|L3]):-
    tappend(L1,L2,L3).

sumList([],0).							%Returns sum of list
sumList([H|Tail],Sum):-
    sumList(Tail, Rest),
    Sum is H+Rest.

deleteOne([],_,[]).						%Deletes first instance from list
deleteOne([X|Tail],X,Tail).
deleteOne([H|Tail],X,[H|Result]):-
    deleteOne(Tail,X,Result).

deleteAll([],_,[]).						%Deletes all instances from list
deleteAll([X|Tail],X,L):-
    deleteAll(Tail,X,L),!.
deleteAll([H|Tail],X,[H|L]):-
    deleteAll(Tail,X,L).

reverseList([],X,X).					%Reverses order of elements in list
reverseList([H|Tail],X,Acc):-
    reverseList(Tail,X,[H|Acc]).

tlength([],0).							%Returns length of the list
tlength([H|Tail],Len1):-
    tlength(Tail,Len2),
    Len1 is Len2+1.