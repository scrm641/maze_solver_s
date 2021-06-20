#include <stdio.h>
#include <iostream>
using namespace std;
/*
x refers to ROWs
y refers to COLUMNs
*/
#define N 10
#define x0 1
#define y0 1
#define xf 8
#define yf 8
#define DIMx 11
#define DIMy 10
/* A recursive utility function to solve Maze problem */
bool solveMazeUtil(int maze[DIMx][DIMy], int x, int y, int sol[DIMx][DIMy])
{
    // if (x, y is goal) return true
    if ( x == xf && y == yf && maze[x][y] == 1)
    { sol[x][y] = 1;  return true; }
    // Check if maze[x][y] is valid
    if ((x >= 0 && x < DIMx && y >= 0 && y < DIMy && maze[x][y] == 1)) // IS SAFE
    {
        // Check if the current block is already part of solution path.
        if (sol[x][y] == 1) {return false;}// mark x, y as part of solution path
        else {sol[x][y] = 1;}
        /* Move forward in x direction */
        if (solveMazeUtil(maze, x + 1, y, sol) == true) {return true;} /* If moving in x direction doesn't give solution then Move down in y direction */
        if (solveMazeUtil(maze, x, y + 1, sol) == true) {return true;} /* If moving in y direction doesn't give solution then Move back in x direction */
        if (solveMazeUtil(maze, x - 1, y, sol) == true) {return true;} /* If moving backwards in x direction doesn't give solution then Move upwards in y direction */
        if (solveMazeUtil(maze, x, y - 1, sol) == true) {return true;} /* If none of the above movements work then BACKTRACK: unmark x, y as part of solution path */
        else {sol[x][y] = 0; return false;}
    }

    else {return false;}
}
/* MAIN PROGRAM*/
int main()
{
    int maze[DIMx][DIMy]
        = { { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 1, 1, 1, 0, 1, 1, 1, 0, 1, 0 },
            { 1, 1, 1, 0, 1, 1, 0, 1, 0, 0 },
            { 0, 0, 1, 1, 1, 0, 0, 0, 0, 0 },
            { 1, 1, 1, 1, 1, 1, 1, 0, 1, 0 },
            { 1, 0, 1, 1, 1, 1, 0, 1, 0, 0 },
            { 1, 0, 0, 0, 1, 0, 0, 0, 0, 0 },
            { 1, 0, 1, 1, 1, 1, 1, 1, 1, 0 },
            { 1, 1, 1, 0, 0, 0, 1, 1, 1, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 } };
    int sol[DIMx][DIMy]
        = { { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }};
    char maze_t[DIMx][DIMy];
    for (int i = 0; i<DIMx;i++)
    {
       for (int j = 0; j<DIMy;j++)
       {
           if (maze[i][j] == 1)
           {
               maze_t[i][j] = ' ';
           }
           else
           {
               maze_t[i][j] = 'Û';
           }
       }
    }

    cout<<"\n\n\n"<<endl;
    for (int i = 0; i<DIMx;i++)
    {
       for (int j = 0; j<DIMy;j++)
       {
               cout<<maze_t[i][j];

       }
           cout<<""<<endl;
    }
cout<<"\n\n"<<endl;
    if (solveMazeUtil(maze, x0, y0, sol)== false)
    {
        printf("Solution doesn't exist");
        return false;
    }
    else
    {
        for (int i = 0; i < DIMx; i++)
        {
            for (int j = 0; j < DIMy; j++)
            {printf(" %d ", sol[i][j]);}
            printf("\n");
        }

    }

    // Solve for recreate table
    for (int i = 0; i<N;i++)
    {
       for (int j = 0; j<N;j++)
       {
           if (sol[i][j] == 1)
           {
               maze_t[i][j] = 'x';
           }

       }
    }
    cout<<"\n\n"<<endl;
    for (int i = 0; i<DIMx;i++)
    {
       for (int j = 0; j<DIMy;j++)
       {
               cout<<maze_t[i][j];

       }
           cout<<""<<endl;
    }
    return 0;
}
