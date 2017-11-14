/* COMP219 - Prolog
Family Tree Programme
*/

parent(pete,ian).     % Pete is a parent of Ian
parent(ian,peter).
parent(ian,lucy).
parent(lou,pete).
parent(lou,pauline).
parent(cathy,ian).
parent(peggy,phil).
parent(peggy,grant).
parent(phil,ben).
parent(cathy,ben).

female(cathy).        % Cathy is female.
female(lucy).
female(pauline).
female(lou).
female(peggy).
female(lisa).
female(louise).

male(ian).            % Ian is male.
male(pete).
male(peter).
male(phil).
male(grant).
male(ben).


/* X is the mother of Y if X is the parent
   of Y and X is female                   */

mother(X,Y):-parent(X,Y),female(X).
father(X,Y):-parent(X,Y),male(X).
son(X,Y):-parent(Y,X),male(X).
daughter(X,Y):-parent(Y,X),female(X).
grandparent(X,Z):-parent(X,Y),parent(Y,Z).
grandmother(X,Z):-mother(X,Y),parent(Y,Z).
grandfather(X,Z):-father(X,Y),parent(Y,Z).
sibling(X,Y):-parent(Z,X),parent(Z,Y),different(X,Y).
different(X,X):-!,fail.
different(_._).
sister(X,Y):-female(X),sibling(X,Y).
brother(X,Y):-male(X),sibling(X,Y).
aunt(X,Z):-sister(X,Y),parent(Y,Z).
uncle(X,Z):-brother(X,Y),parent(Y,Z).
cousin(X,Y):-parent(Z,X),parent(U,Y),sibling(Z,U).
ancestor(X,Z):-parent(X,Z).
ancestor(X,Z):-parent(X,Y),ancestor(Y,Z).
predecessor(X,Z):-predecessor(Y,Z),parent(X,Y).
predecessor(X,Z):-parent(X,Z).
predecessor2(X,Z):-parent(X,Y),predecessor2(Y,Z).
predecessor2(X,Z):-parent(X,Z).
predecessor3(X,Z):-parent(X,Z).
predecessor3(X,Z):-predecessor3(Y,Z), parent(X,Y).