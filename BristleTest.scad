module Bristle(height, botRad, topRad, sphereRad){
    union() {
        cylinder(height, botRad, topRad);
        translate([0, 0, height]){
            sphere(sphereRad);
        }
    }
}

translate([0,0,0])
Bristle(5, 0.25, 0.125, 0.25);
translate([0,-5,0])
Bristle(5, 0.5, 0.25, 0.5);

translate([0,5,0])
Bristle(4, 0.2, 0.1, 0.2);
translate([0,10,0])
Bristle(4, 0.4, 0.2, 0.4);

translate([5,0,0])
Bristle(3, 0.15, 0.075, 0.15);
translate([10,0,0])
Bristle(3, 0.075, 0.0375, 0.075);

translate([-5,0,0])
Bristle(2, 0.0375, 0.01875, 0.0375);
translate([-10,0,0])
Bristle(2, 0.01875, 0.009375, 0.01875);