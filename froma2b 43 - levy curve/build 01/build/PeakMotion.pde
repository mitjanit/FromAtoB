

public class PeakMotion extends Motion {
	
	int direction = 1;
	int[] directions = {0,1};
	//int[] directions = {1,0,0,1};

	float minH=100, maxH=400;

	public PeakMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	float getAmount(float currenStep, float currentLap){
		return (currenStep + currentLap*directions.length)/ (float)(nLaps*directions.length);
	}

	void calculatePath(){

		float d = getDistance();
		int numDirs = directions.length;
		float distPortion = d/(directions.length*nLaps);

		points = new ArrayList<PVector>();
		points.add(origin.copy());

		for(float l=0; l<nLaps; l++){
			// Get interpolated height h for this lap l.
			float h = map(abs(nLaps/2 - l), nLaps/2, 0, minH, maxH);
			for(float np=0; np<=numDirs; np++){
				// Get start point p0 for this portion
				PVector p0 = getLast();
				// Get end point p1 for this portion
				float t =  getAmount(np, l);
				PVector p1 = PVector.lerp(origin, target, t);
				p1.y -= ((np%2==1)?h:0)*direction;

				// Add interpolated points between p0 and p1
				ArrayList<PVector> iPoints = getInterpolated(p0, p1, nSteps);
				for(int i=1; i<iPoints.size(); i++){
					if(!points.contains(iPoints.get(i))){
						points.add(iPoints.get(i));
					}
				}
			}
		}
		
	}

	void display(){

		float d = getDistance();
		int numDirs = directions.length;
		float distPortion = d/(directions.length*nLaps);

		for(float l=0; l<nLaps; l++){
			float h = map(abs(nLaps/2 - l), nLaps/2, 0, minH, maxH);
			for(float np=0; np<numDirs; np++){
				float t =  getAmount(np, l);
				PVector p = PVector.lerp(origin, target, t);
				p.y -= ((np%2==1)?h:0)*direction;
				stroke(0);
				line(p.x, p.y-5, p.x, p.y+5);
			}
		}
	}

}