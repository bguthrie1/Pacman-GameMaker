

//GhostGotoTileNearestXYWLimits((PackmanObj.x + lengthdir_x(12*4,PackmanObj.direction) + x)/2,(PackmanObj.y+ lengthdir_y(12*4,PackmanObj.direction) + y)/2);

var Blinkyx, Blinkyy, BlinkyVector, VectorDirection;


// Get Blinky's position

if (instance_exists(BlinkyObj))
{
    Blinkyx = BlinkyObj.x
    Blinkyy = BlinkyObj.y
}
else
{
    with(BlueGhostObj)
    {
        if (WhoIWas = BlinkyObj)
        {
            Blinkyx = x
            Blinkyy = y
        }
    }
    with(GhostEyesObj)
    {
        if (WhoIWas = BlinkyObj)
        {
            Blinkyx = x
            Blinkyy = y
        }
    }
}

// This is the true Inky Attack AI from Pacman. Inky's target tile uses Pacman's offset tile that is two steps in front of him in addition to Blinky's position and doubling that vector. 


// Without the offset bug

/*
BlinkyVector = point_distance(Blinkyx, Blinkyy, PackmanObj.x + lengthdir_x(12*2,PackmanObj.direction), PackmanObj.y + lengthdir_y(12*2,PackmanObj.direction))
VectorDirection = point_direction(Blinkyx, Blinkyy, PackmanObj.x + lengthdir_x(12*2,PackmanObj.direction), PackmanObj.y + lengthdir_y(12*2,PackmanObj.direction))


GhostGotoTileNearestXYWLimits((PackmanObj.x + lengthdir_x(12*2,PackmanObj.direction)) + lengthdir_x(BlinkyVector, VectorDirection), (PackmanObj.y + lengthdir_y(12*2,PackmanObj.direction)) + lengthdir_y(BlinkyVector, VectorDirection));
*/

// With the offset bug


if (PackmanObj.direction != 90)
{
    BlinkyVector = point_distance(Blinkyx, Blinkyy, PackmanObj.x + lengthdir_x(12*2,PackmanObj.direction), PackmanObj.y + lengthdir_y(12*2,PackmanObj.direction))
    VectorDirection = point_direction(Blinkyx, Blinkyy, PackmanObj.x + lengthdir_x(12*2,PackmanObj.direction), PackmanObj.y + lengthdir_y(12*2,PackmanObj.direction))
    
    GhostGotoTileNearestXYWLimits((PackmanObj.x + lengthdir_x(12*2,PackmanObj.direction)) + lengthdir_x(BlinkyVector, VectorDirection), (PackmanObj.y + lengthdir_y(12*2,PackmanObj.direction)) + lengthdir_y(BlinkyVector, VectorDirection));
}
else
{
    BlinkyVector = point_distance(Blinkyx, Blinkyx, PackmanObj.x + lengthdir_x(12*2,PackmanObj.direction) + lengthdir_x(12*2,180), PackmanObj.y + lengthdir_y(12*2,PackmanObj.direction) + lengthdir_y(12*2,180))
    VectorDirection = point_direction(Blinkyy, Blinkyy, PackmanObj.x + lengthdir_x(12*2,PackmanObj.direction) + lengthdir_x(12*2,180), PackmanObj.y + lengthdir_y(12*2,PackmanObj.direction) + lengthdir_y(12*2,180))
    
    GhostGotoTileNearestXYWLimits((PackmanObj.x + lengthdir_x(12*2,PackmanObj.direction) + lengthdir_x(12*2,180)) + lengthdir_x(BlinkyVector, VectorDirection), (PackmanObj.y + lengthdir_y(12*2,PackmanObj.direction) + lengthdir_y(12*2,180)) + lengthdir_y(BlinkyVector, VectorDirection));
}

