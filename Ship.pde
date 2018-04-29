class Ship{
    
    static final float TURNING_SPEED = 0.1;
    
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
    
    // positive is cw, negative is ccw
    void turn(int direction){
        if (direction > 0){
            this.heading += TURNING_SPEED;
        }else if (direction < 0){
            this.heading += -TURNING_SPEED;
        }
    }
    
    void thrust(){
        PVector force = new PVector(cos(this.heading), sin(this.heading));
        force.mult(0.1);
        this.applyForce(force);
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