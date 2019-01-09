
// Epitrochoid
// x = (a + b) cos(t) - c cos((a/b + 1)t)
// y = (a + b) sin(t) - c sin((a/b + 1)t)


class EpitrochoidMotion extends Motion {
	
	int direction = -1;

	EpitrochoidMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = 0*direction;
		float maxAngle = (PI)*direction;
		float d = getDistance();
		float a = d/2;
		float b = d/8;
		float c = d/6;
		PVector center = getCenter();

		for(int n=0; n<nSteps; n++){
			
			float t= map(n, 0, nSteps, minAngle, maxAngle); 
			
			float fx =  (a + b)*cos(t) - c*cos(((a/b)+1)*t);
			float fy =  (a + b)*sin(t) - c*sin(((a/b)+1)*t);

			float x = center.x - fx - map(n, 0, nSteps,10, -5);
			float y = center.y + fy;

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}