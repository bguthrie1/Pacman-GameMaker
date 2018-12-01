
if(Elroy ==1 and PacReset ==0) GhostGotoTileNearestXYWLimits(PackmanObj.x,PackmanObj.y);
else if(point_distance(x,y,xstart,ystart)< 48) GhostGotoTileNearestXYWLimits(x-32,y);
else GhostGotoTileNearestXYWLimits(306,84);

