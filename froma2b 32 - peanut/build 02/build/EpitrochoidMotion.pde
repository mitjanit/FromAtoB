
// Epitrochoid
// x = (a + b) cos(t) - c cos((a/b + 1)t)
// y = (a + b) sin(t) - c sin((a/b + 1)t)


class EpitrochoidMotion extends Motion {
	
	int direction = -1;

	EpitrochoidMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	void calculatePath(){

		float minAngle = 0*direction;
		float maxAngle = (PI)*direction;
		float d = getDistance();
		println(d/20);
		float a = d/2;  // 2 fixe
		float b = d/12;  // 4, 8, 12, 16, 20  Relacionat amb el Numero de voltes
		float c = d/8;  // 6   si c > b llavors hi ha llaç (i més gros)
		PVector center = getCenter();

		for(int n=0; n<=nSteps; n++){
			
			float t= map(n, 0, nSteps, minAngle, maxAngle); 
			
			float fx =  (a + b)*cos(t) - c*cos(((a/b)+1)*t);
			float fy =  (a + b)*sin(t) - c*sin(((a/b)+1)*t);

			float x = center.x - fx + map(n, 0, nSteps, -d/25, d/25); 
			// 27 si 2, 8, 6 . 
			// 12 si 2, 12, 6 .
			// 10 si 2, 16, 6 
			// 9  si 2, 20, 6
			// 7  si 2, 40, 6
			// 25 si 2, 40, 16
			float y = center.y + fy;

			PVector p = new PVector(x, y);
			points.add(p);
		}
	}


	void display(){
	}

}