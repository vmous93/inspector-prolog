%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%       Detective Prolog  Level 2      %%%%%%%%%%%%%%%%%%%%%%%%
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


% Declare the handedness of suspects
handedness(mustard, left).
handedness(green, left).
handedness(brunette, right).
handedness(scarlett, left).
handedness(peach, right).
handedness(peacock, left).
handedness(plum, left).


% Declare what each suspects smoke
smoke(green, pipe).
smoke(peacock, cigarette).
smoke(plum, cigarette).
smoke(mustard, cigarette).
smoke(peach, pipe).
smoke(brunette, cigarette).
smoke(scarlett, grass).
smoke(rihanna, grass).


% Declare the hair color
hair_color(mustard, black).
hair_color(green, brown).
hair_color(brunette, blonde).
hair_color(scarlett, blonde).
hair_color(peach, black).
hair_color(peacock, blonde).
hair_color(plum, black).
hair_color(rihanna, brown).


% Declare the day victim meets the suspects
meeting_day(green, saturday).
meeting_day(peacock, saturday).
meeting_day(plum, sunday).
meeting_day(mustard, saturday).
meeting_day(peach, friday).
meeting_day(brunette, sunday).
meeting_day(scarlett, saturday).
meeting_day(rihanna, sunday).


% Declare which suspect has which weapon
has_weapon(plum, pistol).
has_weapon(mustard, knife).
has_weapon(peach, rope).
has_weapon(scarlett, poison).
has_weapon(peacock, knife).
has_weapon(brunette, wrench).
has_weapon(green, candlestick).
has_weapon(rihanna, pistol).


% Declare what jewelry each suspect wears
jewelry(mustard, necklace).
jewelry(green, bracelet).
jewelry(brunette, necklace).
jewelry(scarlett, earring).
jewelry(peach, bracelet).
jewelry(peacock, necklace).
jewelry(plum, earring).
jewelry(rihanna, bracelet).


% Declare the possible motives
motive(mustard, revenge).
motive(green, revenge).
motive(scarlett, money).
motive(plum, heritage).
motive(peach, passion).
motive(peacock, money).
motive(brunette, revenge).
motive(rihanna, money).


% Declare the possible crime scenes
kills_in(peacock, kitchen).
kills_in(peach, library).
kills_in(scarlett, bedroom).
kills_in(mustard, pool).
kills_in(plum, garden).
kills_in(brunette, garden).
kills_in(green, dining_room).
kills_in(rihanna, pool).


% Declare the suspects
suspect(X):- man(X); woman(X), \+ victim(X).


% Declare the victim found inside the house
crime_place(X, S) :- suspect(X), kills_in(X, S), \+ S = garden, \+ S = pool.

% Declare the new list of the suspect based on the fact that there was trace of blood at the crime scene and a sleeve of left hand was found
crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \+ Y = poison, \+ Y = rope, \+ Z = right.

% Declare the new list of the suspect based on the fact that safebox has been empty
motive_crime(X, Y) :- suspect(X), motive(X, Y), \+ Y = passion, \+ Y = money.

% Declare the new list of the suspect based on the fact that suspect was black and has a jewelry
has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \+ Y = blonde, \+ Y = black.

% Declare the new list of the suspect based on the fact that safebox has been empty
date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \+ Y = cigarette, \+ Y = grass. 


% Solve the murder mystery
solve_murderer(X, Y, Z, O, P, Q):- 
    crime_place(X, Y), crime_weapon(X, Z, _), has_jewelry(X, _, Q), motive_crime(X, O), date(X, _, P), 
    write("These are the the correct answers provided by Detective Prolog:"),nl,
    write("Murderer is: "), write(X), nl,
    write("Place of crime is: "), write(Y), nl,
    write("Weapon used in crime is: "), write(Z), nl,
    write("Murderer wears a: "), write(Q), nl,
    write("Murderer's motive is: "), write(O), nl,
    write("Date of the crime is: "), write(P), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        Player        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- dynamic u/1. initialize_u :- retractall(u(_)), assert(u(0)). 
:- dynamic p/1. initialize_p :- retractall(p(_)), assert(p(100)).

check(H, I, J, K, L) :- H \= dining_room, I \= revenge, J \= candlestick, K \= bracelet, L \= saturday, write('Correct answers = 0'),nl, write('Hint! Date is saturday!'),nl,
       nl, write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl, 
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 25, assert(p(NewValue)),nl, nl.

%place
check(H, I, J, K, L) :- H = dining_room, I \= revenge, J \= candlestick, K \= bracelet, L \= saturday, write('Correct answers = 1'),nl, write('Hint! Place is correct!'), nl, nl,
     write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 20, assert(p(NewValue)), nl, nl.

%motive
check(H, I, J, K, L) :- H \= dining_room, I = revenge, J \= candlestick, K \= bracelet, L \= saturday, write('Correct answers = 1'),nl, write('Hint! Motive is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 20, assert(p(NewValue)), nl, nl.

%weapon
check(H, I, J, K, L) :- H \= dining_room, I \= revenge, J = candlestick, K \= bracelet, L \= saturday, write('Correct answers = 1'),nl, write('Hint! Weapon is correct!'), nl, nl, 
        write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 20, assert(p(NewValue)), nl, nl.


%jewerly
check(H, I, J, K, L) :- H \= dining_room, I \= revenge, J \= candlestick, K = bracelet, L \= saturday, write('Correct answers = 1'),nl, write('Hint! Jewelry is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 20, assert(p(NewValue)), nl, nl.



%date
check(H, I, J, K, L) :- H \= dining_room, I \= revenge, J \= candlestick, K \= bracelet, L = saturday, write('Correct answers = 1'),nl, write('Hint! Date is correct!'), nl, nl,
        write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 20, assert(p(NewValue)), nl, nl.


%place & motive
check(H, I, J, K, L) :- H = dining_room, I = revenge, J \= candlestick, K \= bracelet, L \= saturday, write('Correct answers = 2'),nl, write('Hint! Place and Motive are correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl, 
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


%weapon & place
check(H, I, J, K, L) :- H = dining_room, I \= revenge, J = candlestick, K \= bracelet, L \= saturday, write('Correct answers = 2'),nl, write('Hint! Weapon and Place are correct!'), nl, nl,
            write("Look at this piece of code in Prolog to better understand its rule:"),nl, write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
			write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


%place & jewerly
check(H, I, J, K, L) :- H = dining_room, I \= revenge, J \= candlestick, K = bracelet, L \= saturday, write('Correct answers = 2'),nl, write('Hint! Place and jewerly are correct!'), nl, nl,
        write("Look at this piece of code in Prolog to better understand its rule:"),nl, write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl, 
     write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


% place & date
check(H, I, J, K, L) :- H = dining_room, I \= revenge, J \= candlestick, K \= bracelet, L = saturday, write('Correct answers = 2'),nl, write('Hint! Date and Place are correct!'), nl, nl,
   write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
   write(' crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


%Motive & weapon
check(H, I, J, K, L) :- H \= dining_room, I = revenge, J = candlestick, K \= bracelet, L \= saturday, write('Correct answers = 2'),nl, write('Hint! Motive and weapon are correct!'), nl, nl,
            write("Look at this piece of code in Prolog to better understand its rule:"),nl, write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
        write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.

%Motive & Jewelry
check(H, I, J, K, L) :- H \= dining_room, I = revenge, J \= candlestick, K = bracelet, L \= saturday, write('Correct answers = 2'),nl, write('Hint! Motive and Jewelry are correct!'), nl, nl,
        write("Look at this piece of code in Prolog to better understand its rule:"),nl, write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
            write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.

%Motive and Date
check(H, I, J, K, L) :- H \= dining_room, I = revenge, J \= candlestick, K \= bracelet, L = saturday, write('Correct answers = 2'),nl, write('Hint! Motive and Date are correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write(' date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


%Weapon and Jewerly
check(H, I, J, K, L) :- H \= dining_room, I \= revenge, J = candlestick, K = bracelet, L \= saturday, write('Correct answers = 2'),nl, write('Hint! Weapon and Jewerly are correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.



%weapon & motive
check(H, I, J, K, L) :- H \= dining_room, I \= revenge, J = candlestick, K \= bracelet, L = saturday, write('Correct answers = 2'),nl, write('Hint! Weapon and Motive are correct!'), nl, nl, 
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.



%weapon & jewerly
check(H, I, J, K, L) :- H \= dining_room, I \= revenge, J \= candlestick, K = bracelet, L = saturday, write('Correct answers = 2'),nl, write('Hint! Weapon and Jewelry are correct!'), nl, nl,
        write("Look at this piece of code in Prolog to better understand its rule:"),nl, write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
		write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


%Motive and Place and weapon
check(H, I, J, K, L) :- H = dining_room, I = revenge, J = candlestick, K \= bracelet, L \= saturday, write('Correct answers = 3'),nl, write('Hint! Motive and Place and weapon are correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
        write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
        write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Place and Jewelry and motive
check(H, I, J, K, L) :- H = dining_room, I = revenge, J \= candlestick, K = bracelet, L \= saturday, write('Correct answers = 3'),nl, write('Hint! Place and Jewelry and motive are correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Motive and Place and Date
check(H, I, J, K, L) :- H = dining_room, I = revenge, J \= candlestick, K \= bracelet, L = saturday, write('Correct answers = 3'),nl, write('Hint! Motive and Place and Date are correct!'), nl, nl, 
        write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl,
    write('date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.



%Place and Weapon and Jewerly
check(H, I, J, K, L) :- H = dining_room, I \= revenge, J = candlestick, K = bracelet, L \= saturday, write('Correct answers = 3'),nl, write('Hint! Place and Weapon and Jewerly are correct!'), nl, nl,
            write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl,
    write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Place and Date and Weapon
check(H, I, J, K, L) :- H = dining_room, I \= revenge, J = candlestick, K \= bracelet, L = saturday, write('Correct answers = 3'),nl, write('Hint! Place and Date and Weapon are correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl,
    write('date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Jewelry and Place and Date
check(H, I, J, K, L) :- H = dining_room, I \= revenge, J \= candlestick, K = bracelet, L = saturday, write('Correct answers = 3'),nl, write('Hint! Jewelry and Place and Date is correct!'), nl, nl, 
     write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl,
    write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Motive and Weapon and jewelry
check(H, I, J, K, L) :- H \= dining_room, I = revenge, J = candlestick, K = bracelet, L \= saturday, write('Correct answers = 3'),nl, write('Hint! Motive and Weapon and jewelry are correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Motive and Weapon and Date
check(H, I, J, K, L) :- H \= dining_room, I = revenge, J = candlestick, K \= bracelet, L = saturday, write('Correct answers = 3'),nl, write('Hint! Motive and Weapon and Date are correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Weapon and jewelry and Date
check(H, I, J, K, L) :- H \= dining_room, I \= revenge, J = candlestick, K = bracelet, L = saturday, write('Correct answers = 3'),nl, write('Hint! Weapon and jewelry and Date are correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
    write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Motive and Jewerly and Date
check(H, I, J, K, L) :- H \= dining_room, I = revenge, J \= candlestick, K = bracelet, L = saturday, write('Correct answers = 3'),nl, write('Hint! Motive and Jewerly and Date are correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Weapon and Motive And Jewerly and Date
check(H, I, J, K, L) :- H \= dining_room, I = revenge, J = candlestick, K = bracelet, L = saturday, write('Correct answers = 4'),nl, write('Hint! Weapon and Motive And Jewerly and Date are correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), nl, nl.



%Place and Jewerly and Date and Weapon
check(H, I, J, K, L) :- H = dining_room, I \= revenge, J = candlestick, K = bracelet, L = saturday, write('Correct answers = 4'),nl, write('Hint! Place and Jewerly and Date and Weapon are correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
    write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), nl, nl.



%Place and Jewerly and Motive and Date
check(H, I, J, K, L) :- H = dining_room, I = revenge, J \= candlestick, K = bracelet, L = saturday, write('Correct answers = 4'),nl, write('Hint! Place and Jewerly and Motive and Date are correct!'), nl, nl,
        write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), nl, nl.


% Place and Motive and Date and Weapon
check(H, I, J, K, L) :- H = dining_room, I = revenge, J = candlestick, K \= bracelet, L = saturday, write('Correct answers = 4'),nl, write('Hint! Place and Motive and Date and Weapon are correct!'), nl, nl,
            write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = garden, \\+ S = pool.'),nl,nl,
    write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = cigarette, \\+ Y = grass. '),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), nl, nl.


% Place and Motive and Weapon and jewelry 
check(H, I, J, K, L) :- H = dining_room, I = revenge, J = candlestick, K = bracelet, L \= saturday, write('Correct answers = 4'),nl, write('Hint! Place and Motive and Weapon and jewelry are correct!'), nl, nl,
                write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right.'),nl,nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = money.'),nl,nl,
    write('has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = blonde, \\+ Y = black.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), nl, nl.

check(H, I, J, K, L) :- H = dining_room, I = revenge, J = candlestick, K = bracelet, L = saturday, write('Congratulations!! You answered all the questions correctly.'), retract(u(OldValue)), NewValue is OldValue + 1, assert(u(NewValue)), nl,nl.


check_murderer(M) :- M = green, write('Congratulations! You identified the murderer!'), nl, nl, p(P), write('*** Your Final point =  '), write(P), write(' ***'), nl, nl, solve_murderer(_,_,_,_,_,_).
check_murderer(M) :- M \= green, write('Sorry! Your guess was incorrect!'), nl, nl, retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), p(P), write('*** Your Final point =  '), write(P), write(' ***'), nl, nl, solve_murderer(_,_,_,_,_,_).

start_game/0 :-
    write("************* Welcome Detective ************* "),nl,nl,
    write('A brutal murder has occurred at the grand estate of the wealthy Rihanna family and this is the list of suspects:'),nl,
    write("Men: mustard, plum, green, brunette"),nl,
    write("Women: scarlett, peacock, peach, rihanna"),nl,nl,
    write("These are some facts about the relation between suspects and clues:"),nl,nl,

    write('% Declare the handedness of suspects'),nl,
    write("handedness(mustard, left)."),nl,
    write("handedness(green, left)."),nl,
    write("handedness(brunette, right)."),nl,
    write("handedness(scarlett, left)."),nl,
    write("handedness(peach, right)."),nl,
    write("handedness(peacock, left)."),nl,
    write("handedness(plum, left)."),nl,
    write("handedness(rihanna, right)."),nl,nl,
    

    write('% Declare what each suspects smoke'),nl,
    write("smoke(green, pipe)."),nl,
    write("smoke(peacock, cigarette)."),nl,
    write("smoke(plum, cigarette)."),nl,
    write("smoke(mustard, cigarette)."),nl,
    write("smoke(peach, pipe)."),nl,
    write("smoke(brunette, cigarette)."),nl,
    write("smoke(scarlett, grass)."),nl,
    write("smoke(rihanna, grass)."),nl,nl,


    write('% Declare the hair color'),nl,
    write("hair_color(mustard, black)."),nl,
    write("hair_color(green, brown)."),nl,
    write("hair_color(brunette, blonde)."),nl,
    write("hair_color(scarlett, blonde)."),nl,
    write("hair_color(peach, black)."),nl,
    write("hair_color(peacock, blonde)."),nl,
    write("hair_color(plum, black)."),nl,
    write("hair_color(rihanna, brown)."),nl,nl,


    write('% Declare the day victim meets the suspects'),nl,
    write("meeting_day(green, saturday)."),nl,
    write("meeting_day(peacock, saturday)."),nl,
    write("meeting_day(plum, sunday)."),nl,
    write("meeting_day(mustard, saturday)."),nl,
    write("meeting_day(peach, friday)."),nl,
    write("meeting_day(brunette, sunday)."),nl,
    write("meeting_day(scarlett, saturday)."),nl,
    write("meeting_day(rihanna, sunday)."),nl,nl,


    write('% Declare which suspect has which weapon'),nl,
    write("has_weapon(plum, pistol)."),nl,
    write("has_weapon(mustard, knife)."),nl,
    write("has_weapon(peach, rope)."),nl,
    write("has_weapon(scarlett, candlestick)."),nl,
    write("has_weapon(peacock, knife)."),nl,
    write("has_weapon(brunette, wrench)."),nl,
    write("has_weapon(green, poison)."),nl,
    write("has_weapon(rihanna, pistol)."),nl,nl,

	
    write('% Declare what jewelry each suspect wears'),nl,
    write("jewelry(mustard, necklace)."),nl,
    write("jewelry(green, bracelet)."),nl,
    write("jewelry(brunette, necklace)."),nl,
    write("jewelry(scarlett, earring)."),nl,
    write("jewelry(peach, bracelet)."),nl,
    write("jewelry(peacock, necklace)."),nl,
    write("jewelry(plum, earring)."),nl,
    write("jewelry(rihanna, bracelet)."),nl,nl,


    write('% Declare the possible motives'),nl,
    write("motive(mustard, revenge)."),nl,
    write("motive(green, heritage)."),nl,
    write("motive(scarlett, money)."),nl,
    write("motive(plum, heritage)."),nl,
    write("motive(peach, passion)."),nl,
    write("motive(peacock, money)."),nl,
    write("motive(brunette, revenge)."),nl,
    write("motive(rihanna, money)."),nl,nl,


    write('% Declare the possible crime scenes'),nl,
    write("kills_in(peacock, kitchen)."),nl,
    write("kills_in(peach, library)."),nl,
    write("kills_in(scarlett, bedroom)."),nl,
    write("kills_in(mustard, pool)."),nl,
    write("kills_in(plum, garden)."),nl,
    write("kills_in(brunette, garden)."),nl,
    write("kills_in(green, dining_room)."),nl,
    write("kills_in(rihanna, pool)."),nl,nl,
	
    initialize_p,
    write(' << By considering that each wrong guess deducts 5 points from 100, Let us begin the investigation: >> '), nl, nl,
    repeat,
      initialize_u,
      write("On Monday morning, Mrs. Rihanna's body was found by her private maid. Considering that the maid only has access to the indoor area, can you guess the location of the murder?"), nl,
      write('Place that crime happened?'), nl, write('[ garden, library,garage, bedroom, kitchen, dining_room, pool ]'), nl,
      read(A),
      write("After investigating, the police have determined that the important documents of Mrs. Rihanna's factory has been fired in the fire place, and a left-hand glove stained with the blood of the victim was found in the fire place too. Can you guess the motive for the murder?"), nl,
      write('What was the motive?'), nl, write('[hatred, money, revenge, heritage, passion]'), nl,
      read(B),
      write("Doctor stated that the cause of death was concussion and bleeding. Can you guess the weapon?"), nl,
      write('Weapon used in the crime?'), nl, write('[pistol, rope, knife, poison, candlestick, wrench]'), nl,
      read(C),
      write("The police found brown hair under the victim's fingernail, which belongs to the murderer. Additionally, they have found a piece of jewelry near the fireplace that does not belong to her. Can you guess the jewelry?"), nl,
      write('What was the jewelry?'), nl, write('[necklace, earring, bracelet]'), nl,
      read(D),nl,
      write("According to the fact that the victim was not a smoker, the maid said that the whole room was filled with a pipe smoke smell, which could be related to the last meeting between the victim and the killer. On which day did the murder occur?"), nl,
      write('Date of crime?'), nl, write('[friday, sunday, saturday]'), nl,
      read(E),nl,    
      check(A, B, C, D, E),
      u(U),
      p(P),
      write('Your point = '), write(P), nl, nl,
 	  (P =< 0, write(" >>>  Game over!  <<< "),nl ; U > 0), !,
    
    P > 0,
    write('Now it is time for your final guess!'),nl,
    write("The last clue is that a In the backyard of the house, the footprint of a shoe belonging to a man has been found.."), nl,
    write('Who is the murderer?'),nl,
    read(F),
    check_murderer(F),nl.


