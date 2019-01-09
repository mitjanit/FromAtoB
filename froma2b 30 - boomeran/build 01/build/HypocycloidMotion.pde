
// Hypocycloid

// x(t) = (a−b)cost + bcos((a/b−1)t) 
// y(t) = (a−b)sint−bsin((a/b−1)t)


class HypocycloidMotion extends Motion {
	
	int direction = 1;

	HypocycloidMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minT = TWO_PI*direction;
		float maxT = 0*direction;
		float b = getDistance()/2.0;
		float a = b/2.0;
		PVector center = getCenter();


		for(int n=0; n<=nSteps; n++){
			float t= map(n, 0, nSteps, minT, maxT); 

			// WAY 1:
			//float fx = (a-b)*cos(t) + b*cos((a/(b-1.0))*t);
			//float fy = (a-b)*sin(t) - b*sin((a/(b-1.0))*t);

			// WAY 2:
			float fx = (a-b)*cos(t) + b*cos(((a/b)-1.0)*t);
			float fy = (a-b)*sin(t) - b*sin(((a/b)-1.0)*t);

			float x = center.x + (b-a) + fx*cos(t);
			float y = center.y + fy*sin(t);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}