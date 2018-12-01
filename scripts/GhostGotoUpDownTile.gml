//show_debug_message(object_get_name(object_index)+ " UD")

//from goto random script, I just tweaked a few areas

//What tile we're on
//tile = collision_point(floor(x),floor(y),TileObj,0,0);
tile = collision_point(floor(x),floor(y),TileObj,0,0);
//none? error, exit;
if(tile == noone) tile = lasttile;
if(tile == noone) exit; 

//not first time doing this? get the direction of the last movement
//direction = point_direction(lasttile.x,lasttile.y,tile.x,tile.y);
if(direction != 90 and direction != 270) 
direction = choose(90,270);

//using a list, we stuff the tiles we can access. 
//I could have not used a list, but it was faster to just keep it from the original
tlist = ds_list_create();

ChangeDirection = false;

//we check at -90, 0, 90 and 180 (if first time; if lasttile == noone)
a = round(direction/90)*90+0; // direction should be up and down anyway, start ahead
//loop 1
//repeat(1)
//{
    //collision point arround AI's current tile
    othertile = collision_point(tile.x+6 + lengthdir_x(12,a),tile.y+6 + lengthdir_y(12,a),TileObj,0,0);
    //and collect the tiles we find in the list
    if(othertile != noone and othertile.InGhostHouse = 1) // Ghosts using this script can only move in the Ghost House, but can't leave
    if(othertile.GhostHouseDoor != 1)

    ds_list_add(tlist,othertile);
    //inc a by 90
    a+=90;
//}
if(lasttile == noone) lasttile = tile;

//how many items found?
ct = ds_list_size(tlist);
//no tiles found? reverse
if(ct == 0 and tile != lasttile) 
{
    startt = tile;
    endt = lasttile;
}
else if (ct = 0 and tile = lasttile) // No tiles found and the only tile is where the AI is standing? Check the other direction for a tile, else the ghost gets stuck.
{   
    if (direction = 90)
    direction = 270;
    else
    direction = 90;
    
    a = round(direction/90)*90+0; 

    //collision point arround AI's current tile
    othertile = collision_point(tile.x+6 + lengthdir_x(12,a),tile.y+6 + lengthdir_y(12,a),TileObj,0,0);
    //and collect the tiles we find in the list
    if(othertile != noone and othertile.InGhostHouse = 1) // Only allow Ghost House tiles for this script 
    ds_list_add(tlist,othertile);
    //inc a by 90
    a+=90;
    
    startt = tile;
    endt = ds_list_find_value(tlist,0);
    if (endt = 0)
    endt = lasttile;
}
else
{
    //tiles!!
    //set the start tile to the tile we are on
    startt = tile;
    //random the list of other tiles to go to
//    ds_list_shuffle(tlist);
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

