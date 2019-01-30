
// Hash symbol #
// The parametric curve represented by: 
// x = 2 Sin[t + 3/2 π] + 4/3*Cos[3 t] 
// y = 2 Cos[t + 3/2 π] + 4/3*Sin[3 t]
// Range =  {t, -2 π, 2 π}, 



class HashMotion extends Motion {
	
	int direction = 1;

	HashMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = 0;
		float maxAngle = PI;

		float a = getDistance()/2;
		float b = getDistance()/1.5;  // Altura [1, 5]
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			
			float t= map(n, 0, nSteps, minAngle, maxAngle); 

			
			float fx = 2*sin(t+3*PI/2) + 4/3*cos(3*t);
			float fy = 2*cos(t+3*PI/2) + 4/3*sin(3*t);

			float x = center.x + a*fx; // SI a=b, igual d'alt que d'ample 
			float y = center.y - b*fy;

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}