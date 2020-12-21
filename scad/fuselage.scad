//###########################################
// fuselage assembly

include <colors.scad>
include <a6-data.scad>
include <motor-stick.scad>
include <tail-boom.scad>
include <wing.scad>
use <propeller.scad>

module spin_prop(ang=$t*360) {
    translate([-0.25,0,-0.25]) 
    rotate([-ang,0,0])
        color(WOOD_Balsa)
            propeller();
}
module fuselage() {
    motor_stick();
    translate([ms_x1-tb_offset,-ms_y/2 - tb_y/2,0]) tail_boom();
    translate([ms_x4 +pt_t + spar_size,spar_size/2-ms_y/2-2*pt_t-pt_r,wing_z0-1/8]) wing();
    translate([ms_x2 + tb_x2 - w_x0 - tb_offset -pt_t -spar_size,-ms_y - tb_y + spar_size/2,-stab_z0 +tb_z2+1/8]) wing();
    spin_prop();
}


fuselage();
