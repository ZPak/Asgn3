Table champions, selection;
int pos;

import controlP5.*;

ControlP5 cp5;

CheckBox checkbox;

void setup() {
  size(1500, 720);
  
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
      
  for(int i=1; i<champions.getRowCount(); i++){
    checkbox.addItem(champions.getRow(i).getString(0) + " ("+champions.getRow(i).getString(1) + ")", i);
  }
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
  
  strokeWeight(1);
  int x = 85;
  for(int i=0; i<champions.getRowCount(); i++){
    if(champions.getRow(i).getString(1).equals("Top")){
      fill(255,0,0,128);
      if((mouseX>85 && checkMouseX(i)) || checkPos(i)){
        fill(255,0,0,255);
        if(checkPos(i)){
          printInfo(i);
        }
      }
    } else if(champions.getRow(i).getString(1).equals("Jungle")){
      fill(0,0,255,128);
      if((mouseX>85 && checkMouseX(i)) || checkPos(i)){
        fill(0,0,255,255);
        if(checkPos(i)){
          printInfo(i);
        }
      }
    } else if(champions.getRow(i).getString(1).equals("Middle")){
      fill(128,0,255,128);
      if((mouseX>85 && checkMouseX(i)) || checkPos(i)){
        fill(128,0,255,255);
        if(checkPos(i)){
          printInfo(i);
        }
      }
    } else if(champions.getRow(i).getString(1).equals("ADC")){
      fill(255,200,50,128);
      if((mouseX>85 && checkMouseX(i)) || checkPos(i)){
        fill(255,200,50,255);
        if(checkPos(i)){
          printInfo(i);
        }
      }
    } else if(champions.getRow(i).getString(1).equals("Support")){
      fill(0,255,0,128);
      if((mouseX>85 && checkMouseX(i)) || checkPos(i)){
        fill(0,255,0,255);
        if(checkPos(i)){
          printInfo(i);
        }
      }
    }
    rect(x,(640-((champions.getRow(i).getFloat(2) - 35)*20)),
          (1000/champions.getRowCount())-2, ((champions.getRow(i).getFloat(2) - 35)*20));
    x+=(1000/champions.getRowCount());
  }
  
  stroke(0);
  strokeWeight(5);
  line(80, 40, 80, 640);
  line(80, 640, 1000, 640);
  
  
}

void mouseClicked(){
  pos = mouseX;
}

void printInfo(int i){
  text(champions.getRow(i).getString(1) + " " + champions.getRow(i).getString(0) + 
               ": " + champions.getRow(i).getFloat(2) + "% Win rate", 550, 90);
}

boolean checkMouseX(int i){
  return (mouseX>((i*915/champions.getRowCount())+85) && mouseX<(((i+1)*915/champions.getRowCount())+85));
}

boolean checkPos(int i){
  return (pos>((i*915/champions.getRowCount())+85) && pos<(((i+1)*915/champions.getRowCount())+85));
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(checkbox)) {
    print("got an event from "+checkbox.getName()+"\t\n");
    // checkbox uses arrayValue to store the state of 
    // individual checkbox-items. usage:
    println(checkbox.getArrayValue());
    int col = 0;
    for (int i=0;i<checkbox.getArrayValue().length;i++) {
      int n = (int)checkbox.getArrayValue()[i];
      print(n);
    }
    println();      
  }
}

