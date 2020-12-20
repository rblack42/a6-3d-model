//#####################################################
// tail boom assembly

include <a6-data.scad>
include <round_post.scad>
include <colors.scad>

module tail_boom() {
    color(WOOD_Balsa)
        rotate([90,0,0])
            translate([0,0,-tb_y/2])
                linear_extrude(height = tb_y, convexity=10)
                    polygon(tb_poly);

    // add front wing posts
    translate([tb_x3 - spar_size,-tb_y/2, tb_z2])
        color(WOOD_Birch)
            rotate([180,0,0])
            round_post(h = stab_z0);

    // add rear wing post
    translate([tb_x2 - spar_size,-tb_y/2, tb_z2])
        color(WOOD_Birch)
            rotate([180,0,0])
            round_post(h = stab_z0);

    // center stab brace
    translate([tb_x3,-tb_y/2 - spar_size,tb_z2-1.0])
        color(WOOD_Balsa)
            cube([w_x0 + (2 * pt_t + pt_r),spar_size, spar_size]);
}
