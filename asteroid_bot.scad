// "Asteroid" robot frame

$fs = 0.1;
$fa = 0.1;

width  = 30;
thickness = 2.75;

height = 25; // 50mm wheel
angle  = 20; // 30 deg inclination

length = height / sin(angle);
echo("length ", length);

castor_axle_r = 1; // radius of castor wheel hole

module motor_clip(){
    translate([0,0,15/2])
        difference(){
            cube([6, 18, 15], center=true);
            cube([6, 12.5, 10.5], center=true);
        }
}

module body(){
//rotate([angle,0,0])
    difference(){
        // motor clips
        union(){
            cube([width, length, thickness]);
            translate([5,11*length/12,2*thickness/3])
                motor_clip();
            translate([25,11*length/12,2*thickness/3])
                motor_clip();
        }
        // main frame
        translate([width/2,length/6,0])
            rotate([0,0,180])
            difference(){
            translate([0,width/2,0])
                cube([width*2, width, thickness*3],
                     center=true);
                hull(){
                translate([0,length/6,0])
                    cylinder(thickness,
                             width/32,
                             width/32);
                cylinder(thickness, width/6, width/6);
            }
        }
        // castor wheel axle hole
        translate([0, length/24, thickness/2])
        rotate([0,90,0])
            cylinder(width, castor_axle_r, castor_axle_r);
        // text
        translate([6*width/10,
                   6*length/7,
                   thickness/3 + 0.5])
        rotate([180, 0, 270])
            linear_extrude(height=thickness)
            union(){
                text("asteroid",
                     font="Source Code Pro",
                     size=6);
                translate([0, width/4])
                    text("GH: @selenologist",
                         font="Source Code Pro",
                         size=2.9);
            }
    }
}

body();
