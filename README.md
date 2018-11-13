# LMC2700project5

Deliverables
-----------------------------------------------
1. Friday, November 9: One Page Proposal
The proposal should explain the roles you have taken on, the concept you wish to explore, the platform you plan to use, and justifications for how these choices fit together and complement one another. Be prepared to share your proposal in class.
-----
2. Friday, November 16: Draft Game
Be prepared to share your progress with instructors during class.
-----
3. November 26, 28: In Class Presentations
Each group will give a 3 minute summary of their deliverables. All deliverables should be condensed into a short powerpoint presentation of about 5 slides + a title slide including your names and the name of the project. Please practice your presentation beforehand and be prepared to answer questions.
-----
4. December 3: Final Game Submission
-----


Puzzle Pandemonium

Roles: Each person is responsible for helping code, but will have an area to focus on when brainstorming new aspects.

Concept Builder: Paula, will make sure that the game stays within the original concept and any new additions contribute to that idea

Experience Architect: Zach, will ensure the game provides a meaningful and enjoyable experience for the player, and that the design is intuitive

Craft Engineer: Kameron, will have the group focus on maintaining realistic and achievable expectations for the craft and experience of the game.

Game Mechanic: Joseph, because he’s a G

Concept: Puzzle Pandemonium is a memory-based drawing game in which three players take turns constructing shapes over a playing grid and a fourth player attempts to reconstruct the picture created by the first three in a limited time.

Platform: For this project we plan to use Java in the Processing environment in order to create our game. We feel as though this environment is the most well-known among all of our group members and offers the greatest flexibility for simple, intuItive gameplay.


Justification: We aim to make our game a collaborative experience that lets the players interact with each other more than with the game. As we were brainstorming, our group members naturally gravitated towards certain roles and we felt as though this concept allowed us to meld our goals of interaction and collaboration.


Current Mechanics
-----------------------------------------------------------------------------------------------
Grid- Series of squares drawn using size of grid as constraint. 2D array is updated whenever the mouse is dragged over the corresponding square. Currently the frame is 500px wider than the grid, so there is a window to the right where we can write information for the players, such as the timer or how many squares they can still fill.

Highlighting/drawing- The 2D backing array is filled by the player's number whenever they draw on the grid.

Timer- Only for the 4th player. It will possibly shrink corresponding to difficulty.

Scoring- Current values: +10 if the squares match, +5 if the numbers don't match but are not null, -5 if old is null but new is not or if new is null but old is not.

Difficulty settings- Currently affects the number of squares in the grid. Could potentially affect timer length or other variables.

Player phases- Will be separated by screens that require action, so that the players can pass the computer easily.