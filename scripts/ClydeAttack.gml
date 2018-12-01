
if(point_distance(x,y,PackmanObj.x, PackmanObj.y)< 12*8)
    ClydeScatter()
else
    GhostGotoTileNearestXYWLimits(PackmanObj.x,PackmanObj.y);
