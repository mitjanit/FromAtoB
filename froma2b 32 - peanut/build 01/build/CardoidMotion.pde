
// Cardoid
// x(t) = a(2 cost − cos(2t))
// y(t) = a(2 sin t − sin(2t))


class CardoidMotion extends Motion {
	
	int direction = -1;

	CardoidMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = 0*direction;
		float maxAngle = PI*direction;
		float b = getDistance()/4;
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, minAngle, maxAngle); 
			float x = origin.x + b - b*(2*cos(angle)-cos(2*angle));
			float y = origin.y + b*(2*sin(angle)-sin(2*angle));

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}