use <sparring_parts.scad>;
use <BOSL/shapes.scad>;

$fa=1;
$fs = 0.1;

// PARAMETERS
outer_big_size = 22;
outer_small_size = 16;

border_thickness = 0.5;

inner_big_size = outer_big_size - 2 * border_thickness;
inner_small_size = outer_small_size - 2 * border_thickness;

flat_inner = false;
flat_outer = true;

base_height = 2;

stair_h = 1; //z
stair_w = outer_big_size-10; //x
stair_t = 1.5; //y

column_h = 12;
column_r = 0.65;

h_supp = 1.5;    //column support height
supp_angle = 25; //angle of teardrop support for column

//BASE
//color("light blue"){
    translate([0,0,0.1])
sparring_base(big_s = inner_big_size,small_s=inner_small_size,height=2.2,flat = flat_inner); //small one

sparring_base(flat=flat_outer); //big one

//}

//STAIR
translate([0,-(outer_big_size/2+stair_t/2),-stair_h/2])
    cube([stair_w,stair_t,stair_h],center = true);

//COLUMNS

l1 = 13.2916667;
l2 = l1 + (outer_big_size-l1)/2;
dist_columns = l2*sqrt(2)/2+column_r;



for (theta = [45:90:45+90*3]) {

    translate([dist_columns*cos(theta),dist_columns*sin(theta),0]){
        rotate([0,0,theta-45]){
            sparring_column(r_col = column_r,h_col = column_h,h_supp = h_supp, supp_angle = supp_angle);
        }
    }
        //cylinder(h=column_h, r=column_r, center=true);
}