module prop_form() {
	difference() {
		cylinder(
			r=prop_form_radius,
			h=prop_form_height);
        translate([0,0,-1])
            cylinder(
                r=prop_form_radius-prop_blade_thickness,
                h=prop_form_height+2);
	}
}

module prop_blade_slicer() {
    rotate([-prop_form_angle,0,0])
    rotate([0,-90,0])
        linear_extrude(
                height = prop_radius + 2,
                center = false,
                convexity = 10)
            scale([prop_radius,prop_max_chord/2])
                polygon(larrabee_coords);
}

module prop_blade() {
    color(WOOD_Balsa) {
        rotate([prop_form_angle,-5,0])  // need to derive this number
            translate([prop_form_radius,0,0])
                intersection() {
                    prop_form();
                    prop_blade_slicer();
                }
    }
}
