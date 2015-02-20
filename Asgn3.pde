Table champions;
int pos, totalDisplay;

ArrayList<Integer> selected = new ArrayList<Integer>();

import controlP5.*;

ControlP5 cp5;

CheckBox checkbox;

Button clear, top, jungle, middle, adc, support, all;
float kills = 0, deaths = 0, assists = 0, kda = 0;
float rkills = 0, rdeaths = 0, rassists = 0, rkda = 0;
int gold = 0, damage = 0;
int rgold = 0, rdamage = 0;

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
    kills += champions.getRow(i).getFloat(5);
    deaths += champions.getRow(i).getFloat(6);
    assists += champions.getRow(i).getFloat(7);
    kda += champions.getRow(i).getFloat(8);
    gold += champions.getRow(i).getInt(16);
    damage += champions.getRow(i).getInt(9);
  }
  
  kills = kills/champions.getRowCount();
  deaths = deaths/champions.getRowCount();
  assists = assists/champions.getRowCount();
  kda = kda/champions.getRowCount();
  gold = gold/champions.getRowCount();
  damage = damage/champions.getRowCount();
  
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
  text("50%", 40, 310);
  text("35%", 40, 540);
  textSize(32);
  
  textSize(20);
  textAlign(LEFT);
  text("Kills", 235, 600);
  text("Deaths", 320, 600);
  text("Assists", 420, 600);
  text("KDA", 520, 600);
  text("Gold", 600, 600);
  text("Damage Dealt", 700, 600);
  
  text("Total Average", 47, 650);
  text(kills, 230, 650);
  text(deaths, 320, 650);
  text(assists, 415, 650);
  text(kda, 510, 650);
  text(gold, 600, 650);
  text(damage, 700, 650);
  
  text("Role Average", 56, 700);
  text("Champ Average", 30, 750);
  
  stroke(128);
  strokeWeight(3);
  line(80, 80, 1000, 80);
  line(80, 310, 1000, 310);
  line(80, 195, 1000, 195);
  line(80, 425, 1000, 425);
  
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
      rect(x,(540-((champions.getRow(i).getFloat(2) - 35)*15)),
          (915/totalDisplay)-2, ((champions.getRow(i).getFloat(2) - 35)*15));
      x+=(915/totalDisplay);
      }
    selected.clear();
  }
  
  stroke(0);
  strokeWeight(5);
  line(80, 40, 80, 540);
  line(80, 540, 1000, 540);
  
  
}

void mousePressed(){
  pos = mouseX;
  if(pos > 1000){
    pos = 0;
  }
}

void printInfo(int i){
  textAlign(CENTER);
  int k = selected.get(i);
  text(champions.getRow(k).getString(1) + " " + champions.getRow(k).getString(0) + 
               ": " + champions.getRow(k).getFloat(2) + "% Win rate", 550, 45);
  textAlign(LEFT);
  
  rkills = 0;
  rdeaths = 0;
  rassists = 0;
  rkda = 0;
  rgold = 0;
  rdamage = 0;
  
  int r = 0;
  
  for(int j=0; j<champions.getRowCount(); j++){
    if(champions.getRow(j).getString(1).equals(champions.getRow(j).getString(1))){
      rkills += champions.getRow(j).getFloat(5);
      rdeaths += champions.getRow(j).getFloat(6);
      rassists += champions.getRow(j).getFloat(7);
      rkda += champions.getRow(j).getFloat(8);
      rgold += champions.getRow(j).getInt(16);
      rdamage += champions.getRow(j).getInt(9);
      r++;
    }
  }
  
  if(r!=0){
    rkills = rkills/r;
    rdeaths = rdeaths/r;
    rassists = rassists/r;
     rkda = rkda/r;
    rgold = rgold/r;
    rdamage = rdamage/r;
  }
  
  text(rkills, 230, 700);
  text(rdeaths, 320, 700);
  text(rassists, 415, 700);
  text(rkda, 510, 700);
  text(rgold, 600, 700);
  text(rdamage, 700, 700);
  
  text(champions.getRow(i).getFloat(5), 230, 750);
  text(champions.getRow(i).getFloat(6), 320, 750);
  text(champions.getRow(i).getFloat(7), 415, 750);
  text(champions.getRow(i).getFloat(8), 510, 750);
  text(champions.getRow(i).getInt(16), 600, 750);
  text(champions.getRow(i).getInt(9), 700, 750);
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

