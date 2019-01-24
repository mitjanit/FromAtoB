
// Based on Nefroid ()
// x(t) = a(3 cost − cos(3t))
// y(t) = a(3 sin t − sin(3t))

class NefroidMotion extends Motion {
	
	int direction = 1;

	NefroidMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		
		PVector center = getCenter();

		float minAngle = PI*direction;
		float maxAngle = TWO_PI*direction;
		float a = getDistance()/8;
		print(getDistance());

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, minAngle, maxAngle);
			float x = center.x + a*(5*cos(angle) - cos(5*angle));
			float y = center.y + a*(5*sin(angle) - sin(5*angle));

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}