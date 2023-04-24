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
has_weapon(scarlett, candlestick).
has_weapon(peacock, knife).
has_weapon(brunette, wrench).
has_weapon(green, poison).

% Declare the possible crime scenes
kills_in(peacock, kitchen).
kills_in(peach, dining_room).
kills_in(scarlett, bedroom).
kills_in(mustard, library).
kills_in(plum, garden).
kills_in(brunette, garage).
kills_in(green, pool).

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
date(X) :- day(X), \+ X = saturday, \+ X = sunday.

% Declare the murdered as a man
murdered(M) :- victim(M), man(M).

% Declare the victim found inside the house
crime_place(X, S) :- suspect(X), kills_in(X, S), \+ S = garden, \+ S = garage, \+ S = pool.

% Declare the new list of the suspect based on the fact that there was no trace of blood at the crime scene
crime_weapon(X, Y) :- suspect(X), has_weapon(X, Y), \+ Y = pistol, \+ Y = knife, \+ Y = candlestick.

% Declare the fact that two people were arguing on a certain day
has_argue(X, Y, Z) :- murdered(X), crime_weapon(Y, _), man(Y), X \= Y, date(Z).

% Declare the fact that nothing has been stolen
motive_crime(X, Y):- motive(X, Y), \+ Y = money, \+ Y = heritage.

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
check(X, Y, Z, E) :- X \= friday, Y \= poison, Z \= library, E \= revenge, write('Your score = 0'),nl,nl.
check(X, Y, Z, E) :- X = friday, Y \= poison, Z \= library, E \= revenge, write('Your score = 1'),nl,nl.
check(X, Y, Z, E) :- X \= friday, Y = poison, Z \= library, E \= revenge, write('Your score = 1'),nl,nl.
check(X, Y, Z, E) :- X \= friday, Y \= poison, Z = library, E \= revenge, write('Your score = 1'),nl,nl.
check(X, Y, Z, E) :- X \= friday, Y \= poison, Z \= library, E = revenge, write('Your score = 1'),nl,nl.
check(X, Y, Z, E) :- X = friday, Y = poison, Z \= library, E \= revenge, write('Your score = 2'),nl,nl.
check(X, Y, Z, E) :- X = friday, Y \= poison, Z = library, E \= revenge, write('Your score = 2'),nl,nl.
check(X, Y, Z, E) :- X = friday, Y \= poison, Z \= library, E = revenge, write('Your score = 2'),nl,nl.
check(X, Y, Z, E) :- X \= friday, Y = poison, Z = library, E \= revenge, write('Your score = 2'),nl,nl.
check(X, Y, Z, E) :- X \= friday, Y = poison, Z \= library, E = revenge, write('Your score = 2'),nl,nl.
check(X, Y, Z, E) :- X \= friday, Y \= poison, Z = library, E = revenge, write('Your score = 2'),nl,nl.
check(X, Y, Z, E) :- X = friday, Y \= poison, Z = library, E = revenge, write('Your score = 3'),nl,nl.
check(X, Y, Z, E) :- X = friday, Y = poison, Z \= library, E = revenge, write('Your score = 3'),nl,nl.
check(X, Y, Z, E) :- X = friday, Y = poison, Z = library, E \= revenge, write('Your score = 3'),nl,nl.
check(X, Y, Z, E) :- X \= friday, Y = poison, Z = library, E = revenge, write('Your score = 3'),nl,nl.
check(X, Y, Z, E) :- X = friday, Y = poison, Z = library, E = revenge, write('Congratulations!! Your score = 4'),nl,nl.

check_murderer(M) :- M = mustard, write('Congratulations! You identified the murderer!'),nl.
check_murderer(M) :- M \= mustard, write('Sorry! Your guess was incorrect!'),nl.

start_game/0 :-
    write("************* Welcome Detective ************* "),nl,nl,
    write('A brutal murder has occurred at the grand estate of the wealthy Snoop family and this is the list of suspects:'),nl,
    write("Men: mustard, plum, green, brunette"),nl,
    write("Women: scarlett, peacock, peach"),nl,nl,
    write("These are some facts about the relation between suspects and clues:"),nl,nl,
    write('% Declare which suspect has which weapon'),nl,
    write("has_weapon(plum, rope)."),nl,
    write("has_weapon(mustard, poison)."),nl,
    write("has_weapon(peach, pistol)."),nl,
    write("has_weapon(scarlett, candlestick)."),nl,
    write("has_weapon(peacock, knife)."),nl,
    write("has_weapon(brunette, wrench)."),nl,
    write("has_weapon(green, poison)."),nl,nl,

    write('% Declare the possible crime scenes'),nl,
    write("kills_in(peacock, kitchen)."),nl,
    write("kills_in(peach, dining_room)."),nl,
    write("kills_in(scarlett, bedroom)."),nl,
    write("kills_in(mustard, library)."),nl,
    write("kills_in(plum, garden)."),nl,
    write("kills_in(brunette, garage)."),nl,
    write("kills_in(green, pool)."),nl,nl,

    write('% Declare the possible motives'),nl,
    write("motive(mustard, revenge)."),nl,
    write("motive(green, money)."),nl,
    write("motive(scarlett, passion)."),nl,
    write("motive(plum, hatred)."),nl,
    write("motive(peach, heritage)."),nl,
    write("motive(peacock, money)."),nl,
    write("motive(brunette, revenge)."),nl,nl,
    
    write('Let us begin the investigation.'), nl,
    write("Police found victim's body on Saturday morning and doctor declare the crime happened about 12 hours ago."), nl,
    write('Date of crime?'), nl,
    read(A),
    write("There were no trace of blood in the crime scene."), nl,
    write('Weapon used in the crime?'), nl,
	read(B),
    write("Victim found inside the house."), nl,
    write('Place that crime happened?'), nl,
	read(C),
    write("Nothing has stolen from the house."), nl,
    write('What was the motive?'), nl,
	read(D),nl,
    check(A, B, C, D),
    write('Now it is time for your final guess!'),nl,
    write("The last clue is that a neighbor heard the victim arguing with a man on the night of the crime."), nl,
    write('Who is the murderer?'),nl,
    read(E),
    check_murderer(E),nl,
    solve_murderer(_,_,_,_,_).
    


