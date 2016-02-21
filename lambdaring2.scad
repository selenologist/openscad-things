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

inner     =   19; // inner diameter
thickness =  2.7; // ring wall thickness
width     =    5; // ring wall tallness
lambdas    =   5; // how many lambdas :P

// tweak this to adjust lambda centering
lambda_angle_tweak = 7;

module do_lambda(x_offset, thickness,
                 angle_increment, lambda){
    rotate([90, 0,
            lambda_angle_tweak +
            angle_increment * lambda])
        translate([x_offset, 0, 0])
        rotate([0,90,0])
        linear_extrude(height=thickness)
                text(font="FreeSans:style=Bold",
                     size=4.5,
                     "λ");
    if(lambda > 1){
        do_lambda(x_offset, thickness,
                  angle_increment, lambda - 1);
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
                 $fa = 360/(lambdas*2));
        translate([0,0,-thickness/3])
            cylinder(thickness/3,
                     d1=inner+5*thickness/6,
                     d2=inner+thickness);
    }

    translate([0,0,-thickness/2-1])
        cylinder(width+thickness+2,
                 d1=inner, d2=inner);
    
    translate([0, 0, width * 0.035])
        do_lambda(inner/2-thickness,
                  thickness*4,
                  360/lambdas,
                  lambdas);
}
