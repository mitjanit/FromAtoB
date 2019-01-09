

class SunMotion extends Motion {
	
	int direction = 1;
	float amplitude = 150;

	SunMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = PI;
		float maxAngle = TWO_PI;
		PVector center = getCenter();
		float r = getDistance()/2;
		float rs = r/20;
		int numRays = 28; // par!

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, minAngle, maxAngle); //TWO_PI/4*ncs;
			float x = center.x + (rs*cos(-PI/2 + numRays*angle) + r)*cos(angle);
			float y = center.y + (rs*cos(-PI/2 + numRays*angle) + r)*sin(angle);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}