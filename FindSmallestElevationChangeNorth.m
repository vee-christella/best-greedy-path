function [smallestPosition] = FindSmallestElevationChangeNorth(current,levels)
% This function calculates the smallest change in elevation of adjacent
% levels based on the current elevation
% If more than one position is found, only the NORTH-MOST ROW of the
% position is taken into consideration
% Each change in elevation is a positive change, despite an increase or
% decrease
% Inputs: current - the current elevation that is being compared to
%         levels - an array displaying the possible three elevations that
%                  are adjacent to current
% Outputs: position - the index of the array that corresponds to the
%                     smallest change in elevation
%
% Author: Vanessa Ciputra
% Project; Function 2


% Set the initial smallest difference as always larger than the following
% difference
dif = abs(levels(1) - current)+1;


% Determine the difference between each adjacent elevation with the current
% elevation
for i = 1:length(levels);
    
    % If the current difference is smaller than the smallest difference,
    % replace the smallest difference with the current difference
    if dif > abs(levels(i) - current);
        dif = abs(levels(i) - current);
        
        % If more than one has the same smallest difference, only the
        % northern most position is assigned to the output
        smallestPosition = i;
    end
    
end



end



