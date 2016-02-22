/* "Asteroid" robot frame
 * currently seems good but I broke the motor clips off trying to remove
 * support material :(.
 * 
 * Gonna glue on replacements until I need to make further edits to this
 * design.
*/

$fs = 0.1;
$fa = 0.1;

width  = 45;
thickness = 3;

height = 25; // 50mm wheel
angle  = 10; // 30 deg inclination

length = height / sin(angle);
echo("length ", length);

castor_axle_r = 1.5; // radius of castor wheel hole

module motor_clip(){
    translate([0,0,13/2])
        difference(){
            cube([5, 15, 13], center=true);
            cube([5, 12, 10.2], center=true);
        }
}

module castor_cutout(){
translate([width/2,length/6,0])
    rotate([0,0,180])
        difference(){
        translate([0,width/2,0])
            cube([width*2, width, thickness*3],
                 center=true);
        hull(){
            translate([0,length/6,0])
                cylinder(thickness,
                         width/48,
                         width/48);
            cylinder(thickness, width/5, width/5);
        }
    }
}

module main_frame(){
    cube([width, length, thickness]);
}

module cargo_cutout(){
    translate([0.5, 3*length/16, 2*thickness/3])
        cube([width-1,
              5*length/7,
              thickness/3]);
}

module castor_wheel_axle_shaft(){
    translate([2*width/5, length/20, thickness/2])
    rotate([0,90,0])
        cylinder(width/5,
                 5*castor_axle_r/3,
                 5*castor_axle_r/3);
}

module body(){
//rotate([angle,0,0])
    difference(){
        union(){
            difference(){
                main_frame();
                cargo_cutout();
                castor_cutout();
            }
            // motor clips
            translate([   width/12,
                       23*length/24,
                        2*thickness/3])
                motor_clip();
            translate([11*width/12,
                       23*length/24,
                        2*thickness/3])
                motor_clip();
            castor_wheel_axle_shaft();
        }
        
        // castor wheel axle hole
        translate([0, length/20, thickness/2])
        rotate([0,90,0])
            cylinder(width, castor_axle_r, castor_axle_r);
        
        // text
        translate([7*width/10,
                   5*length/7,
                   thickness/3 + 0.5])
        rotate([180, 0, 270])
            linear_extrude(height=thickness)
            union(){
                text("asteroid",
                     font="Source Code Pro",
                     size=8);
                translate([-length/64, width/4])
                    text("GH: @selenologist",
                         font="Source Code Pro",
                         size=4);
            }
    }
    
}

body();
