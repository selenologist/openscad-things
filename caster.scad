$fs=0.1;
$fa=0.5;

axle_l  =  20;
axle_r  = 1.3;

wheel_w =   3;
wheel_r =   5;


cylinder(wheel_w, wheel_r, wheel_r);

translate([0,0,wheel_w/2])
    cylinder(axle_l, axle_r, axle_r);

translate([0,25,0])
difference(){
    cylinder(wheel_w, wheel_r, wheel_r);
    translate([0,0,wheel_w/4])
        cylinder(axle_l, axle_r+0.2, axle_r);
}