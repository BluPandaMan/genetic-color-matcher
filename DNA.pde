/*
  Color Matcher
  Tre Turner <tre.turner34@gmail.com>
  
  The class that variates each gene and creates the DNA 
  for each population member.
  
  Functions: 
    # convert genes[] to hex (48)
    # calculate the rgb values (57)
    # calculates the fitness (105)
    # combine parents to make a child (129)
    # mutate the child on a % (142)
    # creates a new DNA genome (156)
    # compares each DNA by their fitness (163)
*/

class DNA implements Comparable<DNA> {
  
  // MEMBER VAIRABLES //
  
  char[] genes;
  int r;
  int g;
  int b;
  public float fitness;
  String hex;
  
  // CONSTRUCTORS //
  
  DNA(int num) {
    genes = new char[num];
    for(int i = 0; i < num; i++) {
      float r = random(1);
      
      // this sets the chance for geting a number and character the same
      if(r >= 0.375) {
        genes[i] = (char) random(48, 58);
      } else {
        genes[i] = (char) random(65, 71);
      }
    }
  }
  
  // METHODS //
  
  // converts the char array (genes) into a string (hex)
  String hexToString() {
    hex = "";
    for(int i = 0; i < genes.length; i++) {
       hex += genes[i];
    }
    return hex; 
  }
  
  // calculates the r, g, and b values
  void toRGB(String hex) {
    int[] ret = new int[3];
    for(int i = 0; i < 3; i++) {
      String a = hex.substring(i*2, i*2+1); 
      String b = hex.substring(i*2+1, i*2+2);
      int x = 0;
      int y = 0;
      
      // sets values for a and b using hex letters or numbers
      switch(a) {
        case "A": x = 10;
          break;
        case "B": x = 11;
          break;
        case "C": x = 12;
          break;
        case "D": x = 13;
          break;
        case "E": x = 14;
          break;
        case "F": x = 15;
          break;
        default: x = Integer.parseInt(a);
      }
      switch(b) {
        case "A": y = 10;
          break;
        case "B": y = 11;
          break;
        case "C": y = 12;
          break;
        case "D": y = 13;
          break;
        case "E": y = 14;
          break;
        case "F": y = 15;
          break;
        default: y = Integer.parseInt(b);
      }
      // calculates the rgb value, then puts in an array
      ret[i] = x * 16 + y;
    }
    r = ret[0];
    g = ret[1];
    b = ret[2];
  }
  
  // calculates the fitness score for a DNA
  void fitness(String target) {
    int score = 0;
    
    // converting the hex into binary, by using toBinaryString(a hex number decimal)
    String binary = Integer.toBinaryString(Integer.parseInt(hex, 16));
    String targetBinary = Integer.toBinaryString(Integer.parseInt(target, 16));
    
    // add 0's to the front of binary strings to get a 24 sized bite
    for(int i = binary.length(); i < 24; i++) {
      binary = "0" + binary; 
    }
    for(int i = targetBinary.length(); i < 24; i++) {
      targetBinary = "0" + targetBinary; 
    }
    
    // compares the DNA's binary to the targets binary to get a score
    for(int i = 0; i < binary.length(); i++) {
      if(binary.charAt(i) == targetBinary.charAt(i)) 
        score++;
    }
    fitness = (float) score / (float) targetBinary.length();    // calculates the fitness score
  }
  
  // makes a child from 2 parents
  DNA crossover(DNA parent) {
    DNA child = new DNA(genes.length);
    
    int midPoint = int(random(genes.length));
    
    for(int i = 0; i < genes.length; i++) {
      if(i < midPoint) child.genes[i] = genes[i];    // half from 1 parent
      else child.genes[i] = parent.genes[i];         // half from the other
    }
    return child;
  }
  
  // aplies mutation chance to every hex value to change it to a random hex
  void mutate(float mutationRate) {
    for(int i = 0; i < genes.length; i++) {
      if(random(1) <= mutationRate) {
        float r = random(1);
        if(r >= 0.375) {
          genes[i] = (char) random(48, 58);
        } else {
          genes[i] = (char) random(65, 71);
        } 
      }
    }
  }
  
  // creates a new DNA element with a random genome
  void newDNA() {
    DNA tempDNA = new DNA(6);
    for(int i = 0; i < genes.length; i++) {
      genes[i] = tempDNA.genes[i];    // replaces the current DNA with the new DNA's genes
    }
  }
  
  public int compareTo(DNA compareDNA) {
     int compareFit = ((DNA) compareDNA).getFitness();
     return this.getFitness() - compareFit;
  }
  
  // GETTERS & SETTERS //
  
  String getHex() {
    return hex; 
  }
  
  int getFitness() {
    return (int) (fitness * 100); 
  }

  int getR() {
    return r; 
  }
  
  int getG() {
    return g; 
  }
  
  int getB() {
    return b; 
  }
  
}