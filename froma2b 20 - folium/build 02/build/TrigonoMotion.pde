

class TrigonoMotion extends Motion {
	
	int direction = 1;
	float amplitude = 250;
	int version = 6;

	TrigonoMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	TrigonoMotion(PVector o, PVector t, int ns, int nl, int v){
		super(o, t, ns, nl);
		this.version = v;
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
			case 5 : return sin(angle)*cos(21*angle);
			case 6 : return sin(2*sin(2*sin(2*sin(angle))));
			case 7 : return sin(tan(angle)*0.05);
			case 8 : return pow(sin(angle), 3);
			case 9 : return sin(angle)*sin(angle*1.5);
			case 10 : return sin(pow(2, sin(angle)))-0.84;
			//case 11 : return cos(sin(angle*3))*sin(angle*0.2); Xulo pero falta aproximar
			case 11 : return sin(angle*5)/(2*cos(PI+angle*8));
			
			default : return 0;
		}
	}


	void display(){
	}

}