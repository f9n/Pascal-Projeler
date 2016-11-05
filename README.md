# Pascal-Projeler
pascal da ufak eski projelerim

!- Eslestirme Oyunu
  Acun Ilicalin'in Survivor oyunundaki hafiza oyununa benziyor. 


!- Game of Life
  https://en.wikipedia.org/wiki/The_Game_of_Life


!- Memory Game
  This game aims at completing the memory walk using the transition cells of
the board. The user will be shown a matrix with transition cells (1) and empty
cells(0) for a predefined time. Then, the transition points will disappear and
the user will start to find the transition points step by step. If the user
makes a mistake, the game will end. Meanwhile, the time is important and
should be saved.
  0 0 1 1 0 0 1 0 0 0
  0 0 0 0 0 0 0 0 0 0
  1 0 0 0 0 1 0 0 0 0
  0 0 0 0 1 0 0 0 0 0
  0 0 0 0 0 0 0 0 1 1
  0 1 0 0 0 0 0 1 0 0
    Fig.1 An example of a raceway
  #System Details
This section describes the inputs and the outputs of your implementation.
You must design your implementation according to the rules mentioned in
this section.

  #System Parameters (Inputs and Outputs)
The program should ask the following parameter at the beginning of the
program
  -The length of the raceway (the number of columns) (10<= length <= 16)
  -The width of the raceway (the number of rows) (6<= width <= 10)
  -The number of transition cell at one column (1<= tcell <=3)
  -The time given to the user to memorize the raceway(board)(10<=t<=60)
After selection of the parameters, the system will generate a random
raceway based on the given parameters. Then, the board will be displayed
for t seconds. Afterwards, the board will disappear.
In 10 seconds, the user will start to find the transition cells in each column.
Whenever the user makes a true prediction, he/she will gain a chance to
make the next prediction. If he/she fails, the race will end. At the end, the
system will save the following parameters:
  -The time to complete the raceway
  -The number of true predictions
  -The name of the user
  -The point of the user
  -All the input parameters
In each play, the user will be given one JOKER. If the user could not
remember the place of next transition cell, he/she will use his/her JOKER
to open it.
  #Points and Score List
To calculate the score of the user, you should use the following equation((The length of the raceway + the width of the raceway ) * the number of
transition cells)) / (the time required to memorize)
  #Interface
The board should be displayed by using underscore character “ _ ”, hypen “ -
“ or vertical strip “ | “.
  0 0 1 1 0 0 1 0 0 0
  0 0 0 0 0 0 0 0 0 0
  1 0 0 0 0 1 0 0 0 0
  0 0 0 0 1 0 0 0 0 0
  0 0 0 0 0 0 0 0 1 1
  0 1 0 0 0 0 0 1 0 0
    Fig.2 The randomly generated raceway
  * * * * * * * * * *
  * * * * * * * * * *
  * * * * * * * * * *
  * * * * * * * * * *
  * * * * * * * * * *
  * * * * * * * * * *
    Fig. 3 The initial state of the raceway
  0 0 * * * * * * * *
  0 0 * * * * * * * *
  1 0 * * * * * * * *
  0 0 * * * * * * * *
  0 0 * * * * * * * *
  0 1 * * * * * * * *
    Fig. 4 The second round look of the board
  0 0 1 1 0 0 1 0 0 0
  0 0 0 0 0 0 0 0 0 0
  1 0 0 0 0 1 0 0 0 0
  0 0 0 0 1 0 0 0 0 0
  0 0 0 0 0 0 0 0 1 1
  0 1 0 0 0 0 0 1 0 0
    Fig. 5 A fully completed board
  0 0 1 1 1 * * * * *
  0 0 0 0 * * * * * *
  1 0 0 0 * * * * * *
  0 0 0 0 * * * * * *
  0 0 0 0 * * * * * *
  0 1 0 0 * * * * * *
    Fig. 5 A board look with a mistake
The user should also see the score board of the player. You should display
the score and time in descending way. All the information should be stored
only during the execution of the program.
  
