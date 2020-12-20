//##################################################
// AMA Rules
w_x0 = 0.98 * 2.0;         // wing max chord
w_rib_t = 1/32;
w_rib_h = 1/16;
prop_r = 3.0;

//##################################################
// wing and stab spar size
spar_size = 1/16;

//##################################################
// paper tubes
pt_t = 1/64;
pt_r = 1/32;

//##################################################
// motor stick

ms_x0 = 0.0;
ms_x1 = 6.0;
ms_x2 = 6.0;
ms_x3 = 0.36 + 2* (pt_t + pt_r) + w_x0 + pt_r + pt_t;
ms_x4 = 0.36 + pt_r + pt_t;
ms_x5 = 0.18;

ms_y = 0.13;

ms_z0 = 0.0;
ms_z1 = 0.0;
ms_z2 = 0.18;
ms_z3 = 0.23;
ms_z4 = 0.23;
ms_z5 = 0.18;

ms_poly = [
    [ms_x0, ms_z0],
    [ms_x1, ms_z1],
    [ms_x2, ms_z2],
    [ms_x3, ms_z3],
    [ms_x4, ms_z4],
    [ms_x5, ms_z5]
];

//#######################################################
// tail boom

tb_offset = 1/8;        // gluing area
tb_length = 3.0;

// polygon coordinates
tb_x0 = 0;
tb_x1 = tb_length + tb_offset;
tb_x2 = tb_x1;
tb_x3 = tb_x2 - (ms_x3 - ms_x4);
tb_x4 = tb_x0;

tb_y =  0.09;

tb_z0 = 0.0;
tb_z1 = ms_z2 - 0.09;
tb_z2 = ms_z2;
tb_z4 = ms_z2;

tb_poly = [
    [tb_x0, tb_z0],
    [tb_x1, tb_z1],
    [tb_x2, tb_z2],
    [tb_x4, tb_z4]
];

//#######################################################
// wing dimensions

wing_z0 = 1.44;
w_rib_camber = 6.0;

// wing coordnates

w_x0r = 0.0;    w_y0r = 1.98;
w_x1r = 2.50;   w_y1r = 1.88;
w_x2r = 4.90;   w_y2r = 1.80;
w_x3r = 6.90;   w_y3r = 1.40;
w_x4r = 8.20;   w_y4r = 1.13;
w_x5r = 8.80;   w_y5r = 0.50;

w_x0l = 0.00;   w_y0l = 1.98;
w_x1l = 2.80;   w_y1l = 1.88;
w_x2l = 5.50;   w_y2l = 1.80;
w_x3l = 7.45;   w_y3l = 1.41;
w_x4l = 8.75;   w_y4l = 1.13;
w_x5l = 9.35;   w_y5l = 0.50;

alpha1r = atan2(w_x0 - w_y2r, w_x2r);
alpha2r = atan2(w_y2r - w_y4r,w_x4r - w_x2r);
alpha3r = atan2(w_y4r - w_y5r,w_x5r - w_x4r);


alpha1l = atan2(w_x0 - w_y2l, w_x2l);
alpha2l = atan2(w_y2l - w_y4l,w_x4l - w_x2l);
alpha3l = atan2(w_y4l - w_y5l,w_x5l - w_x4l);

theta1l = atan2(0.28,w_x2l);
theta2l = atan2(1.34,w_x5l-w_x2l);
theta1r = atan2(0.28,w_x2r);
theta2r = atan2(1.34,w_x5r-w_x2r);

//#######################################################
// stab dimensions
stab_z0 = 1.6;

//#######################################################
// prop dimensions

prop_blade_t = 1/32;
prop_spar_l = 4;
prop_spar_center_r = 1/16;
prop_spar_tip_r = 1/32;
prop_spar_color = WOOD_Oak;

