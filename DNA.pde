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
  int[] genes;
  int r;
  int g;
  int b;
  float fitness;
  String hex;
  
  // CONSTRUCTORS //
  DNA(int num) {
    genes = new int[num];
    for(int i = 0; i < num; i++) {
      genes[i] = int(random(2)); 
    }
  }
  
  // METHODS //
  void toHex() {
    String g = Arrays.toString(genes).replaceAll("\\[|\\]|,|\\s", "");
    int dec = Integer.parseInt(g, 2);
    hex = Integer.toHexString(dec);
  }
  
  void toRGB(String hex) {
    r = Integer.valueOf(hex.substring(1, 3), 16);
    g = Integer.valueOf(hex.substring(3, 5), 16);
    b = Integer.valueOf(hex.substring(5, 6), 16); 
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