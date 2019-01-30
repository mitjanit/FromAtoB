

public class LevyCurveMotion extends Motion {
	
	int nGenerations = 5;

	public LevyCurveMotion(PVector o, PVector t, int ns, int nl){
		super(o, t, ns, nl);
		calculatePath();
	}

	String getLevyCurveRule(int nGens){
		String F = "+F--F+";
		String S = "F";
		String g = S;
		for(int i=0; i<nGens; i++){
			String nG="";
			for(int k=0; k<g.length(); k++){
				char c = g.charAt(k);
				if(c=='F'){
					nG+=F;
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

		float distPortion = getDistance() / sqrt((pow(2, nGenerations)));
		float a=0;
		float aStep = -45;
		String rule = getLevyCurveRule(nGenerations);
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
				y = previous.y + distPortion*sin(radians(a));
				kPoints.add(new PVector(x, y));

				PVector p0 = kPoints.get(kPoints.size()-2);
				PVector p1 = kPoints.get(kPoints.size()-1);
				ArrayList<PVector> iPoints = getInterpolated(p0, p1, nSteps);
				points.addAll(iPoints);
			}
			else if (c=='+') {
				a-=aStep;
			}
			else if (c=='-') {
				a+=aStep;
			}
		}
	}

	void display(){
		for(int i=0; i<points.size()-1; i++){
			PVector p0 = points.get(i);
			PVector p1 = points.get(i+1);
			stroke(0, 50);
			line(p0.x, p0.y, p1.x, p1.y);
		}
	}

}