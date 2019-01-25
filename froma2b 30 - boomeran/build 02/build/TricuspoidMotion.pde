
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

		float k = 4.0;  // 4, 8, 12, 16, 20, 24, 28, 32, 36, ...
		float q = k/2.0;
		float a = getDistance()/k;
		PVector center = getCenter();


		for(int n=0; n<=nSteps; n++){

			float t= map(n, 0, nSteps, minT, maxT); 

			float fx = a*(q*cos(t) + cos(q*t));
			float fy = a*(q*sin(t) - sin(q*t));

			float x = center.x - a + fx;

			float amplitude = 1; //ap(abs(nSteps/3 - n), 0, nSteps/3, 1.5, 0.75); // Quan k=4
			// si amplitude == 1, la corba original
			//amplitude = map(abs((maxT+minT)/2.0 - t), (maxT+minT)/2.0, 0, 1, 1.5);
			float y = center.y + fy*amplitude;

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}