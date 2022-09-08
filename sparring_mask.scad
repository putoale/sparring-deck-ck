use <sparring_parts.scad>;

$fa=1;
$fs = 0.1;

// PARAMETERS
outer_big_size = 22;
outer_small_size = 16;

border_thickness = 0.5;

inner_big_size = outer_big_size - 2 * border_thickness;
inner_small_size = outer_small_size - 2 * border_thickness;


sparring_mask(big_s = inner_big_size,small_s=inner_small_size,height=0.25, cross_l = outer_big_size, flat = true);