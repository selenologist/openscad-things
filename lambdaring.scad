$fa = 1;

/* 
 * Adjust these values!
 * Especially the inner diameter. Make it more than you think it should be,
 * then make it bigger than that. I'm still wearing my lambda ring. Because it
 * is stuck. But I only wish I had filed it down before trying it on... :-)
*/ 

inner     = 18; // inner diameter
thickness =  3; // ring wall thickness
width     =  8; // ring wall tallness

module do_lambda(x_offset, thickness,
                 angle_increment, lambda){
    rotate([90, 0, angle_increment * lambda])
        translate([x_offset, thickness/3, 0])
        rotate([0,90,0])
        linear_extrude(height=thickness)
                text(font="Source Code Pro",
                     size=6,
                     "λ");
    if(lambda > 1){
        do_lambda(x_offset, thickness,
                  angle_increment, lambda - 1);
    }
}

difference(){
    cylinder(8,
             d1=inner+thickness,
             d2=inner+thickness,
             $fa = 360/12);
    cylinder(8, d1=inner, d2=inner);
    do_lambda(inner/2, thickness, 360/6, 6);
}
