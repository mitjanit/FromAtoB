
// Cochleoid
// r = a* (sin(θ) / θ)
// x = a* (sin(θ) / θ)*cos(θ)
// y = a* (sin(θ) / θ)*sin(θ)


class CochleoidMotion extends Motion {
	
	int direction = -1;

	CochleoidMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = TWO_PI*nLaps*direction;
		float maxAngle = -PI/256*direction;
		float a = getDistance();
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, minAngle, maxAngle); 
			
			float f = sin(angle)/(angle);
			println(f);
			float x = origin.x + a*f*cos(angle);
			float y = origin.y + a*f*sin(angle);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}