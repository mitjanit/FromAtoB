
// Lissajous Curves
// x(t) = asin(nt + c)
// y(t) = bsint

// n: ratio, c : phase


class LissajousMotion extends Motion {
	
	int direction = 1;
	float ratio = 4;
	float phase = 5*PI;

	LissajousMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath1();
	}

	void calculatePath1(){

		ratio = 4;
		phase = 5*PI;
		float minAngle = (PI + PI/8)*direction;
		float maxAngle = (TWO_PI - PI/8)*direction;
		float b = getDistance()/1.0;
		float a = getDistance()/2;
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){

			float angle= map(n, 0, nSteps, minAngle, maxAngle); 
			
			float x = center.x + a*sin(ratio*angle + phase);
			float y = center.y + b/2.65 + b*sin(angle);


			PVector p = new PVector(x, y);
			points.add(p);
		}
	}

	void calculatePath2(){

		ratio = 8;
		phase = 10*PI;

		float minAngle = (PI + PI/5.5)*direction;
		float maxAngle = (TWO_PI - PI/5.5)*direction;
		float b = getDistance()/0.75;
		float a = getDistance()/2;
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){

			float angle= map(n, 0, nSteps, minAngle, maxAngle); 
			
			float x = center.x + a*sin(ratio*angle + phase);
			float y = center.y + b/1.85 + b*sin(angle);


			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}