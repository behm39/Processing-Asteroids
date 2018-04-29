class Asteroid {
    
    PVector pos, vel, acc;
    int size;
    PShape shape;

    Asteroid(float x, float y, int size) {
        this.pos = new PVector(x, y);
        this.vel = new PVector();
        this.acc = new PVector();
        this.size = size;

        // generate shape
        int corners = floor(random(8, 12));
        this.shape = createShape();
        this.shape.beginShape();
        int smoothness = 2; // maybe make global constant
        for (float i = 0; i < corners; i++) {
            float a = i * (TWO_PI / corners);
            float r = this.size + random(-this.size / smoothness, this.size / smoothness);
            float xx = r * cos(a);
            float yy = r * sin(a);
            this.shape.vertex(xx, yy);
        }
        this.shape.noFill();
        this.shape.endShape(CLOSE);
        this.shape.setStroke(255);
    }

    void applyForce(PVector force) {
        this.acc.add(force);
    }

    void update() {
        this.vel.add(this.acc);
        this.pos.add(this.vel);
        this.acc.mult(0);
    }

    void show() {
        pushMatrix();
        translate(this.pos.x, this.pos.y);
        shape(this.shape);
        popMatrix();
    }
}