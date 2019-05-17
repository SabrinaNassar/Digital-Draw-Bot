//var mySound;
ArrayList<circle> circles = new ArrayList<circle>();
float n = 500;
float d = 20;
int timeout = 2;
int time = 0;

public class circle {
  int x = 0;
  int y = 0;
  float vx = 0;
  float vy = 0;
  float di = d;
  
  circle(int x_, int y_,float vx_,float vy_){
    x = x_;
    y = y_;
    vx = vx_;
    vy = vy_;
  }
  
  void move() {
    x += vx;
    y += vy;
  
    if (x < -d || x > width+d) {
      //circles.splice(circles.indexOf(circle), 1);
      vx *= -1;
    }
    if (y < -d || y > height+d) {
     // circles.splice(circles.indexOf(circle), 1);
      vy *= -1;
    }
    di *= .99;
    vx *= .99;
    vy *= .99;
    //ellipse(x,y,d,d);
  }
}


void setup() {
  //frameRate(60);
  size(500,500);
  colorMode(HSB);
  background(255);

  //mySound.setVolume(0,500);
  //mySound.loop();


// for (let i = 0; i < n; i++) {
// Origating line
  /*  circles.push({
      x: (i/n)*width,
      y: sin(PI/500 *i)*height/3*2,
      vx: random(-sin(PI/360*i), sin(PI/360*i)),
      vy: random(-sin(PI/360*i), cos(PI/360*i))
    });*/
}


void draw() {
  if (mousePressed && millis()-time > timeout){
    //random(-2,2)
    circles.add(circles.size(), new circle(mouseX, mouseY, noise(millis())*random(-2,4), noise(millis())*random(-2,4)));
  //  mySound.pan(mouseX);
  //  mySound.play();
  time = millis();
  }
//else {
  //mySound.stop()
//}


  n = sin(PI/360 * millis())+1*10;
  // HSB: fully orange (hue of 30, sat & bri at 100%), 0.03 opacity
  stroke(random (100,200), 100, 200,30);
  strokeWeight(.5);
  if(circles.size()>0){
    for (int i = 0; i < circles.size(); i++) {
      // for each circle
      circle from = circles.get(i);
      for (int j = i+1; j < circles.size(); j++) {
        circle to = circles.get(j);
        if (dist(from.x, from.y, to.x, to.y) < from.di*5) {
          /*
          if(from.x < width-100 && from.x > 100 &&
             from.y < height-100 && from.y > 100 &&
             to.x < width-100 && to.x > 100 &&
             to.y < height-100 && to.y > 100
            )
            */
          //println(to.x);
          line(from.x, from.y, to.x, to.y);
          from.move();
        }
      }
    }
  }
  for(int i = 0; i < circles.size(); i++){
    circles.get(i).move();
  }
}
