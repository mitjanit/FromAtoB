

class TrigonoMotion extends Motion {
	
	int direction = 1;
	float amplitude = 150;
	int version = 4;

	TrigonoMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void setVersion(int v){
		this.version = v;
	}

	void calculatePath(){

		float maxAngle = TWO_PI*nLaps;

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, 0.0, maxAngle); //TWO_PI/4*ncs;
			float x=map(n, 0, nSteps, origin.x, target.x);
			float baseY = map(n, 0, nSteps, origin.y, target.y);
			float y = baseY - direction*amplitude*trigonometric(angle, version);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}

	float trigonometric(float angle, int v){
		switch(v){
			case 0 : return sin(angle)/(2 + cos(angle/2));
			case 1 : return sin(angle)/(2 + cos(PI+angle/2));
			case 2 : return sin(PI + angle/2)/(2 - sin(TWO_PI+angle/4));
			case 3 : return sin(angle*3)/(2 - cos(PI+angle*4));
			case 4 : return sin(angle*3)*cos(PI+angle*4);
			default : return 0;
		}
	}


	void display(){
	}

}