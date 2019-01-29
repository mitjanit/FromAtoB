
class LinearMotion extends Motion {
	

	LinearMotion(PVector o, PVector t, float n){
		super(o, t);
		this.nSteps = (int)n;
		calculatePath();
	}

	void calculatePath(){
		
		points = new ArrayList<PVector>();

		float step = 1.0/(float)nSteps;
		for(float t=0.0; t<=1.0; t+=step){
			float x = origin.x + t*(target.x - origin.x);
			float y = origin.y + t*(target.y - origin.y);
			float z = origin.z + t*(target.z - origin.z);

			PVector p = new PVector(x, y, z);
			points.add(p);
		}
	}

}