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
        translate([1, 5.5, 0]) cylinder(h=3, r=5.5, $fn=30);
        linear_extrude(height=2.1, center=false, convexity=10, twist=0)
            polygon(points=[[0, -0.5], [-7.3, 7], [-6.4, 8.2], [0, 12], [30, -2]], paths=[[0, 1, 2, 3, 4, 5]]);
    }
}

difference(){
    union(){
        translate([3.7, 1, 15.8]) outer_bearing();
        translate([37.3, 1, 15.8]) outer_bearing();
        translate([10, 0, 10.3]) inner_bearing();
        translate([35, 0, 10.3]) mirror([1, 0, 0]) inner_bearing();
    }
    translate([0, 1, 15.8]) rotate([0, 90, 0]) cylinder(h=45, r=2.1, $fn=30);
}

module lid(){
    polyhedron(
        points=[
            //Top
            [10, 0, 12],
            [35, 0, 12],
            [35, 30, -2],
            [10, 30, -2],
            //Bottom
            [10, 0, 10],
            [35, 0, 10],
            [35, 30, -4],
            [10, 30, -4]
        ],
        faces=[
            [0, 1, 2, 3],
            [4, 5, 6, 7],
            [0, 3, 7, 4],
            [1, 2, 6, 5],
            [0, 4, 5, 1],
            [3, 7, 6, 2]
]
    );
}

translate([0, 0, 10.6]) lid();
