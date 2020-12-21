include <colors.scad>

blade_x = 2.0;
blade_y = 1.185;
blade_t = 1/32;
blade_m = 1.5;

$fn=100;

module prop_blade() {
    color(WOOD_Balsa) rotate([0,-90,0]) 
    translate([blade_m +1,0,-blade_t/2])
    union() {
        difference() {
            linear_extrude(height=blade_t,convexity=10)
                scale([blade_m, blade_y]) circle(r=1);
            translate([-2,-2,-0.5]) cube([4,2,1]);
            translate([0,-2,-0.5]) cube([3,4,1]);
        }
        difference() {
            linear_extrude(height=blade_t,convexity=10)
                scale([blade_x- blade_m, blade_y]) circle(r=1);
            translate([-2,-2,-0.5]) cube([4,2,1]);
            translate([-3,-2,-0.5]) cube([3,4,1]);
        }
    }
}

//prop_blade();
