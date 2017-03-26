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

import java.awt.Color;
import java.awt.Graphics;

Population population;
int popMax = 400;
float mutationRate = 0.0;

void setup() {
  size(1000, 800);
  population = new Population(popMax, mutationRate);
}

void draw() {
  // populates the hex string for each DNA with a hex value
  population.calcHex();
  
  // concerts all the populations hex into r, g, and b values
  population.calcRGB();
  
  // population.sort();
  
  // displays the grid of colors or members
  population.displayDNA();
  
  // calculates the fitness of every member
  population.calcFitness();
  
  population.naturalSelection();
  
  population.generate();
}