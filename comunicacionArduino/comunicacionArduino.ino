#include <SPI.h>

const int ssPin = 10;          // Slave Select
const int switchPins[3] = {2, 3, 4}; // Switches para columna (3 bits: 0–7)
const int botonEnvio = 5;      // Botón para enviar jugada
const int enviado = 6;
const int mosiPin = 11;
const int spi_clk = 13;

void setup() {
  pinMode(ssPin, OUTPUT);
  pinMode(enviado, OUTPUT);
  pinMode(mosiPin, OUTPUT);
  pinMode(spi_clk, OUTPUT);
  digitalWrite(ssPin, HIGH);   // Desactiva esclavo al inicio
  //SPI.begin();                 // Inicia SPI como master

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

//void enviarJugada(byte valor) {
//  SPI.beginTransaction(SPISettings(1000000, MSBFIRST, SPI_MODE0));
//  digitalWrite(ssPin, LOW);    // Activar esclavo
//  digitalWrite(enviado, HIGH);
//  SPI.transfer(valor);         // Enviar jugada
//  digitalWrite(ssPin, HIGH);   // Desactivar esclavo
//  digitalWrite(enviado,LOW);
//  SPI.endTransaction();
//
//  Serial.print("Jugada enviada: ");
//  Serial.println(valor);
//}

void enviarJugada(byte valor) {
  for (int i = 2; i >= 0; i--) { // Envía bit 2, 1, 0

    bool bitVal = (valor >> i) & 1;
    if (bitVal) {
      digitalWrite(ssPin, LOW);
      digitalWrite(mosiPin, HIGH);
      delay(1);
      digitalWrite(ssPin,HIGH);
      Serial.print("Enviado bit: ");
      Serial.println(bitVal);
    } else {
      digitalWrite(ssPin, LOW);
      digitalWrite(mosiPin, LOW);
      delay(1);
      digitalWrite(ssPin,HIGH);
      Serial.print("Enviado bit: ");
      Serial.println(bitVal);
    }
    delay(10);
    digitalWrite(spi_clk, HIGH);  // Pulso de reloj
    delay(10);
    digitalWrite(spi_clk, LOW);
  }

  // Puedes limpiar línea de datos después de enviar
  //digitalWrite(mosiPin, LOW);

  Serial.print("Jugada enviada: ");
  Serial.println(valor);
}
