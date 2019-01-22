

class DemoMotion{
	
	String info;
	Point a, b;
	Mover m;

	float timeLoop = 100;
	float tl;

	DemoMotion(String info, PVector start, PVector end, int motion, int steps, int x, int speed){
		this.info = info;
		setOrigin(start);
		setTarget(end);
		setMover(motion, steps, x, speed);
	}

	void setOrigin(PVector start){
		this.a = new Point("A", start.x, start.y, 20);
		this.a.setFillColor(color(255, 127, 16, 255));
		this.a.setTextFont(f);
		this.a.setLabelAlignment(-20*2, 10);
	}

	void setTarget(PVector end){
		// Target
		this.b = new Point("B", end.x, end.y, 20);
		this.b.setFillColor(color(2, 255, 172));
		this.b.setTextFont(f);
		this.b.setLabelAlignment(+20*2, 10);
	}

	void setMover(int motion, int steps, int x, int speed){
		this.m = new Mover(this.a.pos, this.b.pos);
		this.m.setMotion(motion, steps, x);
		this.m.setSpeed(speed);
		tl = timeLoop;
	}

	void display(boolean viewDots, boolean viewNums){

		a.display();
		b.display();
		m.display(viewDots, viewNums);
		

		if(m.isEnded() && tl>0){
			tl--;
		}
		else if(m.isEnded() && tl<=0){
			tl = timeLoop;
			m.motion.reset();
		}
		m.move();

		displayCorners(50, 100, 30);
		displayInfo("From A to B", width/2, 50+22);
		displayInfo(this.info, width/2, height - 50);

	}

	void displayInfo(String info, float x, float y){
		textAlign(CENTER);
		textSize(18);
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
}