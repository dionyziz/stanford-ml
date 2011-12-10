function gradCheck = gradientCheck( theta, X, y, lambda )
    EPSILON = 0.00001;
    gradCheck = zeros( size( theta ) );
    for j = 1:size( theta )
        thetaPlus = theta;
        thetaPlus( j ) = thetaPlus( j ) + EPSILON;
        thetaMinus = theta;
        thetaMinus( j ) = thetaMinus( j ) - EPSILON;
        
        [ Jminus, grad ] = lrCostFunction( thetaMinus, X, y, lambda );
        [ Jplus,  grad ] = lrCostFunction( thetaPlus, X, y, lambda );
        
        gradCheck( j ) = ( Jplus - Jminus ) / ( 2 * EPSILON );
    end