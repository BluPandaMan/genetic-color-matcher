/*
  Color Matcher, Genetic Algorith
  Tre Turner <tre.turner34@gmail.com>
  
  This class holds our DNA members into our population
  
  Functions:
    # gets hex and rgb values (35, 42)
    # displays shapes and colors on a grid (49)
    # calculates fitness on every pop member(66)
    # puts parents in the mating pool (73)
    # creates a new generation of colors (96)
    # checks the avg fitness (109)
*/

class Population {
   
  DNA[] population;                   // new pop of colors
  ArrayList<DNA> matingPool;          // pool to select from for mating
  float mutationRate;                 // chance to mutate a gene
  int popMax;                         // total population
  
  Population(int p, float m) {
    mutationRate = m;
    popMax = p;
    population = new DNA[popMax];
    for(int i = 0; i < popMax; i++) {
      population[i] = new DNA(6); 
    }
    
    matingPool = new ArrayList<DNA>();
  }
  
  // adds value for each DNA's hex value;
  void calcHex() {
    for(int i = 0; i < population.length; i++) {
      population[i].hexToString(); 
    }
  }
  
  // adds value for each DNA's r, g, and b values
  void calcRGB() {
    for(int i = 0; i < population.length; i++) {
      population[i].toRGB(population[i].getHex()); 
    }
  }
  
  // displays the color rectangles in a grid
  void displayDNA() {
    int xPos = 0;
    int yPos = 0;
    for(int i = 0; i < population.length; i++) {
      fill(population[i].getR(),    // gets the color for the rect
           population[i].getG(),
           population[i].getB()); 
      rect(xPos, yPos, 50, 40);     // creates the rect using an xPos
      xPos += 50;                   // every rect moves over by 50
      if(xPos >= 1000) {            // until it reaches the end of the canvas
        xPos = 0;                   // then x goes back to 0
        yPos += 40;                 // and y moves down 40 (starting a new row)
      } 
    }
  }
  
  // adds a value for the fitness value
  void calcFitness() {
    for(int i = 0; i < population.length; i++) {
      population[i].fitness(population[0].getHex());
    }
  }
  
  // preps the mating pool for parent selection 
  void naturalSelection() {
    matingPool.clear();
    
    // gets the most fit DNA's score
    float maxFitness = 0;
    for(int i = 0; i < population.length; i++) {
      if(population[i].fitness > maxFitness) {
        maxFitness = population[i].fitness; 
      }
    }
    
    for(int i = 0; i < population.length; i++) {
      
      // maps each DNA's fitness to a float between 0 - 1 based off of the maxFitness
      float fitness = map(population[i].fitness, 0, maxFitness, 0, 1);
      int n = int(fitness * 100);    
      for(int j = 0; j < n; j++) {    // 0.31 = 31 times it gets put in the mating pool
        matingPool.add(population[i]); 
      }
    }  
  }
  
  // replaces the current population with children
  void generate() {
    for(int i = 1; i < population.length; i++) {
      int a = int(random(1, matingPool.size()));    // gets random # for parent selection
      int b = int(random(1, matingPool.size()));
      DNA parentA = matingPool.get(a);              // gets two random DNA parents
      DNA parentB = matingPool.get(b);
      DNA child = parentA.crossover(parentB);       // creates the child using crossover
      child.mutate(mutationRate);                   // applies mutation chance
      population[i] = child;                        // replaces the population with child
    }
  }
  
  // in population class: used to find the avg fitness of a generation
  void getAverageFitness() {
    float total = 0;
    for(int i = 0; i < population.length; i++) {
      total += population[i].fitness; 
    }
    
    // if the avg fitness is over 99.999% then the first pop member (the target) changes
    if(total / (population.length) >= 0.99999) population[0].newDNA();
  }
  
}