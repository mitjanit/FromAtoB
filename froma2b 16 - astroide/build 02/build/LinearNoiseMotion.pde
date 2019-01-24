
class LinearNoiseMotion extends Motion {
	
	int direction = -1;
	float amplitude = 150;

	LinearNoiseMotion(PVector o, PVector t, int n){
		super(o, t);
		this.nSteps = n;
		this.amplitude = 150;
		calculatePath();
	}

	LinearNoiseMotion(PVector o, PVector t, int n, int h){
		super(o, t);
		this.nSteps = n;
		this.amplitude = h;
		calculatePath();
	}

	void calculatePath(){

		
		PVector center = getCenter();
		float dTotal = getDistance()/2.0;

		points = new ArrayList<PVector>();

		for(float s=0.0; s<=nSteps; s++){
			float t = s/(float)nSteps;
			float x = origin.x + t*(target.x - origin.x);
			float y = origin.y + t*(target.y - origin.y);
			float z = origin.z + t*(target.z - origin.z);

			float dParcial = dist(x, y, center.x, center.y);
			float scaleY = map(dParcial, 0, dTotal, amplitude, 0);
			float noiseY = (noise(x,t, frameCount)-0.5)*scaleY;

			PVector p = new PVector(x, y + direction*noiseY, z);
			points.add(p);
		}
	}

}