function [adjElev, x, y] = AdjacentPaths(grid, newPos)
% This function calculates the adjacent 3 positions of the next column of
% the current position, and returns the values of elevation from the
% matrix.
% If the current position is at the top edge or the bottom edge of the
% matrix, the function only returns 2 values to ensure that matrix
% dimensions are not exceeded.
% Inputs: grid - the m x n matrix showing the elevations of all paths
%        newPos - the mxn coordinates of the current position
%        dim - the dimensions/size of the matrix 'grid'
% Outputs: adjElev - the elevation values of the adjacent positions, in the
%                    order of a row above, the same row, and a row below
%                    the current position but in the next column
%          x - a preset value depending on the current position to ensure
%              matrix dimensions are not exceeded in following processes
%          y - a preset value depending on the current position to ensure
%              matrix dimensions are not exceeded in following processes
%
% Author: Vanessa Ciputra
% Project; Helper Function 1 for BestPath


dim = size(grid); % Determine size of the array


% Find adjacent elements of elevation
if newPos(1) == 1
    
    % If on the top row, make sure the row above the current
    % position is not extracted
    adjElev = [grid((newPos(1)), (newPos(2) + 1)), ...
        grid((newPos(1) + 1),(newPos(2) + 1))];
    x = 0;  % Preset value to ensure matrix dimensions are not exceeded
    y = 2;
    
    
elseif newPos(1) == dim(1)
    
    % If on the bottom row, make sure the row below the current position is
    % not extracted
    adjElev = [grid((newPos(1) - 1),(newPos(2) + 1)), grid((newPos(1)), ...
        (newPos(2) + 1))];
    x = -1; % Preset value to ensure matrix dimensions are not exceeded
    y = 1;
    
    
else
    
    adjElev = [grid((newPos(1) - 1),(newPos(2) + 1)), grid((newPos(1)), ...
        (newPos(2) + 1)), grid((newPos(1) + 1),(newPos(2) + 1))];
    x = -1; % Preset value to ensure matrix dimensions are not exceeded
    y = 1;
end


end