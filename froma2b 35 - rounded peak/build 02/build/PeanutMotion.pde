
// Peanut
// r = 1 - cos(t)*sin(3*t)
// x(t) = (1 - cos(t)*sin(3*t))*cos(t)
// y(t) = (1 - cos(t)*sin(3*t))*sin(t)


class PeanutMotion extends Motion {
	
	int direction = 1;

	PeanutMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = PI*direction;
		float maxAngle = TWO_PI*direction;

		float a = getDistance()/2;
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			
			float t= map(n, 0, nSteps, minAngle, maxAngle); 

			// x(t) = (1 - cos(t)*sin(3*t))*cos(t)
			// y(t) = (1 - cos(t)*sin(3*t))*sin(t)
			float fxy = (1 - cos(t)*sin(7*t));  //3,4,5,6   ELs parells es simetric

			float x = center.x + a*fxy*cos(t); 
			float y = center.y + a*fxy*sin(t);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}