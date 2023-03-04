class Algorithm{
  Population pop, nPop;
  int size;
  int gen;
  float pk;
  float pm;
  int first = 0;
  int second = 1;
  int notBetter = 0;
  int curGen = 0;
  
  Algorithm(int popSize, int gen, float pk, float pm){
    this.size = popSize;
    this.gen = gen;
    this.pk = pk;
    this.pm = pm;
    
    pop = new Population(popSize);
    nPop = new Population(popSize);
  }
  
  void findSolution(){
    curGen++;
    pop.fit();
    for(int i=0; i<size; i+=2){
      fitness();
      cross_over(i);
    }
    nPop.fit();
    if(nPop.bestFit > bestFitness){
      pop = nPop;
      notBetter = 0;
      println("Selected: ");
    }else if(nPop.fitSum > pop.fitSum && nPop.bestFit > 0.8*bestFitness){
      pop = nPop;
      notBetter = 0;
      println("Selected: ");
    }else{
      notBetter++;
    }
    
    bestFit[curGen] = pop.bestFit;
    worstFit[curGen] = pop.worstFit;
    medFit[curGen] = pop.fitSum/size;
    if(pop.bestFit > bestFitness){
      bestFitness = pop.bestFit;
    }
  }
  
  void fitness(){
    first = 0;
    second = 1;
    float fScore = 0.0f;
    float sScore = 0.0f;
    
    float tmp = 0.0;
    
    for(int i=0; i<size; i++){
      tmp = pop.ind[i].fit*5 + rn.nextFloat()*pop.ind[i].fit;
      //tmp = rn.nextFloat()*pop.ind[i].fit;
      //print("Score[" + i + "] = " + tmp + "; ");
      if(tmp > fScore){
        second = first;
        first = i;
        sScore = fScore;
        fScore = tmp;
      }else if(tmp > sScore){
        second = i;
        sScore = tmp;
      }
    }
    //println("\nfirst = " + first + "; second = " + second);
  }
  
  void cross_over(int pos){
    int one = rn.nextInt(32);
    int two = rn.nextInt(32);
    //println("one: " + one + ", two: " + two);
    //int one, two;
    
    /*
    if(tOne == tTwo)
      tTwo++;
      
    if(tOne>tTwo){
      int tmp = tOne;
      tOne = tTwo;
      tTwo = tmp;
    }
    */
    
    float chance = rn.nextFloat();
    
    /*
    if(tOne >= 32){
      one = 32;
    }else{
      one = tOne;
    }
    if(tTwo >= 32){
      two = 32;
    }else{
      two = tTwo;
    }
    */
    
    //BITSB
    int fBits = pop.ind[first].getBitsB();
    int sBits = pop.ind[second].getBitsB();
    
    if(chance < pk){
      int tmp = 0;
      for(int i = one; i<two; i++){
        tmp = getBit(fBits, i);
        modifyBit(fBits, i, getBit(sBits, i));
        modifyBit(sBits, i, tmp);
      }
    }
    
    fBits = mutation(fBits);
    sBits = mutation(sBits);
    
    nPop.ind[pos++].setBitsB(fBits);
    nPop.ind[pos].setBitsB(sBits);
    
    pos--;
    
    /*
    if(tOne >= 32){
      one = tOne - 32;
    }else{
      one = 0;
    }
    if(tTwo >= 32){
      two = tTwo;
    }else{
      two = 0;
    }
    */
    
    //BITSA
    one = rn.nextInt(32);
    two = rn.nextInt(32);
    
    fBits = pop.ind[first].getBitsA();
    sBits = pop.ind[second].getBitsA();
    
    if(chance < pk){
      int tmp = 0;
      for(int i = one; i<two; i++){
        tmp = getBit(fBits, i);
        modifyBit(fBits, i, getBit(sBits, i));
        modifyBit(sBits, i, tmp);
      }
    }
    
    fBits = mutation(fBits);
    sBits = mutation(sBits);
    
    nPop.ind[pos++].setBitsA(fBits);
    nPop.ind[pos].setBitsA(sBits);
  }
  
  int mutation(int bits){
    for(int i=0; i<32; i++){
      if(rn.nextFloat() < pm){
        bits = flipBit(bits, i);
      }
    }
    return bits;
  }
}
