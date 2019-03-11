
class SnakeMotion extends Motion {
	
	int direction = 1;
	float amplitude = 150;

	PVector c;
	float r, dp;
	ArrayList<PVector> centers;
	ArrayList<Float> diameters;
	float minD,maxD;

	SnakeMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		this.minD = 20;
		this.maxD = 150;
		calculatePath();
		
	}

	void calculatePath(){

		dp = getDistance()/(float)nLaps;
		
		diameters = new ArrayList<Float>();
		float sumD = 0.0;
		float sumEffectiveD = 0.0;
		float totalD = getDistance();
		println("TOTAL:"+totalD);
		while(sumD<totalD){
			float newD = random(minD, maxD);
			println("newD: "+newD);
			sumD+=newD;
			println(sumD);
			if(sumD<totalD){
				diameters.add(new Float(newD));
				sumEffectiveD+=newD;
			}
		}
		float pendingD = totalD - sumEffectiveD;
		println("PENDING:"+pendingD);
		Float lastD = diameters.get(diameters.size()-1);
		lastD+=pendingD;
		diameters.set(diameters.size()-1, lastD);

		for(int i=0; i<diameters.size(); i++){
			println(i+": "+diameters.get(i));
		}

		// Centres de cercles
		centers = new ArrayList<PVector>();
		float dSum = 0.0;
		for(int i=0; i<diameters.size(); i++){
			float dPrevious = 0.0;
			for(int j=0; j<i; j++){
				dPrevious += diameters.get(j);
			}
			float dCurrent = dPrevious + diameters.get(i);
			float t0 = dPrevious/totalD;
			float t1 = dCurrent/totalD;
			PVector p0 = lerpPoint(origin, target, t0);
			PVector p1 = lerpPoint(origin, target, t1);
			PVector mid = midPoint(p0, p1);
			centers.add(mid);
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
			float rc = diameters.get(i)/2.0;
			iPoints = getCircleInterpolated(cc, rc, radians(a0), radians(a1), nSteps);
			points.addAll(iPoints);

		}
	}


	void display(){
		
		for(int i=0; i<centers.size(); i++){
			dashCircle(centers.get(i), diameters.get(i)/2.0, 50);
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