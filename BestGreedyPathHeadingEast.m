function [minRows, minCols, minElev] = BestPathHeadingEast(grid)
% This function finds the best greedy path starting from the very left
% edge, travelling east (right) until it hits the right edge.
% The path with the lowest row number is chosen if equally low cost
% alternatives are found
% Inputs: grid - the m x n matrix showing the elevations of all paths
% Outputs: minRows - an array to represent all of the rows of the best
%                     path being taken
%         minCols - an array to represent all of the columns of the best
%                     path being taken
%         minElev - the minimum elevation values of the path being taken
%
% Author: Vanessa Ciputra
% Project; Function 6


% Set dimensions for the matrix of the data
dim = size(grid);


minCost = Inf; % Set initial minCost function to always be bigger


% Pre-allocate arrays
minElev = zeros(dim(1),dim(2));
begin = zeros(1,dim(1)*2);


% Set direction to positive 1 to travel east
direction = 1;


% Cycle through each possible start position on the western edge
for i = 1:dim(1)
    begin(i*2-1) = i;
    begin(i*2) = 1;
end


% Using each possible start position, call GreedyWalk.m and
% FindPathElevationsAndCost.m functions to obtain the fastest path
for j = 1:2:length(begin)
    % Replace current position with each new coordinate
    startPos = [begin(j),begin(j+1)];
    
    [pathRows, pathCols] = GreedyWalk(startPos, direction, grid);
    
    [elev, cost] = FindPathElevationsAndCost(pathRows,pathCols,grid);
    
    
    % If the cost of the current path is less than the cost of the previous
    % path, replace output data
    if cost < minCost
        minCost = cost;
        minRows = pathRows;
        minCols = pathCols;
        minElev = elev;
        
    end
    
    
end

