class Population{
  int size = 0;
  int bestFit = 0;
  int worstFit = 0;
  int fitSum = 0;
  int bestInd = 0;
  Individual ind[];
  
  Population(int size){
    this.size = size;
    ind = new Individual[size];
    
    for(int i=0; i<size; i++){
      ind[i] = new Individual();
    }
  }
  
  void fit(){
    int tmp = 0;
    bestFit = 0;
    worstFit = 99999;
    fitSum = 0;
    for(int i=0; i<size; i++){
      background(255);
      a = ind[i].getA();
      b = ind[i].getB();
      drawShape();
      tmp = ind[i].fitness();
      fitSum += tmp;
      if(tmp > bestFit){
        bestFit = tmp;
        bestInd = i;
      }
      if(tmp < worstFit){
        worstFit = tmp;
      }
    }
  }
  
}
