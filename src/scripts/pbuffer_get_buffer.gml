///pbuffer_get_buffer(pbuffer);

/*
If you have issues on getting alpha, check this blog post:
http://www.yoyogames.com/blog/60

Using draw_enable_alphablend(false) before semi-transparent
shader draws helps.

Copyright 2017, Cem Baspinar
Reuse permitted under the MIT license.

*/

if (!is_array(argument0)) { 
    show_debug_message("pbuffer_get_pixel takes a pbuffer array. Use pbuffer_create_from_surface() to create one.");
    return 0; 
}

var buff = argument0[@2];
if (!buffer_exists(buff)) { 
    show_debug_message("Buffer cannot be found. Use pbuffer_create_from_surface()");
    return 0; 
}

return buff;
