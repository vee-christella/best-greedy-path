function [totalRows, totalCols] = BestRowPath(startPos, grid)
% This function displays the rows and columns of the path that has been
% travelled which allows the minimum elevation cost possible.
% It backtracks via previous positions in order to create two arrays that
% represent the rows and columns of the best path being travelled from the
% particular starting position to any point on the eastern edge of the
% grid.
% Inputs: startPos - the m x n array of the starting position on the
%                    western edge
%         grid - the m x n matrix showing the elevations of all paths
% Outputs: totalRows - the subsequent rows of the best path that can be
%                      taken from the particular starting position
%          totalCols - the subsequent columns of the best path that can be
%                      taken from the particular starting position
%
% Author: Vanessa Ciputra
% Project; Helper Function 3 for BestPath


% Call BestPosition.m function in order to obtain the end position on the
% eastern wall, as well as arrays for the rows and column of the path
% that it travels
[endPos, prevPathRows, prevPathCols] = BestPosition(startPos, grid);


% Pre-allocate arrays
totalRows = zeros(1,length(grid));
totalCols = zeros(1,length(grid));


% Replace variables with current position
a = endPos(1);
b = endPos(2);
% Replace the last element of each array with current position coordinates
totalRows(1,length(grid)) = a;
totalCols(1,length(grid)) = b;

z = 1;


% Update each subsequent path into the final path array until all path
% information has been recorded
while prevPathRows(a,b) > 0
    
    % Replace variable with respective values that indicate the previous
    % path that had been taken to reach that position
    a = prevPathRows(a,b);
    b = prevPathCols(a,b);
    % Going backwards, replace each element with the respective values
    totalRows(1,(length(grid)-z)) = a;
    totalCols(1,(length(grid)-z)) = b;
    
    z = z + 1;   
end



end