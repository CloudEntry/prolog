/* COMP219 - Prolog
Programme for 8 queens problem
Solutions can be found with:
template1(X),tqueensolution(X).
template2(X),tqueensolution(X).
Adapted from an example in:
I. Bratko. Prolog Programming for Artificial Intelligence. Addison Wesley, 1990
*/

tqueensolution([]).

tqueensolution([p(X,Y)|Others]):-                    % First queen at p(X,Y),
  tqueensolution(Others),                            % Other queens at Others
  member(Y,[1,2,3,4,5,6,7,8]),
  member(X,[1,2,3,4,5,6,7,8]),
  tnoattack(p(X,Y),Others).                          % First queen does not attack others

tnoattack( _,[]).                                    % Nothing to attack

tnoattack( p(X,Y), [p(X1,Y1) | Others] ) :-
  Y =\= Y1,                                          % Queens have different Y-coordinates
  X =\= X1,                                          % Queens have different X-coordinates
  Y1-Y =\= X1-X,                                     % Queens have different diagonals
  Y1-Y =\= X-X1,
  tnoattack( p(X,Y), Others).


template1([p(X1,Y1),p(X2,Y2),p(X3,Y3),p(X4,Y4),      % Solution template 1
	p(X5,Y5),p(X6,Y6),p(X7,Y7),p(X8,Y8)]).

template2( [p(1,Y1),p(2,Y2),p(3,Y3),p(4,Y4),p(5,Y5), % Solution template 2
   p(6,Y6),p(7,Y7),p(8,Y8)] ).
