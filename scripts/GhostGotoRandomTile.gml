
//What tile we're on
tile = collision_point(floor(x),floor(y),TileObj,0,0);
//none? error, exit;
if(tile == noone) tile = lasttile;
if(tile == noone) exit;

//not first time doing this? get the direction of the last movement
//if(lasttile != noone) direction = point_direction(lasttile.x,lasttile.y,tile.x,tile.y);

//using a list, we stuff the tiles we can access. on the right, in front, on the left, and, if first time, on the back
tlist = ds_list_create();
//we check at -90, 0, 90 and 180 (if first time; if lasttile == noone)
a = round(direction/90)*90+270+ ChangeDirection * 180
//show_debug_message("Dir" + string(direction) + " CD" +string(ChangeDirection) + " a" + string(a ))
ChangeDirection = false;
//look 3 ot 4 times
repeat(3 + 1 * (lasttile == noone))
{
    //collision point arround AI's current tile
    othertile = collision_point(tile.x+6 + lengthdir_x(12,a),tile.y+6 + lengthdir_y(12,a),TileObj,0,0);
    //and collect the tiles we find in the list
    if(othertile != noone) 
    if(othertile.GhostHouseDoor != 1) // This is to prevent Blue ghosts from entering the Ghost house.
    ds_list_add(tlist,othertile);
    //inc a by 90
    a+=90;
}
if(lasttile == noone) lasttile = tile;

//how many items found?
ct = ds_list_size(tlist);
//no tiles found? a dead end, not usually in a packman game... just reverse
if(ct == 0) 
{
    startt = tile;
    endt = lasttile
}
else
{
    //tiles!!
    //set the start tile to the tile we are on
    startt = tile;
    //random the list of other tiles to go to
    ds_list_shuffle(tlist);
    //and select the first one
    endt = ds_list_find_value(tlist,0);
    //this basically is a nice random seelction of tiles
}
//done with the list
ds_list_destroy(tlist);

//set the last tile we were on to this new tile
lasttile = startt;

// now the movement from this tile to the selected one
//re-using path, clear old path
path_clear_points(path);
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

