//#####################################
// paper tube generator

$fn = 100;

module paper_tube(radius=1/32, height=1/4) {
    difference() {
        cylinder(r=radius + pt_t,
            h=height);
        translate([0,0,-height])
            cylinder(r=radius, h=3 * height);
    }
}
