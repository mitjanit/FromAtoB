
// Figure Eight - Lemniscate
// r2 = a2 cos(2θ)sec4 
// x = sqrt(a*a*cos(2*θ)*sec4(θ)) * cos(θ)
// y = sqrt(a*a*cos(2*θ)*sec4(θ)) * * sin(θ)


class LemniscateMotion extends Motion {
	
	int direction = -1;

	LemniscateMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = PI*direction;
		float maxAngle = 0*direction;
		float a = getDistance()/2;
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, minAngle, maxAngle); 
			
			float sec = 1.0 / cos(angle);
			float sec4 = min(sec*sec*sec*sec, 1);
			float f = min(sqrt(abs(a*a*cos(2*angle)*sec4)), 2*a);
			
			if(n>nSteps/4 && n<=3*nSteps/4){
				f=0;
				n+=nSteps/4 - 1;
			}
			else if(n>3*nSteps/4){
				angle = -angle;
			}
			float x = center.x + f*cos(angle);
			float y = center.y + f*sin(angle);

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}