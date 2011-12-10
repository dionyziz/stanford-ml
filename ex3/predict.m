function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% X: m x ( n + 1 )
% X( 1, : ): 1 x ( n + 1 )
% X( 1, : )': ( n + 1 ) x 1
% Theta1: s2 x ( n + 1 )
% Theta2: k x s2
% a2: s2 x m
% a2 = sigmoid( Theta1 * X' )
% a3: k x m
% a3 = sigmoid( Theta2 * a2 )

X = [ ones( m, 1 ) X ];
a2 = [ ones( 1, m ); sigmoid( Theta1 * X' ) ];
a3 = sigmoid( Theta2 * a2 );
[ dummy, p ] = max( a3 );
p = p';

% =========================================================================

end
