import controlP5.*;

// Create ControlP5 variable
ControlP5 cp5;

int markerSize = 10;

float pointDiff = 0.1;

int axiesNumberX = 10;
int gridSizeX = 500 / axiesNumberX; // gridSize = (width/2) / axiesNumber

int axiesNumberY = 10;
int gridSizeY = 500 / axiesNumberY; // gridSize = (width/2) / axiesNumber

int graph1Red = 0;
int graph1Green = 0;
int graph1Blue = 0;

void drawGrid(){
  // Draw middle grid lines
  line((width / 2), 0, (width / 2), height);
  line(0, (height / 2), width, (height / 2));
  
  // Draw grid lines on x-axies
  for(int i = (axiesNumberX * -gridSizeX); i <= (axiesNumberX * gridSizeX); i+= gridSizeX){
    line((width / 2) + i, (height / 2) - markerSize, (width / 2) + i, (height / 2) + markerSize);
  }
  
  // Draw numbers on grid lines for X axis
  for(int i = (-axiesNumberX); i <= axiesNumberX; i++){ //<>//
    fill(0, 0, 0); //<>//
    text(i, convertToX(i) - 5, (convertToY(0) - markerSize - 5)); //<>//
  }
  
  // Draw grid lines on y-axies
  for (int i = (axiesNumberY * -gridSizeY); i <= (axiesNumberY * gridSizeY); i+= gridSizeY){
    line((width / 2) - markerSize, (height / 2) + i, (width / 2) + markerSize, (height / 2) + i);
  }
  
    // Draw numbers on grid lines for Y axis
  for(int i = (-axiesNumberY); i <= axiesNumberY; i++){ //<>//
    fill(0, 0, 0); //<>//
    text(i, (convertToX(0) + markerSize + 5), convertToY(i) + 5); //<>//
  }
}

void setup(){
  //Initialize cp5 variable
  cp5 = new ControlP5(this); //<>//
  
  size(1000, 1000);

  // Create Textboxes for axies change
  cp5.addTextfield("X Axies").setPosition(10, 10).setSize(50, 20).setAutoClear(false); //<>//
  cp5.addTextfield("Y Axies").setPosition(10, 60).setSize(50, 20).setAutoClear(false); //<>//
  
  // Create Textboxes for color
  cp5.addTextfield("Red").setPosition(70, 10).setSize(50, 20).setAutoClear(false);
  cp5.addTextfield("Green").setPosition(70, 60).setSize(50, 20).setAutoClear(false);
  cp5.addTextfield("Blue").setPosition(70, 110).setSize(50, 20).setAutoClear(false);
  
  // Create submit textbox
  cp5.addBang("Change").setPosition(10, 110).setSize(50, 20); //<>//
  
  drawGrid();
}

void draw(){
  drawEquation();
  //line(convertToX(0), convertToY(0), convertToX(5.5), convertToY(-2.5));
}

float convertToX(float x){
    int decimalPlaces = checkDecimal(x);
    
    float xCoordinate = (width / 2);
    
    // For +ve values of x
    for (float count = 0; count < x; count = count + (1*(pow(10, -decimalPlaces)))){
      xCoordinate += gridSizeX * (1*(pow(10, -decimalPlaces)));
    }
    
    // For -ve values of x
    for (float count = 0; count > x; count = count - (1*(pow(10, -decimalPlaces)))){
          xCoordinate -= gridSizeX * (1*(pow(10, -decimalPlaces)));
    }
    return xCoordinate;
}

float convertToY(float y){
  int decimalPlaces = checkDecimal(y);
  
  float yCoordinate = (height / 2);
  
  // For +ve vales of y
  for (float count = 0; count < y; count = count + (1*(pow(10, -decimalPlaces)))){
    yCoordinate -= gridSizeY * (1*(pow(10, -decimalPlaces)));
  }
  
  // For -ve values of y
  for (float count = 0; count > y; count = count - (1*(pow(10, -decimalPlaces)))){
    yCoordinate += gridSizeY * (1*(pow(10, -decimalPlaces)));
  }
  return yCoordinate;
}

void drawEquation(){
    if(axiesNumberX > 30){
      pointDiff = 1;
    }else{
      pointDiff = 0.1;
    }
    
    strokeWeight(2);    
    stroke(graph1Red, graph1Green, graph1Blue);
    
    float count = -axiesNumberX;
    
    for (float i = (-axiesNumberX / pointDiff); i < (axiesNumberX / pointDiff); i++){
      
      float x1 = count;
      float y1 = x1 * x1;
      
      float x2 = count + pointDiff;
      float y2 = x2 * x2;
      
      line(convertToX(x1), convertToY(y1), convertToX(x2), (convertToY(y2)));
      
      
      count += pointDiff;
    }
    
    
    strokeWeight(1);
    stroke(0, 0, 0);
}

int checkDecimal(float num){
  if( int(nf(num, 0, 0)) == num){
    return 0;
  } else if( float(nf(num, 0, 1)) == num){
    return 1;
  }else{
    return 2;
    }
}

void Change(){ //<>//
  axiesNumberX = int(cp5.get(Textfield.class, "X Axies").getText()); //<>//
  gridSizeX = 500 / axiesNumberX; // gridSize = (width/2) / axiesNumber //<>//
  
  axiesNumberY = int(cp5.get(Textfield.class, "Y Axies").getText()); //<>//
  gridSizeY = 500 / axiesNumberY; // gridSize = (width/2) / axiesNumber //<>//
  
  graph1Red = int(cp5.get(Textfield.class, "Red").getText());
  graph1Green = int(cp5.get(Textfield.class, "Green").getText());
  graph1Blue = int(cp5.get(Textfield.class, "Blue").getText());
  
  background(200); //<>//
  drawGrid(); //<>//
  drawEquation(); //<>//
  
}
