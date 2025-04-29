#include <SPI.h>

const int ssPin = 10;          // Slave Select
const int switchPins[3] = {2, 3, 4}; // Switches para columna (3 bits: 0–7)
const int botonEnvio = 5;      // Botón para enviar jugada

void setup() {
  pinMode(ssPin, OUTPUT);
  digitalWrite(ssPin, HIGH);   // Desactiva esclavo al inicio
  SPI.begin();                 // Inicia SPI como master

  for (int i = 0; i < 3; i++) {
    pinMode(switchPins[i], INPUT_PULLUP);
  }

  pinMode(botonEnvio, INPUT_PULLUP);

  Serial.begin(9600);          // Debug
}

void loop() {
  if (digitalRead(botonEnvio) == LOW) { // Botón presionado (activo en bajo)
    byte valor = leerSwitches();
    enviarJugada(valor);
    delay(500); // Anti-rebote
  }
}

byte leerSwitches() {
  byte jugada = 0;
  for (int i = 0; i < 3; i++) {
    if (digitalRead(switchPins[i]) == LOW) { // switch activado
      jugada |= (1 << i);
    }
  }
  return jugada & 0b00000111; // Asegura que solo se envíen 3 bits
}

void enviarJugada(byte valor) {
  digitalWrite(ssPin, LOW);    // Activar esclavo
  SPI.transfer(valor);         // Enviar jugada
  digitalWrite(ssPin, HIGH);   // Desactivar esclavo

  Serial.print("Jugada enviada: ");
  Serial.println(valor);
}
