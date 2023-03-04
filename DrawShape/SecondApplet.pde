import javax.swing.JFrame;

public class SecondApplet extends PApplet {

  public void settings() {
    size(1000, 500);
  }
  public void draw() {
    background(255);
    
    float space = width/stopPoint;
    
    for(int i=1; i<stopPoint; i++){
      fill(255, 0, 0);
      stroke(255, 0, 0);
      text("BEST", 10,10);
      line(i*space, height-bestFit[i]/bestFitness*height, (i+1)*space, height-bestFit[i+1]/bestFitness*height);
      
      fill(0, 255, 0);
      stroke (0, 255, 0);
      text("WORST", 10,30);
      line(i*space, height-worstFit[i]/bestFitness*height, (i+1)*space, height-worstFit[i+1]/bestFitness*height);
      
      fill(0, 0, 255);
      stroke(0, 0, 255);
      text("MEAN", 10,50);
      line(i*space, height-medFit[i]/bestFitness*height, (i+1)*space, height-medFit[i+1]/bestFitness*height);
    }
  }
}
