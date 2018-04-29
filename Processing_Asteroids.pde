Ship player;
Asteroid asteroid;

void setup(){
    size(400, 400);
    player = new Ship(width / 2, height / 2, 20);
    asteroid = new Asteroid(width / 4, height / 4, 50);
}

void draw(){
    background(0);
    
    if (upIsDown){
        player.thrust();
    }
    if (leftIsDown){
        player.turn(-1);
    }
    if (rightIsDown){
        player.turn(1);
    }
    
    player.update();
    asteroid.update();
    
    player.show();
    asteroid.show();
}