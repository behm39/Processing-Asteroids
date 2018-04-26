class Ship{
    
    PVector pos, vel, acc;
    float heading;
    int size;
    
    Ship(int x, int y, int size){
        this.pos = new PVector(x, y);
        this.vel = new PVector();
        this.acc = new PVector();
        this.heading = 0;
        this.size = size;
    }
    
    void applyForce(PVector force){
        this.acc.add(force);
    }
    
    void update(){
        this.vel.add(this.acc);
        this.pos.add(this.vel);
        this.acc.mult(0);
    }
    
    void show(){
        
        noFill();
        stroke(255);
        
        pushMatrix();
        translate(this.pos.x, this.pos.y);
        rotate(this.heading);
        beginShape();
        vertex(this.size, 0);
        vertex(-this.size, -this.size);
        vertex(-this.size, this.size);
        endShape(CLOSE);
        popMatrix();
    }
    
}