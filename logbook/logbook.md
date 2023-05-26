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


### (6th Week) 11.04.2023
**Zahra Jaleh**

During this week, we continued to work on improving our knowledge of the Prolog programming language and were able to achieve good results. To narrow down and eliminate suspects until we reach the main culprit based on facts and rules, we use operand negation /+.

Prolog uses a backward-chaining algorithm to search through its database of facts and rules to determine the answer to the queries. The negation operand is important in Prolog because it allows for non-monotonic reasoning, which is the ability to draw conclusions that can be invalidated by new information. By allowing for negation, Prolog can reason with incomplete or uncertain information, making it a powerful tool for solving puzzles.

Furthermore, based on feedback from Prof. Buchs and Dr. Morard regarding the interaction part with the user, we provide input data to the program in the form of multiple choices or single-word due to syntax limitations in the Prolog. We need more time to determine the best method.

<div style="align-items:center">
        <figure>
            <img src="logbook/images/p2.png" alt="alt text" width="" height="150" align="Center">
            <figcaption>Fig3. A slide from the presentation2 which describes the defenition of rules in the Prolog.</figcaption>
        </figure>
</div>

We have also prepared a presentation to present the work we have done and the things we want to do, which we will present on 18.04.2023. On that day, we will also show the sample code written in Prolog.


### (7th Week) 25.04.2023
**Vahid Mousavinezhad**

On April 18th, we unveiled our idea for an interactive game during a presentation. However, feedback from Prof. Buchs and Dr. Morard indicated that implementing player interaction may not be feasible. As a result, we made the decision to shift our focus towards creating a real prototype of the game using Prolog. This week, we diligently worked on developing the first version of the game, specifically targeting the easy difficulty level. Although the prototype was relatively simple, it effectively showcased the core gameplay mechanics, allowing us to gather valuable feedback for future improvements and refinements.

<div style="align-items:center">
        <figure>
            <img src="logbook/images/user2.png" alt="alt text" width="" height="150" align="Center">
            <figcaption>Fig4. It is the first version of Detective Prolog in SWI-Prolog. It demonstrates the interactive aspect with players.</figcaption>
        </figure>
</div>

As you can see in the image, players respond to questions based on the list of suspects, facts, and provided clues, and in the end, their score is displayed based on the correctness of their guesses. In this part of the project, scoring based on players' guesses has been the challenging aspect of our project up to this point.

We look forward to using the feedback will receive to iterate and improve upon our prototype as we continue to refine our game concept. We are ready to iterate upon our prototype and expand the game to encompass higher difficulty levels. Our goal is to transform our concept into a fully realized game that captivates and engages players.


### (8th Week) 02.05.2023
**Vahid Mousavinezhad**

During the past week, we made notable progress and finally unveiled the first version of our game, which was met with positive feedback.

Building upon this success, our supervisors encouraged us to amplify the level of player interaction, allowing for additional guessing opportunities to rectify any incorrect answers and ultimately guide players towards the correct solutions. In response to this challenge, we wholeheartedly dedicated our efforts throughout the week to tackle this important aspect. A pivotal step in this endeavor was the integration of a helpful hint feature within the game, effectively illuminating which answers provided by players were accurate and which ones missed the mark.

Additionally, we also began working on the advanced difficulty level and exploring potential scenarios for our game. We understand the importance and complexity of this phase, as it requires thorough consideration and precise execution to deliver a high-quality experience. We recognize the need for extra time and attention to ensure that our game provides an immersive and captivating experience for our players.

Looking ahead, we are hopeful that we will reach a definitive conclusion for the final scenario idea. Furthermore, we are committed to further refining the player interaction component, striving to provide an immersive and captivating experience that fully embodies our vision for the game.


### (9th Week) 09.05.2023
**Zahra Jaleh**

At the beginning of this week, we conducted a presentation and explained the progress of our project. We received positive feedback, and the first version of our game was able to capture the attention of the audience.

Professor Buchs proposed an idea to add to the game, which is to show the player a Prolog code in the "hints" section when they make a correct guess. This addition aims to incorporate an educational aspect into our game by teaching the players how to write Prolog rules while they play.

Therefore, this week we worked on this aspect of our game and successfully added this feature. We also finalized our second scenario and completed the Prolog programming. In the second scenario, we increased the difficulty level of the game by adding more elements for the player to guess.

<div style="align-items:center">
        <figure>
            <img src="logbook/images/idea_show_rule.jpg" alt="alt text" width="" height="150" align="Center">
            <figcaption>Fig5. It is the second version of Detective Prolog in SWI-Prolog. It demonstrates how to show the player a Prolog code in the "hints" section when they make a correct guess.</figcaption>
        </figure>
</div>

For the upcoming week, our plan is to start working on the third scenario and make changes to the game's scoring system.



### (10th Week) 16.05.2023
**Seyedvahid Mousavinezhad**

This week, our main focus was on implementing the scoring mechanism based on the player's answers in various attempts. The implementation of this game component proved to be quite challenging, but through extensive research, we were able to achieve the desired outcome.

<div style="align-items:center">
        <figure>
            <img src="logbook/images/guess.jpg" alt="alt text" width="" height="150" align="Center">
            <figcaption>Fig6. It is the third version of Detective Prolog in SWI-Prolog. It demonstrates the scoring mechanism based on the player's answers in various attempts.</figcaption>
        </figure>
</div>

We defined a dynamic variable for the initial score, which deducts 5 points for every incorrect guess. Additionally, we defined another dynamic variable that exits the loop and reaches the last guess, which is the name of the killer, in case all the questions are answered correctly.

<div style="align-items:center">
        <figure>
            <img src="logbook/images/dynamic_var.jpg" alt="alt text" width="500" height="50" align="Center">
            <figcaption>Fig7. Defenition of dynamic variables.</figcaption>
        </figure>
</div>

In addition to working on the scoring system, we also brainstormed the third game scenario this week. We are hopeful that we can successfully implement it and meet the deadline.

<div style="align-items:center">
        <figure>
            <img src="logbook/images/point_reduce.jpg" alt="alt text" width="" height="100" align="Center">
            <figcaption>Fig8. Prolog code that demonstrates the mechanism of reducing the score after each wrong guess.</figcaption>
        </figure>
</div>

For the upcoming week, our plan is to work on the third scenario and address any existing issues with the scoring component. We aim to refine the scoring mechanism to ensure accuracy and smooth gameplay.
