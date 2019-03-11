

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

	static final int BI_SPIRAL = 9;

	static final int LINEAR_NOISE = 10;
	static final int TRIGONOMETRIC = 11;
	static final int NEFROID = 12;
	static final int BEZIER = 13;
	static final int ROSE = 14;
	static final int SUN = 15;
	static final int RADIAL_NOISE = 16;
	static final int ASTROID = 17;
	static final int CARDOID = 18;
	static final int SINUS_SPIRAL = 19;
	static final int COCHLEOID = 20;
	static final int FOLIUM = 21;
	static final int LEMNISCATE = 22;
	static final int FLOWER = 23;
	static final int FERMAT_SPIRAL = 24;
	static final int HYPOCYCLOID = 25;
	static final int LISSAJOUS = 26;
	static final int TRICUSPOID = 27;
	static final int PIRIFORM = 28;
	static final int EPITROCHOID = 29;
	static final int BICORN = 30;
	static final int BOOMERAN = 31;
	static final int HASH = 32;
	static final int PEANUT = 33;
	static final int SEA_WAVE = 34;
	static final int PEAK = 35;
	static final int ROUNDED_PEAK = 36;
	static final int SUPERFORMULA = 37;
	static final int HEXASTRIP = 38;
	static final int KOCH_CURVE = 39;
	static final int SIERPINSKI_CURVE = 40;
	static final int HILBERT_CURVE = 41;
	static final int DRAGON_CURVE = 42;
	static final int SNOW_CURVE = 43;
	static final int LEVY_CURVE = 44;
	static final int QUADRATIC_GOSPER = 45;
	static final int BUBBLE_ARC = 46;
	static final int ZIG_ZAG = 47;
	static final int SNAKE = 48;
	
	PVector origin;
	PVector target;

	boolean isEnded;
	boolean isPaused;

	int nSteps;
	int nLaps = 1;
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

	void setSpeed(int s){
		this.speed = s;
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

	PVector getCenter(){
		float xc = (origin.x + target.x)/2.0;
		float yc = (origin.y + target.y)/2.0;
		float zc = (origin.z + target.z)/2.0;
		return new PVector(xc, yc, zc); 
	}

	PVector midPoint(PVector a, PVector b){
		float x = (a.x + b.x)/2.0;
		float y = (a.y + b.y)/2.0;
		return new PVector(x, y);
	}

	PVector lerpPoint(PVector a, PVector b, float  amt){
		float x = lerp(a.x, b.x, amt);
		float y = lerp(a.y, b.y, amt);
		return new PVector(x, y);
	}

	float getDistance(){
		return dist(origin.x, origin.y, target.x, target.y);
	}

	void setSpeed(float f){
		this.speed = (int)f;
	}

	void pause(){
		this.isPaused = true;
	}

	void start(){
		this.isPaused = false;
	}

	void display(){
	}


	PVector getLast(){
		return points.get(points.size()-1);
	}


	ArrayList<PVector> getInterpolated(PVector p0, PVector p1, int n){
		ArrayList<PVector> points = new ArrayList<PVector>();
		for(float s=0; s<=n; s++){
			float ti = s/n;
			float xi = lerp(p0.x, p1.x, ti);
			float yi = lerp(p0.y, p1.y, ti);
			PVector pi = new PVector(xi, yi);
			points.add(pi);
		}
		return points;
	}

	ArrayList<PVector> getCircleInterpolated(PVector c, float r, float a0, float a1, int n){
		ArrayList<PVector> points = new ArrayList<PVector>();
		for(float s=0; s<=n; s++){
			float t = s/n;
			float a = lerp(a0, a1, t);
			float x = c.x + r*cos(a);
			float y = c.y + r*sin(a);
			PVector p = new PVector(x, y);
			points.add(p);
		}
		return points;
	}


	// VISUALIZATION HELPERS

	// Display a dashed line between p0 & p1 points 
	void dashLine(PVector p0, PVector p1, int ns){
		for(float i =0.0; i<=ns; i+=2){
			float t1 = i / (float)ns;
			PVector a = lerpPoint(p0, p1, t1);
			float t2 = (i+1)/(float)ns;
			PVector b = lerpPoint(p0, p1, t2);
			stroke(0, 50);
			line(a.x, a.y, b.x, b.y);
		}
	}

	// Display a dashed circle with center c and radius r 
	void dashCircle(PVector c, float r, int ns){
		for(float i =0.0; i<=ns; i+=2){
			float t1 = i / (float)ns;
			float a1 = lerp(0, TWO_PI, t1);
			float t2 = (i+1)/(float)ns;
			float a2 = lerp(0, TWO_PI, t2);
			stroke(0, 50); noFill();
			arc(c.x, c.y, 2*r, 2*r, a1, a2);
		}
	}

}