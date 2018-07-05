function [minRows, minCols, minElev, minCost] = BestGreedyPath(grid)
% This function calculates the greedy path from every single element in the
% matrix to find the best greedy path possible
% Middle elements must travel both east and west
% If alternatives are found with the same cost, the first path discovered
% is priorities
% Inputs: grid - the m x n matrix showing the elevations of all paths
% Outputs:  minRows - an array to represent all of the rows of the best
%                     path being taken
%         minCols - an array to represent all of the columns of the best
%                     path being taken
%         minElev - the minimum elevation values of the path being taken
%
% Author: Vanessa Ciputra
% Project; Function 7


% Set the dimensions of the matrix
dim = size(grid);

% Set initial values of variables to use later
minCost = Inf;
pathElev = [];
pathCost = 0;

for i = 1:dim(1); % Cycle through each position on the grid
    for j = 1:dim(2)
        startPos = [i,j]; % Assign starting position
        
        % Clear all arrays with each new position
        westRows = [];
        westCols = [];
        eastRows = [];
        eastCols = [];
        pathCost = 0;
        
        if j == dim(2) % If the eastern edge of grid is reached, end loop
            
            pathElev = [];
            pathCost = Inf;
            
            % Start with the west direction - only occurs if the position
            % is in the middle or at the eastern edge
        elseif (j > 1) & (j <= dim(2))
            direction = -1;
            
            
            % Call GreedyWalk.m and FindPathElevationsAndCost.m functions
            % to determine the best path from the position and the cost
            [westRows, westCols] = GreedyWalk(startPos, direction, grid);
            [westElev, cost] = ...
                FindPathElevationsAndCost(westRows,westCols,grid);
            
            % Call RevWestPath.m function to reverse all arrays of the
            % western direction (reading from left to right)
            [westRows, westCols, elev] = RevWestPath(westRows, ...
                westCols, westElev, j);
            
            
            % Store west elevations and costs into the final variables
            pathElev = elev;
            pathCost = cost;
            
        end
        
        if (j >= 1) & (j < dim(2))
            
            % Go from east to west direction
            direction = 1;
            
            % Call GreedyWalk.m and FindPathElevationsAndCost.m functions to
            % determine the best path from the position and the cost
            [eastRows, eastCols] = GreedyWalk(startPos, direction, grid);
            [elev, cost] = FindPathElevationsAndCost(eastRows, ...
                eastCols, grid);
            
            % Add east elevations and costs into the final variables
            pathCost = pathCost + cost;
            pathElev = [pathElev, elev];
            
        end
        
        % If the cost of the current path is less than the cost of the
        % previous path, replace output data
        if pathCost < minCost
            minCost = pathCost;
            minRows = [westRows, eastRows];
            minCols = [westCols, eastCols,];
            minElev = pathElev;
            
        end
        
        
    end
end