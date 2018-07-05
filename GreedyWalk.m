function [pathRows, pathCols] = GreedyWalk(startPos, direction, grid)
% This function finds a greedy path from the starting position and heads in
% a specified direction from east to west or west to east, until the edge
% of the matrix is reached
% Each step is picked by the GreedyPick.m function
% Inputs: startPos - the starting position coordinates represented by
%                    [rows, columns]
%         direction - an integer representing the direction to head in,
%                     with +1 going east and -1 going west
%         grid - the m x n matrix showing the elevations of all paths
% Outpus: pathRows - an array to represent all of the rows of the path
%                    being taken
%         pathCols - an array to represent all of the columns of the path
%                    being taken
%
% Author: Vanessa Ciputra
% Project; Function 4



dim = size(grid);  % Determine the dimensions of the matrix

% Pre-allocate rows and columns array
pathRows = zeros(1,dim(2));
pathCols = zeros(1,dim(2));

% Initialise the starting row and columns in the first element each array
pathRows(1) = startPos(1);
pathCols(1) = startPos(2);



% If going west, ensure that columns are less than the columns of matrix
% If going east, ensure that columns are greater to 1
i = 2;
while (direction == 1 && (startPos(2) < dim(2))) || ...
        (direction == -1 && (startPos(2) > 1))
    
    % Call GreedyPick to determine the best elevation choice for adjacent
    % positions, and replace the startPos variable with the new position
    [startPos] = GreedyPick(startPos, direction, grid);
    
    % Add to output arrays
    pathRows(i) = startPos(1);
    pathCols(i) = startPos(2);
    
    
    % Increase the increment to identify the next position in the arrays
    i = i + 1;
    
end

% Clear any elements that have not been replaced
pathRows(i:length(pathRows)) = [];
pathCols(i:length(pathCols)) = [];


end