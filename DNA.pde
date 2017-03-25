/*
  Color Matcher
  Tre Turner <tre.turner34@gmail.com>
  
  The class that creates the variation in each gene
  
  Functions: 
    # calculate fitness
    # display the shape as a rectangle
    # combine parents to make a child
    # mutate the child on a %
*/

import java.awt.Color;
import java.util.Arrays;

class DNA {
  
  // MEMBER VAIRABLES //
  char[] genes;
  int r;
  int g;
  int b;
  float fitness;
  String hex;
  
  // CONSTRUCTORS //
  DNA(int num) {
    genes = new char[num];
    for(int i = 0; i < num; i++) {
      float r = random(1);
      if(r >= 0.375) {
        genes[i] = (char) random(48, 58);
      } else {
        genes[i] = (char) random(65, 71);
      }
    }
  }
  
  // METHODS //
  void toBinary() {
    
  }
  
  String hexToString() {
    hex = "";
    for(int i = 0; i < genes.length; i++) {
       hex += genes[i];
    }
    return hex; 
  }
  
  void toRGB(String hex) {
    int[] ret = new int[3];
    for(int i = 0; i < 3; i++) {
      String a = hex.substring(i*2, i*2+1); 
      String b = hex.substring(i*2+1, i*2+2);
      int x = 0;
      int y = 0;
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
      ret[i] = x * 16 + y;
    }
    r = ret[0];
    g = ret[1];
    b = ret[2];
  }
  
  String getHex() {
    return hex; 
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