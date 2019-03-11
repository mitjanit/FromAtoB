
class BubbleArcMotion extends Motion {
	
	int direction = -1;
	float amplitude = 150;

	PVector c;
	float r, dp;
	ArrayList<PVector> centers;
	ArrayList<CircleIntersections> intersections;


	BubbleArcMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = 225;
		float maxAngle = 315;
		float aStep = (maxAngle - minAngle) / (float)nLaps;

		c = midPoint(origin, target);
		float d = getDistance()/2;
		c.y+=d;
		r = dist(origin.x, origin.y, c.x, c.y);

		// Centres de cercles
		centers = new ArrayList<PVector>();
		for(int n=0; n<=nLaps; n++){
			float angle= map(n, 0, nLaps, minAngle, maxAngle);
			float x = c.x + r*cos(radians(angle));
			float y = c.y + r*sin(radians(angle));
			centers.add(new PVector(x, y));
		}

		//Interseccions entre cercles
		float x0 = c.x + r*cos(radians(minAngle));
		float y0 = c.y + r*sin(radians(minAngle));
		float x1 = c.x + r*cos(radians(minAngle+aStep));
		float y1 = c.y + r*sin(radians(minAngle+aStep));

		PVector m = midPoint(new PVector(x0, y0), new PVector(x1, y1));
		// Distancia entre 2 centres
		dp = dist(x0, y0, x1, y1);
		float da = dist(x0, y0, m.x, m.y);
		float h = sqrt(dp*dp - da*da);

		intersections = new ArrayList<CircleIntersections>();
		for(int i=1; i<centers.size()-2; i++){
			PVector c0 = centers.get(i);
			PVector c00 = new PVector(c0.x+100 , c0.y);
			PVector c1 = centers.get(i+1);
			
			CircleIntersections ci = getCirclesIntersections(c0, c1, dp, dp);
			ci.display(true, false, false);
			intersections.add(ci);
		}

		// INterpolated points for each circle
		points = new ArrayList<PVector>();
		float ni = intersections.size();
		for(int i=1; i<centers.size()-1; i++){
			PVector cc = centers.get(i);
			PVector cn = centers.get(i+1);
			PVector cp = centers.get(i-1);
			PVector cc2 = new PVector(cc.x+100, cc.y);
			PVector i1 = (i==1)? cp : intersections.get(i-2).i1;
			PVector i2 = (i==centers.size()-2) ? cn :intersections.get(i-1).i1;
			
			float a0 = angleBetween2Lines(cc, cc2, cc, i1);
			float a1 = angleBetween2Lines(cc, cc2, cc, i2);
			if(a1<a0) a1+=360.0;

			ArrayList<PVector> iPoints = new ArrayList<PVector>();
			iPoints = getCircleInterpolated(cc, dp, radians(a0), radians(a1), nSteps);
			points.addAll(iPoints);

		}
	}


	void display(){
		
		//dashCircle(c, r, 150);

		for(int i=0; i<centers.size(); i++){
			dashCircle(centers.get(i), dp, 50);
		}

		for(int k=0; k<intersections.size(); k++){
			CircleIntersections ci = intersections.get(k);
			ci.display(true, false, false);
		}
	}

	float angleBetween2Lines(PVector a1, PVector a2, PVector b1, PVector b2) {
	    float angle1 = atan2(a2.y - a1.y, a1.x - a2.x);
	    float angle2 = atan2(b2.y - b1.y, b1.x - b2.x);
	    float angle = (float) degrees(angle1 - angle2);
	    if (angle < 0) angle += 360;
	    return angle;
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

}