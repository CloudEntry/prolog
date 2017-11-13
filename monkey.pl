/* COMP219 - Prolog
Monkey and Banana Puzzle Programme
Adapted from an example in:
I. Bratko. Prolog Programming for Artificial Intelligence. Addison Wesley, 1990
*/

% move( State1, Move, State2): making Move in State1 results in State2;
% a state is represented by a structure:
% state( MonkeyHorizontal, MonkeyVertical, BoxPosition, HasBanana)

move( state( middle, onBox, middle, noBanana), % Before move
grasp,                                         % Grasp banana
state( middle, onBox, middle, banana) ).       % After move

move( state( P, onFloor, P, H),
climb,                                         % Climb box
state( P, onBox, P, H) ).

move( state( P1, onFloor, P1, H),
push( P1, P2),                                 % Push box from P1 to P2
state( P2, onFloor, P2, H) ).

move( state( P1, onFloor, B, H),
walk( P1, P2),                                 % Walk from P1 to P2
state( P2, onFloor, B, H) ).

canGet( state( _, _, _, banana) ).             % can 1: Monkey already has it
canGet( State1) :-                             % can 2: Do some work to get it
move( State1, Move, State2),                   % Do something
canGet( State2),                               % Get it now
write(Move),nl.                                % report moves: will appear in reverse order
