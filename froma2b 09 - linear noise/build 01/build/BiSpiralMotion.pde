

class BiSpiralMotion extends Motion {
	
	int direction = 1;
	PVector center;

	BiSpiralMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);

		float xc = (o.x + t.x)/2.0;
		float yc = (o.y + t.y)/2.0;
		this.center = new PVector(xc, yc);

		calculatePath();
	}

	void calculatePath(){
		float maxAngle = TWO_PI*nLaps;
		float minRadius = 0.0;
		float maxRadius = dist(origin.x, origin.y, center.x, center.y);

		//Spiral 1
		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, 0.0, maxAngle);
			float radius=map(n, 0, nSteps, minRadius, maxRadius);
			if(radius>maxRadius){
				radius = maxRadius;
			}
			float x = origin.x + direction*radius*cos(angle);
			float y = origin.y + direction*radius*sin(angle);

			PVector p = new PVector(x, y);
			points.add(p);
		}

		// SPiral 2
		
		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, maxAngle, 0.0);
			float radius=map(n, 0, nSteps, maxRadius, minRadius);
			if(radius<minRadius){
				radius = minRadius;
			}
			float x = target.x - direction*radius*cos(angle);
			float y = target.y - direction*radius*sin(angle);

			PVector p = new PVector(x, y);
			points.add(p);
		}
		
	}


	void display(){
	}

}