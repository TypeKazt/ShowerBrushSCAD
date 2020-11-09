
brushLength = 100;
brushWidth = 100;
brushHeight = 2;

bristleNumRows = 60;
bristleNumCols = 60;

bristleStartXPos = 100;
bristleStartYPos = 100;

//bristleXPos = bristleStartXPos;
//bristleYPos = bristleStartYPos;

cylinderHeight = 5.0;
cylinderBotRad = 0.5;
cylinderTopRad = 0.25;

//deltaRow = (brushLength - (brushLength - bristleXPos) ) / bristleNumRows;
//deltaCol = (brushWidth - (brushWidth - bristleYPos) ) / bristleNumCols;

deltaRow = brushLength / bristleNumRows;
deltaCol = brushWidth / bristleNumCols;

bristleXPos = bristleStartXPos - deltaRow/2.0;
bristleYPos = bristleStartYPos - deltaCol/2.0;


sphereRad = 0.5;

handRadius = 20;
handXPos = 50;
handYPos = 50;

adapterHeight = brushHeight / 2.0;
adapterBaseRad = 2;
adapterTopRad = 0.5;

function notInHandArea(x, y, centerX, centerY, radius) =  sqrt(pow(abs(x - centerX), 2) + pow(abs(y - centerY), 2)) - radius < 0 ? false : true; 
    


module Bristle(height, botRad, topRad, sphereRad){
    union() {
        cylinder(height, botRad, topRad);
        translate([0, 0, height]){
            sphere(sphereRad);
        }
    }
}

module BristleArray(){
    for (row=[0:bristleNumRows-1]){
        for(col=[0:bristleNumCols-1]){
            if(notInHandArea(bristleXPos, bristleYPos, handXPos, handYPos, handRadius) ){
                translate([bristleXPos,bristleYPos,0]) 
                Bristle(cylinderHeight, cylinderBotRad, cylinderTopRad, sphereRad);
            }
 
            bristleYPos = bristleYPos - deltaCol*col;
        }
        bristleXPos = bristleXPos - deltaRow*row;
    }
    
}

translate([-100, -100, brushHeight/2.0])
{
    color("BlueViolet", 1.0)
    difference()
    {
        translate([0,0,brushHeight/2.0])
        cube(size=[brushLength, brushWidth, brushHeight/2.0]);
        BristleArray();
    }
    
};

union()
{
    translate([brushLength/2.0, brushWidth/2.0, brushHeight]){
        cube(size=[2,2,adapterHeight]);
     }
    union()
    {
        color("BlueViolet", 1.0)
        cube(size=[brushLength, brushWidth, brushHeight/2.0]);
        color("Yellow", 1.0)
        BristleArray();
    };
}



