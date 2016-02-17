// smoothify; remove for speed
$fa=1;
$fs=1;

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
        cylinder(width,
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
        translate([2*shaft_diameter/3, 0, 0])
            cube([shaft_diameter,
                  
                  shaft_diameter,
                  width*2],
                 center=true); // I have no idea why
                               // this needs to be *2
    }
    }
}

wheel(wheel_diameter  = 30,
      wheel_thickness = 6,
      hub_diameter    = 6,
      shaft_diameter  = 3,
      spokes          = 3,
      width           = 10);
