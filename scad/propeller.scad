include <math-magik.data>
include <colors.scad>
include <prop-blade.scad>

$fn=50;

module prop_spar() {
    color(prop_spar_color) {
        cylinder(
            h=prop_spar_length/2, 
            r1=prop_spar_center_radius, 
            r2=prop_spar_tip_radius);
        rotate([180,0,0])
            cylinder(
            h=prop_spar_length/2, 
            r1=prop_spar_center_radius, 
            r2=prop_spar_tip_radius);
    }
}

module prop_wire() {
    color(METAL_Aluminium)
    rotate([90,90,0]) cylinder(h=1, r=1/64);
}

module propeller() {
    rotate([0,0,90]) {
        prop_spar();
        prop_wire();
        rotate([0,0,-prop_pitch_angle])
            prop_blade();
            rotate([180,0,180+prop_pitch_angle])
                prop_blade();
    }
}

propeller();