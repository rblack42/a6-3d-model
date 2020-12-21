include <colors.scad>
include <a6-data.scad>
include <round_post.scad>

module motor_stick() {
    color(WOOD_Balsa)
        rotate([90,0,0]) {
            translate([0,0,-ms_y/2])
                linear_extrude(height = ms_y, convexity=10)
                    polygon(ms_poly);
            translate([0,-1/8,-ms_y/2]) 
                cube([0.25,ms_y,1/8]);
            translate([ms_x1-0.25,-1/8,-ms_y/2])
                cube([0.25, ms_y, 1/8]);
        }

    // add front wing posts
    translate([ms_x4,-ms_y/2-spar_size])
        color(WOOD_Birch)
            round_post(h = wing_z0);
    // add rear wing post
    translate([ms_x3,-ms_y/2-spar_size])
        color(WOOD_Birch)
            round_post(h = wing_z0);
}

motor_stick();