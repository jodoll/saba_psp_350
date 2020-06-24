module bracket_side(){
    cube([45, 30, 3]);
}

module pin(){
    cylinder(h = 1, r = 2.5, $fn=30);
}

module raw_bracket(){
    union(){
        translate([0, 0, 0]) rotate([1, 0, 0]) bracket_side();
        translate([0, 0, 7]) rotate([-1, 0, 0]) bracket_side();
        translate([0, 0, 1]) cube([45, 3, 8]);

        //Pins
        translate([6.5, 24, 2.75]) pin();
        translate([6.5, 24, 6.25]) pin();
        translate([38.5, 24, 2.75]) pin();
        translate([38.5, 24, 6.25]) pin();
    }
}

module corner_cutout(){
    difference(){
        cube([3, 3, 15]);
        cylinder(h=15, r=2, $fn=30);
    }
}

difference(){
    raw_bracket();
    // Cutout between bearings
    translate([13.6, 0, 8.5]) cube([17.7, 5.5, 1.5]);
    // Rounded Corners
    translate([2, 28, 0]) rotate([0, 0, 90]) corner_cutout();
    translate([43, 28, 0]) rotate([0, 0, 0]) corner_cutout();
}

module outer_bearing (){
    rotate([0, 90, 0]){
        union(){
            cylinder(h=4, r=5.5, $fn=30);
            translate([7, -1, 2]){
                rotate([0, 0, 90]){
                    linear_extrude(height = 4, center = true, convexity = 10, twist = 0)
                        polygon(points=[[0,0],[15,0],[0,12]], paths=[[0,1,2]]);
                }
            }
        }
    }
}

module inner_bearing() {
    rotate([90, 0, 90]) union(){
        translate([1, 5.5, 0]) cylinder(h=3.1, r=5.5, $fn=30);
        linear_extrude(height=2.5, center=false, convexity=10, twist=0)
            polygon(points=[[0, -0.5], [-7.3, 7], [-6.4, 8.2], [0, 12], [30, -2]], paths=[[0, 1, 2, 3, 4, 5]]);
    }
}

difference(){
    union(){
        translate([4, 1, 15.8]) outer_bearing();
        translate([37, 1, 15.8]) outer_bearing();
        translate([10.5, 0, 10.3]) inner_bearing();
        translate([34.5, 0, 10.3]) mirror([1, 0, 0]) inner_bearing();
    }
    translate([0, 1, 15.8]) rotate([0, 90, 0]) cylinder(h=45, r=2.1, $fn=30);
}

module lid(){
    rotate([-25, 0, 0]) cube([24, 31, 2]);
}

translate([10.5, -0.8, 20.5]) lid();

module lid_support(){
    cube([24, 3, 3.7]);
}

translate([10.5, 15.2, 10]) lid_support(); 
