function [minRows, minCols, minElev, minCost] = BestPath(grid)
% This function finds the very best path with the minimum elevation cost
% starting from the very left edge, travelling east (right) until it hits
% any point on the right edge.
%
% The method of the BestPath function is based on DIJKSTRA'S ALGORITHM. It
% uses the concept of nodes, and assigning distance values to them. It
% continuously scans each element in the matrix/grid whiles finding
% adjacent positions and the differences between the adjacent elevations
% and current elevations. Distance values of adjacent positions get
% replaced with the sum of the current distance value with the difference
% between the respective adjacent elevation and the current elevation.
% However, distance values only get replaced if the new distance value is
% less than the original distance value on that node. The positions of the
% current path is then recorded in the adjacent positions of a row and
% column array, in order to backtrack via previous positions at the end.
% This helps to find the shortest path possible. Once this process is done,
% the current position is checked off by setting to infinity in a check
% array. Instead of using greedy pick and taking the adjacent position the
% the next position is thus determined by finding the smallest distance
% value that has not been checked off in the check array. This process is
% hence repeated until we reach the eastern edge. From then, we use the
% previous path column and row arrays to backtrack and find the best
% possible path from the initial node. This whole process is repeated with
% each position in the western edge, which can then be analysed to give the
% best path out of these possible paths.
%
% Inputs: grid - the m x n matrix showing the elevations of all paths
% Outputs: minRows - an array to represent all of the rows of the best
%                     path being taken
%         minCols - an array to represent all of the columns of the best
%                     path being taken
%         minElev - the minimum elevation values of the path being taken
%
% Sources & References for Djikstra's Algorithm:
% http://www.geeksforgeeks.org/greedy-algorithms-set-6-dijkstras-shortest-path-algorithm/
% https://www.youtube.com/watch?v=gdmfOwyQlcI
% https://www.youtube.com/watch?v=GazC3A4OQTE&t=536s
%
% Author of the entire code (excluding Algorithm concept): Vanessa Ciputra
% Project; Function 8


dim = size(grid); % Set dimensions for the matrix of the data

minCost = Inf; % Set initial variable to always be larger

% Pre-allocate arrays
minElev = zeros(dim(1),dim(2));
begin = zeros(1,dim(1)*2);


% Cycle through each possible start position on the western edge
for i = 1:dim(1)
    begin(i*2-1) = i;
    begin(i*2) = 1;
end



for j = 1:2:length(begin)
    startPos = [begin(j),begin(j+1)];
    % Using each possible start position, call BestRowPath.m and
    % FindBestPathElevationsAndCost.m functions to obtain the fastest path
    % positions, minimum elevations and minimum costs
    [totalRows, totalCols] = BestRowPath(startPos, grid);
    
    [elev, cost] = FindBestPathElevationsAndCost(totalRows,totalCols,grid);
    
    
    
    % If the cost of the current path is less than the cost of the previous
    % path, replace output data until the minimum cost, and subsequently
    % the minimum path, is found.
    if cost < minCost
        minCost = cost;
        minRows = totalRows;
        minCols = totalCols;
        minElev = elev;
        
    end
    
    
end

