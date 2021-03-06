
class PosSinusMotion extends Motion {
	
	int direction = 1;
	float amplitude = 150;

	PosSinusMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	PosSinusMotion(PVector o, PVector t, int ns, int nl, int h){
		super(o, t, ns, nl);
		this.amplitude = h;
		calculatePath();
	}

	void calculatePath(){

		float maxAngle = TWO_PI*nLaps;

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, 0.0, maxAngle); //TWO_PI/4*ncs;
			float x=map(n, 0, nSteps, origin.x, target.x);
			float baseY = map(n, 0, nSteps, origin.y, target.y);
			float h = sin(angle)<0?0:sin(angle);
			if(sin(angle)<0) println("NEGATIU");
			float y = baseY - direction*amplitude*h;

			PVector p = new PVector(x, y);
			points.add(p);
			println("P: "+p.x +", "+p.y);
		}
	}


	void display(){
	}

}