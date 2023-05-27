#### Group Members: Zahra Jaleh & Vahid Mousavinezhad

# INSPECTOR PROLOG

The goal of this project is to create an educational game based on logic programming. The idea is to find out who the murderer is using a list of facts, in the manner of a detective at a crime scene. We need to create a set of rules to gather evidence and assist users in tracking down the murderer.

We utilize Prolog to provide clues that aid in deducing which suspect is the murderer. Prolog employs logic-based deduction to systematically and efficiently eliminate suspects who do not fit the given clues until the correct answer is revealed.

Additionally, the game involves user interactions and employs Prolog to verify user inputs against actual scripts, determining the accuracy of their answers.

### PROJECT DESCRIPTION

A murder mystery game where the player, assumed to be a detective, tries to solve a murder by entering the murder weapon, location, day, motive, and suspect. The program uses a set of rules to determine which suspect committed the crime based on the entered information and check with the player’s guess. Clues and scenarios should be carefully chosen to ensure that they are relevant to the story and that they help the player to solve the murder.

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


#### What is Prolog?

Prolog is a logic programming language that operates based on a declarative approach, emphasizing the description of relationships and logical rules rather than explicit instructions. It allows users to define facts and rules and then query them to obtain logical deductions. Prolog programs consist of a knowledge base containing facts and rules, and queries are posed to the system to infer logical conclusions. It uses a form of automated reasoning called resolution to perform logical inference. Prolog's key strength lies in its ability to solve problems using logical and constraint-based methods

#### How are facts defined in Prolog?

In Prolog, facts are simple statements that represent true information about something. They consist of a predicate and its arguments, describing a relationship or property. Facts serve as the fundamental pieces of knowledge in Prolog, forming the basis for logical deductions and reasoning in the program.

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

