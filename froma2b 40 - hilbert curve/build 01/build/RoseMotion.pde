

class RoseMotion extends Motion {
	
	int direction = -1;
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

		float minR = r;
		float maxR = 1.65*r;  // Si maxR = minR , el radi sempre és igual
		int nPetals = 8;  // numero par!!!

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, minAngle, maxAngle); //TWO_PI/4*ncs;
			float rm = map(abs(nSteps/2 - n), 0, nSteps/2, maxR, minR);
			float x = center.x + rm*cos(nPetals*angle)*cos(angle);
			float y = center.y + direction*rm*cos(nPetals*angle)*sin(angle);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}