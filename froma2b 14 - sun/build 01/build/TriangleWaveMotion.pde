

public class TriangleWaveMotion extends Motion {
	
	
	//int[] directions= {0,1,1,0};
	int[] directions= {1,0,0,1};

	public TriangleWaveMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float distPortion = dist(origin.x, origin.y, target.x, target.y)/(4*nLaps);
		float amplitude = distPortion;
		int stepsPortion = (int)(nSteps / (nLaps*4)); 

		points = new ArrayList<PVector>();

		float x=0, y=0;
		PVector p = origin.copy();
		points.add(p);
		for(int n=0; n<nLaps; n++){
			int dir = 0;
			for(int nq = 0; nq<directions.length; nq++){
				PVector p0 = points.get(points.size()-1);
				if(directions[dir]==0){
					for(int s=0; s<=nSteps; s++){
						x = map(s, 0, nSteps, p0.x, p0.x + amplitude);
						y = map(s, 0, nSteps, p0.y, p0.y - amplitude);
						p = new PVector(x, y);
						points.add(p);
					}
					dir++;
				}
				else if(directions[dir]==1){
					for(int s=0; s<=nSteps; s++){
						x = map(s, 0, nSteps, p0.x, p0.x + amplitude);
						y = map(s, 0, nSteps, p0.y, p0.y + amplitude);
						p = new PVector(x, y);
						points.add(p);
					}
					dir++;
				}

				if(dir>=directions.length){
					dir=0;
				}
			}
		}
	}

	void display(){
	}

}