function [newPos] = GreedyPick(startPos, direction, grid)
% This function chooses which adjacent position has the smallest difference
% in elevation from the current position
% In the event of a tie, it will pick the northern-most direction (lowest
% row number)
% GreedyPick should ensure that values that are out of the boundaries of
% the matrix are not exceeded
%
% Inputs: currentPos - a 1x2 array representing the row and column
%                      respectively of the current position in the 2D
%                      array/grid
%         direction - an integer representing the direction to head in,
%                     with +1 going east and -1 going west
%         grid - the m x n matrix showing the elevations of all paths
% Outputs: newPos - a 1x2 array representing the row and column
%                   respectively of the new position that has been picked
%                   with the smallest difference
%
% Author: Vanessa Ciputra
% Project; Function 3


% Set the dimensions of the matrix to avoid exceeding maximum dimensions
dim = size(grid);


levels = zeros(3); % Pre-allocate levels array

% Extract the value of the current elevation
currentValue = grid(startPos(1),startPos(2));



% If the current position is on the top edge of the matrix, set the first
% level to infinity to avoid exceeding matrix dimensions
if (startPos(1) -1) > dim(1) || (startPos(1) - 1) < 1
    levels(1) = Inf;
    
    % If the current position is on the bottom edge of the matrix, set the
    % third level to infinity to avoid exceeding matrix dimensions
elseif (startPos(1) +1) > dim(1) || (startPos(1) + 1) < 1
    levels(3) = Inf;
    
end



% Cycle through the levels array
for i = 1:3
    % If the value has not been set to infinity, replace with the
    % corresponding adjacent elevations
    if levels(i) == 0
        levels(i) = grid((startPos(1) + (-2+i)),(startPos(2)+direction));
    end
end



% Call FindSmallestElevationChange.m function to find which position of the
% array has the smallest elevation
[smallestPosition] = FindSmallestElevationChangeNorth(currentValue,levels);


% Determine the coordinates of the adjacent position with the smallest
% elevation
newPos = (startPos + [-2+smallestPosition, direction]);



end