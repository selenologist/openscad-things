/*
 * Modified version of the lambda ring... that instead
 * has heart patterns. Prints upside-down so the top of
 * the heart is preserved. Isn't gravity a pain?
*/

$fa = 1;
$fs = 0.1;

/* 
 * Adjust these values!
 * Especially the inner diameter. Make it more than
 * you think it should be, then make it bigger than
 * that. If it's too big THEN make it smaller,
 * better than making one too small and having to
 * cut it off your finger...
*/ 

inner     =  19.5; // inner diameter
thickness =  2.75; // ring wall thickness
width     =     5; // ring wall tallness
hearts    =     5; // how many hearts :P

// tweak this to adjust heart centering
heart_angle_tweak = -8;

module do_heart(x_offset, thickness,
                 angle_increment, heart){
    rotate([270, 0,
            heart_angle_tweak +
            angle_increment * heart])
        translate([x_offset, 0, 0])
        rotate([0,90,0])
        linear_extrude(height=thickness)
                text(font="Source Code Pro:style=Bold",
                     size=4.5,
                     "♥");
    if(heart > 1){
        do_heart(x_offset, thickness,
                  angle_increment, heart - 1);
    }
}

difference(){
    union(){
        translate([0, 0, width])
            cylinder(thickness/3,
                     d1=inner+thickness,
                     d2=inner+thickness/2);
        
        cylinder(width,
                 d1=inner+thickness,
                 d2=inner+thickness,
                 $fa = 360/(hearts*2));
        translate([0,0,-thickness/3])
            cylinder(thickness/3,
                     d1=inner+5*thickness/6,
                     d2=inner+thickness);
    }

    translate([0,0,-thickness/2-1])
        cylinder(width+thickness+2,
                 d1=inner, d2=inner);
    
    translate([0, 0, width*0.925])
        do_heart(inner/2-thickness,
                  thickness*4,
                  360/hearts,
                  hearts);
}
