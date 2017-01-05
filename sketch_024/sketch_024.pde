float yoff=0, zoff=0, ns=0.1, zs=8;
float nx, ny=yoff, z1, z2;

void setup(){
    size(512, 256, P3D);
    noiseDetail(8, 0.5);
    noStroke();
    background(20, 40, 50);
    frameRate(1);
}

void draw(){
    translate(width*0.5, height*.55, 0);
    rotate(PI/3.25);
    scale(15);
    for(int y = -10; y <=10; y++){
        nx = 0.005;
        beginShape(TRIANGLE_STRIP);
        for(int x = -25; x < 25; x++){
            z1 = noise(nx, ny, zoff);
            z2 = noise(nx, ny+ns, zoff);
            fill(0, z1*160, z2*255, pow(10, 0.85+z1*2));
            vertex(x, y, z1*zs);
            fill(0, z2*160, z2*255, pow(10, 0.85+z2*2));
            vertex(x, y+1, z2*zs);
            nx += ns;
        }
        endShape();
        ny += ns;
    }
}

void keyTyped(){
    if(key == 's' || key == 'S'){
        save("screen.png");
    }
}