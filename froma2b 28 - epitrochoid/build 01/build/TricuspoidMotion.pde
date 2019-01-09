
// Tripuscoid
// x(t) = a(2cost + cos(2t)) 
// y(t) = a(2sint−sin(2t)


class TricuspoidMotion extends Motion {
	
	int direction = 1;

	TricuspoidMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minT = PI*direction;
		float maxT = TWO_PI*direction;
		float a = getDistance()/4.0;
		PVector center = getCenter();


		for(int n=0; n<=nSteps; n++){

			float t= map(n, 0, nSteps, minT, maxT); 

			float fx = a*(2*cos(t) + cos(2*t));
			float fy = a*(2*sin(t) - sin(2*t));

			float x = center.x - a + fx;
			float y = center.y + fy;

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}