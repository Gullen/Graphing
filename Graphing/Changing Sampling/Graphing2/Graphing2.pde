int markerSize = 10;

float pointDiff = 0.1;

int axiesNumber = 10;
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
  drawGrid();
  drawEquation();
  //line(convertToX(0), convertToY(0), convertToX(5.5), convertToY(-2.5));
}

float convertToX(float x){
    int decimalPlaces = checkDecimal(x);
    
    float xCoordinate = (width / 2); //<>//
    
    // For +ve values of x
    for (float count = 0; count < x; count = count + (1*(pow(10, -decimalPlaces)))){ //<>//
      xCoordinate += gridSize * (1*(pow(10, -decimalPlaces))); //<>//
    }
    
    // For -ve values of x
    for (float count = 0; count > x; count = count - (1*(pow(10, -decimalPlaces)))){ //<>//
          xCoordinate -= gridSize * (1*(pow(10, -decimalPlaces))); //<>//
    }
    return xCoordinate; //<>//
}

float convertToY(float y){
  int decimalPlaces = checkDecimal(y);
  
  float yCoordinate = (height / 2); //<>//
  
  // For +ve vales of y
  for (float count = 0; count < y; count = count + (1*(pow(10, -decimalPlaces)))){ //<>//
    yCoordinate -= gridSize * (1*(pow(10, -decimalPlaces))); //<>//
  }
  
  // For -ve values of y
  for (float count = 0; count > y; count = count - (1*(pow(10, -decimalPlaces)))){ //<>//
    yCoordinate += gridSize * (1*(pow(10, -decimalPlaces))); //<>//
  }
  return yCoordinate; //<>//
}

void drawEquation(){
  // equation (1/100)x^2 //<>//
    
    strokeWeight(2);    
    stroke(255, 0, 0);
    
    float count = -axiesNumber;
    
    for (float i = (-axiesNumber / pointDiff); i < (axiesNumber / pointDiff); i++){ //<>//
      
      float x1 = count; //<>//
      float y1 = x1 * x1; //<>//
      
      float x2 = count + pointDiff; //<>//
      float y2 = x2 * x2; //<>//
      
      line(convertToX(x1), convertToY(y1), convertToX(x2), (convertToY(y2))); //<>//
      
      
      count += pointDiff; //<>//
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
