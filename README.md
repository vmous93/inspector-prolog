#### Group Members: Zahra Jaleh & Vahid Mousavinezhad

# INSPECTOR PROLOG

The goal of this project is to create an educational game based on logic programming. The idea is to find out who the murderer is using a list of facts, in the manner of a detective at a crime scene. We need to create a set of rules to gather evidence and assist users in tracking down the murderer.

We utilize Prolog to provide clues that aid in deducing which suspect is the murderer. Prolog employs logic-based deduction to systematically and efficiently eliminate suspects who do not fit the given clues until the correct answer is revealed.

Additionally, the game involves user interactions and employs Prolog to verify user inputs against actual scripts, determining the accuracy of their answers.

### PROJECT DESCRIPTION
A murder mystery game where the player, assumed to be a detective, tries to solve a murder by entering the murder weapon, location, day, motive, and suspect. The program uses a set of rules to determine which suspect committed the crime based on the entered information and check with the player’s guess.

**Suspects:**
Men:
    - Mustard
    - Green
    - Plum
    - Brunette

Women:
    - Scarlett
    - Peacock
    - Peach
    - Rihanna

**List of evidence:**
1. MURDER WEAPONS: Knife, Wrench, Rope, Pistol, Candlestick, Poison
2. LOCATIONS: Kitchen, Library, Dining room, Bedroom, Garage, Garden, Pool, Stable
3. WEEKDAYS: Friday, Saturday, Sunday
4. MOTIVES: Revenge, Heritage, Money, Passion, Hatred
5. HANDEDNESS: Left, Right
6. SMOKE: Pipe, Grass, Cigarette
7. HAIR COLOR: Black, Brown, Blonde

In our murder mystery game, we have provided Prolog with a set of facts about the suspects based on the list of evidence and the scenario. You can see some examples of them below:

```prolog
% Declare the men
man(snoop).
man(mustard).
man(green).
man(plum).
man(brunette).

% Declare the handedness of suspects
handedness(mustard, left).
handedness(green, left).
handedness(brunette, right).
handedness(scarlett, left).
handedness(peach, right).
handedness(peacock, left).
handedness(plum, left).
handedness(rihanna, right).

% Declare which suspect has which weapon
has_weapon(plum, pistol).
has_weapon(mustard, knife).
has_weapon(peach, rope).
has_weapon(scarlett, poison).
has_weapon(peacock, knife).
has_weapon(brunette, wrench).
has_weapon(green, candlestick).
has_weapon(rihanna, pistol).

```

