Ship player;
Asteroid asteroid;
ArrayList<Laser> lasers;

void setup() {
    size(640, 480);
    player = new Ship(width / 2, height / 2, 10);
    asteroid = new Asteroid(width / 4, height / 4, 50);
    lasers = new ArrayList<Laser>();
}

void draw() {
    background(0);

    if (upIsDown) {
        player.thrust();
    }
    if (leftIsDown) {
        player.turn(-1);
    }
    if (rightIsDown) {
        player.turn(1);
    }
    if (spaceIsDown) {
        if (frameCount - player.lastShotTime > Ship.COOLDOWN) {
            Laser laser = new Laser(player.pos.x, player.pos.y, player.heading);
            lasers.add(laser);
            player.lastShotTime = frameCount;
        }
    }

    player.update();
    asteroid.update();
    for (Laser laser : lasers) {
        laser.update();
    }

    for (int i = lasers.size() - 1; i >= 0; i--) {
        if (frameCount - lasers.get(i).bornTime > Laser.LIFESPAN) {
            lasers.remove(i);
        } else {
            lasers.get(i).show();
        }
    }
    asteroid.show();
    player.show();
}