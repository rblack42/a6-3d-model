//###########################################
// wing
include <colors.scad>
include <a6-data.scad>
include <paper-tube.scad>
include<rib.scad>

module wing_rib(chord = w_x0) {
    // accounts for spar size
    color(WOOD_Balsa)
        translate([0,-w_rib_t/2,0])
            rib(
                chord - 2 * spar_size,
                w_rib_camber,
                w_rib_h,
                w_rib_t
            );
}


module wing_left_inner_panel() {
    // leading edge
    rotate([0,0,alpha1l])
        translate([0,-w_x2l,0])
            cube([spar_size,w_x2l,spar_size]);

    // trailing edge
    translate([w_x0-spar_size,-(w_x2l-w_x0l),0])
        cube([spar_size,w_x2l,spar_size]);

    // rib 1
    translate([w_x0 +spar_size- w_y1l,-w_x1l,0]) 
        wing_rib(w_y1l);
    // rib 2
    translate([w_x0 +spar_size- w_y2l,-w_x2l,0]) 
        wing_rib(w_y2l);
}

module wing_left_outer_panel() {
    // inner leading edge
    translate([w_x0 - w_y4l,-(w_x4l-w_x2l),0])
    rotate([0,0,alpha2l])
        cube([spar_size,w_x4l-w_x2l+.09,spar_size]);
    
    // outer leading edge
    translate([w_x0 - w_y5l - spar_size/2, -(w_x5l - w_x2l), 0])
        rotate([0,0,alpha3l])
        cube([spar_size,w_x5l - w_x4l+0.23,spar_size]);

    // trailing edge
    translate([w_x0-spar_size,-(w_x5l- w_x2l),0])
        cube([spar_size,w_x5l- w_x2l,spar_size]);
    
    // rib 3
    translate([w_x0 +spar_size- w_y3l, -(w_x3l-w_x2l),0]) 
        wing_rib(w_y3l);
    
    // rib 4
    translate([w_x0 +spar_size - w_y4l,-(w_x4l-w_x2l),0]) 
        wing_rib(w_y4l);
    
    // rib 5 (flat)
    translate([w_x0 - spar_size - w_y5l, -(w_x5l-w_x2l),0])
        cube([w_y5l,spar_size,spar_size]);
}

module wing_right_inner_panel() {
    // leading edge
    rotate([0,0,-alpha1r])
    translate([0,0,0])
        cube([spar_size,w_x2r,spar_size]);

    // trailing edge
    translate([w_x0 - spar_size,0,0])
        cube([spar_size,w_x2r,spar_size]);

    // rib 1
    translate([w_x0 +spar_size - w_y1r,w_x1r,0]) 
        wing_rib(w_y1r);
    
    // rib 2
    translate([w_x0 +spar_size - w_y2r,w_x2r,0]) 
        wing_rib(w_y2r);
}

module wing_right_outer_panel() {

    // inner leading edge
    translate([w_x0 - w_y2r,0,0])
        rotate([0,0,-alpha2l])
        cube([spar_size,w_x4r-w_x2r+.09,spar_size]);
    
    // outer leading edge
    translate([w_x0 - w_y4r + spar_size/2, w_x4r - w_x2r, 0])
        rotate([0,0,-alpha3r])
        cube([spar_size,w_x5r - w_x4r+0.23,spar_size]);
    
    // trailing edge
    translate([w_x0 - spar_size,0,0])
        cube([spar_size,w_x5r - w_x2r,spar_size]);
    
    // rib 3
    translate([w_x0 + spar_size - w_y3r,w_x3r - w_x2r,0]) 
        wing_rib(w_y3r);
    
    // rib 4
    translate([w_x0 + spar_size - w_y4r, w_x4r - w_x2r,0]) 
        wing_rib(w_y4r);
    
    // rib 5 (flat)
    translate([w_x0 - spar_size - w_y5r, w_x5r - w_x2r -spar_size,0])
        cube([w_y5r,spar_size,spar_size]);
}


module wing() {
    // front post mount
	translate([-(pt_t + pt_r),0,-1/8])
        paper_tube();

    // left wing
    rotate([-theta1l,0,0]) 
        union() { 
            wing_left_inner_panel();
            translate([0,-w_x2l,0])
                rotate([-theta2l,0,0]) 
                    wing_left_outer_panel();
        }
    
    // right wing    
    rotate([theta1r,0,0]) 
        union() {
        wing_right_inner_panel();
        translate([0,w_x2r,0])
           rotate([theta2r,0,0]) 
                    wing_right_outer_panel();
        }
    // center wing rib
    translate([spar_size,-w_rib_t/2,0]) wing_rib(w_x0);

    // rear post mount
    translate([w_x0+(pt_t+pt_r), 0, -1/8])
        paper_tube();
}

//wing();