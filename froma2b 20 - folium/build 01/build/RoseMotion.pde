

class RoseMotion extends Motion {
	
	int direction = 1;
	float amplitude = 150;

	RoseMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = PI;
		float maxAngle = TWO_PI;
		PVector center = getCenter();
		float r = getDistance()/2;
		int nPetals = 6;  // numero par!!!

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, minAngle, maxAngle); //TWO_PI/4*ncs;
			float x = center.x + r*cos(nPetals*angle)*cos(angle);
			float y = center.y + r*cos(nPetals*angle)*sin(angle);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}