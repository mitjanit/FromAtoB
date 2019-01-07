

class SpiralMotion extends Motion {
	
	int direction = 1;

	SpiralMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);

		calculatePath();
	}

	void calculatePath(){
		float maxAngle = TWO_PI*nLaps;
		float minRadius = 0.0;
		float maxRadius = dist(origin.x, origin.y, target.x, target.y);

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, 0.0, maxAngle);
			float radius=map(n, 0, nSteps, minRadius, maxRadius);
			if(radius>maxRadius){
				radius = maxRadius;
			}
			float x = origin.x + radius*cos(angle*direction);
			float y = origin.y + radius*sin(angle*direction);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}