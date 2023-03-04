//n - bits, p - pos, b - new bit
int modifyBit(int n, int p, int b){
    int mask = 1 << p;
    return (n & ~mask) |
           ((b << p) & mask);
}

int flipBit(int n, int p){
    int mask = 1 << p;
    return (n ^ mask);
}

int getBit(int n, int p) {
    return (n >> p) & 1;
}

/*
//println("a:" + a); 
 int bitsA = Float.floatToIntBits(a); 
 System.out.println(Integer.toBinaryString(bitsA)); 
 int bitsB = Float.floatToIntBits(b); 
 System.out.println(Integer.toBinaryString(bitsB));
 long bitsC = bitsA;
 bitsC <<= 32;
 bitsC |= bitsB;
 a = Float.intBitsToFloat(bitsA);
 //println("a:" + a); 
 System.out.println(Integer.toBinaryString(bitsA));
 bitsA = modifyBit(bitsA, 5, 0);
 System.out.println(Integer.toBinaryString(bitsA));
 
 //BitSet abBS = new BitSet(bitsA + bitsB);
*/
