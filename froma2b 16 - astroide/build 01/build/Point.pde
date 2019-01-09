
class Point {

	String label;
	PFont f;
	PVector labelAlignment;
	PVector pos;
	float radius;
	color cFill, cStroke, cText;


	Point(String t, float x, float y, float r){
		this.label = t;
		this.pos = new PVector(x, y);
		this.radius = r;
		this.cFill = color(100);
		this.cStroke = color(0);
		this.cText = color(0);
	}


	void setFillColor(color c){
		this.cFill = c;
	}

	void setStrokeColor(color c){
		this.cStroke = c;
	}

	void setTextColor(color c){
		this.cText = c;
	}

	void setTextFont(PFont f){
		this.f = f;
	}

	void setLabelAlignment(float x, float y){
		this.labelAlignment = new PVector(x, y);
	}

	void display(){
		pushMatrix();
			translate(this.pos.x, this.pos.y, this.pos.z);
			stroke(this.cStroke);
			fill(this.cFill);
			ellipse(0, 0, this.radius*2, this.radius*2);
			textAlign(CENTER);
			fill(this.cText);
			strokeWeight(3);
			textFont(this.f);
			textSize(32);
			text(this.label, labelAlignment.x, labelAlignment.y);
		popMatrix();
	}


}