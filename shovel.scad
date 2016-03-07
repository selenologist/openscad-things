union(){
    difference(){
        cube([10, 15, 2.5]);
        translate([0,-1,0.25])
            rotate([7,0,0])
            cube([11,15,5]);
        translate([1,0,0.2])
            rotate([2,0,0])
            cube([8,13,5]);
    }
    translate([3.5,15,0])
        cube([3,25,2]);
}