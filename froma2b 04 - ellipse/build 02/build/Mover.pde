

class Mover {
	
	Motion motion;
	PVector origin, target, currentPos;

	Mover(PVector o, PVector t){
		this.origin = new PVector(o.x, o.y, o.z);
		this.target = new PVector(t.x, t.y, t.z);
		this.currentPos = new PVector(o.x, o.y, o.z);
	}

	void setMotion(int tipus, float a, float b){
		switch(tipus){

			case Motion.LINEAR:
				motion = new LinearMotion(origin, target, (int)a);
				break;

			case Motion.RADIAL:
				motion = new RadialMotion(origin, target, (int)a);
				break;

			case Motion.ELLIPSE:
				motion = new EllipseMotion(origin, target, (int)a, (int)b);
				break;

			case Motion.SPIRAL:
				motion = new SpiralMotion(origin, target, (int)a, (int)b);
				break;

			case Motion.SINUS:
				motion = new SinusMotion(origin, target, (int)a, (int)b);
				break;

			case Motion.ABS_SINUS:
				motion = new AbsSinusMotion(origin, target, (int)a, (int)b);
				break;

			case Motion.POS_SINUS:
				motion = new PosSinusMotion(origin, target, (int)a, (int)b);
				break;

			case Motion.SQUARE_WAVE: 		
				motion = new SquareWaveMotion(origin, target, (int)a, (int)b);
				break;  
		}
	}

	void setSpeed(int s){
		this.motion.setSpeed(s);
	}


	void move(){
		if(!motion.isEnded){
			currentPos = motion.move();
		}
	}

	void reset(){
		motion.reset();
	}

	void pause (){
		this.motion.pause();
	}

	void start (){
		this.motion.start();
	}


	void display(boolean showDots, boolean showNums){

		ArrayList<PVector> positions = new ArrayList<PVector>();
		int n = 0;
		for(PVector p : motion.points){
			if(n>motion.currentP){
				break;
			}
			positions.add(p.copy());
			n++;
		}

		// Punts
		if(showDots){
			for(int i=0; i<positions.size(); i++){
				PVector p = positions.get(i);
				pushMatrix();
					translate(p.x, p.y, p.z);
					noStroke();
					fill(0);
					ellipse(0,0, 15, 15);
					if(showNums && i>0 && i<getNumSteps()){
						textSize(20);
						text(i, 0, -15*2);
					}
				popMatrix();
			}
		}

		// Punt actual
		pushMatrix();
			translate(currentPos.x, currentPos.y, currentPos.z);
			noStroke();
			fill(0);
			ellipse(0,0, 15, 15);
		popMatrix();

		// Path (lines between points)
		for(int i=0; i<positions.size()-1; i++){
			PVector p0 = positions.get(i);
			PVector p1 = positions.get(i+1);
			stroke(0);
			strokeCap(ROUND);
			strokeWeight(3);
			strokeJoin(ROUND);
			line(p0.x, p0.y, p1.x, p1.y);
		}

		// Mover
		this.motion.display();
	}

	void nextPosition(){
		PVector p;
	}


	int getNumSteps(){
		return motion.nSteps;
	}

}