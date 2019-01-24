

class BezierMotion extends Motion {
	
	
	static final int QUADRATIC = 0;
	static final int CUBIC = 1;
	PVector p1, p2;
	int mode = CUBIC;

	BezierMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);

		PVector center = getCenter();
		this.p1 = new PVector(o.x + random(100,300), center.y - random(200,300));
		this.p2 = new PVector(center.x - 100, center.y + 300);

		calculatePath();
	}

	void setControlPoints(PVector p1, PVector p2){
		this.p1 = p1;
		this.p2 = p2;
	}

	void setControlPoint1(PVector p){
		this.p1 = p.copy();
	}

	boolean overP1(float x, float y){
		return dist(this.p1.x, this.p1.y, x, y)<50;
	}

	boolean overP2(float x, float y){
		return dist(this.p2.x, this.p2.y, x, y)<50;
	}

	void setControlPoint2(PVector p){
		this.p2 = p.copy();
	}

	void calculatePath(){
		
		float minT  = 0;
		float maxT  = 1;

		points = new ArrayList<PVector>();

		for(int n=0; n<=nSteps; n++){
			float t = map(n, 0, nSteps, minT, maxT);
			//PVector pt = bezier(CUBIC, t);
			PVector pt = bezier(this.mode, t);
			points.add(pt);
		}
	}


	PVector bezier(int mode, float t){
		
		float x, y;
		float it 	= 1 - t;
		float it2 	= it * it;
		float it3 	= it2 * it;
		float t2 	= t * t;
		float t3 	= t2 * t;

		if(mode==QUADRATIC){
			x = it2*origin.x + 2*it*t*p1.x+ t2*target.x;
			y = it2*origin.y + 2*it*t*p1.y+ t2*target.y;
		}
		else if(mode==CUBIC){
			x = it3*origin.x + 3*it2*t*p1.x+ 3*it*t2*p2.x + t3*target.x;
			y = it3*origin.y + 3*it2*t*p1.y+ 3*it*t2*p2.y + t3*target.y;
		}
		else {
			x = 0;
			y = 0;
		}
		return new PVector(x, y);
	}


	void display(){
		stroke(0);
		line(origin.x, origin.y, p1.x, p1.y);
		
		ellipse(p1.x, p1.y, 10, 10);
		if(this.mode==CUBIC){
			line(p2.x, p2.y, target.x, target.y);
			ellipse(p2.x, p2.y, 10, 10);
		}
	}

}