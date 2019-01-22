
int    sceneWidth   = 1920;
int    sceneHeight  = 540;
color  bgColor    = #F0F0D0;
String pathDATA = "../../../DATA/";

Point a, b;
Mover m;

void settings() {
	size(sceneWidth,sceneHeight,P3D);
	smooth();
}

void setup(){

	background(bgColor);
	colorMode(RGB, 255);
	PFont f = createFont(pathDATA+"myFont.ttf", 32);

	// Origin
	a = new Point("A", 1*width/5, 1*height/2, 20);
	a.setFillColor(color(255, 127, 16, 255));
	a.setTextFont(f);
	a.setLabelAlignment(-20*2, 10);

	// Target
	b = new Point("B", 4*width/5, 1*height/2, 20);
	b.setFillColor(color(2, 255, 172));
	b.setTextFont(f);
	b.setLabelAlignment(+20*2, 10);


	// Mover
	m = new Mover(a.pos, b.pos);
	m.setMotion(Motion.LINEAR, 11, 0);

}

void draw(){

	background(bgColor);
	a.display();
	b.display();
	m.display(true, true);

	if(frameCount%10==0)
	m.move();

	displayCorners(50, 100, 30);
	displayInfo("From A to B", width/2, 50+22);
	displayInfo("01. Linear Motion", width/2, height - 50);
}

void displayInfo(String info, float x, float y){
	textAlign(CENTER);
	textSize(32);
	fill(0);
	text(info, x, y);
}

void displayCorners(float margin, float w, float h){
	fill(200, 200, 180);noStroke();
	// Top-Left corner
	rect(margin, margin, w, h, w/4);
	rect(margin, margin, h, w, w/4);
	// Top-Right corner
	rect(width - margin - w, margin, w, h, w/4);
	rect(width - margin - h, margin, h, w, w/4);
	// Bottom-Left corner
	rect(margin, height - margin - h, w, h, w/4);
	rect(margin, height - margin - w, h, w, w/4);
	// Bottom-Right corner
	rect(width - margin - w, height - margin - h, w, h, w/4);
	rect(width - margin - h, height - margin - w, h, w, w/4);
}

void keyPressed(){
	if(key=='r'){
		m.reset();
	}
	else if(key=='p'){
		m.pause();
	}
	else if(key=='s'){
		m.start();
	}

}
