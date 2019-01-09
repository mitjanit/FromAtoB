
// Fermat Spiral
// r2 = a2θ
// x = sqrt(a*a*θ)*cos(θ)
// y = sqrt(a*a*θ)*sin(θ)


class FermatSpiralMotion extends Motion {
	
	int direction = 1;

	FermatSpiralMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = 0*direction;
		float maxAngle = TWO_PI*direction;
		float a = getDistance()/2.5;
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, minAngle, maxAngle); 
			
			float f = sqrt((a*a*angle));
			println(f);
			float x = origin.x + f*cos(angle);
			float y = origin.y + f*sin(angle);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}