// [UP, LEFT, RIGHT]
boolean upIsDown, leftIsDown, rightIsDown;

void keyPressed(){
    if (keyCode == UP){
        upIsDown = true;
    }else if (keyCode == LEFT){
        leftIsDown = true;
    }else if (keyCode == RIGHT){
        rightIsDown = true;
    }
}

void keyReleased(){
    if (keyCode == UP){
        upIsDown = false;
    }else if (keyCode == LEFT){
        leftIsDown = false;
    }else if (keyCode == RIGHT){
        rightIsDown = false;
    }
}