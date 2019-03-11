
int    sceneWidth   = 1920;
int    sceneHeight  = 1080;
color  bgColor    = #F0F0D0;

boolean recordVideo = false;
String pathDATA = "../../../DATA/";
String num = "01";
String title = num+". Rectilinear Motion";
PFont f;


ArrayList<DemoMotion> dms;
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

	dms = new ArrayList<DemoMotion>();
	for(int i=0; i<600; i++){

		start 	= new PVector(1*width/2 + random(0, 0), i*3);
		end 	= new PVector(1*width/1, i*3);
		if(i%2==0){
			end 	= new PVector(0, i*3);
		}

		dm = new DemoMotion(title, start, end,
						Motion.LINEAR, 
						(int)random(51, 251), 5, 1);
		dms.add(dm);
	}
}

void draw(){
	background(bgColor);
	for(DemoMotion dm : dms){
		dm.display(false, false);
	}
	if(recordVideo){
		saveFrame(pathDATA+"video/"+num+"/"+title+"-######.tif");
	}
}


void keyPressed(){
	if(key=='r'){
		for(DemoMotion dm : dms){
			dm.m.reset();
		}
	}
	else if(key=='p'){
		for(DemoMotion dm : dms){
			dm.m.pause();
		}
	}
	else if(key=='s'){
		for(DemoMotion dm : dms){
			dm.m.start();
		}
	}
	else if(key=='x'){
		recordVideo = !recordVideo;
		println("RECORD VIDEO: "+recordVideo);
	}

}
