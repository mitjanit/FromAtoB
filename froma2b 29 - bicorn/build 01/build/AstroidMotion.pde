
// Astroid
// x(t) = a cos3t
// y(t) = a sin3t

class AstroidMotion extends Motion {
	
	int direction = 1;

	AstroidMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = PI*direction;
		float maxAngle = TWO_PI*direction;
		float a = getDistance()/2.0;
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, minAngle, maxAngle); 
			float c = cos(angle);
			float s = sin(angle);
			float x = center.x + a*c*c*c;
			float y = center.y + a*s*s*s;

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}