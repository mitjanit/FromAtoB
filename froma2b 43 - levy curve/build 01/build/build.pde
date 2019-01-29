
int    sceneWidth   = 1080;
int    sceneHeight  = 1080;
color  bgColor    = #F0F0D0;

boolean recordVideo = false;
String pathDATA = "../../../DATA/";
String num = "45";
String title = num+". Snow Flock Curve Motion";
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

	start 	= new PVector(1*width/4, 2*height/5);
	end 	= new PVector(3*width/4, 2*height/5);
	dm = new DemoMotion(title, start, end, 
						Motion.LEVY_CURVE, 
						3, 2, 1);

}

void draw(){
	background(bgColor);
	dm.display(false, false);
	if(recordVideo){
		saveFrame(pathDATA+"video/"+num+"/"+title+"-######.tif");
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
