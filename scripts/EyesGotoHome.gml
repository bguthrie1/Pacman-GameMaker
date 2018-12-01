
if(HomeTile != noone)
if (point_distance(x,y,HomeTile.x+6,HomeTile.y+6)>6)
{
    GhostGotoTileNearestXY(HomeTile.x+6,HomeTile.y+6)
}
else if (!instance_exists(PointOnSpotPausedObj))
{
      instance_change(WhoIWas, 1);
}
else
alarm[2] = 1;
