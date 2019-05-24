% When new landmark is added to state vector, all matrices have to be
% updated.  This includes xest, Pest, A, Q, and W.
function new_state(zlaser)

    global xest;        % state matrix
    global Pest;        % covariance matrix
    global numStates;   % number of states before entering this loop
    global A Q W k

    % Calculate landmark position in global frame
    theta = zlaser(2,1) + xest(3,k) - pi/2; 
    x = xest(1,k) + zlaser(1,1)*cos(theta);     % x-position of landmark in global frame
    y = xest(2,k) + zlaser(1,1)*sin(theta);     % y-position of landmark in global frame
   
    xest = [xest; zeros(2,length(xest))];   % add 2 rows of zeros to xest
    xest(numStates+1,k) = x;                % add estimate of x-pos of landmark
    xest(numStates+2,k) = y;                % add estimate of y-pos of landmark
    clear x y;

    Pest(numStates+1,1:(numStates)) = 0;    % x row
    Pest(1:numStates,numStates+1) = 0;      % x column
    Pest(numStates+1,numStates+1) = 10^6;   % x diagonal

    Pest(numStates+2,1:(numStates+1)) = 0;  % y row
    Pest(1:numStates+1,numStates+2) = 0;    % y column
    Pest(numStates+2,numStates+2) = 10^6;   % y diagonal  (this may introduce numerical problems if not choosen properly)
    
    
    A = [A, zeros(numStates,2)];            % make top right of Jacobian null matrix
    A = [A; zeros(2,numStates+2)];          % make bottom of Jacobian null matrix
    A(numStates+1,numStates+1)=1;           % make bottom right of Jacobian identity
    A(numStates+2,numStates+2)=1;           % make bottom right of Jacobian identity
    
    Q = [Q, zeros(numStates,2)];
    Q = [Q; zeros(2,numStates+2)];
    W = [W, zeros(numStates,2)];
    W = [W; zeros(2,numStates+2)];

return;