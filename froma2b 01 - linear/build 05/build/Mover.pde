

class Mover {
	
	Motion motion;
	PVector origin, target, currentPos;

	Mover(PVector o, PVector t){
		this.origin = new PVector(o.x, o.y, o.z);
		this.target = new PVector(t.x, t.y, t.z);
		this.currentPos = new PVector(o.x, o.y, o.z);
	}

	void setOrigin(float x, float y){
		this.origin = new PVector(x, y);
	}

	void setTarget(float x, float y){
		this.target = new PVector(x, y);
	}

	void flip(){
		PVector temp = this.origin.copy();
		this.origin = this.target.copy();
		this.target = temp.copy();
		this.motion.flip();
	}



	void setMotion(int tipus, float ... p){
		switch(tipus){

			case Motion.LINEAR:
				motion = new LinearMotion(origin, target, p[0]);
				break;

			case Motion.RADIAL:
				motion = new RadialMotion(origin, target, (int)p[0]);
				break;

			case Motion.ELLIPSE:
				motion = new EllipseMotion(origin, target, (int)p[0]);
				break;

			case Motion.SPIRAL:
				motion = new SpiralMotion(origin, target, (int)p[0], (int)p[1]);
				break;

			case Motion.SINUS:
				motion = new SinusMotion(origin, target, (int)p[0], (int)p[1]);
				break;

			case Motion.ABS_SINUS:
				motion = new AbsSinusMotion(origin, target, (int)p[0], (int)p[1]);
				break;

			case Motion.POS_SINUS:
				motion = new PosSinusMotion(origin, target, (int)p[0], (int)p[1]);
				break;

			case Motion.SQUARE_WAVE: 		
				motion = new SquareWaveMotion(origin, target, (int)p[0], (int)p[1]);
				break;  

			case Motion.TRIANGLE_WAVE: 		
				motion = new TriangleWaveMotion(origin, target, (int)p[0], (int)p[1]);
				break; 


			case Motion.BI_SPIRAL: 		
				motion = new BiSpiralMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.LINEAR_NOISE: 		
				motion = new LinearNoiseMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.TRIGONOMETRIC: 		
				motion = new TrigonoMotion(origin, target, (int)p[0], (int)p[1], 2);
				break; 

			case Motion.NEFROID: 		
				motion = new NefroidMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.BEZIER: 		
				motion = new BezierMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.ROSE: 		
				motion = new RoseMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.SUN: 		
				motion = new SunMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.RADIAL_NOISE: 		
				motion = new RadialNoiseMotion(origin, target, (int)p[0]);
				break; 

			case Motion.ASTROID: 		
				motion = new AstroidMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.CARDOID: 		
				motion = new CardoidMotion(origin, target, (int)p[0], (int)p[1]);
				break;

			case Motion.SINUS_SPIRAL: 		
				motion = new SinusSpiralMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.COCHLEOID: 		
				motion = new CochleoidMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.FOLIUM: 		
				motion = new FoliumMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.LEMNISCATE: 		
				motion = new LemniscateMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.FLOWER: 		
				motion = new FlowerMotion(origin, target, (int)p[0], (int)p[1]);
				break;

			case Motion.FERMAT_SPIRAL: 		
				motion = new FermatSpiralMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.HYPOCYCLOID: 		
				motion = new HypocycloidMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.LISSAJOUS: 		
				motion = new LissajousMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.TRICUSPOID: 		
				motion = new TricuspoidMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.PIRIFORM: 		
				motion = new PiriformMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.EPITROCHOID: 		
				motion = new EpitrochoidMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.BICORN: 		
				motion = new BicornMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.BOOMERAN: 		
				motion = new BoomeranMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.HASH: 		
				motion = new HashMotion(origin, target, (int)p[0], (int)p[1]);
				break;

			case Motion.PEANUT: 		
				motion = new PeanutMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.SEA_WAVE: 		
				motion = new SeaWaveMotion(origin, target, (int)p[0], (int)p[1]);
				break; 

			case Motion.PEAK: 		
				motion = new PeakMotion(origin, target, (int)p[0], (int)p[1]);
				break;

			case Motion.ROUNDED_PEAK: 		
				motion = new RoundedPeakMotion(origin, target, (int)p[0], (int)p[1]);
				break;

			case Motion.SUPERFORMULA: 		
				motion = new SuperformulaMotion(origin, target, (int)p[0], (int)p[1]);
				break;
		}
	}

	void setSpeed(int s){
		this.motion.setSpeed(s);
	}

	boolean isEnded(){
		return motion.isEnded;
	}


	void move(){
		if(!motion.isEnded){
			currentPos = motion.move();
		}
	}

	void reset(){
		motion.reset();
		motion.flip();
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
			//ellipse(0,0, 3, 3);
		popMatrix();

		// Path (lines between points)
		for(int i=0; i<positions.size()-1; i++){
			PVector p0 = positions.get(i);
			PVector p1 = positions.get(i+1);
			stroke(20);
			strokeCap(ROUND);
			strokeWeight(2);
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