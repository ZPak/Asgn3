Table champions;
int pos;

void setup() {
  size(1280, 720);
  //colorMode(HSB, 100);
  
  champions = loadTable("champions.csv", "header");
  Table top = new Table();
  Table jg = new Table();
  Table mid = new Table();
  Table adc = new Table();
  Table sup = new Table();
  
  TableRow row;
  for(int i=1; i<champions.getRowCount(); i++){
    row = champions.getRow(i);
    if(row.getString(1).equals("Top")){
      top.addRow(row);
    } else if(row.getString(1).equals("Jungle")){
      jg.addRow(row);
    } else if(row.getString(1).equals("Middle")){
      mid.addRow(row);
    } else if(row.getString(1).equals("ADC")){
      adc.addRow(row);
    } else if(row.getString(1).equals("Support")){
      sup.addRow(row);
    }
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
      if((mouseX>85 && mouseX>((i*915/champions.getRowCount())+85) && mouseX<(((i+1)*915/champions.getRowCount())+85))
          || (pos>((i*915/champions.getRowCount())+85) && pos<(((i+1)*915/champions.getRowCount())+85))){
        fill(255,0,0,255);
        if(pos>((i*915/champions.getRowCount())+85) && pos<(((i+1)*915/champions.getRowCount())+85)){
          text(champions.getRow(i).getString(1) + " " + champions.getRow(i).getString(0) + 
               ": " + champions.getRow(i).getFloat(2) + "% Win rate", 550, 90);
        }
      }
    } else if(champions.getRow(i).getString(1).equals("Jungle")){
      fill(0,0,255,128);
      if((mouseX>85 && mouseX>((i*915/champions.getRowCount())+85) && mouseX<(((i+1)*915/champions.getRowCount())+85))
          || (pos>((i*915/champions.getRowCount())+85) && pos<(((i+1)*915/champions.getRowCount())+85))){
        fill(0,0,255,255);
        if(pos>((i*915/champions.getRowCount())+85) && pos<(((i+1)*915/champions.getRowCount())+85)){
          text(champions.getRow(i).getString(1) + " " + champions.getRow(i).getString(0) + 
               ": " + champions.getRow(i).getFloat(2) + "% Win rate", 550, 90);
        }
      }
    } else if(champions.getRow(i).getString(1).equals("Middle")){
      fill(128,0,255,128);
      if((mouseX>85 && mouseX>((i*915/champions.getRowCount())+85) && mouseX<(((i+1)*915/champions.getRowCount())+85))
          || (pos>((i*915/champions.getRowCount())+85) && pos<(((i+1)*915/champions.getRowCount())+85))){
        fill(128,0,255,255);
        if(pos>((i*915/champions.getRowCount())+85) && pos<(((i+1)*915/champions.getRowCount())+85)){
          text(champions.getRow(i).getString(1) + " " + champions.getRow(i).getString(0) + 
               ": " + champions.getRow(i).getFloat(2) + "% Win rate",550, 90);
        }
      }
    } else if(champions.getRow(i).getString(1).equals("ADC")){
      fill(255,200,50,128);
      if((mouseX>85 && mouseX>((i*915/champions.getRowCount())+85) && mouseX<(((i+1)*915/champions.getRowCount())+85))
          || (pos>((i*915/champions.getRowCount())+85) && pos<(((i+1)*915/champions.getRowCount())+85))){
        fill(255,200,50,255);
        if(pos>((i*915/champions.getRowCount())+85) && pos<(((i+1)*915/champions.getRowCount())+85)){
          text(champions.getRow(i).getString(1) + " " + champions.getRow(i).getString(0) + 
               ": " + champions.getRow(i).getFloat(2) + "% Win rate", 550, 90);
        }
      }
    } else if(champions.getRow(i).getString(1).equals("Support")){
      fill(0,255,0,128);
      if((mouseX>85 && mouseX>((i*915/champions.getRowCount())+85) && mouseX<(((i+1)*915/champions.getRowCount())+85))
          || (pos>((i*915/champions.getRowCount())+85) && pos<(((i+1)*915/champions.getRowCount())+85))){
        fill(0,255,0,255);
        if(pos>((i*915/champions.getRowCount())+85) && pos<(((i+1)*915/champions.getRowCount())+85)){
          text(champions.getRow(i).getString(1) + " " + champions.getRow(i).getString(0) + 
               ": " + champions.getRow(i).getFloat(2) + "% Win rate", 550, 90);
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

