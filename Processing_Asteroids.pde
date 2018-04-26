Ship player;

void setup(){
    size(400, 400);
    player = new Ship(width / 2, height / 2, 20);
}

void draw(){
    background(0);
    
    player.update();
    player.show();
}