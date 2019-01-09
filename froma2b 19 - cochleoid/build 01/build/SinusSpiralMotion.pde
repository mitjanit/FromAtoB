
// Cayley’s Sextic
// Sinus Spiral
// r = 4acos3(θ/3)
// x = 4acos3(θ/3)cos(θ)
// y = 4acos3(θ/3)sin(θ)


class SinusSpiralMotion extends Motion {
	
	int direction = -1;

	SinusSpiralMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = (PI + PI/2)*direction;
		float maxAngle = 0*direction;
		float a = getDistance()/4;
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, minAngle, maxAngle); 
			
			float c = cos(angle/3);
			float x = origin.x + 4*a*c*c*c*cos(angle);
			float y = origin.y + 4*a*c*c*c*sin(angle);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}