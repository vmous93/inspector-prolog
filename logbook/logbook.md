<img src="logbook/images/Universite_de_Geneve_logo.svg.png" alt="alt text" width="350" height="100" align="center">

#### Outils Formels Avancés 2023

# INSPECTOR PROLOG

In this logbook we summarize our research work and develop it throughout the semester.


### (1st Week) 07.03.2023
**Zahra Jaleh**

This week, we focused on brainstorming ideas for our murder mystery project and discussing how to implement them using Prolog programming. We decided that the project would involve creating a murder mystery game in which the player would have to solve the murder by using clues and scenarios.

We started by discussing the different types of clues and scenarios that we could use in the game. We identified that the clues and scenarios should be carefully chosen to ensure that they are relevant to the story and that they help the player to solve the murder.

After discussing the different options, we came up with a list of possible clues and scenarios. We then evaluated each option based on its relevance to the story, its complexity, and its feasibility for implementation using Prolog.

We also took some time to prepare for our presentation and create a Gantt diagram. The Gantt diagram will provide a visual representation of our project timeline and goals. It will help us to keep track of our progress and ensure that we are staying on track to meet our deadlines. 

<div style="align-items:center">
        <figure>
            <img src="logbook/images/p1.png" alt="alt text" width="" height="150" align="Center">
            <figcaption>Fig1. A slide from the presentation which describes a scenario of the murder for the difficulty level 1</figcaption>
        </figure>
</div>

For next week, we will work on narrowing down our list of clues and scenarios and choosing the ones that are most relevant and feasible for implementation in Prolog. We will also begin to learn Prolog programming and work on structure of the game.


### (2nd Week) 14.03.2023
**Zahra Jaleh**

In the second week of our Murder Mystery Project in Prolog Programming, we focused on learning how to program in Prolog and becoming familiar with the Swish environment. We used the resource "The Power of Prolog" by Markus Triska, which proved to be an excellent reference in understanding the language and syntax of Prolog. We learned how to write facts and basic rules that would help our program determine who the murderer is in our murder mystery game. We also learned how to interact with users by allowing them to make guesses and comparing their answers to the correct ones.

As we began to develop our program, we realized that we needed to find a way to constrain the clues step by step to make the game more engaging and challenging. We plan to consult the following resources to further our understanding of how to write constraints and rules for puzzle games in Prolog:

1. "Learn Prolog Now!" by Patrick Blackburn, Johan Bos, and Kristina Striegnitz
2. "The Art of Prolog" by Leon Sterling and Ehud Shapiro
3. "Constraining Prolog Clauses for Puzzles" by William F. Clocksin
4. "Puzzles in Prolog" by James F. Allen

By studying these resources and experimenting with different approaches, we hope to find a method for constraining clues step by step in Prolog. Overall, we are excited about the progress we have made so far and look forward to continuing our work next week.


### (3rd Week) 21.03.2023
**Vahid Mousavinezhad**

This week, We continued to work on our Prolog program for a murder mystery game. We made much progress in defining the game elements and creating the rules for solving the murder.

To begin, we declared the possible suspects, murder weapons, crime scenes, motives, and days. Next, we defined relationships between these elements using the "related" predicate, which established the links between the "suspects", "weapons", "scenes", "motives", and "days". Using these relationships, we defined the solve_murder predicate, which checks if the inputted Suspect, Weapon, Scene, Motive, and Day match with the relationships established earlier. This will be used to determine whether the user has correctly solved the murder mystery.

Finally, we created the "start_game/0" predicate, which initiates the game by prompting the user to input the murder weapon, crime scene, motive, and day. Once the user has inputted their guesses, the "solve_murder" predicate is called to check whether the user's answers are correct. If so, the game ends and the user is congratulated.

For next week, We are looking forward to continuing to develop this game and exploring more ways to make it even more engaging and challenging. We are considering implementing our program recursively, which will enable the game to follow the clues and scenarios presented to the user. This recursive approach will add complexity to the game, making it even more educational.


### (4th Week) 28.03.2023
**Vahid Mousavinezhad**

This week, we made an effort to replace our previous approach with a new method. Specifically, we aimed to transform our program from a fact-based system to one that utilizes logical inference. We realized that our initial version did not meet the expectations, and this may be due to the fact that the necessary conditions for building our game were not addressed in the initial explanation.

To gain inspiration and ideas for solving puzzles in Prolog, we have been exploring existing examples of puzzle-solving in the language. This has helped us gain a deeper understanding of how to apply logical inference to our game and has given us new ideas on how to create a more challenging and engaging experience for players.

By doing so, we hope to present a better approach in the upcoming week. We are committed to improving our Murder Mystery Project in Prolog Programming and look forward to overcoming any obstacles along the way.


### (5th Week) 04.04.2023
**Zahra Jaleh**

This week, we continued our exploration of different examples to gain a better understanding of how to move our game towards logical inference, allowing the Prolog program to use the defined facts and rules to identify the murderer.

In addition, we brainstormed an idea for user engagement that would make the game even more exciting and challenging for the user, encouraging them to test their knowledge of Prolog and their understanding of the existing clues to arrive at the correct answers.

<div style="align-items:center">
        <figure>
            <img src="logbook/images/user1.png" alt="alt text" width="" height="100" align="Center">
            <figcaption>Fig2. A demo of the interactive part of the game with the user.</figcaption>
        </figure>
</div>

Our game has interactions with users and uses Prolog to check user inputs against actual scripts to determine the correctness of their answers. Each correct answer counts as a point for players.

Our hope is that these changes will meet our expectations and that we can further improve our program by developing more complex and longer scenarios for different levels of difficulty, showcasing the power of Prolog in logical inference. We believe that this will help us to create a more engaging and immersive experience for the user and allow them to truly appreciate the capabilities of Prolog in solving puzzles.

