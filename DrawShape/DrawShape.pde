import java.util.BitSet;
import java.util.Random;

Random rn = new Random();

float a = -0.48726236;
//float b = 0.124799;
float b = 0.024799;
int pointLength = 10000;
float x0 = 0.0;
float y0 = 0.0;
float scale_x = 10.0;
float scale_y = 10.0;

color pixelsData[];
int blackCount = 0;
color white = color(255, 255, 255);

Boolean draw = true;
int counter = 0;

String[] args = {"TwoFrameTest"};
SecondApplet sa = new SecondApplet();


int genes = 200;
Algorithm alg = new Algorithm(100, genes, 0.7, 0.01);


float bestFit[] = new float[genes+1];
float medFit[] = new float[genes+1];
float worstFit[] = new float[genes+1];
float bestFitness = 0;
int stopPoint = genes;

void setup()
{
 size(300, 300);
 pixelsData = new color[width*height];
 background(255, 255, 255);
 drawShape();
 loadPixels();
 for(int i=0; i<width*height; i++){
   pixelsData[i] = pixels[i];
   if(pixels[i] != white){
     blackCount++;
   }
 }
 
 
}
void draw(){  
  if(draw == true){
    //alg.findSolution();
    /*
    for(int i=1; i<=alg.gen; i++){
      alg.findSolution();
      println("Generation: " + i + " , Fit: " + alg.pop.bestFit);
    }
    */
    while(alg.curGen < alg.gen){
      alg.findSolution();
      println("Generation: " + alg.curGen + " , Best Fit: " + alg.pop.bestFit + " , Mean Fit: " + alg.pop.fitSum/alg.pop.size + " , Worst Fit: " + alg.pop.worstFit);
      if(alg.notBetter > 50){
        stopPoint = alg.curGen;
        break;
      }
    }
    println("SOLUTION");
    println("a = " + a + " - b = " + b);
    println(bestFitness);
    
    a = alg.pop.ind[alg.pop.bestInd].getA();
    b = alg.pop.ind[alg.pop.bestInd].getB();
    background(255);
    drawShape();
    loadPixels();
    
    PApplet.runSketch(args, sa);
    
    draw = false;
  }
}

float function(float x, float a){
  return a*x + (2*(1 - a)*x*x) / (1 - x + x*x);
}

void drawShape(){
   float xn, xn_1 = x0;
   float yn, yn_1 = y0;
  
  
   for(int i=0; i<pointLength; i++)
   {
   xn = yn_1 + (b * (1-0.05*yn_1*yn_1)*yn_1 ) + function(a, xn_1);
   yn = function(a, xn) - xn_1;
  
   point(width/2 + (float)xn * scale_x, height/2 + (float)yn * scale_y);
  
   xn_1 = xn;
   yn_1 = yn;
   }
}
