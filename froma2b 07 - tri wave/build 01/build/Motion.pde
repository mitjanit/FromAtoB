

class Motion {

	static final int LINEAR = 0;
	
	static final int RADIAL = 1;
	static final int ELLIPSE = 2;
	static final int SPIRAL = 3;

	static final int SINUS = 4;
	static final int ABS_SINUS = 5;
	static final int POS_SINUS = 6;

	static final int SQUARE_WAVE = 7;
	static final int TRIANGLE_WAVE = 8;
	
	PVector origin;
	PVector target;

	boolean isEnded;
	boolean isPaused;

	int nSteps;
	int nLaps;
	int currentP = 0;

	ArrayList<PVector> points;

	int speed = 1;

	Motion(PVector o, PVector t){
		this.origin = o.copy();
		this.target = t.copy();
		this.isPaused = true;
		this.isEnded = false;
		this.currentP = 0;
		this.points = new ArrayList<PVector>();
	}

	Motion(PVector o, PVector t, int ns, int nl){
		this.origin = o.copy();
		this.target = t.copy();
		this.isPaused = true;
		this.isEnded = false;
		this.currentP = 0;
		this.points = new ArrayList<PVector>();
		this.nSteps = ns;
		this.nLaps = nl;
	}

	boolean updateNow(){
		return (frameCount%speed == 0);
	}

	PVector move(){

		if(!isPaused && updateNow()){
			currentP++;
		}

		if(currentP < points.size()){
			return points.get(currentP);
		}
		else {
			isEnded = true;
		}
		return target;

	}

	void reset(){
		currentP= 0;
		isEnded = false;
	}

	void pause(){
		this.isPaused = true;
	}

	void start(){
		this.isPaused = false;
	}

	void display(){
	}

}