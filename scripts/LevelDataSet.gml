// Had to change this a bit due to how Game Maker Studio works with argument arrays
var row; row = argument[0];
var col; col = 0;

repeat(16)
{
    ds_grid_set(LevelDataGrid, col, row, argument[col])
    col+=1;
}
