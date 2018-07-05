function [reversed] = Reverse(array)
% This function returns a reversed version of a one-dimensional array that
% has been passed into it as the input
% If the input array is a 1D column, reverse the column as the output
% Input: array - a one-dimensional array
% Output: reversed - the reversed version of the input
%
% Author: Vanessa Ciputra
% Project; Function 1


[m,n] = size(array); % Determine the size of the input array

if n == 1 % Check if the array is a 1D column to reverse vertically
    
    reversed = zeros(length(array),1);  % Pre-allocate array
    
    
    % Create loop to cycle through each index of the original array
    for i = 1:length(array);
        % Place each element of the original array onto the opposite end of
        % the new array, by starting from the last index to the first index
        reversed(length(array)-(i-1)) = array(i);
    end
    
    
else
    % If not a 1D column, call the fliplr function to reverse the array
    % horizontally
    reversed = fliplr(array);
end



end
