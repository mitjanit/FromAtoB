

public class HexaMotion extends Motion {
	

	public HexaMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		points = new ArrayList<PVector>();

		float rHexa = getDistance()/(2.0*nLaps);
		int dir = -1;

		for(float i =0.0; i<nLaps; i++){
			
			float t1 = i / (float)nLaps;
			PVector a = lerpPoint(origin, target, t1);
			float t2 = (i+1.0)/(float)nLaps;
			PVector b = lerpPoint(origin, target, t2);
			PVector c = midPoint(a, b);

			ArrayList<PVector> hPoints = new ArrayList<PVector>();
			if(dir==1){
				hPoints = getHexagonPoints(c, rHexa, PI, dir);
			}
			else {
				hPoints = getHexagonPoints(c, rHexa, PI, dir);
			}

			for(int k=0; k<hPoints.size()-1; k++){
				PVector h0 = hPoints.get(k);
				PVector h1 = hPoints.get(k+1);
				ArrayList<PVector> kPoints = getInterpolated(h0, h1, nSteps);
				points.addAll(kPoints);
			}
			//For alternating
			dir*=-1;
		}
	}

	ArrayList<PVector> getHexagonPoints(PVector c, float r, float a0, int dir){
		ArrayList<PVector> hexaPoints = new ArrayList<PVector>();

		float stepA = dir*PI/3.0; 
		for(float i=0; i<=3; i++){
			float a = a0 + stepA*i;
			float x = c.x + r*cos(a);
			float y = c.y + r*sin(a);
			hexaPoints.add(new PVector(x, y));
		}
		return hexaPoints;
	}

	void displayHexagon(PVector c, float r){
		ArrayList<PVector> hexaPoints = new ArrayList<PVector>();
		for(float a=0.0; a<TWO_PI; a+=PI/3.0){
			float x = c.x + r*cos(a);
			float y = c.y + r*sin(a);
			hexaPoints.add(new PVector(x, y));
		}

		for(int i=0; i<hexaPoints.size(); i++){
			PVector p0 = hexaPoints.get(i);
			PVector p1 = hexaPoints.get((i+1)%hexaPoints.size());
			dashLine(p0, p1, 11);
		}
	}


	void display(){

		float dHexa = dist(origin.x, origin.y, target.x, target.y)/((float)nLaps);
		float rHexa = dHexa / 2.0;
		for(float i =0.0; i<nLaps; i++){
			float t1 = i / (float)nLaps;
			PVector a = lerpPoint(origin, target, t1);
			float t2 = (i+1)/(float)nLaps;
			PVector b = lerpPoint(origin, target, t2);
			PVector c = midPoint(a, b);
			displayHexagon(c, rHexa);
		}
	}

}