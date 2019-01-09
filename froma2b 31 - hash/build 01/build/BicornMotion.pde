
// Bicorn
// OPTION 1:
// x = a* sin(θ)
// y = a* (cos2(θ) / (2 - cos(θ)))
//OPTION 2:
// x = a* sin(θ)
// y = a* (cos2(θ) / (2 + cos(θ)))



class BicornMotion extends Motion {
	
	int direction = 1;

	BicornMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		// Per damunt
		float minAngle = 3*PI/2;
		float maxAngle = 5*PI/2;

		//Per davall
		//float minAngle = 5*PI/2 + PI;
		//float maxAngle = 5*PI/2;

		float a = getDistance()/2;
		float b = 2; // Valor per defecte:2. Fa la corba més bonyarruda [0.1, 8]
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			
			float angle= map(n, 0, nSteps, minAngle, maxAngle); 
			
			// x = a* sin(θ)
			// y = a* (cos2(θ) / (2 - cos(θ)))
			float fx = a*sin(angle);
			float fy = a*(cos(angle)*cos(angle))/(b - cos(angle));
			float x = center.x + fx;
			float y = center.y - fy*direction;

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}