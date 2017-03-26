/*
  Color Matcher, Genetic Algorith
  Tre Turner <tre.turner34@gmail.com>
  
  This class holds our DNA members into our population
*/

import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

class Population {
   
  DNA[] population;
  ArrayList<DNA> matingPool;
  float mutationRate;
  int popMax;
  TreeMap<Integer, DNA> sortedPop;
  
  Population(int p, float m) {
    mutationRate = m;
    popMax = p;
    population = new DNA[popMax];
    for(int i = 0; i < popMax; i++) {
      population[i] = new DNA(6); 
    }
    matingPool = new ArrayList<DNA>();
    sortedPop = new TreeMap<Integer, DNA>();
  }
  
  void calcHex() {
    for(int i = 0; i < population.length; i++) {
      population[i].hexToString(); 
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
      rect(xPos, yPos, 50, 40);
      xPos += 50;
      if(xPos >= 1000) {
        xPos = 0;
        yPos += 40;
      } 
    }
  }
  
  void calcFitness() {
    for(int i = 0; i < population.length; i++) {
      population[i].fitness(population[0].getHex());
    }
  }
  
  void naturalSelection() {
    matingPool.clear();
    
    float maxFitness = 0;
    for(int i = 0; i < population.length; i++) {
      if(population[i].fitness > maxFitness) {
        maxFitness = population[i].fitness; 
      }
    }
    
    for(int i = 0; i < population.length; i++) {
      float fitness = map(population[i].fitness, 0, maxFitness, 0, 1);
      int n = int(fitness * 100);
      for(int j = 0; j < n; j++) {
        matingPool.add(population[i]); 
      }
    }  
  }
  
  void generate() {
    for(int i = 1; i < population.length; i++) {
      int a = int(random(1, matingPool.size())); 
      int b = int(random(1, matingPool.size()));
      DNA parentA = matingPool.get(a);
      DNA parentB = matingPool.get(b);
      DNA child = parentA.crossover(parentB);
      child.mutate(mutationRate);
      population[i] = child;
    }
  }
  
  void sort() {
    for(int i = 1; i < population.length; i++) {
      sortedPop.put((int)population[i].fitness, population[i]);
    }
    System.out.println(sortedPop.size());
    for(int i = 1; i < population.length; i++) {
      if(sortedPop.size() > 0) {
        population[i] = sortedPop.get(sortedPop.firstKey()); 
        sortedPop.remove(sortedPop.firstKey());

      }
    }
  }
  
}