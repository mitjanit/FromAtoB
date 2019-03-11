
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

	float stepR = 100;
	float minR = 40;
	float maxR = 80;
	float ns = 40.0;
	for(int k=1; k<11; k++){
		minR = 0 + k*stepR + random(0,10);
		maxR = stepR + k*stepR + random(0, 10);
		ns = 80 + 100*k;
		for(float n=0; n<ns; n+=1){
			float t = n/ns;
			float a = lerp(0, TWO_PI, t);
			minR = 10 + k*stepR + random(0,10);
			maxR = stepR + k*stepR + random(0, 10);
			start 	= new PVector(width/2 + minR*cos(a), height/2 + minR*sin(a));
			end 	= new PVector(width/2 + maxR*cos(a), height/2 + maxR*sin(a));
			if(((int)(k))%2==1){
				PVector temp = start.copy();
				start = end.copy();
				end = temp.copy();
			}
			dm = new DemoMotion(title, start, end,
							Motion.LINEAR, 
							(int)random(25, 55), 5, 1);
			dms.add(dm);
		}
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
