/*
  Color Matcher, Genetic Algorithm
  Tre Turner <tre.turner34@gmail.com>
  04/06/2017
  
  # A program to match up to a color
  
  void setup()
    Step 1: Populate
      - an empty array of DNA 
      - DNA is an arraylist of genes (DNA is the rectangle of color)
      - each gene is a random hex color
   
  void draw()
    Step 2: Selection
      - evaluate fitness (compare to the binary of the hex to the target binary)
      - make a mating pool to put more fit DNA in more often (arraylist)
    Step 3: Reproduce
      - for every population member:
        # pick two elements from the mating pool
        # take a random amount from one child, the rest from the other
        # combine into a new child 
        # apply mutation chance to the new child's genes
      - replace the population with the new children
*/

Population population;
int popMax = 1400;
float mutationRate = 0.0001;
float avgPercentNeeded = 0.9965;

boolean sort = true;    // Set to 'true' if you want the colors to be sorted before displayed (makes a color rainbow effect) 
                         // Set to 'false' if you want the standard random display

void setup() {
  fullScreen();    // sets up a new canvas the size of your screen
  
  // creates the new initial population
  population = new Population(popMax, mutationRate, avgPercentNeeded);
}

void draw() {
  // populates the hex string for each DNA with a hex value
  population.calcHex();
  
  // concerts all the populations hex into r, g, and b values
  population.calcRGB();
  
  // calculates the fitness of every member
  population.calcFitness();
  
  if(sort == true) 
    // Sorts the colors bottom to top, right to left in terms of fitness
    population.sort();
  
  population.calcFitness();
  
  // displays the grid of colors or members
  population.displayDNA();
    
  // gets the average fitness of the population and changes the target
  // DNA if the avg fitness is greater than 99.999%
  population.getAverageFitness();
  
  // adds all DNA to the mating pool based on fitness
  population.naturalSelection();
  
  // splits parents and replaces population with new children
  population.generate();
}