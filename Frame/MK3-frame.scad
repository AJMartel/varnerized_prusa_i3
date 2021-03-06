// Prusa i3 MK3V8B Frame routing template.

/* --- Print Settings ---
    Rotate stl outputs in your slicing software to avoid support material.
    All layers: 0.25mm
    Infill: 10% honeycomb
    you may want to compensate for elephant foot.
*/
    
/* --- Use Notes ---
    Once all the parts are printed super-glue and clamp until cured.
    
    Use double-sided (carpet) tape to adhear the assembled frame to the wood when routing.
*/

// Select which sector to print ([1-9], or 0 for the full-size frame)
sector = 0;

// Final thickness of the frame.
thickness = 6;

/* -- About the .dxf --
    I started with the .dxf obtained from the original Prusa github repo.
    This was opened with DraftSight, where I traced the splines as polylines, so I could import them cleanly into OpenSCAD.
    
    Prior attempts (dxf -> pdf -> svg, dxf->svg, etc.) all were 'off' with scaling artifacts.
*/
module layer() {
linear_extrude(thickness, convexity = 10)
    import("MK3v8b-frame.dxf", convexity = 10, layer = "0", $fn = 100);
}

// The frame is rougly 400x400.
// In order to fit the parts on an MK2 / MK3 heatbed (the most common sizes)
// we split the area into 9 sectors and overlap parts

if (sector == 1 || sector == 0) {
    union() {
        intersection() {
            layer();
            cube([112.5, 112.5, thickness / 2]);
        }
        intersection() {
            layer();
            translate([0, 0, thickness / 2])
                cube([150, 150, thickness / 2]);
        }
    }
}

if (sector == 2 || sector == 0) {
    union() {
        intersection() {
            layer();
            translate([112.5, 0, 0])
                cube([175, 112.5, thickness / 2]);
        }
        intersection() {
            layer();
            translate([150, 0, thickness / 2])
                cube([100, 150, thickness / 2]);
        }
    }
}

if (sector == 3 || sector == 0) {
    union() {
        intersection() {
            layer();
            translate([287.5, 0, 0])
                cube([112.5, 112.5, thickness / 2]);
        }
        intersection() {
            layer();
            translate([250, 0, thickness / 2])
                cube([150, 150, thickness / 2]);
        }
    }
}

if (sector == 4 || sector == 0) {
    union() {
        intersection() {
            layer();
            translate([0, 112.5, 0])
                cube([112.5, 175, thickness / 2]);
        }
        intersection() {
            layer();
            translate([0, 150, thickness / 2])
                cube([150, 100, thickness / 2]);
        }
    }
}

if (sector == 5 || sector == 0) {
    union() {
        intersection() {
            layer();
            translate([112.5, 112.5, 0])
                cube([175, 175, thickness / 2]);
        }
        intersection() {
            layer();
            translate([150, 150, thickness / 2])
                cube([100, 100, thickness / 2]);
        }
    }
}

if (sector == 6 || sector == 0) {
    union() {
        intersection() {
            layer();
            translate([287.5, 112.5, 0])
                cube([112.5, 175, thickness / 2]);
        }
        intersection() {
            layer();
            translate([250, 150, thickness / 2])
                cube([150, 100, thickness / 2]);
        }
    }
}

if (sector == 7 || sector == 0) {
    union() {
        intersection() {
            layer();
            translate([0, 287.5, 0])
                cube([112.5, 112.5, thickness / 2]);
        }
        intersection() {
            layer();
            translate([0, 250, thickness / 2])
                cube([150, 150, thickness / 2]);
        }
    }
}

if (sector == 8 || sector == 0) {
    union() {
        intersection() {
            layer();
            translate([112.5, 287.5, 0])
                cube([175, 112.5, thickness / 2]);
        }
        intersection() {
            layer();
            translate([150, 250, thickness / 2])
                cube([100, 150, thickness / 2]);
        }
    }
}

if (sector == 9 || sector == 0) {
    union() {
        intersection() {
            layer();
            translate([287.5, 287.5, 0])
                cube([112.5, 112.5, thickness / 2]);
        }
        intersection() {
            layer();
            translate([250, 250, thickness / 2])
                cube([150, 150, thickness / 2]);
        }
    }
}

