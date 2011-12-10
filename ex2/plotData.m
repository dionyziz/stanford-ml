function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

P = zeros( 0, size( X, 2 ) );
Q = zeros( 0, size( X, 2 ) );

p = 1
q = 1

for j = 1:length( y )
    if y( j ) == 0
        P( p, : ) = X( j, : );
        p = p + 1;
    else
        Q( q, : ) = X( j, : );
        q = q + 1;
    end
end

scatter(P(:, 1)', P(:, 2)', 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'y' )
scatter(Q(:, 1)', Q(:, 2)', '+', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k' )

% =========================================================================



hold off;

end
