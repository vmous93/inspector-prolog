%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%       Detective Prolog  Level 2      %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Declare the victims
victim(mustard).


% Declare the men
man(snoop).
man(green).
man(plum).
man(peach).


% Declare the women
woman(rihanna).
woman(scarlett).
woman(peacock).
woman(brunette).


% Declare the handedness of suspects
handedness(green, left).
handedness(brunette, right).
handedness(scarlett, left).
handedness(peach, left).
handedness(peacock, left).
handedness(plum, right).
handedness(rihanna, right).


% Declare what each suspects smoke
smoke(green, pipe).
smoke(peacock, pipe).
smoke(plum, cigarette).
smoke(peach, cigarette).
smoke(brunette, cigarette).
smoke(scarlett, grass).
smoke(rihanna, grass).


% Declare the hair color
hair_color(green, brown).
hair_color(brunette, black).
hair_color(scarlett, blonde).
hair_color(peach, blonde).
hair_color(peacock, blonde).
hair_color(plum, black).
hair_color(rihanna, brown).


% Declare the day victim meets the suspects
meeting_day(green, friday).
meeting_day(peacock, saturday).
meeting_day(plum, sunday).
meeting_day(peach, friday).
meeting_day(brunette, sunday).
meeting_day(scarlett, saturday).
meeting_day(rihanna, sunday).


% Declare which suspect has which weapon
has_weapon(plum, pistol).
has_weapon(peach, knife).
has_weapon(scarlett, poison).
has_weapon(peacock, rope).
has_weapon(brunette, wrench).
has_weapon(green, candlestick).
has_weapon(rihanna, knife).


% Declare what jewelry each suspect wears
jewelry(green, earring).
jewelry(brunette, bracelet).
jewelry(scarlett, earring).
jewelry(peach, necklace).
jewelry(peacock, necklace).
jewelry(plum, earring).
jewelry(rihanna, bracelet).


% Declare the possible motives
motive(green, heritage).
motive(scarlett, money).
motive(plum, heritage).
motive(peach, money).
motive(peacock, money).
motive(brunette, revenge).
motive(rihanna, passion).


% Declare the possible crime scenes
kills_in(peacock, library).
kills_in(peach, kitchen).
kills_in(scarlett, kitchen).
kills_in(plum, garden).
kills_in(brunette, garden).
kills_in(green, stable).
kills_in(rihanna, pool).


% Declare the suspects
suspect(X):- man(X); woman(X), \+ victim(X).


% Declare the victim found inside the house
crime_place(X, S) :- suspect(X), kills_in(X, S), \+ S = pool, \+ S = garden, \+ S = stable.

% Declare the new list of the suspect based on the fact that there was trace of blood at the crime scene and cause of death was bleeding from the left side of mustard neck
crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \+ Y = poison, \+ Y = rope, \+ Z = right.

% Declare the new list of the suspect based on the fact that safebox has been empty
motive_crime(X, Y) :- suspect(X), motive(X, Y), \+ Y = passion, \+ Y = revenge.

% Declare the new list of the suspect based on the fact that suspect was blonde and has a jewelry
has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \+ Y = black, \+ Y = brown.

% Declare the new list of the suspect based on the fact that safebox has been empty
date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \+ Y = pipe, \+ Y = grass. 


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


check(H, I, J, K, L) :- H \= kitchen, I \= money, J \= knife, K \= necklace, L \= friday, write('Correct answers = 0'),nl, write('Hint! Date is friday!'),nl,nl, 
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 25, assert(p(NewValue)),nl, nl.



%place
check(H, I, J, K, L) :- H = kitchen, I \= money, J \= knife, K \= necklace, L \= friday, write('Correct answers = 1'),nl, write('Hint! Place is correct!'), nl, nl,
         write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = pool, \\+ S = garden, \\+ S = stable.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 20, assert(p(NewValue)), nl, nl.



%motive
check(H, I, J, K, L) :- H \= kitchen, I = money, J \= knife, K \= necklace, L \= friday, write('Correct answers = 1'),nl, write('Hint! Motive is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = revenge.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 20, assert(p(NewValue)), nl, nl.



%Weapon
check(H, I, J, K, L) :- H \= kitchen, I \= money, J = knife, K \= necklace, L \= friday, write('Correct answers = 1'),nl, write('Hint! Weapon is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl, 
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 20, assert(p(NewValue)), nl, nl.


%Jewerly
check(H, I, J, K, L) :- H \= kitchen, I \= money, J \= knife, K = necklace, L \= friday, write('Correct answers = 1'),nl, write('Hint! Jewelry is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = black, \\+ Y = brown."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 20, assert(p(NewValue)), nl, nl.


%Date
check(H, I, J, K, L) :- H \= kitchen, I \= money, J \= knife, K \= necklace, L = friday, write('Correct answers = 1'),nl, write('Hint! Date is correct!'), nl, nl, 
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = pipe, \\+ Y = grass. "),nl, nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 20, assert(p(NewValue)), nl, nl.


%Place % Weapon
check(H, I, J, K, L) :- H = kitchen, I = money, J \= knife, K \= necklace, L \= friday, write('Correct answers = 2'),nl, write('Hint! Place is correct! Weapon is incorrect!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = pool, \\+ S = garden, \\+ S = stable.'),nl,nl,
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


%Weapon & Motive
check(H, I, J, K, L) :- H = kitchen, I \= money, J = knife, K \= necklace, L \= friday, write('Correct answers = 2'),nl, write('Hint! Weapon is correct! Motive is incorrect!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl, 
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = revenge.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


%Place & Date
check(H, I, J, K, L) :- H = kitchen, I \= money, J \= knife, K = necklace, L \= friday, write('Correct answers = 2'),nl, write('Hint! Place is correct! Date is incorrect!'), nl, nl, 
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = pool, \\+ S = garden, \\+ S = stable.'),nl,nl,
    write("date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = pipe, \\+ Y = grass. "),nl, nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


% Date & Jewerly
check(H, I, J, K, L) :- H = kitchen, I \= money, J \= knife, K \= necklace, L = friday, write('Correct answers = 2'),nl, write('Hint! Date is correct! Jewelry is incorrect!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = black, \\+ Y = brown."),nl,nl,
    write("date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = pipe, \\+ Y = grass. "),nl, nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


%Motive & Date
check(H, I, J, K, L) :- H \= kitchen, I = money, J = knife, K \= necklace, L \= friday, write('Correct answers = 2'),nl, write('Hint! Motive is correct! Date is incorrect!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = revenge.'),nl,nl,
    write("date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = pipe, \\+ Y = grass. "),nl, nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


%jewerly & weapon
check(H, I, J, K, L) :- H \= kitchen, I = money, J \= knife, K = necklace, L \= friday, write('Correct answers = 2'),nl, write('Hint! Jewelry is correct! Weapon is incorrect!'), nl, nl, 
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = black, \\+ Y = brown."),nl,nl,
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.

%Date & place
check(H, I, J, K, L) :- H \= kitchen, I = money, J \= knife, K \= necklace, L = friday, write('Correct answers = 2'),nl, write('Hint! Date is correct! Place is incorrect!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = pipe, \\+ Y = grass. "),nl, nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = pool, \\+ S = garden, \\+ S = stable.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.



%weapon & Motive
check(H, I, J, K, L) :- H \= kitchen, I \= money, J = knife, K = necklace, L \= friday, write('Correct answers = 2'),nl, write('Hint! Weapon is correct! Motive is incorrect!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl, nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = revenge.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


%Weapon & place
check(H, I, J, K, L) :- H \= kitchen, I \= money, J = knife, K \= necklace, L = friday, write('Correct answers = 2'),nl, write('Hint! Weapon is correct! Place is incorrect!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = pool, \\+ S = garden, \\+ S = stable.'),nl,nl,
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.


%Jewerly & weapon
check(H, I, J, K, L) :- H \= kitchen, I \= money, J \= knife, K = necklace, L = friday, write('Correct answers = 2'),nl, write('Hint! Jewelry is correct! Weapon is incorrect!'), nl, nl, 
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = black, \\+ Y = brown."),nl,nl,
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 15, assert(p(NewValue)), nl, nl.



%place %Motive
check(H, I, J, K, L) :- H = kitchen, I = money, J = knife, K \= necklace, L \= friday, write('Correct answers = 3'),nl, write('Hint! Place and Motive is correct!'), nl, nl, 
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = pool, \\+ S = garden, \\+ S = stable.'),nl,nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = revenge.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.



%place & Jewerly
check(H, I, J, K, L) :- H = kitchen, I = money, J \= knife, K = necklace, L \= friday, write('Correct answers = 3'),nl, write('Hint! Place and Jewelry is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = pool, \\+ S = garden, \\+ S = stable.'),nl,nl,
    write("has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = black, \\+ Y = brown."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.



%motive & Date
check(H, I, J, K, L) :- H = kitchen, I = money, J \= knife, K \= necklace, L = friday, write('Correct answers = 3'),nl, write('Hint! Motive and Date is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = revenge.'),nl,nl,
    write("date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = pipe, \\+ Y = grass. "),nl, nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%place & weapon
check(H, I, J, K, L) :- H = kitchen, I \= money, J = knife, K = necklace, L \= friday, write('Correct answers = 3'),nl, write('Hint! Place and Weapon is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = pool, \\+ S = garden, \\+ S = stable.'),nl,nl,
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Place & date
check(H, I, J, K, L) :- H = kitchen, I \= money, J = knife, K \= necklace, L = friday, write('Correct answers = 3'),nl, write('Hint! Place and Date is correct!'), nl, nl, 
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = pipe, \\+ Y = grass. "),nl, nl,
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = pool, \\+ S = garden, \\+ S = stable.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Jewerly & date
check(H, I, J, K, L) :- H = kitchen, I \= money, J \= knife, K = necklace, L = friday, write('Correct answers = 3'),nl, write('Hint! Jewelry and Date is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = pipe, \\+ Y = grass. "),nl, nl,
    write("has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = black, \\+ Y = brown."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.
	

%motive & jewerly
check(H, I, J, K, L) :- H \= kitchen, I = money, J = knife, K = necklace, L \= friday, write('Correct answers = 3'),nl, write('Hint! Motive and jewelry is correct!'), nl, nl, 
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = revenge.'),nl,nl,
    write("has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = black, \\+ Y = brown."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Motive & weapon
check(H, I, J, K, L) :- H \= kitchen, I = money, J = knife, K \= necklace, L = friday, write('Correct answers = 3'),nl, write('Hint! Motive and Weapon is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = revenge.'),nl,nl,
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.

%Weapon & Jewerly
check(H, I, J, K, L) :- H \= kitchen, I \= money, J = knife, K = necklace, L = friday, write('Correct answers = 3'),nl, write('Hint! Weapon and jewelry is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = black, \\+ Y = brown."),nl,nl,
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.


%Motive & date
check(H, I, J, K, L) :- H \= kitchen, I = money, J \= knife, K = necklace, L = friday, write('Correct answers = 3'),nl, write('Hint! Motive and Date is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = revenge.'),nl,nl,
    write("date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = pipe, \\+ Y = grass. "),nl, nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 10, assert(p(NewValue)), nl, nl.



%Weapon & Date
check(H, I, J, K, L) :- H \= kitchen, I = money, J = knife, K = necklace, L = friday, write('Correct answers = 4'),nl, write('Hint! Weapon and Date is correct!'), nl, nl, 
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl,nl,
    write("date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = pipe, \\+ Y = grass. "),nl, nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), nl, nl.


%place & weapon
check(H, I, J, K, L) :- H = kitchen, I \= money, J = knife, K = necklace, L = friday, write('Correct answers = 4'),nl, write('Hint! Place and Weapon is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = pool, \\+ S = garden, \\+ S = stable.'),nl,nl,
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), nl, nl.

%Motive & date
check(H, I, J, K, L) :- H = kitchen, I = money, J \= knife, K = necklace, L = friday, write('Correct answers = 4'),nl, write('Hint! Motive and Date is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = revenge.'),nl,nl,
    write("date(X, Y, Z) :- suspect(X), smoke(X, Y), meeting_day(X, Z), \\+ Y = pipe, \\+ Y = grass. "),nl, nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), nl, nl.


%place & motive
check(H, I, J, K, L) :- H = kitchen, I = money, J = knife, K \= necklace, L = friday, write('Correct answers = 4'),nl, write('Hint! Place and Motive is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write('crime_place(X, S) :- suspect(X), kills_in(X, S), \\+ S = pool, \\+ S = garden, \\+ S = stable.'),nl,nl,
    write('motive_crime(X, Y) :- suspect(X), motive(X, Y), \\+ Y = passion, \\+ Y = revenge.'),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), nl, nl.

%weapon & Jewerly
check(H, I, J, K, L) :- H = kitchen, I = money, J = knife, K = necklace, L \= friday, write('Correct answers = 4'),nl, write('Hint! Weapon and jewelry is correct!'), nl, nl,
    write("Look at this piece of code in Prolog to better understand its rule:"),nl, 
    write("crime_weapon(X, Y, Z) :- suspect(X), has_weapon(X, Y), handedness(X, Z), \\+ Y = poison, \\+ Y = rope, \\+ Z = right."),nl,nl,
    write("has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \\+ Y = black, \\+ Y = brown."),nl,nl,
    write('Try again and refine your answers'), retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), nl, nl.


check(H, I, J, K, L) :- H = kitchen, I = money, J = knife, K = necklace, L = friday, write('Congratulations!! You answered all the questions correctly.'), retract(u(OldValue)), NewValue is OldValue + 1, assert(u(NewValue)), nl,nl.



check_murderer(M) :- M = peach, write('Congratulations! You identified the murderer!'), nl, nl, p(P), write('*** Your Final point =  '), write(P), write(' ***'), nl, nl, solve_murderer(_,_,_,_,_,_).
check_murderer(M) :- M \= peach, write('Sorry! Your guess was incorrect!'), nl, nl, retract(p(OldValue)), NewValue is OldValue - 5, assert(p(NewValue)), p(P), write('*** Your Final point =  '), write(P), write(' ***'), nl, nl, solve_murderer(_,_,_,_,_,_).

start_game/0 :-
    write("************* Welcome Detective ************* "),nl,nl,
    write('A brutal murder has occurred at the grand estate of the wealthy mustard family and this is the list of suspects:'),nl,
    write("Men: peach, plum, green, snoop"),nl,
    write("Women: brunette, scarlett, peacock, rihanna"),nl,nl,
    write("These are some facts about the relation between suspects and clues:"),nl,nl,

    write('% Declare the handedness of suspects'),nl,
    write("handedness(green, left)."),nl,
    write("handedness(brunette, right)."),nl,
    write("handedness(scarlett, left)."),nl,
    write("handedness(peach, left)."),nl,
    write("handedness(peacock, left)."),nl,
    write("handedness(plum, right)."),nl,
    write("handedness(rihanna, right)."),nl,nl,
    

    write('% Declare what each suspects smoke'),nl,
    write("smoke(green, pipe)."),nl,
    write("smoke(peacock, pipe)."),nl,
    write("smoke(plum, cigarette)."),nl,
    write("smoke(peach, cigarette)."),nl,
    write("smoke(brunette, cigarette)."),nl,
    write("smoke(scarlett, grass)."),nl,
    write("smoke(rihanna, grass)."),nl,nl,


    write('% Declare the hair color'),nl,
    write("hair_color(green, brown)."),nl,
    write("hair_color(brunette, black)."),nl,
    write("hair_color(scarlett, blonde)."),nl,
    write("hair_color(peach, blonde)."),nl,
    write("hair_color(peacock, blonde)."),nl,
    write("hair_color(plum, black)."),nl,
    write("hair_color(rihanna, brown)."),nl,nl,


    write('% Declare the day victim meets the suspects'),nl,
    write("meeting_day(green, friday)."),nl,
    write("meeting_day(peacock, saturday)."),nl,
    write("meeting_day(plum, sunday)."),nl,
    write("meeting_day(peach, friday)."),nl,
    write("meeting_day(brunette, sunday)."),nl,
    write("meeting_day(scarlett, saturday)."),nl,
    write("meeting_day(rihanna, sunday)."),nl,nl,


    write('% Declare which suspect has which weapon'),nl,
    write("has_weapon(plum, pistol)."),nl,
    write("has_weapon(peach, knife)."),nl,
    write("has_weapon(scarlett, poison)."),nl,
    write("has_weapon(peacock, rope)."),nl,
    write("has_weapon(brunette, wrench)."),nl,
    write("has_weapon(green, candlestick)."),nl,
    write("has_weapon(rihanna, knife)."),nl,nl,


    write('% Declare what jewelry each suspect wears'),nl,
    write("jewelry(green, earring)."),nl,
    write("jewelry(brunette, bracelet)."),nl,
    write("jewelry(scarlett, earring)."),nl,
    write("jewelry(peach, necklace)."),nl,
    write("jewelry(peacock, necklace)."),nl,
    write("jewelry(plum, earring)."),nl,
    write("jewelry(rihanna, bracelet)."),nl,nl,


    write('% Declare the possible motives'),nl,
    write("motive(green, heritage)."),nl,
    write("motive(scarlett, money)."),nl,
    write("motive(plum, heritage)."),nl,
    write("motive(peach, money)."),nl,
    write("motive(peacock, money)."),nl,
    write("motive(brunette, revenge)."),nl,
    write("motive(rihanna, passion)."),nl,nl,


    write('% Declare the possible crime scenes'),nl,
    write("kills_in(peacock, library)."),nl,
    write("kills_in(peach, kitchen)."),nl,
    write("kills_in(scarlett, kitchen)."),nl,
    write("kills_in(plum, garden)."),nl,
    write("kills_in(brunette, garden)."),nl,
    write("kills_in(green, stable)."),nl,
    write("kills_in(rihanna, pool)."),nl,nl,
	
    initialize_p,
    write(' << By considering that each wrong guess deducts 5 points from 100, Let us begin the investigation: >> '), nl, nl,
    repeat,
      initialize_u,
      write("On Saturday morning, Mr. Mustard's private chef found his body inside the house, can you guess the location of the murder?"), nl,
      write('Place that crime happened?'), nl, write('[garden, library, bedroom, kitchen, garage, stable, pool]'), nl,
      read(A),
      write("After investigating, the police have determined that Mr. Mustard's safe has been robbed, Can you guess the motive for the murder?"), nl,
      write('What was the motive?'), nl, write('[hatred, money, revenge, heritage, passion]'), nl,
      read(B),
      write("Doctor stated that the cause of death was bleeding from the left side of mustard neck, Can you guess the weapon?"), nl,
      write('Weapon used in the crime?'), nl, write('[pistol, rope, knife, poison, candlestick, wrench]'), nl,
      read(C),
      write("The police have found a blonde hair under the victim's fingernail, which belongs to the murderer. Additionally, they have also found a piece of jewelry in the victim's fist that does not belong to him. Can you guess the jewelry?"), nl,
      write('What was the jewelry?'), nl, write('[necklace, earring, bracelet]'), nl,
      read(D),nl,
      write("According to the fact that the victim used to smoke pipe, but a cigarette butt was found in the house, which could be related to the last meeting between the victim and the killer. On which day did the murder occur?"), nl,
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


