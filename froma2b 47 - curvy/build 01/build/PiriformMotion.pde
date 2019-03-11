
// Piriform
// x	=	a(1+sint)	
// y	=	bcost(1+sint)


class PiriformMotion extends Motion {
	
	int direction = 1;

	PiriformMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minT = (PI/2 + PI)*direction;
		float maxT = PI/2*direction;
		float a = getDistance()/2;
		float b = a/0.9;  // 1.5   Altura de la fulla [0, a]
		PVector center = getCenter();


		for(int n=0; n<=nSteps; n++){

			float t= map(n, 0, nSteps, minT, maxT); 

			float fx = a*(1 + sin(t));
			float fy = b*cos(t)*(1+sin(t));

			float x = center.x - a + fx;
			float y = center.y + fy;

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}