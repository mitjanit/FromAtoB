
class LinearMotion extends Motion {
	

	LinearMotion(PVector o, PVector t, int n){
		super(o, t);
		this.nSteps = n;
		calculatePath();
	}

	void calculatePath(){
		
		points = new ArrayList<PVector>();

		for(float n=0.0; n<=nSteps; n++){
			float t = n / (float)nSteps;
			float x = origin.x + t*(target.x - origin.x);
			float y = origin.y + t*(target.y - origin.y);
			float z = origin.z + t*(target.z - origin.z);

			PVector p = new PVector(x, y, z);
			points.add(p);
		}
	}

}