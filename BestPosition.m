function [endPos, prevPathRows, prevPathCols] = BestPosition(startPos,grid)
% This function determines the best path that can be travelled with the
% minimum cost, from the starting position to anywhere on the eastern edge.
% Instead of using Greedy Pick method, this function evaluates all possible
% paths and determines the fastest path possible by using the locating
% distance/elevation costs.
% This function ensures that all elements and paths are checked.
% Inputs: startPos - startPos - the m x n array of the starting position on
%                    the western edge
%         grid - the m x n matrix showing the elevations of all paths
% Outputs: endPos - the m x n coordinates of the end position on the
%                   eastern edge of the matrix after following the best
%                   path
%          prevPathRows - an array that displays the row positions of the
%                         path travelled, with each value representing the
%                         previous position that was crossed to get to the
%                         value
%          prevPathCos - an array that displays the column positions of the
%                         path travelled, with each value representing the
%                         previous position that was crossed to get to the
%                         value
%
% Author: Vanessa Ciputra
% Project; Helper Function 2 for BestPath


dim = size(grid); % Determine the size of the grid/matrix


% Pre-allocate arrays for the shortest path set
prevPathRows = zeros(dim(1),dim(2));
prevPathCols = zeros(dim(1),dim(2));


% Assign initial distance values for each 'node' or element
% Each element is initially set to infinity
distance = Inf(dim(1), dim(2));
% The starting position is initially set to 0 in order to be
% prioritised over other elements
distance(startPos(1),startPos(2)) = 0;


% Create array to check off/remove after calculating adjacent positions
% of each position
check = grid;

% All positions on the western edge, except for the starting position,
% are set to infinity as they are not considered in the path
check(:,1) = Inf;
check(startPos(1),1) = grid(startPos(1),1);


% Create cycle to iterate through all paths to find the shortest possible
% path
while startPos(2) < dim(2)
    
    
    % Only continue if the current position is NOT on the eastern edge
    if startPos(2) ~= dim(2);
        
        % Extract the elevation value of the current position
        currentElev = grid(startPos(1),startPos(2));
        % Call the AdjacentPaths.m function to determine the adjacent
        % elevation values based on the current position
        [adjElev, x, y] = AdjacentPaths(grid, startPos);
        % Pre-allocate array for the difference of elevations of the
        % current and adjacent positions
        difference = Inf(1,3);
        
        
        
        % Find the difference between elevations
        for j = 1:length(adjElev)
            
            % If the difference is less than the current difference in
            % the array, replace the value and continue
            % If not, skip to the next adjacent position
            if abs(adjElev(j)-currentElev) <= difference(y)
                difference(y) = abs(adjElev(j)-currentElev);
                
                
                % If the sum of the current distance of the position
                % with the difference is less than the adjacent
                % position's distance, replace the value of distance
                if difference(y) + distance(startPos(1), startPos(2)) < ...
                        distance((startPos(1) + x), (startPos(2) + 1))
                    
                    distance((startPos(1) + x),(startPos(2) + 1)) = ...
                        (difference(y)+ distance(startPos(1),startPos(2)));
                    
                    % Link the adjacent position with its current
                    % position to indicate the path travelled via
                    % current position
                    prevPathRows((startPos(1) + x), ...
                        (startPos(2) + 1)) = startPos(1);
                    prevPathCols((startPos(1) + x), ...
                        (startPos(2) + 1)) = startPos(2);
                end
                
                
            end
            
            % Increment variables
            x = x + 1;
            y = y + 1;
            
            % Remove/check off the current position
            check(startPos(1),startPos(2)) = Inf;
            
            
        end
        
        
        % Determine the smallest value of the distance array to be
        % considered as a new position
        disDim = size(distance);
        
        smallestDis = Inf; % Set initial value to always be large
        
        % Check the values in the current column and the next column
        for c = startPos(2):(startPos(2)+1)
            for r = 1:disDim(1)
                
                % Only consider values that have not been removed/checked
                % off to explore alternate paths
                if check(r,c) ~= Inf && distance(r,c) < smallestDis
                    % If the distance cost is less than the smallest
                    % distance, replace the current position with it
                    smallestDis = distance(r,c);
                    startPos = [r,c];
                    
                end
            end
            
            
        end
    end
end

endPos = startPos; % Output the last position on the eastern edge

end