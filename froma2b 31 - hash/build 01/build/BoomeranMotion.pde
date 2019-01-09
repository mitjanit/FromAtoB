
// Boomeran
// The parametric curve represented by: 
//x = t* cos(2t);  y = t* sin(t) 
//over the interval (0, 4Pi)



class BoomeranMotion extends Motion {
	
	int direction = 1;

	BoomeranMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = 0;
		float maxAngle = 7*PI;

		float a = getDistance();
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			
			float angle= map(n, 0, nSteps, minAngle, maxAngle); 
			
			float fx = angle*cos(2*angle);
			float fy = angle*sin(angle);

			float x = origin.x + a/22*fx;  // Com més petit més ample X
			float y = origin.y + a/15*fy*direction;  // Com més petit més alt Y

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}