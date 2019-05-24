% Based on range and intensity values from SICK scanner, determine center of landmark.
% Landmarks are assumed to be reflectors and therefore generate a high intensity value.
function [landmarkRange,landmarkBearing]=getLandmarkCenter(laser,intensity)
    landmarkRange = [];
    landmarkBearing = [];
    maxRange = 30;
    range = 0;
    bearing = 0;
    count = 0;

    for i=1:361 % for i = 1 to 180 degrees at 0.5 degree resolution
        if( laser(i)<maxRange & intensity(i)>0)
            range = range + laser(i);   % keep running count of range values
            bearing = bearing + i;      % keep running count of bearing values
            count = count + 1;          % keep running count to calculate average
        
            % check next 3 intensity values...if all zero, then calculate landmark center
            bound = 361 - i;
            val_1 = min(1,bound);       % if i=361, then bound equals 0
            val_2 = min(2,bound);       % if i=360, then val_1, val_2, & val_3 all equal 1...otherwise val_2=2
            val_3 = min(3,bound);       % if i=359, then val_1=1, val_2 & val_3 equal 2...otherwise val_3=3
            if( intensity(i+val_1)==0 & intensity(i+val_2)==0 & intensity(i+val_3)==0 || bound==0)
                range = range/count;                            % calculate range to landmark center
                bearing = bearing/count;                        % calculate bearing to landmark center
                bearing = (bearing-1)/2*(pi/180);               % bearing is from 0:180 with 0.5 deg resolution
                landmarkRange = [landmarkRange range];          % form 1D array of range vals for every LM observed
                landmarkBearing = [landmarkBearing bearing];    % form 1D array of bearing vals for every LM observed
                range = 0; bearing = 0; count = 0;              % reset all variables
            end        
        end
    end
return;