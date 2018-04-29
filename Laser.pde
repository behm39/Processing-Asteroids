class Laser{
    
    static final int LENGTH = 20, WIDTH = 2;
    static final int LIFESPAN = 60; // in ticks
    PVector pos;
    PVector vel;
    float heading;
    int bornTime;
    
    Laser(float x, float y, float heading){
        bornTime = frameCount;
        this.heading = heading;
        this.pos = new PVector(x, y);
        this.vel = new PVector(cos(this.heading), sin(this.heading));
        float SPEED = 10;
        this.vel.mult(SPEED);
    }
    
    void update(){
        this.pos.add(this.vel);
        this.edges();
    }
    
        void edges(){
        float x = this.pos.x;
        float y = this.pos.y;
        int size = LENGTH;
        if (x < -size){
            this.pos.x = width + size;
        }else if (x > width + size){
            this.pos.x = -size;
        }
        
        if (y < -size){
            this.pos.y = height + size;
        }else if (y > height + size){
            this.pos.y = -size;
        }
    }
    
    void show(){
        int WIDTH = 2;
        int LENGTH = 20;
        pushMatrix();
        stroke(0);
        fill(255, 0, 0);
        rectMode(CENTER);
        translate(this.pos.x, this.pos.y);
        rotate(this.heading);
        rect(0, 0, LENGTH, WIDTH);
        popMatrix();
    }
    
}