
// Astroid
// x(t) = a cos3t
// y(t) = a sin3t

class SuperformulaMotion extends Motion {
	
	int direction = 1;
	float m, n1, n2, n3;

	SuperformulaMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		this.m=8;  //parell
		this.n1 = 60; //0.526; //random(0, 1);
		this.n2 = 55; //0.792; //random(0,1);
		this.n3 = 30; //0.677; //random(0,5);
		println("//M:"+m+",N1:"+n1+",N2:"+n2+",N3:"+n3);
		calculatePath();

		// 6, 1.7, 0.5, 2
		// 6, 1.3, 0.25, 2.1
		//M:6.0,N1:1.8703455,N2:0.4255364,N3:0.3758381 (sac)
		//M:6.0,N1:1.2694305,N2:1.7599708,N3:2.3019543 (cercle irregular)
		//M:12.0,N1:0.5268468,N2:0.7925267,N3:0.6778106 (estrella)


	}


	PVector sf2d(float m,float n1,float n2,float n3,float phi){
   		
   		float r;
   		float t1,t2;
   		float a=1.0,b=1.0;
   		PVector p;

   		t1 = cos(m * phi / 4.0) / a;
   		t1 = abs(t1);
   		t1 = pow(t1,n2);

   		t2 = sin(m * phi / 4.0) / b;
   		t2 = abs(t2);
   		t2 = pow(t2,n3);

   		r = pow(t1+t2,1/n1);
   		if (abs(r) == 0) {
	      p = new PVector(0,0);
	   } else {
	      r = 1.0 / r;
	      p = new PVector( r * cos(phi), r * sin(phi));
	      
	   }

	   return p;
	}

	void calculatePath(){

		float minAngle = PI*direction;
		float maxAngle = TWO_PI*direction;

		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			float angle= map(n, 0, nSteps, minAngle, maxAngle); 

			PVector p = sf2d(m, n1, n2, n3, angle);
			p.mult(getDistance()/2.0);
			p.add(center);

			points.add(p);
		}
	}


	void display(){
	}

}