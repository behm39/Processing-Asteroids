class Ship{
    
    static final float TURNING_SPEED = 0.1;
    static final int COOLDOWN = 30; // in ticks
    
    PVector pos, vel, acc;
    float heading;
    int size;
    int lastShotTime;
    
    Ship(int x, int y, int size){
        this.pos = new PVector(x, y);
        this.vel = new PVector();
        this.acc = new PVector();
        this.heading = 0;
        this.size = size;
        this.lastShotTime = 0;
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
        edges();
    }
    
    void edges(){
        float x = this.pos.x;
        float y = this.pos.y;
        if (x < -this.size){
            this.pos.x = width + this.size;
        }else if (x > width + this.size){
            this.pos.x = -this.size;
        }
        
        if (y < -this.size){
            this.pos.y = height + this.size;
        }else if (y > height + this.size){
            this.pos.y = -this.size;
        }
    }
    
    void show(){
        fill(0);
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