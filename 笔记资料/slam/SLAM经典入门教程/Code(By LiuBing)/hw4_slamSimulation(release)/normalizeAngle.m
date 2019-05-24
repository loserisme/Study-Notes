% This function was copied from Nebot's code.  It is used to keep the angle
% between -180 and 180 degrees.
function ang2 = normalizeAngle(ang1)
    if ang1>pi, ang2 =ang1-2*pi ;  return ; end ;
    if ang1<-pi, ang2 =ang1+2*pi ;  return ; end ;
    ang2=ang1;
return