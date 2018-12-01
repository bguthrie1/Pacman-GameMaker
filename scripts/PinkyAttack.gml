// Without the offset bug
//GhostGotoTileNearestXYWLimits(PackmanObj.x + lengthdir_x(12*4,PackmanObj.direction),PackmanObj.y+ lengthdir_y(12*4,PackmanObj.direction));

//With the offset bug

if (PackmanObj.direction != 90)
GhostGotoTileNearestXYWLimits(PackmanObj.x + lengthdir_x(12*4,PackmanObj.direction),PackmanObj.y+ lengthdir_y(12*4,PackmanObj.direction));
else
GhostGotoTileNearestXYWLimits(PackmanObj.x + lengthdir_x(12*4,PackmanObj.direction) + lengthdir_x(12*4,180),PackmanObj.y+ lengthdir_y(12*4,PackmanObj.direction) + lengthdir_y(12*4,180));

