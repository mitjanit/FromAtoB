

public class RoundedPeakMotion extends Motion {
	
	int direction = 1;

	float minRH=100, maxRH=300;

	public RoundedPeakMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	float getAmount(float currentLap){
		return (currentLap)/(nLaps);
	}

	float getAmount(float currentStep, float currentLap){
		return (currentStep + currentStep*currentLap)/(nSteps*nLaps);
	}

	ArrayList<PVector> getElliptics(PVector c, float rh, float rv, float a0, float a1, int ns, int s0, int s1){
		ArrayList<PVector> ePoints = new ArrayList<PVector>();
		for(float s=s0; s<=s1; s++){
			float a = map(s, 0, ns, a0, a1);
			float x = c.x + rh*cos(a);
			float y = c.y + rv*sin(a);
			float z = 0; //(s==s1)?1:0;
			ePoints.add(new PVector(x, y, z));
		}
		return ePoints;
	}

	void calculatePath(){

		float d = getDistance();
		float distPortion = d/nLaps;
		float rh = distPortion/2;
		//float rv = distPortion;

		PVector fTarget = new PVector(target.x, origin.y);

		points = new ArrayList<PVector>();

		for(float l=0; l<nLaps; l++){
			float t =  getAmount(l);
			PVector c = PVector.lerp(origin, fTarget, t);
			c.x+=rh;
			float rv = map(abs(nLaps/2 - l), nLaps/2, 0, minRH*direction, maxRH*direction);
			int n = (l>0 && l<nLaps-1)?(nSteps-2):nSteps;
			int s0 = (l>0 && l<nLaps-1)?1:0;
			int s1 = (l>0 && l<nLaps-1)?nSteps-1:nSteps;
			//ArrayList<PVector> ePoints = getElliptics(c, rh, rv, PI, TWO_PI, nSteps, s0, s1);
			ArrayList<PVector> ePoints = getElliptics(c, rh, rv, PI, TWO_PI, nSteps, 0, nSteps);
			for(PVector ep : ePoints){
				points.add(ep.copy());
			}
		}	

		/*
		for(int k=0; k<points.size(); k++){
			PVector np = points.get(k);
			float dt = target.x - origin.x;
			float dp = target.x - np.x;
			np.y += map(dp, dt, 0, 0, (float)(target.y - origin.y));
			if(k>0 && np.z==1 && k<points.size()-2){
				np.x = points.get(k-1).x;
				np.y = points.get(k-1).y;
			}
			else if(k==points.size()-1){
				np.x = target.x;
				np.y = target.y;
			}
		}
		*/
	}

	void display(){

		float d = getDistance();
		float distPortion = d/nLaps;

		for(float l=0; l<nLaps; l++){
			float h = map(abs(nLaps/2 - l), nLaps/2, 0, minRH, maxRH);
			for(float n=0; n<2; n++){
				float t =  (n + 2*l)/(2*nLaps);
				PVector p = PVector.lerp(origin, target, t);
				if(n%2==1){
					p.y -=h*direction;
				}
				stroke(0);
				line(p.x, p.y-5, p.x, p.y+5);
			}
		}

		line(origin.x, origin.y, target.x, target.y);
	}

}