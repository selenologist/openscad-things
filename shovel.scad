union(){
    difference(){
        cube([15, 15, 2.5]);
        translate([0,-1,0.25])
            rotate([7,0,0])
            cube([16,15,5]);
        translate([1,0,0.2])
            rotate([2,0,0])
            cube([13,13,5]);
    }
    translate([6,15,0])
        cube([3,25,2]);
}