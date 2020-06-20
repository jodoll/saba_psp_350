// Bracket
union(){
    difference(){
        polyhedron(
            points=[
                //Bottom
                [0, 0, 0],
                [45, 0, 0],
                [45, 30, 1],
                [0, 30, 1],
                //Lower Middle
                [0, 3, 3],
                [45, 3, 3],
                [45, 30, 3.5],
                [0, 30, 3.5],
                //Upper Middle
                [0, 3, 7],
                [45, 3, 7],
                [45, 30, 6.5],
                [0, 30, 6.5],
                //Top
                [0, 0, 10],
                [45, 0, 10],
                [45, 30, 9],
                [0, 30, 9],
            ],
            faces=[
                //xy
                [0, 1, 2, 3],
                [4, 5, 6, 7],
                [8, 9, 10, 11],
                [12, 13, 14, 15],
                //yz
                [0, 1, 13, 12],
                [4, 5, 9, 8],
                [3, 2, 6, 7],
                [11, 10, 14, 15],
                //xz
                [1, 2, 6, 5, 9, 10, 14, 13],
                [0, 3, 7, 4, 8, 11, 15, 12]
            ],
            convexity = 50
        );
//        // Rounded Corners
//        translate([0, 28, 0])
//            difference(){
//                cube([2, 2, 10]);
//                translate([2, 0, 0]) cylinder(h=10, r=2, $fn=30);
//            }
//        translate([43, 28, 0])
//            difference(){
//                cube([2, 2, 10]);
//                cylinder(h=10, r=2, $fn=30);
//            }
    }
    translate([6.5, 24, 2.75]){
        cylinder(h = 1, r = 2.5, $fn=30);
    }
    translate([6.5, 24, 6.25]){
        cylinder(h = 1, r = 2.5, $fn=30);
    }
    translate([38.5, 24, 2.75]){
        cylinder(h = 1, r = 2.5, $fn=30);
    }
    translate([38.5, 24, 6.25]){
        cylinder(h = 1, r = 2.5, $fn=30);
    }
}

