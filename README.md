#### Group Members: Zahra Jaleh & Vahid Mousavinezhad

# INSPECTOR PROLOG

The goal of this project is to create an educational game based on logic programming. The idea is to find out who the murderer is using a list of facts, in the manner of a detective at a crime scene. We need to create a set of rules to gather evidence and assist users in tracking down the murderer.

We utilize Prolog to provide clues that aid in deducing which suspect is the murderer. Prolog employs logic-based deduction to systematically and efficiently eliminate suspects who do not fit the given clues until the correct answer is revealed.

Additionally, the game involves user interactions and employs Prolog to verify user inputs against actual scripts, determining the accuracy of their answers.

## PROJECT DESCRIPTION

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

We perform Prolog programming in SWISH (SWI-Prolog for SHaring), a web-based integrated development environment (IDE) specifically designed for Prolog programming. SWISH offers a convenient platform for writing, testing, and sharing Prolog code through a web browser interface.


### What is Prolog?

Prolog is a logic programming language that operates based on a declarative approach, emphasizing the description of relationships and logical rules rather than explicit instructions. It allows users to define facts and rules and then query them to obtain logical deductions. Prolog programs consist of a knowledge base containing facts and rules, and queries are posed to the system to infer logical conclusions. It uses a form of automated reasoning called resolution to perform logical inference. Prolog's key strength lies in its ability to solve problems using logical and constraint-based methods


### How are facts defined in Prolog?

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

### What is the rule in Prolog?

In Prolog, rules are used to define relationships between entities and to establish logical connections. They consist of a head and a body, separated by the ":-" operator. The head represents the goal or the conclusion, while the body contains the conditions or the premises that need to be satisfied for the rule to be true. Rules can also have multiple conditions in the body, connected by commas (",") to express logical conjunction.

In order to uncover the identity of a murderer, we analyze each crime scenario and develop additional rules that enable Prolog to deduce the murderer. However, before diving into these rules, let's discuss an essential Prolog operator called the negation opernad (\\+).


### What is "\\+" operand?

Prolog employs a backward-chaining algorithm to explore its knowledge base, which consists of facts and rules, in order to find answers to queries. The negation operator (/+) plays a significant role in Prolog as it allows for non-monotonic reasoning. This means that Prolog can draw conclusions that may be contradicted or invalidated by new information.

The negation operator enables Prolog to reason with incomplete or uncertain data, which greatly enhances its problem-solving capabilities. By utilizing negation, Prolog becomes a powerful tool for tackling puzzles and resolving complex mysteries, such as identifying the perpetrator of a crime.


```prolog
% Declare the suspects
suspect(X):- man(X); woman(X), \+ victim(X).
```

It means the suspect could be a man or(;) a woman who is not the victim.In the following, we you can see various clues and their corresponding rules. Each clue pertains to a specific element of the murder mystery, such as the motive, the weapon,...


**Clue1:**
"Police found victim's body on Saturday morning and doctor declare the crime happened about 12 hours ago."
```prolog
% Declare the date of crime
date(X) :- day(X), \+ X = saturday, \+ X = sunday.
```

**Clue2:**
"The police have found a black hair under the victim's fingernail, which belongs to the murderer. Additionally, they have also found a piece of jewelry in the victim's fist that does not belong to him. Can you guess the jewelry?"
```prolog
% Declare the new list of the suspect based on the fact that suspect was black and has a jewelry
has_jewelry(X, Y, Z) :- suspect(X), hair_color(X, Y), jewelry(X, Z), \+ Y = blonde, \+ Y = brown.
```

**Clue3:**
"Mr. Snoop's body was found by his maid. Considering that the maid only has access to the outdoor area, can you guess the location of the murder?"
```prolog
% Declare the victim found outside the house
crime_place(X, S) :- suspect(X), kills_in(X, S), \+ S = kitchen, \+ S = bedroom, \+ S = library.
```


### How does Prolog solve the mystery?
Using the defined rules for each scenario, we can use Prolog to deduce the identity of the murderer. By writing a predicate and querying it, Prolog will provide us with the exact evidence related to the crime and reveal the identity of murderer. Let's look at an example in SWISH:

```prolog
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
```

<div style="align-items:center">
        <figure>
            <img src="images/swish_reasoning.jpg" alt="alt text" width="" height="300" align="Center">
            <figcaption>Fig1. Swish UI and the Prolog deductions. </figcaption>
        </figure>
</div>
