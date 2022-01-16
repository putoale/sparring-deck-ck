use <BOSL/masks.scad>
use <BOSL/shapes.scad>

$fa = 1;
$fs = 0.1;
/*
//circle(r=0.5);
translate([0,-(2+2.5),0])
square(5,center=true);


rotate([90,0,0])
teardrop(r=2,ang=20);
cylinder(r=2,h=10);
//translate([-1.5,0])
//fillet_mask_z(l=1.5, r=1.5, align=V_UP);
*/

column_r = 0.65;
column_h = 10;
module sparring_column(r_col,h_col,h_supp=1.5,supp_angle=20){
    cylinder(r=r_col,h=h_col);
    rotate([90,0,-45])
    %teardrop(r=r_col,h=h_supp,ang=supp_angle);
}

sparring_column(r_col=column_r,h_col=column_h);