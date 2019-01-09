
class LinearNoiseMotion extends Motion {
	
	int direction = -1;

	LinearNoiseMotion(PVector o, PVector t, int n){
		super(o, t);
		this.nSteps = n;
		calculatePath();
	}

	void calculatePath(){

		
		PVector center = getCenter();
		float dTotal = getDistance()/2.0;

		points = new ArrayList<PVector>();

		float step = 1.0/(float)nSteps;
		for(float t=0.0; t<=1.0; t+=step){
			float x = origin.x + t*(target.x - origin.x);
			float y = origin.y + t*(target.y - origin.y);
			float z = origin.z + t*(target.z - origin.z);

			float dParcial = dist(x, y, center.x, center.y);
			float scaleY = map(dParcial, 0, dTotal, 250.0, 0);
			float noiseY = (noise(x,t, frameCount)-0.5)*scaleY;

			PVector p = new PVector(x, y + direction*noiseY, z);
			points.add(p);
		}
	}

}