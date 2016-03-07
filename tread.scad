width           = 7;
wheel_diameter  = 50;
wheel_thickness = 3;

difference(){
    cylinder(width,
             d1=wheel_diameter,
             d2=wheel_diameter);
    cylinder(width, d1=wheel_diameter -
                       wheel_thickness,
                    d2=wheel_diameter -
                       wheel_thickness);
}