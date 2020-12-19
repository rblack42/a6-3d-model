//##############################################################################
// rounded post

module round_post(d=1/16, h=1, t=1/4) {
    // d = post thickness, h = total post height, t = tube height
    cube([d, d, h - t]);
    translate([d/2,d/2,h - t])
        cylinder(r=d/2,h = t);
}

