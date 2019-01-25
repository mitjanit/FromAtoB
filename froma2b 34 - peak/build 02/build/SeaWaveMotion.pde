

public class SeaWaveMotion extends Motion {
	
	int direction = 1;
	int[] directions = {1,0};
	//int[] directions = {1,0,0,1};

	public SeaWaveMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	float getAmount(float currenStep, float currentLap){
		return (currenStep + currentLap*directions.length)/ (float)(nLaps*directions.length);
	}

	void calculatePath(){


		float d = getDistance();
		float distPortion = d/(directions.length*nLaps);

		points = new ArrayList<PVector>();

		float a=0,x=0, y=0;
		PVector p = origin.copy();
		points.add(p);

		float amplitude = 2;  // >=1

		for(int n=0; n<nLaps; n++){
			int dir = 0;
			for(int nq = 0; nq<directions.length; nq++){
				PVector p0 = points.get(points.size()-1);
				if(directions[dir]==0){
					for(int s=0; s<=nSteps; s++){
						a = map(s, 0, nSteps, PI, PI/2);
						x = (p0.x + distPortion) + distPortion*cos(a); 
						y = p0.y + direction*amplitude*distPortion*sin(a); 
						p = new PVector(x, y);
						points.add(p);
					}
				}
				else if(directions[dir]==1){
					for(int s=0; s<=nSteps; s++){
						a = map(s, 0, nSteps, PI/2, 0);
						x = p0.x + distPortion*cos(a); 
						y = (p0.y - distPortion*direction*amplitude) + amplitude*direction*distPortion*sin(a); 
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
		float d = getDistance();
		int numDirs = directions.length;
		float distPortion = d/(directions.length*nLaps);

		for(float l=0; l<nLaps; l++){
			for(float np=0; np<numDirs; np++){
				float t =  getAmount(np, l);
				PVector p = PVector.lerp(origin, target, t);
				p.y -= ((np%2==1)?distPortion:0)*direction;
				stroke(0);
				line(p.x, p.y-5, p.x, p.y+5);
			}
		}
	}

}