
int    sceneWidth   = 1800;
int    sceneHeight  = 800;
color  bgColor    = #ECECEC;
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
	a = new Point("A", 2*width/5, 1*height/2, 20);
	a.setFillColor(color(255, 0, 0, 255));
	a.setTextFont(f);
	a.setLabelAlignment(-20*2, 10);

	// Target
	b = new Point("B", 3*width/5, 1*height/2, 20);
	b.setFillColor(color(0, 0, 255));
	b.setTextFont(f);
	b.setLabelAlignment(+20*2, 10);


	// Mover
	m = new Mover(a.pos, b.pos);
	m.setMotion(Motion.BI_SPIRAL, 50, 3);

}

void draw(){

	background(bgColor);
	a.display();
	b.display();
	m.display(false, false);
	m.move();
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
