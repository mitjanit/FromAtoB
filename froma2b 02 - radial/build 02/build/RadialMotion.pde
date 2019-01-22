

class RadialMotion extends Motion {
	
	PVector center;
	float radius;

	RadialMotion(PVector o, PVector t, int n){
		super(o, t);
		this.nSteps = n;
		calculatePath();
		
	}

	void calculatePath(){

		float xc = (origin.x + target.x) / 2.0;
		float yc = (origin.y + target.y) / 2.0;

		this.center = new PVector(xc, yc);
		this.radius = dist(origin.x, origin.y, target.x, target.y)/2.0;

		float step = PI/(float)nSteps;
		for(float angle = PI; angle<TWO_PI+step; angle+=step){
			float x = center.x + radius*cos(angle);
			float y = center.y + radius*sin(angle);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
		line(center.x, center.y-10, center.x, center.y+10);
		line(center.x-10, center.y, center.x+10, center.y);
	}

}