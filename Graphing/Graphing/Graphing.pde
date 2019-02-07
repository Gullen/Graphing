int markerSize = 10;

float pointDiff = 1;

int axiesNumber = 100; //<>//
int gridSize = 500 / axiesNumber; // gridSize = (width/2) / axiesNumber

void drawGrid(){
  // Draw middle grid lines
  line((width / 2), 0, (width / 2), height);
  line(0, (height / 2), width, (height / 2));
  
  // Draw grid lines on x-axis
  for(int i = (axiesNumber * -gridSize); i <= (axiesNumber * gridSize); i+= gridSize){
    line((width / 2) + i, (height / 2) - markerSize, (width / 2) + i, (height / 2) + markerSize);
  }
  
  for (int i = (axiesNumber * -gridSize); i <= (axiesNumber * gridSize); i+= gridSize){
    line((width / 2) - markerSize, (height / 2) + i, (width / 2) + markerSize, (height / 2) + i);
  }
}

void setup(){
  size(1000, 1000);
}

void draw(){
  drawGrid(); //<>//
  drawEquation();
  //line(convertToX(0), convertToY(0), convertToX(5), convertToY(-2)); //<>//
}

float convertToX(float x){
    float xCoordinate = (width / 2);
    
    // For +ve values of x
    for (int count = 0; count < x; count++){
      xCoordinate += gridSize;
    }
    
    // For -ve values of x
    for (int count = 0; count > x; count--){
          xCoordinate -= gridSize;
    }
    return xCoordinate;
}

float convertToY(float y){
  float yCoordinate = (height / 2);
  
  // For +ve vales of y
  for (int count = 0; count < y; count++){
    yCoordinate -= gridSize;
  }
  
  // For -ve values of y
  for (int count = 0; count > y; count--){
    yCoordinate += gridSize;
  }
  return yCoordinate;
}

void drawEquation(){
  // equation (1/100)x^2
    
  for(float x = -axiesNumber; x < axiesNumber; x+= pointDiff){ //<>//
    float x1 = x;
    float y1 = x * x /100;
    float x2 = x + pointDiff;
    float y2 = (x + pointDiff) * (x + pointDiff) /100;
    
    strokeWeight(2);    
    stroke(255, 0, 0);
    
    line(convertToX(x1), convertToY(y1), convertToX(x2), (convertToY(y2))); //<>//
    
    strokeWeight(1);
    stroke(0, 0, 0);
  }
}
