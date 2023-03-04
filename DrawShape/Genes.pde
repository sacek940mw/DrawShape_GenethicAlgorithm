class Individual{
  int bitsA;
  int bitsB;
  int fit = 0;
  //double chance = 0.0;
  
  Individual(){
    float x = rn.nextFloat()*2-1.0;
    setBitsA(x);
    x = rn.nextFloat()*2-1.0;
    setBitsB(x);
  }
  
  int getBitsA(){
    return bitsA;
  }
  
  int getBitsB(){
    return bitsB;
  }
  /*
  void setBits(int bits){
    bitsB = bits;
  }
  */
  void setBitsA(float b){
    bitsA = Float.floatToIntBits(b); 
  }
  
  void setBitsA(int bits){
    bitsA = bits; 
  }
  
  void setBitsB(float b){
    bitsB = Float.floatToIntBits(b); 
  }
  
  void setBitsB(int bits){
    bitsB = bits; 
  }
  
  float getA(){
    return Float.intBitsToFloat(bitsA);
  }
  
  float getB(){
    return Float.intBitsToFloat(bitsB);
  }
  
  int fitness0(){
    int tmp = 0;
    loadPixels();
    for(int i=0; i<width*height; i++){
      if(pixelsData[i] == pixels[i] && pixels[i] != white){
        tmp++;
      }
    }
    fit = tmp;
    return fit;
  }
  
  int fitness2(){
    int tmp = 0;
    loadPixels();
    for(int i=5; i<width*height-5; i++){
        if(pixelsData[i] == pixels[i] && pixels[i] != white){
          for(int j = i-5; j < i+5; j++){
            if(pixelsData[j] == pixels[j]){
              tmp++;
            }
          }
        }
    }
    fit = tmp;
    return fit;
  }
  
  int fitness(){
    int tmp = 0;
    loadPixels();
    for(int i=5; i<width*height-5; i++){
      if(pixelsData[i] == pixels[i] && pixels[i] != white){
        for(int j = i-5; j < i+5; j++){
          for(int jj=width*-5; jj < width*5; jj+=width){
            if(pixelsData[j+jj] == pixels[j+jj]){
              tmp++;
            }
          }
        }
      }
    }
    fit = tmp;
    return fit;
  }
    
  int fitness1(){
    int tmp = 0;
    int score = 0;
    loadPixels();
    for(int i=0; i<width; i++){
      tmp = 0;
      for(int j=0; j<height; j++){
        if(pixelsData[i*height+j] == pixels[i*height+j] && pixels[i*height+j] != white){
          tmp++;
        }
      }
      score += tmp*tmp;
    }
    for(int i=0; i<height; i++){
      tmp = 0;
      for(int j=0; j<width; j++){
        if(pixelsData[i*width+j] == pixels[i*width+j] && pixels[i*width+j] != white){
          tmp++;
        }
      }
      score += tmp*tmp;
    }
    fit = score;
    return fit;
  }
}
