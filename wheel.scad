// D-shafted parametric robot wheel.


// smoothify; remove for speed
$fa=1;
$fs=0.1;

module make_spokes(length,
                   base_diameter,
                   end_diameter,
                   angle,
                   spokes){
    rotate([90,0,angle*spokes])
        cylinder(length,
                 d1=base_diameter,
                 d2=end_diameter);
    if(spokes > 1){
        make_spokes(length        = length,
                    base_diameter = base_diameter,
                    end_diameter  = end_diameter,
                    angle         = angle,
                    spokes        = spokes - 1);
    }
}

module wheel(wheel_diameter,
             wheel_thickness,
             hub_diameter,
             shaft_diameter,
             spokes,
             width){
    difference(){
    union(){
        difference(){
            cylinder(width,
                     d1=wheel_diameter,
                     d2=wheel_diameter);
            cylinder(width, d1=wheel_diameter -
                               wheel_thickness,
                            d2=wheel_diameter -
                               wheel_thickness);
        }
        translate([0,0,width/6])
            cylinder(2*width/3,
                     hub_diameter,
                     hub_diameter);
        translate([0,0,width/2])
        make_spokes(length=wheel_diameter/2 -
                           wheel_thickness/2,
                    base_diameter=width/3,
                    end_diameter=2*width/3,
                    angle=360/spokes,
                    spokes=spokes);
    }
    difference(){
        cylinder(width,
                 d1=shaft_diameter,
                 d2=shaft_diameter);
        translate([5*shaft_diameter/6, 0, width/2])
            cube([shaft_diameter,
                  
                  shaft_diameter,
                  width],
                 center=true);
    }
    }
}

wheel(wheel_diameter  = 50,
      wheel_thickness = 6,
      hub_diameter    = 7,
      shaft_diameter  = 3.5,
      spokes          = 3,
      width           = 6);
