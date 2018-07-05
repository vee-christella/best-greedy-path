function [newRow, newCol, newElev] = RevWestPath(westRows, westCols, ...
    westElev, j)
% This function reverses three inputs of the west rows, columns and
% elevation values and removes the values in its current position in order
% to prevent double-ups when moving in the east direction
% This function is only called when moving in the west direction and allows
% the matrix to be read from left to right
% Inputs: westRows- the rows of the best path travelling west from the
%                   current position
%         westCols - the columns of the best path travelling west from the
%                    current position
%         westElev - the elevation values of the best path travelling west
%                    from the current position
%         j - a value to indicate the position of the array to be removed
%             that will be repeated in the east direction
% Outputs: newRow - the reversed rows of the best path travelling west but
%                   reading left to right (west to east)
%          newCols - the reversed columns of the best path travelling west
%                    but reading left to right (west to east)
%          newElev - the reversed elevation values of the best path
%                    travelling west but reading left to right
%                    (west to east)
%
% Author: Vanessa Ciputra
% Project; BestGreedyPath Helper Function


% Call the Reverse.m function to switch the elevation values
% in order, from west to east
[newElev] = Reverse(westElev);
[newCol] = Reverse(westCols);
[newRow] = Reverse(westRows);


% Ensure the starting elevation is not repeated by removing it in the array
newElev(j) = [];
newCol(j)= [];
newRow(j) = [];


end