void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(99);
    noStroke();
    rectMode(CENTER);
    
    for(int y = 0; y < 10; y++){
        println("y = " + y);
        for(int x = 0; x <10; x++){
            //println("x = " + x);
            fill(x*10, 80, 99, (x + y) % 5 * 20) ;

            //println("x + y = " + (x + y) + " / (x + y) % 5 =  " + (x + y) % 5);
            //println("y % 2 = " + y % 2);
            //println("x % 4 = " + x % 4);
            
            if(y % 2 == 0){
                println(x);
                ellipse(width/10 *  x, height/10 * y, width/20 + x % 4 *10, height/20 + x % 4 *10);
            } else {
                rect(width/10 * x, height/10 * y,  width/20 + x % 4 *10,  height/20 + x % 4 *10);
            }
        }
    }
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}