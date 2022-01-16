use <BOSL/shapes.scad>

outer_big_size = 22;
outer_small_size = 16;

border_thickness = 0.5;

inner_big_size = outer_big_size - 2 * border_thickness;

inner_small_size = outer_small_size - 2 * border_thickness;

base_height = 2;

module sparring_angle (l,d,h){
    
    d_square = l * sqrt(2);
    h_tri = d_square - d;
    l_tri = 2 * h_tri / sqrt(2); 
    linear_extrude(h){
        
        translate([-l_tri/2,-l_tri/2,0]){
        
            difference(){
                square(l);
                polygon([[0,0],[0,l_tri],[l_tri,0]]);
            }
        }
    }
}

module sparring_base(big_s = 22, small_s=16,height=2,flat = false) {
    
    l1 = 13.2916667;
    l2 = l1 + (big_s-l1)/2;
    l_angle = (big_s - small_s)/2;
    d_angle = (big_s - l2) * sqrt(2) / 2;
    
    l2_sq_dh = flat ? 0:0.2;
    l1_sq_dh = flat ? 0:0; ///
    
    
    
    difference(){
        union(){
    
            //color("brown")
            cube([big_s,big_s,height],center = true);
            
            translate([0,0,l1_sq_dh/2])
                cube([l1,l1,height+l1_sq_dh],center=true);
            
            color("Black")
            translate([0,0,(l2_sq_dh)/2])
            cube([l2,l2,height+l2_sq_dh],center=true);
        }
        
        union(){
            for (theta = [45:90:45+90*3]) {
                
                translate([(l2*sqrt(2)/2) * cos(theta), (l2*sqrt(2)/2) * sin(theta),-height*(1.1)/2]){
                    rotate([0,0,theta-45]){
                        scale(1.1)
                        sparring_angle(l_angle,d_angle,height);
                    }
                }
                
            }
            
        }
    }
    
    
}

module sparring_column(r_col,h_col,h_supp=1.5,supp_angle=20){
    cylinder(r=r_col,h=h_col);
    rotate([90,0,-45])
    teardrop(r=r_col,h=h_supp,ang=supp_angle);
}