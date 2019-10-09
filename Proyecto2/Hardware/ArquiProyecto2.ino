#include <WiFiEsp.h>
#include <PubSubClient.h>
#include <Servo.h>

#ifndef HAVE_HWSERIAL1
#include "SoftwareSerial.h"
SoftwareSerial serial1(10, 11); // RX, TX
#endif   

const char* ssid = "AndroidAPFAC7";
const char* password = "iwau2541";
const char* mqttServer = "3.83.223.148";
const int mqttPort = 11079;
const char* mqttUser = "user1";
const char* mqttPassword = "0000";
const int waterFlowSensorPin = 2;
const int servoPin = 4;

WiFiEspClient espClient;
PubSubClient client(espClient);
Servo servo;

int status = WL_IDLE_STATUS; 

volatile int rpmCounter = 0;
int waterFlow = 0;
String mqttPayload;
char messageWaterFlow[10];

void setup_wifi() {

  delay(10);
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  /*while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("Connecting to WiFi..");
  }  */ 

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void callback(char* topic, byte* payload, unsigned int length) { 
  Serial.print("Message arrived in topic: ");
  Serial.println(topic);
 
  Serial.print("Message:");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
    mqttPayload += ((char)payload[i]);
  }
 
  Serial.println();
  Serial.println("-----------------------"); 

  /*if (String(topic) == "/arqui/waterflow"){
    if (mqttPayload == "1") {
      servo.write(90);
    } else {
      servo.write(0);
    }
  }*/

  mqttPayload = "";
}

void reconnect() {
  uint8_t retries = 3;
  
  while (!client.connected()) {
    Serial.print("Intentando conexion MQTT...");   
    
    if (client.connect("ESP8266Client", mqttUser, mqttPassword)) {
      Serial.println("conectado");
      client.subscribe("/arqui/waterflow");
    } else {
      Serial.print("fallo, rc=");
      Serial.print(client.state());
      Serial.println(" intenta nuevamente en 5 segundos");
      delay(5000);
    }
    retries--;
    if (retries == 0) {
      while (1);
    }
  }
}

void rpm() {
  rpmCounter++;
}

void setup() {    

  pinMode(waterFlowSensorPin, INPUT);  
  pinMode(servoPin, OUTPUT);
  servo.attach(servoPin);
  attachInterrupt(digitalPinToInterrupt(waterFlowSensorPin), rpm, RISING);
  
  Serial.begin(9600);
  serial1.begin(9600);
  // initialize ESP module
  WiFi.init(&serial1);
  setup_wifi();
  client.setServer(mqttServer, mqttPort);
  client.setCallback(callback);

  while (!client.connected()) {
    Serial.println("Connecting to MQTT...");
 
    if (client.connect("ESP8266Client", mqttUser, mqttPassword )) { 
      Serial.println("connected");  
 
    } else { 
      Serial.print("failed with state ");
      Serial.print(client.state());
      delay(2000); 
    }
  }

  client.subscribe("/arqui/waterflow");
}

void loop() {

  if (!client.connected()) {
    Serial.println("Disconnected");
    reconnect();
  }  
  client.loop();
  
  waterFlow = ((rpmCounter * 60) / 7.5 );
  rpmCounter = 0;   

  sprintf(messageWaterFlow, "%d", waterFlow);   
  client.publish("/arqui/waterflow", messageWaterFlow);
  
  delay(100);
 
}
