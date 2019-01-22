

class EllipseMotion extends Motion {

	PVector center;
	float radiusH, radiusV;

	EllipseMotion(PVector o, PVector t, int n){
		super(o, t);
		this. nSteps = n;

		float xc = (o.x + t.x) / 2.0;
		float yc = (o.y + t.y) / 2.0;
		this.center = new PVector(xc, yc);
		this.radiusH = dist(o.x, o.y, t.x, t.y)/2.0;
		this.radiusV = radiusH / 2.0;

		calculatePath();
		
	}

	EllipseMotion(PVector o, PVector t, int n, int rv){
		super(o, t);
		this. nSteps = n;

		float xc = (o.x + t.x) / 2.0;
		float yc = (o.y + t.y) / 2.0;
		this.center = new PVector(xc, yc);
		this.radiusH = dist(o.x, o.y, t.x, t.y)/2.0;
		this.radiusV = rv;

		calculatePath();
		
	}

	void calculatePath(){

		float step = PI/(float)nSteps;
		for(float angle=PI; angle<=TWO_PI+step; angle+=step){
			
			float x = center.x + radiusH*cos(angle);
			float y = center.y + radiusV*sin(angle);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
		line(center.x, center.y-10, center.x, center.y+10);
		line(center.x-10, center.y, center.x+10, center.y);
	}

}