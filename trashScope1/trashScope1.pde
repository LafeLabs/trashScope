
import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
int ones, tens, hundreds;
int LF = 10;
int digitIndex = 0;

void setup() 
{
  size(1000, 1000);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 115200);
}

void draw() {
  frameRate(1000);
 
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();         // read it and store it in val
    if(val == 10){
      hundreds = myPort.read() - 48;
      tens = myPort.read() - 48;
      ones = myPort.read()- 48;
      val = ones + 10*tens + 100*hundreds;
      println(val);
      fill(0);
        background(255);

      ellipse(width/2,height/2,val,val);
    }
  }
   myPort.clear();
}


/* Arduino code follows:
int x = 0;

void setup() {
  Serial.begin(115200);
}

void loop() {
  x = analogRead(A5);
  Serial.println(x);
  //delay(5);
}


*/