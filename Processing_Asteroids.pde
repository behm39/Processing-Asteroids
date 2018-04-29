Ship player;

void setup(){
    size(400, 400);
    player = new Ship(width / 2, height / 2, 20);
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
    player.show();
}