/*
  Color Matcher, Genetic Algorithm
  Tre Turner <tre.turner34@gmail.com>
  23Mar.17
  
  # A program to match up to a color
  
  void setup()
    Step 1: Populate
      - an empty array of DNA 
      - DNA is an arraylist of genes (shapes)
      - each gene is a rectangle with a random hex color
   
  void draw()
    Step 2: Selection
      - evaluate fitness (compare to the hex of the target)
      - make a mating pool to put more fit DNA in (arraylist)
    Step 3: Reproduce
      - for every population member do:
        # pick two elements from the mating pool
        # take a rendom amount from one child, the rest from the other
        # combine into a new child 
        # apply mutation chance to the new child's genes
      - replace the population with the new children
*/

Population population;
int popMax = 400;
float mutationRate = 0.0001;

void setup() {
  size(1000, 800);    // sets up a new canvas that size
  
  // creates the new initial population
  population = new Population(popMax, mutationRate);
}

void draw() {
  // populates the hex string for each DNA with a hex value
  population.calcHex();
  
  // concerts all the populations hex into r, g, and b values
  population.calcRGB();
  
  // displays the grid of colors or members
  population.displayDNA();
  
  // calculates the fitness of every member
  population.calcFitness();
  
  // gets the average fitness of the population and changes the target
  // DNA if the avg fitness is greater than 99.999%
  population.getAverageFitness();
  
  // adds all DNA to the mating pool based on fitness
  population.naturalSelection();
  
  // splits parents and replaces population with new children
  population.generate();
}