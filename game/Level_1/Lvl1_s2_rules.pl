%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%        Detective Prolog        %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Declare the victims
victim(snoop).
victim(rihanna).

% Declare the men
man(snoop).
man(mustard).
man(green).
man(plum).
man(brunette).

% Declare the women
woman(rihanna).
woman(scarlett).
woman(peacock).
woman(peach).


% Declare the possible days
day(friday).
day(saturday).
day(sunday).

% Declare which suspect has which weapon
has_weapon(plum, rope).
has_weapon(mustard, poison).
has_weapon(peach, pistol).
has_weapon(scarlett, poison).
has_weapon(peacock, knife).
has_weapon(brunette, wrench).
has_weapon(green, candlestick).

% Declare the possible crime scenes
kills_in(peacock, kitchen).
kills_in(peach, dining_room).
kills_in(scarlett, pool).
kills_in(mustard, library).
kills_in(plum, garden).
kills_in(brunette, garage).
kills_in(green, bedroom).

% Declare the possible motives
motive(mustard, revenge).
motive(green, money).
motive(scarlett, passion).
motive(plum, hatred).
motive(peach, heritage).
motive(peacock, money).
motive(brunette, revenge).

% Declare the suspects
suspect(X):- man(X); woman(X), \+ victim(X).

% Declare the date of crime
date(X):- day(X), \+ X = friday, \+ X = saturday.

% Declare the murdered as a woman
murdered(X):- victim(X), woman(X).

% Declare the victim found outside the house
crime_place(X, P):- suspect(X), kills_in(X, P), \+ P = kitchen, \+ P = dining_room, \+ P = bedroom, \+ P = library.

% Declare the new list of the suspect based on the fact that there was no trace of blood at the crime scene
crime_weapon(X, W):- suspect(X), has_weapon(X, W), \+ W = pistol, \+ W = knife, \+ W = candlestick.

% Declare the fact that two people were arguing on a certain day
has_argue(X, Y, D):- murdered(X), crime_weapon(Y,_), woman(Y), X \= Y, date(D).

% Declare the fact that nothing has been stolen
motive_crime(X, M):- motive(X, M), \+ M = money, \+ M = heritage.

% Solve the murder mystery
solve_murderer(X, Y, Z, O, P):- 
	has_argue(_, X, P), crime_place(X, Y), crime_weapon(X, Z), motive_crime(X, O),
    write("These are the the correct answers provided by Detective Prolog:"),nl,
    write("Murderer is: "), write(X), nl,
    write("Place of crime is: "), write(Y), nl,
    write("Weapon used in crime is: "), write(Z), nl,
    write("Murderer's motive is: "), write(O), nl,
    write("Date of the crime is: "), write(P), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        Player        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- dynamic u/1. initialize_u :- retractall(u(_)), assert(u(0)). 
:- dynamic p/1. initialize_p :- retractall(p(_)), assert(p(100)).

%check_p(T) :- T > 0.

check(X, Y, Z, E) :-X \= sunday, Y \= poison, Z \= pool, E \= passion, write('Correct answers = 0'), nl,nl, write('Hint! Date is friday!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' date(X) :- day(X), \\+ X = friday, \\+ X = saturday.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 20, assert(p(NewValue)),nl, nl.
                                                 
check(X, Y, Z, E) :- X = sunday, Y \= poison, Z \= pool, E \= passion, write('Correct answers = 1'), nl,nl, write('Hint! Date is correct!'), nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' date(X) :- day(X), \\+ X = friday, \\+ X = saturday.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.

check(X, Y, Z, E) :- X \= sunday, Y = poison, Z \= pool, E \= passion, write('Correct answers = 1'), nl,nl, write('Hint! Weapon is correct!'), nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' crime_weapon(X, Y) :- suspect(X), has_weapon(X, Y), \\+ Y = pistol, \\+ Y = knife, \\+ Y = candlestick.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.

check(X, Y, Z, E) :- X \= sunday, Y \= poison, Z = pool, E \= passion, write('Correct answers = 1'), nl,nl, write('Hint! Place is correct!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = bedroom, \\+ S = library, \\+ S = kitchen, \\+ S = dining_room.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.

check(X, Y, Z, E) :- X \= sunday, Y \= poison, Z \= pool, E = passion, write('Correct answers = 1'), nl,nl, write('Hint! Motive is correct!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write('motive_crime(X, Y):- motive(X, Y), \\+ Y = money, \\+ Y = heritage.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)),nl, nl.

check(X, Y, Z, E) :- X = sunday, Y = poison, Z \= pool, E \= passion, write('Correct answers = 2'), nl,nl, write('Hint! Date and Weapon are correct!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' date(X) :- day(X), \\+ X = friday, \\+ X = saturday.'),nl,
    write(' crime_weapon(X, Y) :- suspect(X), has_weapon(X, Y), \\+ Y = pistol, \\+ Y = knife, \\+ Y = candlestick.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)),nl, nl.

check(X, Y, Z, E) :-X = sunday, Y \= poison, Z = pool, E \= passion, write('Correct answers = 2'), nl,nl, write('Hint! Date and Place are correct!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' date(X) :- day(X), \\+ X = friday, \\+ X = saturday.'),nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = garage, \\+ S = pool.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)),nl, nl.

check(X, Y, Z, E) :- X = sunday, Y \= poison, Z \= pool, E = passion, write('Correct answers = 2'), nl,nl, write('Hint! Date and Motive correct!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' date(X) :- day(X), \\+ X = friday, \\+ X = saturday.'),nl,
    write('motive_crime(X, Y):- motive(X, Y), \\+ Y = money, \\+ Y = heritage.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)),nl, nl.

check(X, Y, Z, E) :- X \= sunday, Y = poison, Z = pool, E \= passion, write('Correct answers = 2'), nl,nl, write('Hint! Weapon and Place are correct!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' crime_weapon(X, Y) :- suspect(X), has_weapon(X, Y), \\+ Y = pistol, \\+ Y = knife, \\+ Y = candlestick.'),nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = garage, \\+ S = pool.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)),nl, nl.

check(X, Y, Z, E) :- X \= sunday, Y = poison, Z \= pool, E = passion, write('Correct answers = 2'), nl,nl, write('Hint! Weapon and Motive are correct!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' crime_weapon(X, Y) :- suspect(X), has_weapon(X, Y), \\+ Y = pistol, \\+ Y = knife, \\+ Y = candlestick.'),nl,
    write('motive_crime(X, Y):- motive(X, Y), \\+ Y = money, \\+ Y = heritage.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)),nl, nl.

check(X, Y, Z, E) :- X \= sunday, Y \= poison, Z = pool, E = passion, write('Correct answers = 2'), nl,nl, write('Hint! Place and Motive are correct!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = bedroom, \\+ S = library, \\+ S = kitchen, \\+ S = dining_room.'),nl,
    write('motive_crime(X, Y):- motive(X, Y), \\+ Y = money, \\+ Y = heritage.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)),nl, nl.

check(X, Y, Z, E) :- X = sunday, Y \= poison, Z = pool, E = passion, write('Correct answers = 3'), nl,nl, write('Hint! Date, Motive and Place are correct!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' date(X) :- day(X), \\+ X = friday, \\+ X = saturday.'),nl,
    write('motive_crime(X, Y):- motive(X, Y), \\+ Y = money, \\+ Y = heritage.'),nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = bedroom, \\+ S = library, \\+ S = kitchen, \\+ S = dining_room.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)),nl, nl.

check(X, Y, Z, E) :- X = sunday, Y = poison, Z \= pool, E = passion, write('Correct answers = 3'), nl,nl, write('Hint! Date, Weapon and Motive are correct!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' date(X) :- day(X), \\+ X = friday, \\+ X = saturday.'),nl,
    write('motive_crime(X, Y):- motive(X, Y), \\+ Y = money, \\+ Y = heritage.'),nl,
    write(' crime_weapon(X, Y) :- suspect(X), has_weapon(X, Y), \\+ Y = pistol, \\+ Y = knife, \\+ Y = candlestick.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)),nl, nl.

check(X, Y, Z, E) :- X = sunday, Y = poison, Z = pool, E \= passion, write('Correct answers = 3'), nl,nl, write('Hint! Date, Place and Weapon are correct!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' date(X) :- day(X), \\+ X = friday, \\+ X = saturday.'),nl,
    write(' crime_weapon(X, Y) :- suspect(X), has_weapon(X, Y), \\+ Y = pistol, \\+ Y = knife, \\+ Y = candlestick.'),nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = bedroom, \\+ S = library, \\+ S = kitchen, \\+ S = dining_room.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)),nl, nl.

check(X, Y, Z, E) :- X \= sunday, Y = poison, Z = pool, E = passion, write('Correct answers = 3'), nl,nl, write('Hint! Place, Motive and Weapon are correct!'),nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = bedroom, \\+ S = library, \\+ S = kitchen, \\+ S = dining_room.'),nl,
    write('motive_crime(X, Y):- motive(X, Y), \\+ Y = money, \\+ Y = heritage.'),nl,
    write(' crime_weapon(X, Y) :- suspect(X), has_weapon(X, Y), \\+ Y = pistol, \\+ Y = knife, \\+ Y = candlestick.'),nl,nl,
    nl, write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)),nl, nl.

check(X, Y, Z, E) :- X = sunday, Y = poison, Z = pool, E = passion,  write('Congratulations!! You answered all the questions correctly.'), nl,nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' date(X) :- day(X), \\+ X = friday, \\+ X = saturday.'),nl,
    write('motive_crime(X, Y):- motive(X, Y), \\+ Y = money, \\+ Y = heritage.'),nl,
    write(' crime_weapon(X, Y) :- suspect(X), has_weapon(X, Y), \\+ Y = pistol, \\+ Y = knife, \\+ Y = candlestick.'),nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = bedroom, \\+ S = library, \\+ S = kitchen, \\+ S = dining_room.'),nl,
    retract(u(OldValue)), NewValue is OldValue + 1, assert(u(NewValue)), nl,nl.

check_murderer(M) :- M = scarlett, write('Congratulations! You identified the murderer!'), nl, nl, p(P), write('*** Your Final point =  '), write(P), write(' ***'), nl, nl, solve_murderer(_,_,_,_,_).
check_murderer(M) :- M \= scarlett, write('Sorry! Your guess was incorrect!'), nl, nl, retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), p(P), write('*** Your Final point =  '), write(P), write(' ***'), nl, nl, solve_murderer(_,_,_,_,_).

start_game/0 :-
    write("************* Welcome Detective ************* "),nl,nl,
    write('A brutal murder has occurred at the bachelor party of Rihanna and this is the list of suspects:'),nl,
    write("Men: mustard, plum, green, brunette"),nl,
    write("Women: scarlett, peacock, peach"),nl,nl,
    write("These are some facts about the relation between suspects and clues:"),nl,nl,
    write('% Declare which suspect has which weapon'),nl,
    write("has_weapon(plum, rope)."),nl,
    write("has_weapon(mustard, poison)."),nl,
    write("has_weapon(peach, pistol)."),nl,
    write("has_weapon(scarlett, poison)."),nl,
    write("has_weapon(peacock, knife)."),nl,
    write("has_weapon(brunette, wrench)."),nl,
    write("has_weapon(green, candlestick)."),nl,nl,

    write('% Declare the possible crime scenes'),nl,
    write("kills_in(peacock, kitchen)."),nl,
    write("kills_in(peach, dining_room)."),nl,
    write("kills_in(scarlett, pool)."),nl,
    write("kills_in(mustard, library)."),nl,
    write("kills_in(plum, garden)."),nl,
    write("kills_in(brunette, garage)."),nl,
    write("kills_in(green, bedroom)."),nl,nl,

    write('% Declare the possible motives'),nl,
    write("motive(mustard, revenge)."),nl,
    write("motive(green, money)."),nl,
    write("motive(scarlett, passion)."),nl,
    write("motive(plum, hatred)."),nl,
    write("motive(peach, heritage)."),nl,
    write("motive(peacock, money)."),nl,
    write("motive(brunette, revenge)."),nl,nl,
    
    initialize_p,
    write(' << By considering that each wrong guess deducts 5 points from 100, Let us begin the investigation: >> '), nl, nl,
    repeat,
      initialize_u,
      write("Police found victim's body on Monday morning and doctor declare the crime happened about 12 hours ago."), nl,
      write('Date of crime?'), nl, write('[friday, sunday, saturday]'), nl,
      read(A), nl,
      write("There was no trace of blood in the crime scene."), nl,
      write('Weapon used in the crime?'), nl, write('[pistol, rope, knife, poison, candlestick, wrench]'), nl,
      read(B), nl,
      write("Victim found outside the house."), nl,
      write('Place that crime happened?'), nl, write('[garden, library, bedroom, kitchen, garage, dining_room, pool]'), nl,
      read(C), nl,
      write("Nothing has been stolen from the house and a picture of Rihanna and her fiance is torn."), nl,
      write('What was the motive?'), nl, write('[hatred, money, revenge, heritage, passion]'), nl,
      read(D), nl, nl,
      check(A, B, C, D),
      u(U),
      p(P),
      write('Your point = '), write(P), nl, nl,
 	  (P =< 0, write(" >>>  Game over!  <<< "),nl ; U > 0), !,
    
    P > 0,
    write('Now it is time for your one and only final guess!'), nl,
    write("The last clue is that a neighbor heard the victim arguing with a woman when all the guests were gone."), nl,
    write('Who is the murderer?'),nl,
    read(E),nl,
    check_murderer(E), nl.




