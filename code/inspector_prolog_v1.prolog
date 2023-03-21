% Declare the suspects
suspect(scarlett).
suspect(mustard).
suspect(green).
suspect(peacock).
suspect(plum).
suspect(peach).
suspect(brunette).

% Declare the possible murder weapons
weapon(knife).
weapon(wrench).
weapon(rope).
weapon(pistol).
weapon(candlestick).
weapon(poison).

% Declare the possible crime scenes
scene(kitchen).
scene(dining_room).
scene(bedroom).
scene(library).
scene(garden).
scene(garage).
scene(pool).

% Declare the possible motives
motive(revenge).
motive(money).
motive(passion).
motive(hatred).
motive(heritage).

% Declare the possible days
day(friday).
day(saturday).
day(sunday).


% Define the relations between the suspects, weapons, scenes, and motives
related(scarlett, knife, kitchen, revenge, friday).
related(plum, poison, dining_room, money, saturday).
related(peacock, rope, bedroom, passion, friday).
related(mustard, pistol, bathroom, hatred, saturday).

% Define the rules for solving the murder
solve_murder(Suspect, Weapon, Scene, Motive, Day) :-
  suspect(Suspect),
  weapon(Weapon),
  scene(Scene),
  motive(Motive),
  day(Day),
  related(Suspect, Weapon, Scene, Motive, Day).

start_game/0 :-
  write('Welcome, Detective. Let us begin the investigation.'), nl,
  write('Please enter the murder weapon: [knife, gun, rope, pistol]'), nl,
  read(Weapon),
  write('Please enter the crime scene: [kitchen, living_room, bedroom, bathroom]'), nl,
  read(Scene),
  write('Please enter the motive: [revenge, money, passion, hatred]'), nl,
  read(Motive),
  write('Please enter the day: [friday, saturday, sunday]'), nl,
  read(Day),
  repeat,
      write('Who do you think is the murderer? [scarlett, plum, peacock, mustard]'), nl,
      read(Suspect),
      solve_murder(Suspect, Weapon, Scene, Motive, Day),
      write('Congratulations, Detective. You have solved the murder. The murderer was '), write(Suspect), write('.'), nl, !.