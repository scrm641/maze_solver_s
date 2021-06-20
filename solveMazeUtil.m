function [solve, u]  = solveMazeUtil(maze,x,y,t)
        u=t;     
        xf   =  8;
        yf   =  8;
        DIMx = 11;
        DIMy = 10;
     if (  (x == xf) &&(y == yf ) && ( maze(x,y) == 1 )   )
             u(x,y) = 1;   
             solve = 1;         
             return
     end
     if ((x > 0 && x <= DIMx && y >0 && y <= DIMy && maze(x,y) == 1))
          if (u(x,y) == 1)
              solve = 0; return ;
          else
              u(x,y)= 1;
          end
          [r,d] = solveMazeUtil(maze, x + 1, y, u); 
          if ( r == 1 )
             solve = 1; u = d; return;
          end
          [r,d] = solveMazeUtil(maze, x, y + 1, u); 
          if ( r == 1)
             solve = 1; u = d;return;
          end
          [r,d] = solveMazeUtil(maze, x - 1, y, u); 
          if ( r == 1)
             solve = 1; u = d; return;
          end
          [r,d] = solveMazeUtil(maze, x, y - 1, u) ; 
          if ( r == 1 )
             solve = 1; u = d; return;
          else
             u(x,y) = 0; 
             solve = 0; return;
          end
      else
          solve = 0; return;          
               
     end 
end 

%function [solve, u]  = solveMazeUtil(maze,x,y,t)
%         u=t;
%         xf   =  8;
%         yf   =  8;
%         DIMx = 11;
%         DIMy = 10;
%      if (  (x == xf) &&(y == yf ) && ( maze(x,y) == 1 )   )
%              u(x,y) = 1;   
%              solve = 1;
%              return
%      end
%      if ((x > 0 && x <= DIMx && y >0 && y <= DIMy && maze(x,y) == 1))
%           if (t(x,y) == 1)
%               solve = 0; return 
%           else
%               u(x,y)= 1;
%           end
%           if ( solveMazeUtil(maze, x + 1, y, u) == 1)
%              solve = 1; return
%           end
%           if ( solveMazeUtil(maze, x, y + 1, u) == 1)
%              solve = 1; return
%           end
%           if ( solveMazeUtil(maze, x - 1, y, u) == 1)
%              solve = 1; return
%           end
%           if ( solveMazeUtil(maze, x, y - 1, u) == 1 )
%              solve = 1; return;
%           else
%              u(x,y) = 0; 
%              solve = 0; return;
%           end
%       else
%           solve = 0; return;          
%                
%      end 
% end 
