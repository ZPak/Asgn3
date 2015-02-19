Table champions;
int pos, totalDisplay;

ArrayList<Integer> selected = new ArrayList<Integer>();

import controlP5.*;

ControlP5 cp5;

CheckBox checkbox;

Button clear, top, jungle, middle, adc, support, all;

void setup() {
  size(1500, 900);
  
  champions = loadTable("champions.csv", "header");
  
  cp5 = new ControlP5(this);
  checkbox = cp5.addCheckBox("checkBox")
                .setPosition(1050, 10)
                .setColorForeground(color(120))
                .setColorActive(color(255,0,0))
                .setColorLabel(color(0))
                .setSize(10, 10)
                .setItemsPerRow(4)
                .setSpacingColumn(100)
                .setSpacingRow(5)
                ;
      
  for(int i=0; i<champions.getRowCount(); i++){
    checkbox.addItem(champions.getRow(i).getString(0) + " ("+champions.getRow(i).getString(1) + ")", i);
  }
  
  clear = cp5.addButton("Clear")
             .setPosition(1050,720)
             .setWidth(80)
             .updateSize();
             
  top = cp5.addButton("Top")
             .setPosition(1150,720)
             .setWidth(80)
             .updateSize();
  
  jungle = cp5.addButton("Jungle")
             .setPosition(1250,720)
             .setWidth(80)
             .updateSize();
             
  middle = cp5.addButton("Middle")
             .setPosition(1350,720)
             .setWidth(80)
             .updateSize();
             
  adc = cp5.addButton("ADC")
             .setPosition(1150,750)
             .setWidth(80)
             .updateSize();
             
  support = cp5.addButton("Support")
             .setPosition(1250,750)
             .setWidth(80)
             .updateSize();
             
  all = cp5.addButton("All")
             .setPosition(1050,750)
             .setWidth(80)
             .updateSize();
}

void draw() {
  background(255);
  fill(0);
  textSize(16);
  text("65%", 40, 80);
  text("50%", 40, 340);
  text("35%", 40, 640);
  textSize(32);
  textAlign(CENTER);
  
  stroke(128);
  strokeWeight(3);
  line(80, 340, 1000, 340);
  line(80, 190, 1000, 190);
  line(80, 490, 1000, 490);
  
  totalDisplay = 0;
  for(int i=0;i<checkbox.getArrayValue().length;i++) {
    if((int)checkbox.getArrayValue()[i] == 1){
      totalDisplay++;
    }
  }
  
  for(int i=0; i<checkbox.getArrayValue().length; i++){
      if((int)checkbox.getArrayValue()[i] == 1){
        selected.add(i);
      }
  }
  
  strokeWeight(1);
  int x = 85;
  if(totalDisplay!=0){
    for(int j=0; j<selected.size(); j++){
      int i = selected.get(j);
      if(champions.getRow(i).getString(1).equals("Top")){
        fill(255,0,0,128);
        if((inBounds() && checkMouseX(j)) || checkPos(j)){
          fill(255,0,0,255);
          if(checkPos(j)){
            printInfo(j);
          }
        }
      } else if(champions.getRow(i).getString(1).equals("Jungle")){
        fill(128,0,255,128);
        if((inBounds() && checkMouseX(j)) || checkPos(j)){
          fill(0,0,255,255);
          fill(128,0,255,255);
          if(checkPos(j)){
            printInfo(j);
          }
        }
      } else if(champions.getRow(i).getString(1).equals("Middle")){
        fill(0,0,255,128);
        if((inBounds() && checkMouseX(j)) || checkPos(j)){
          fill(0,0,255,255);
          if(checkPos(j)){
            printInfo(j);
          }
        }
      } else if(champions.getRow(i).getString(1).equals("ADC")){
        fill(255,150,20,128);
        if((inBounds() && checkMouseX(j)) || checkPos(j)){
          fill(255,150,20,255);
          if(checkPos(j)){
            printInfo(j);
          }
        }
      } else if(champions.getRow(i).getString(1).equals("Support")){
        fill(0,255,0,128);
        if((inBounds() && checkMouseX(j)) || checkPos(j)){
          fill(0,255,0,255);
          if(checkPos(j)){
            printInfo(j);
          }
        }
      }
      rect(x,(640-((champions.getRow(i).getFloat(2) - 35)*20)),
          (915/totalDisplay)-2, ((champions.getRow(i).getFloat(2) - 35)*20));
      x+=(915/totalDisplay);
      }
    selected.clear();
  }
  
  stroke(0);
  strokeWeight(5);
  line(80, 40, 80, 640);
  line(80, 640, 1000, 640);
  
  
}

void mousePressed(){
  pos = mouseX;
  if(pos > 1000){
    pos = 0;
  }
}

void printInfo(int i){
  int k = selected.get(i);
  text(champions.getRow(k).getString(1) + " " + champions.getRow(k).getString(0) + 
               ": " + champions.getRow(k).getFloat(2) + "% Win rate", 550, 90);
}

boolean inBounds(){
  return mouseX>85 && mouseX<1000;
}

boolean checkMouseX(int i){
  return (mouseX>((i*(915/totalDisplay))+85) && mouseX<(((i+1)*(915/totalDisplay))+85));
}

boolean checkPos(int i){
  return (pos>((i*(915/totalDisplay))+85) && pos<(((i+1)*(915/totalDisplay))+85));
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(checkbox)) {
    for (int i=0;i<checkbox.getArrayValue().length;i++) {
      int n = (int)checkbox.getArrayValue()[i];
    }    
  }
}

public void Clear(int theValue) {
  checkbox.deactivateAll();   
}

public void Top(int theValue) {
  for(int i=0; i<champions.getRowCount(); i++){
    if(champions.getRow(i).getString(1).equals("Top")){
      checkbox.activate(i);
    }
  }
}

public void Jungle(int theValue) {
  for(int i=0; i<champions.getRowCount(); i++){
    if(champions.getRow(i).getString(1).equals("Jungle")){
      checkbox.activate(i);
    }
  }
}

public void Middle(int theValue) {
  for(int i=0; i<champions.getRowCount(); i++){
    if(champions.getRow(i).getString(1).equals("Middle")){
      checkbox.activate(i);
    }
  }   
}

public void ADC(int theValue) {
  for(int i=0; i<champions.getRowCount(); i++){
    if(champions.getRow(i).getString(1).equals("ADC")){
      checkbox.activate(i);
    }
  }  
}

public void Support(int theValue) {
  for(int i=0; i<champions.getRowCount(); i++){
    if(champions.getRow(i).getString(1).equals("Support")){
      checkbox.activate(i);
    }
  }   
}

public void All(int theValue) {
  checkbox.activateAll();  
}

