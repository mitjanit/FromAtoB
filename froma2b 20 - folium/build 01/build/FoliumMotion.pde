
// Double Folium
// r = 4acosθsin2 θ
// x = 4*a* (cos(θ) * sin2 (θ)) * cos(θ)
// y = 4*a* (cos(θ) * sin2 (θ)) * sin(θ)


class FoliumMotion extends Motion {
	
	int direction = 1;

	FoliumMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = PI/2*direction;
		float maxAngle = (PI/2 + PI/3.15)*direction;
		float a = getDistance();
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, minAngle, maxAngle); 
			
			float f = 4*a*cos(angle)*sin(angle)*sin(angle);
			float x = f*cos(angle);
			float y = f*sin(angle);

			float ar = PI/5.52;
			float xr = origin.x + x*cos(ar) - y*sin(ar);
			float yr = origin.y + x*sin(ar) + y*cos(ar);

			PVector p = new PVector(xr, yr);
			points.add(p);
		}
	}


	void display(){
	}

}