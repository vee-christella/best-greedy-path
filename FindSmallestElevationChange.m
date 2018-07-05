  function [smallestPosition] = FindSmallestElevationChange(current,levels)
% This function calculates the smallest change in elevation of adjacent
% levels based on the current elevation
% If more than one position is found, all positions are displayed
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


% Create an empty array to be substituted in as we do not know how many
% values will be inserted
smallestPosition = [];


% Determine the difference between each adjacent elevation to the current
% one
for i = 1:length(levels);
    
    
    % If the current difference is smaller than the smallest difference,
    % replace the smallest difference with the current difference
    if dif > abs(levels(i) - current);
        dif = abs(levels(i) - current);
        
        smallestPosition = i; % Replace the smallest position of the array
        
        % If the difference is equal to the smallest difference, we have
        % more than one value with the same difference
    elseif dif == abs(levels(i) - current)
        dif = abs(levels(i) - current);
        
        % Output ALL values of positions with the smallest elevation
        smallestPosition = [smallestPosition, i];
        
    end
    
    
end



end



