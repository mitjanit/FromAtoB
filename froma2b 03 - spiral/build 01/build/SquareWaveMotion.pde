

public class SquareWaveMotion extends Motion {
	
	
	int[] directions= {2,1,0,0,1,2};

	public SquareWaveMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float distPortion = dist(origin.x, origin.y, target.x, target.y)/(2*nLaps);
		float amplitude = distPortion;
		int stepsPortion = (int)(nSteps / (nLaps*6)); 

		points = new ArrayList<PVector>();

		float x=0, y=0;
		PVector p = origin.copy();
		points.add(p);
		for(int n=0; n<nLaps; n++){
			int dir = 0;
			for(int nq = 0; nq<6; nq++){
				PVector p0 = points.get(points.size()-1);
				if(directions[dir]==0){
					for(int s=0; s<=nSteps; s++){
						float h = map(s, 0, nSteps, p0.y, p0.y - amplitude);
						y = h;
						x = p.x;
						p = new PVector(x, y);
						points.add(p);
					}
					dir++;
				}
				else if(directions[dir]==1){
					for(int s=0; s<=nSteps; s++){
						float h = map(s, 0, nSteps, p0.x, p0.x + distPortion);
						y = p.y ;
						x = h;
						p = new PVector(x, y);
						points.add(p);
					}
					dir++;
				}
				else if(directions[dir]==2){
					for(int s=0; s<=nSteps; s++){
						float h = map(s, 0, nSteps, p0.y, p0.y + amplitude);
						y = h;
						x = p.x;
						p = new PVector(x, y);
						points.add(p);
					}
					dir++;
				}

				p = new PVector(x, y);
				points.add(p);
				if(dir>=directions.length){
					dir=0;
				}
			}
		}
	}

	void display(){
	}

}