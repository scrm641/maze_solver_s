
clc
%% Right Hand Algorith to SolveMaze
%% Initial Values
N    = 10; x0   =  1; y0   =  1; xf   =  8; yf   =  8; DIMx = 11; DIMy = 10;
%% Input Matrix
maze = [
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0; 
    1, 1, 0, 0, 1, 1, 1, 0, 1, 0;
    1, 1, 1, 0, 1, 1, 0, 1, 0, 0;
    0, 0, 1, 1, 1, 0, 0, 0, 0, 0;
    1, 1, 1, 1, 1, 1, 1, 0, 1, 0;
    1, 0, 1, 1, 1, 1, 0, 1, 0, 0;
    1, 0, 0, 0, 1, 0, 0, 0, 0, 0;
    1, 0, 1, 1, 1, 1, 1, 1, 1, 0;
    1, 1, 1, 0, 0, 0, 1, 1, 1, 0;
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1;
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1
]   ; 
%% Solve Initial Matrix
sol = zeros(DIMx, DIMy);
%% Call to recursive function
    [a, k] = solveMazeUtil(maze, x0, y0,sol) ;
    if(a == 0)    
        disp("There is not a Solution");
    else
        disp("Found");
    end 

