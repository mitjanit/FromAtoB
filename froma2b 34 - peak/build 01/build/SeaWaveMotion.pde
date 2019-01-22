

public class SeaWaveMotion extends Motion {
	
	int direction = 1;
	int[] directions = {1,0};
	//int[] directions = {1,0,0,1};

	public SeaWaveMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float d = dist(origin.x, origin.y, target.x, target.y);
		float distPortion = d/(directions.length*nLaps);

		points = new ArrayList<PVector>();

		float a=0,x=0, y=0;
		PVector p = origin.copy();
		points.add(p);

		for(int n=0; n<nLaps; n++){
			int dir = 0;
			for(int nq = 0; nq<directions.length; nq++){
				PVector p0 = points.get(points.size()-1);
				if(directions[dir]==0){
					for(int s=0; s<=nSteps; s++){
						a = map(s, 0, nSteps, PI, PI/2);
						x = (p0.x + distPortion) + distPortion*cos(a); 
						y = p0.y + direction*distPortion*sin(a); 
						p = new PVector(x, y);
						points.add(p);
					}
				}
				else if(directions[dir]==1){
					for(int s=0; s<=nSteps; s++){
						a = map(s, 0, nSteps, PI/2, 0);
						x = p0.x + distPortion*cos(a); 
						y = (p0.y - distPortion*direction) + direction*distPortion*sin(a); 
						p = new PVector(x, y);
						points.add(p);
					}
				}
				dir++;
				if(dir>=directions.length){
					dir=0;
				}
			}
		}
	}

	void display(){
	}

}