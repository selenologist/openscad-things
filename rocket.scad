$fa = 1;
$fs = 1;

module body_shape(height, diameter){
    difference(){
        hull(){
            translate([0,height-diameter])
                circle(d=diameter);
            square([diameter, height],
                center=true);
        }
        translate([diameter/2,0])
            square([diameter, height+diameter*2],
                   center=true);
    }
}

module body(height, diameter, thickness){
    rotate_extrude(){
        difference(){
            body_shape(height, diameter);
            translate([0, -thickness])
            body_shape(height,
                       diameter - thickness);
        }
    }
}

module fin(height, width, thickness){
    linear_extrude(height=thickness, center=true){
        difference(){
            hull(){
                translate([0,height,0])
                    square([1,1],center=true);
                square([width, 1], center=true);
            }
            translate([-width/2,0])
                    square([width, height*3],
                            center=true);
        }
    }
}

module make_fins(height, x_offset,
                 fin_width,
                 fin,
                 fincrement,
                 thickness){
    echo("fin ", fin);
    rotate([90,0,fincrement * fin])
        translate([x_offset,0,0])
                  fin(height,
                      fin_width,
                      thickness);
    if (fin > 1) {
        make_fins(height, x_offset,
                  fin_width,
                  fin - 1,
                  fincrement,
                  thickness);
    }
}            

module rocket(height,
              diameter,
              fin_width,
              fins,
              thickness,
              title){
    fincrement = 360 / fins;

    union(){
        difference(){
            body(height, diameter, thickness);
            rotate([90,90,0])
                translate([-height/2,
                           0,
                           diameter/2])
                rotate([-20,0,0])
                linear_extrude(height=thickness/2)
                text(font="Source Code Pro",
                     title);
        }
    
        translate([0, 0, -height/2])
            make_fins(height    = 2*height/3,
                      x_offset  = diameter/2,
                      fin_width = fin_width,
                      fin       = fins,
                      fincrement= fincrement,
                      thickness = thickness);
    }
}

rocket(height    = 80,
       diameter  = 30,
       fin_width = 40,
       fins      = 3,
       thickness = 4,
       title     = "LUNA I");