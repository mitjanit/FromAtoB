
int    sceneWidth   = 1080;
int    sceneHeight  = 1080;
color  bgColor    = #F0F0D0;

boolean recordVideo = false;
String pathDATA = "../../../DATA/";
PFont f;

PVector start, end;
DemoMotion dm;

void settings() {
	size(sceneWidth,sceneHeight,P3D);
	smooth();
}

void setup(){
	frameRate(30);
	background(bgColor);
	smooth();
	colorMode(RGB, 255);
	f = createFont(pathDATA+"myFont.ttf", 32);

	start 	= new PVector(1*width/4, 1*height/2);
	end 	= new PVector(3*width/4, 1*height/2);
	dm = new DemoMotion("15. Cubic Bezier Motion", start, end, Motion.BEZIER, 
		40, 8, 1);

}

void draw(){
	background(bgColor);
	dm.display(true, false);
	if(recordVideo){
		saveFrame("video/bezier01-######.tif");
	}
}

void mouseDragged(){
	BezierMotion bm = (BezierMotion)(dm.m.motion);
	if(bm.overP1(mouseX, mouseY)){
		bm.setControlPoint1(new PVector(mouseX, mouseY));
		bm.calculatePath();
	}
	else if(bm.overP2(mouseX, mouseY)){
		bm.setControlPoint2(new PVector(mouseX, mouseY));
		bm.calculatePath();
	}
	else if(dm.overOrigin(mouseX, mouseY)){
		start = new PVector(mouseX, mouseY);
		dm.setOrigin(start);
		dm.setMover(Motion.BEZIER, 40, 8, 1);
	}
	else if(dm.overTarget(mouseX, mouseY)){
		end = new PVector(mouseX, mouseY);
		dm.setTarget(end);
		dm.setMover(Motion.BEZIER, 40, 8, 1);
	}
}



void keyPressed(){
	if(key=='r'){
		dm.m.reset();
	}
	else if(key=='p'){
		dm.m.pause();
	}
	else if(key=='s'){
		dm.m.start();
	}
	else if(key=='x'){
		recordVideo = !recordVideo;
		println("RECORD VIDEO: "+recordVideo);
	}

}
