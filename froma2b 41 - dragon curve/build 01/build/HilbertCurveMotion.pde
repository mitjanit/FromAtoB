

public class HilbertCurveMotion extends Motion {
	
	// L -> +.RF -.LF.L -F.R+
	// R -> -.LF - .RF.R +F.L-
	// Axiom: L
	// ANGLE : 90

	int nGenerations = 4;
	int direction = -1;

	public HilbertCurveMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	String getHilbertCurveRule(int nGens){
		String L = "+RF-LFL-FR+";
		String R = "-LF+RFR+FL-";
		String S = "L";
		String g = S;
		for(int i=0; i<nGens; i++){
			String nG="";
			for(int k=0; k<g.length(); k++){
				char c = g.charAt(k);
				if(c=='L'){
					nG+=L;
				}
				else if(c=='R'){
					nG+=R;
				}
				else {
					nG+=c;
				}
			}
			g = nG;
			println("Generation "+i+":"+g);
		}
		
		return g;
	}

	void calculatePath(){

		float distPortion = getDistance() / (pow(2,nGenerations)-1.0);
		float a = 0;
		float aStep = 90;
		String rule = getHilbertCurveRule(nGenerations);
		points = new ArrayList<PVector>();

		ArrayList<PVector> kPoints = new ArrayList<PVector>();
		float x=0, y=0;
		PVector p = origin.copy();
		kPoints.add(p);
		for(int n=0; n<rule.length(); n++){
			char c = rule.charAt(n);
			PVector previous = kPoints.get(kPoints.size()-1);
			if(c=='F'){
				x = previous.x + distPortion*cos(radians(a));
				float scaleY = map(abs(rule.length()/2-n), 0, rule.length()/2, distPortion, 1*distPortion);
				y = previous.y + direction*scaleY*sin(radians(a));
				kPoints.add(new PVector(x, y));

				PVector p0 = kPoints.get(kPoints.size()-2);
				PVector p1 = kPoints.get(kPoints.size()-1);
				ArrayList<PVector> iPoints = getInterpolated(p0, p1, nSteps);
				points.addAll(iPoints);
			}
			else if (c=='+') {
				a+=aStep;
			}
			else if (c=='-') {
				a-=aStep;
			}
		}
	}

	void display(){
		for(int i=0; i<points.size()-1; i++){
			PVector p0 = points.get(i);
			PVector p1 = points.get(i+1);
			stroke(0, 50);
			dashLine(p0, p1, 5);
		}
	}

}