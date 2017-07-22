pBuffer for GMS
==========

[![pBuffer Logo](./graphics/icon.png)](https://marketplace.yoyogames.com/assets/5398/pbuffer-read-color-data-fast)

Reading a color data from a surface/sprite/texture/image is a very slow process. It's a known technique to get the image to a buffer (which is sometimes called pixel buffer on different platforms) and look the data up from the buffer to make it faster.

These scripts make this process easier. It's all in GML. No external resource is used.

[Marketplace Page](https://marketplace.yoyogames.com/assets/5398/pbuffer-read-color-data-fast)


Demos
-----
[Download Windows Demo](http://github.com/aft/pBuffer-for-GMS/raw/master/bin/pBuffer_win.zip) (Scanned with AVG 17.5.3021 - Definition v. 170712-10)


Usage
-----

```gml
var pb = pbuffer_create_from_surface(some_surface);
var pix = pbuffer_get_pixel(pb, some_x, some_y);
_r = pbuffer_pixel_get_r(pix);  // _r equal to something between 0.0-255.0
_g = pbuffer_pixel_get_g(pix);  // _g equal to something between 0.0-255.0
_b = pbuffer_pixel_get_b(pix);  // _b equal to something between 0.0-255.0
_a = pbuffer_pixel_get_a(pix);  // _a equal to something between 0.0-1.0
pbuffer_destroy(pb);
```


Included Scripts:
-----


```gml
pbuffer_create_from_surface(surface);
```

Takes: Surface id
Returns: pbuffer
Creates a pbuffer from a surface. Remember to destroy it after you are done.


```gml
pbuffer_copy_to_surface(pbuffer, surface);
```

Takes: pbuffer and an id of an already created surface
Returns: 0 or 1
Copies the content of the pbuffer to a surface.
MANUAL NOTE: This function is currently only available for the Windows and
Playstation 4 target platforms.


```gml
pbuffer_destroy(pbuffer);
```

Takes: pbuffer
Returns: 0 or 1
Destroys the buffer. Prevents memory leaks.


```gml
pbuffer_is_equal(pbuffer_original, pbuffer2);
```

Takes: two pbuffers
Returns: 0 or 1
Compares two different pbuffer contents using sha1 encoding. This function
is very expensive to run. Use with caution.


```gml
pbuffer_exists(pbuffer);
```

Takes: pbuffer
Returns: 0 or 1
Checks if the pbuffer exists. This function doesn't work on HTML5 runtime.
You may use pbuffer_exists_hack() to prevent getting Javascript errors.


```gml
pbuffer_get_pixel(pbuffer, x, y);
```

Takes: pbuffer and x,y coordinates
Returns: pixel data
Gets the pixel data of the coordinate. This data has RGBA values in it. Use
pbuffer_pixel_* functions to decode this data.


```gml
pbuffer_get_width(pbuffer);
```

Takes: pbuffer
Returns: integer
Gets the width of the pbuffer in pixels.


```gml
pbuffer_get_height(pbuffer);
```

Takes: pbuffer
Returns: integer
Gets the height of the pbuffer in pixels.


```gml
pbuffer_get_buffer(pbuffer);
```

Takes: pbuffer
Returns: buffer
Gets the GMS buffer.


```gml
pbuffer_pixel_get_color(pixel);
```

Takes: pixel data
Returns: GMS compatible color
Gets the color of the pixel. This can be used as a parameter of
draw_set_color() function. If you need to get R, G, B, A values seperately,
use pbuffer_pixel_get_* functions.


```gml
pbuffer_pixel_get_r(pixel, [bool_bgra]);
```

Takes: pixel data, and optional: boolean
Returns: Float between 0.0 & 255.0
Gets the red value of the pixel. If your system returns pixel colors with the order of BGRA, instead of RGBA, use "true" as a second parameter.
```gml
    pbuffer_pixel_get_r(pix, true); // for BGRA order
    pbuffer_pixel_get_r(pix);       // for RGBA order
```



```gml
pbuffer_pixel_get_a(pixel);
```

Takes: pixel data
Returns: Float between 0.0 & 1.0
Gets the alpha value of the pixel. If the alpha value you are getting is incorrect, check the notes below.


Important Notes:
-----
If you have issues on getting alpha correctly, check this blog post:
http://www.yoyogames.com/blog/60

Using draw_enable_alphablend(false) before semi-transparent shader draws helps.



Contributing
-----
It's through your contributions that this project will continue to improve. You can contribute in several ways.

**Issues:** Provide a detailed report of any bugs you encounter and open an issue.

**Documentation:** If you'd like to fix a typo or beef up the docs, you can fork the project, make your changes, and submit a pull request.

**Code:** Make a fix and submit it as a pull request. When making changes, add comments to describe the changes.



Author
------
Cem Baspinar

+ http://github.com/aft
+ http://twitter.com/aft



Thanks
------
Thanks to anyone who downloaded the extention from the marketplace.



Copyright and License
----
Copyright 2017 Cem Baspinar

Code released under the MIT License.