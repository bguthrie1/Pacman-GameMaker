//lasttile = noone;
var t; t = instance_nearest(x,y,BlueGhostObj);
if(t)
{
    if(point_distance(t.x,t.y,t.xstart,t.ystart) < 64) t = noone;
}
if(t== noone)
if(instance_exists(FruitObj))
    if(FruitObj.visible) t = FruitObj;

if(t) 
{
    if(point_distance(x,y,t.x,t.y) < point_distance(x+lengthdir_x(3,direction),y+lengthdir_y(3,direction),t.x,t.y))
    {
        var shouldflip; 
        shouldflip = true;
        var o; o = collision_line(x,y,x+lengthdir_x(-32,direction),y+lengthdir_y(-32,direction),ParentGhostObj,0,0);
        if(o)
        {
            if(o.object_index != BlueGhostObj) shouldflip = false;
            else GhostFlipDirection();

        }
        flipcount +=shouldflip;
        if(flipcount>room_speed/4)
        {
            GhostFlipDirection();
            flipcount = 0;
        }
    }
    else
    {
        flipcount = 0;
    }
}
    
if(t==noone)
    t = instance_nearest(x,y,PelletObj);
if(t==noone)
    t = instance_nearest(x,y,PillObj);

   
if(t) PacGotoTileNearestXYWLimits(t.x+random(4)-2,t.y+random(4)-2);
else PacGotoRandomTileWLimits();

