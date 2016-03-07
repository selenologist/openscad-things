// First go. Lots of hardcoding. Way too much spacing.

$fs=0.1;

module pi_placeholder(){
    color([0,0.75,0]) cube([125, 93, 30]);
}

module battery_placeholder(){
    color([0.1,0.1,0.80]) cube([48, 90, 20]);
}

module hollow_box(x, y, z, thickness){
    difference(){
        cube([x, y, z]);
        translate([-thickness, thickness, thickness])
            cube([x+thickness, y-thickness*2, z-thickness*2]);
    }
}

difference(){
    union(){
        hollow_box(125+48+15, 110, 40, 4);
        translate([10,0,4]) translate([125,0,0])
            cube([2, 107, 4]);
        translate([10,0,4]) translate([174,0,0])
            cube([4, 107, 5]);
    }
    translate([10,5,15])
        pi_placeholder();
    translate([20,30,0])
        for (grill = [0:5])
            union(){            
            translate([0, 10*grill, 0])
                rotate(-10,0,0)
                cube([30,2,5]);
            translate([40, 10*grill - 10, 0])
                rotate( 10,0,0)
                cube([30,2,5]);
            }
    translate([145,20,35])
        for (grill = [0:5])
            translate([0, 10*grill, 0])
            rotate([0,0,10])
            cube([30,2,5]);

    cyledge(200, 5);
    
    translate([0,0,40])
        rotate([-90,0,0])
        cyledge(200, 5);
        
    
    translate([170, 109, 8])
        rotate([-90,-180,0])
        linear_extrude(6)
        text("CERULEAN",
             font="Source Code Pro:style=Bold",
             size=23);
}

//translate([5,5,5]) pi_placeholder();

module cyledge(length, diameter){
    difference(){
        cube([length*2,diameter,diameter], center=true);
        translate([0, diameter/2, diameter/2])
        rotate([0, 90, 0])
            cylinder(length, d1=diameter, d2=diameter);
    }
}

 
