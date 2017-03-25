/*
  Color Matcher, Genetic Algorith
  Tre Turner <tre.turner34@gmail.com>
  
  This class holds our DNA members into our population
*/

class Population {
   
  DNA[] population;
  
  Population(int popMax) {
    population = new DNA[popMax];
    for(int i = 0; i < popMax; i++) {
      population[i] = new DNA(6); 
    }
  }
  
  void calcHex() {
    for(int i = 0; i < population.length; i++) {
      population[i].hexToString(); 
      System.out.println(population[i].getHex());
    }
  }
  
  void calcRGB() {
    for(int i = 0; i < population.length; i++) {
      population[i].toRGB(population[i].getHex()); 
    }
  }
  
  void displayDNA() {
    int xPos = 0;
    int yPos = 0;
    for(int i = 0; i < population.length; i++) {
      fill(population[i].getR(),
           population[i].getG(),
           population[i].getB()); 
      rect(xPos, yPos, 100, 80);
      xPos += 100;
      if(xPos >= 1000) {
        xPos = 0;
        yPos += 80;
      } 
    }
  }
  
}