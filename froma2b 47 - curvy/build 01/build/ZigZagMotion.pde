
class ZigZagMotion extends Motion {
	
	int direction = 1;
	float amplitude = 150;

	PVector c;
	float r, dp;
	ArrayList<PVector> centers;
	ArrayList<CircleIntersections> intersections;


	ZigZagMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		dp = getDistance()/(float)nLaps;

		// Centres de cercles
		centers = new ArrayList<PVector>();
		for(float n=1; n<=nLaps; n+=2){
			float t = n/(float)nLaps;
			float x = lerp(origin.x, target.x, t);
			float y = lerp(origin.y, target.y, t);
			centers.add(new PVector(x, y));
		}

		// INterpolated points for each circle
		points = new ArrayList<PVector>();
		for(int i=0; i<centers.size(); i++){
			PVector cc = centers.get(i);
			PVector cc2 = new PVector(cc.x+100, cc.y);
			PVector cp = (i==0)? origin : centers.get(i-1);
			PVector cn = (i==centers.size()-1)? target : centers.get(i+1);

			float a0 = angleBetween2Lines(cc, cc2, cc, cp);
			float a1 = angleBetween2Lines(cc, cc2, cc, cn);

			if(i%2==0 && direction==1){
				a1+=360;
			}
			else if(i%2==1 && direction==-1){
				a1+=360;
			}

			ArrayList<PVector> iPoints = new ArrayList<PVector>();
			iPoints = getCircleInterpolated(cc, dp, radians(a0), radians(a1), nSteps);
			points.addAll(iPoints);

		}
	}


	void display(){
		
		for(int i=0; i<centers.size(); i++){
			dashCircle(centers.get(i), dp, 50);
		}

	}

	float angleBetween2Lines(PVector a1, PVector a2, PVector b1, PVector b2) {
	    float angle1 = atan2(a2.y - a1.y, a1.x - a2.x);
	    float angle2 = atan2(b2.y - b1.y, b1.x - b2.x);
	    float angle = (float) degrees(angle1 - angle2);
	    if (angle < 0) angle += 360;
	    return angle;
	}

}


CircleIntersections getCirclesIntersections(PVector c1, PVector c2, float r1, float r2){
	float d = dist(c1.x, c1.y, c2.x, c2.y);
	float a = (r1*r1 - r2*r2 + d*d)/(2.0*d); 
	float h = sqrt(r1*r1 - a*a);

	float mx = c1.x + a*(c2.x - c1.x)/d;
	float my = c1.y + a*(c2.y - c1.y)/d;
	PVector m = new PVector(mx, my);

	float i1x = mx + h*(c2.y - c1.y)/d;
	float i1y = my - h*(c2.x - c1.x)/d;
	PVector i1 = new PVector(i1x, i1y);

	float i2x = mx - h*(c2.y - c1.y)/d;
	float i2y = my + h*(c2.x - c1.x)/d;
	PVector i2 = new PVector(i2x, i2y);

	return new CircleIntersections(i1, i2, m);
}


class CircleIntersections {
	
	PVector i1, i2;
	PVector m;

	CircleIntersections(PVector a, PVector b, PVector m){
		this.i1 = a.copy();
		this.i2 = b.copy();
		this.m = m.copy();
	}

	void display(boolean b1, boolean b2, boolean bm){
		ellipseMode(CENTER);
		noStroke(); fill(0, 255, 0, 50);
		if(b1)
			ellipse(i1.x, i1.y, 15, 15);
		if(b2)
			ellipse(i2.x, i2.y, 15, 15);
		fill(255, 0, 0, 50);
		if(bm)
			ellipse(m.x, m.y, 15, 15);
	}
}