const int switchPins[3] = {2, 3, 4}; // Pines de los 3 switches
const int buttonPin = 5;            // Botón de envío

void setup() {
  Serial.begin(9600);
  for (int i = 0; i < 3; i++) pinMode(switchPins[i], INPUT);
  pinMode(buttonPin, INPUT);
}

void loop() {
  static bool sent = false;

  if (digitalRead(buttonPin) == HIGH && !sent) {
    byte data = 0;

    // Leer los 3 switches (LSB)
    for (int i = 0; i < 3; i++) {
      if (digitalRead(switchPins[i]) == HIGH)
        data |= (1 << i); // Bits 0,1,2
    }

    data |= (1 << 3); // Bit de confirmación (bit 3)

    Serial.write(data);
    sent = true;
  }

  // Esperar a que se suelte el botón
  if (digitalRead(buttonPin) == LOW)
    sent = false;
}
