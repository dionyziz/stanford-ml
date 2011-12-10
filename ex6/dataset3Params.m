function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

Cs = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30 ]';
Sigmas = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30 ]';
minerror = Inf;
bestSigma = 0;
bestC = 0;

for Ci = 1:length( Cs )
    C = Cs( Ci );
    for Si = 1:length( Sigmas )
        sigma = Sigmas( Si );
        predictions = zeros( length( Xval ), 1 );
        model = svmTrain( X, y, C, @( x1, x2 ) gaussianKernel( x1, x2, sigma ) );
        for i = 1:size( Xval, 1 )
            this_X = Xval( i, : );
            predictions( i ) = svmPredict( model, this_X );
        end
        error = mean( double( predictions ~= yval ) );
        if error < minerror
            minerror = error;
            bestSigma = sigma;
            bestC = C;
        end
        fprintf( 'Tried C = %f, sigma = %f. Error is %f.\n', C, sigma, error );
    end
end

C = bestC;
sigma = bestSigma;

% =========================================================================

end
