function [elev, cost] = FindBestPathElevationsAndCost(totalRows,totalCols,grid)
% This function finds the elevations encountered on a specific path and
% calculates the total cost of travelling that particular path
% Total cost is equal to the sum of all elevation changes
% Changes of elevation are all positive
% Inputs: pathRows - an array to represent all of the rows of the path
%                    being taken
%         pathCols - an array to represent all of the columns of the path
%                    being taken
%         grid - the m x n matrix showing the elevations of all paths
% Outputs: elevations - an array showing the values of elevation extracted
%          from the grid of each particular position travelled within the
%          path cost - the total cost  of elevation changes along the path
%
% Author: Vanessa Ciputra
% Project; Helper Function 4 for BestPath


% Pre-allocate arrays
elev = zeros(1, length(totalRows));
dif = zeros(1, (length(totalRows)-1));


% Extract the elevation values from the matrix of the path travelled
for i = 1:length(totalCols)
    elev(i) = grid((totalRows(i)),(totalCols(i)));
end


% Create the differences in elevations into an array, using absolute values
% as an increase and a decrease will always be a positive change
for j = 1:(length(elev)-1)
    dif(j) = abs([elev(j+1)-elev(j)]);
end


% Add the differences in elevation together to find total cost output
cost = sum(dif);


end