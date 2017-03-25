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

final int WIDTH = 1000, HEIGHT = 800;

Population population;
int popMax = 100;

void setup() {
  size(1000, 800);
  population = new Population(popMax);
}

void draw() {
  population.calcHex();
  population.calcRGB();
  
  population.displayDNA();
}