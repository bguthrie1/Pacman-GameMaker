/* 
AnimatePart(framestart, numframes)
this sets the image index to the right frame subset in a animated sprite holding multiple animation sequences
pass on the animation start index and the number of frames.
*/


image_index = (image_index-argument0) mod max(1,argument1) + argument0;
image_index = min(max(argument0,image_index),argument0 + argument1)
