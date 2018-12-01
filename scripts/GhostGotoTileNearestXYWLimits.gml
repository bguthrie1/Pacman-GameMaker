//GhostGotoTileNearestXY(x,y)
//this is basically the method used in packman

//find nearest tile, remember to center the search
targett = instance_nearest(argument0-6, argument1-6, TileObj);
//debug
//with(TileObj) {visible = true; image_blend = c_white;}
//with(targett) image_blend = c_red;


//What tile we're on
tile = collision_point(floor(x),floor(y),TileObj,0,0);
//none? error, exit;
if(tile == noone) tile = lasttile;
if(tile == noone) exit;

//not first time doing this? get the direction of the last movement
//if(lasttile != noone) direction = point_direction(lasttile.x,lasttile.y,tile.x,tile.y);

//using a list, we stuff the tiles we can access. on the right, in front, on the left, and, if first time, on the back
tlist = ds_priority_create();

// Do not reverse direction in the Ghost House
if (tile.InGhostHouse = 1) 
ChangeDirection = false;
//we check at -90, 0, 90 and 180 (if first time; if lasttile == noone)
a = round(direction/90)*90+270 + ChangeDirection * 180; //-90 is start point
ChangeDirection = false;
//look 3 ot 4 times
repeat(3 + 1 * (lasttile == noone))
{
    //collision point arround AI's current tile
    othertile = collision_point(tile.x+6 + lengthdir_x(12,a),tile.y+6 + lengthdir_y(12,a),TileObj,0,0);
    //and collect the tiles we find in the list, priority list is sorted by distance here
    if(othertile != noone) 
    if(othertile.GhostDirs[floor((a mod 360) / 90)] == 1) 
        ds_priority_add(tlist,othertile,point_distance(othertile.x, othertile.y,targett.x,targett.y));

    //inc a by 90
    a+=90;
}

if(lasttile == noone) lasttile = tile;
//how many items found?
ct = ds_priority_size(tlist);
//no tiles found? a dead end, not usually in a packman game... just reverse
if(ct == 0 and tile != lasttile) 
{
    startt = tile;
    endt = lasttile;
}
else if (ct = 0 and tile = lasttile) // No tiles found and the only tile is where the AI is standing? Go to any tile available thats the closest to Pacman, else the ghost gets stuck.
{   
    a = round(direction/90)*90+0; 

    //collision point arround AI's current tile
    othertile = collision_point(tile.x+6 + lengthdir_x(12,a),tile.y+6 + lengthdir_y(12,a),TileObj,0,0);
    //and collect the tiles we find in the list, priority list is sorted by distance here
    if(othertile != noone) 
    ds_priority_add(tlist,othertile,point_distance(othertile.x, othertile.y,targett.x,targett.y));
    //inc a by 90
    a+=90;
    
    startt = tile;
    endt = ds_priority_find_min(tlist);
    if (endt = 0)
    endt = lasttile;
}
else
{
    //tiles!!
    //set the start tile to the tile we are on
    startt = tile;
    //and select the first one, the tile closest to the target
    endt = ds_priority_find_min(tlist);
    //this basically is a nice random seelction of tiles
}
//done with the list
ds_priority_destroy(tlist);

//set the last tile we were on to this new tile
lasttile = startt;

// now the movement from this tile to the selected one
// re-using path, clear old path
path_clear_points(path);
//add the current tile
//path_add_point(path,startt.x+6,startt.y+6,startt.GhostPathSpeed);
path_add_point(path,x,y,startt.GhostPathSpeed);
//add the end point, the tile center x,y to go to, and the path speed modifier
//is 100% speed, later we can use this to slow down the AI in the tunnel (Now uses tile var for speed)
path_add_point(path,endt.x+6,endt.y+6,endt.GhostPathSpeed);


//start the path from point 1, AI position to b, tile center
path_start(path,maxspeed,0,1);

//debug
//with(TileObj) {visible = true; image_blend = c_white;}
//with(startt) image_blend = c_red;
//with(endt) image_blend = c_lime;
