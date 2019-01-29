

class RadialNoiseMotion extends Motion {

	PVector center;
	
	RadialNoiseMotion(PVector o, PVector t, int n){
		super(o, t);
		this.nSteps = n;
		calculatePath();
		
	}

	void calculatePath(){


		this.center = getCenter();
		float radius = getDistance()/2.0;

		float minAngle = PI;
		float maxAngle = TWO_PI;
		float halfAngle = 3.0*PI/2.0;

		float amplitude = 200;

		float step = PI/(float)nSteps;
		for(float angle = minAngle; angle<=maxAngle; angle+=step){
			float d0 = angle - minAngle;
			float d1 = maxAngle - angle;
			float minD = min(d0, d1);
			float scaleR = map(minD, 0, halfAngle/3, 0, amplitude);
			float noiseR = (noise(frameCount, angle, d0)-0.5)*scaleR;
			float x = center.x + (radius + noiseR)*cos(angle);
			float y = center.y + (radius + noiseR)*sin(angle);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
		stroke(0, 50);
		line(center.x, center.y-10, center.x, center.y+10);
		line(center.x-10, center.y, center.x+10, center.y);
		 noFill();
		for(float angle=PI; angle<=TWO_PI; angle+=PI/20){
			float angle2 = angle + PI/60;
			arc(center.x, center.y, getDistance(), getDistance(), angle, angle2);
		}
	}

}