#include "esp_camera.h"
#include <WiFi.h>
#include <Servo.h>

// ===========================
// Configuración del modelo de cámara
// ===========================
#define CAMERA_MODEL_ESP_EYE
#include "camera_pins.h"

// ===========================
// Credenciales de WiFi
// ===========================
const char *ssid = "NETLIFE-SANCHEZ";
const char *password = "kd200421";

// ===========================
// Pines para servos y motor
// ===========================
#define SERVO1_PIN 12  // GPIO para Servo 1
#define SERVO2_PIN 13  // GPIO para Servo 2
#define SERVO3_PIN 14  // GPIO para Servo 3
#define MOTOR_PIN 15   // GPIO para motor de la banda transportadora

// Inicialización de servos
Servo servo1, servo2, servo3;

void startCameraServer();
void setupLedFlash(int pin);

// ===========================
// Configuración inicial
// ===========================
void setup() {
  Serial.begin(115200);
  Serial.println();

  // Inicializar cámara
  camera_config_t config;
  config.ledc_channel = LEDC_CHANNEL_0;
  config.ledc_timer = LEDC_TIMER_0;
  config.pin_d0 = Y2_GPIO_NUM;
  config.pin_d1 = Y3_GPIO_NUM;
  config.pin_d2 = Y4_GPIO_NUM;
  config.pin_d3 = Y5_GPIO_NUM;
  config.pin_d4 = Y6_GPIO_NUM;
  config.pin_d5 = Y7_GPIO_NUM;
  config.pin_d6 = Y8_GPIO_NUM;
  config.pin_d7 = Y9_GPIO_NUM;
  config.pin_xclk = XCLK_GPIO_NUM;
  config.pin_pclk = PCLK_GPIO_NUM;
  config.pin_vsync = VSYNC_GPIO_NUM;
  config.pin_href = HREF_GPIO_NUM;
  config.pin_sccb_sda = SIOD_GPIO_NUM;
  config.pin_sccb_scl = SIOC_GPIO_NUM;
  config.pin_pwdn = PWDN_GPIO_NUM;
  config.pin_reset = RESET_GPIO_NUM;
  config.xclk_freq_hz = 20000000;
  config.frame_size = FRAMESIZE_UXGA;
  config.pixel_format = PIXFORMAT_JPEG;
  config.grab_mode = CAMERA_GRAB_WHEN_EMPTY;
  config.fb_location = CAMERA_FB_IN_PSRAM;
  config.jpeg_quality = 12;
  config.fb_count = 1;

  esp_err_t err = esp_camera_init(&config);
  if (err != ESP_OK) {
    Serial.printf("Error iniciando la cámara: 0x%x", err);
    return;
  }

  // Configuración de servos
  servo1.attach(SERVO1_PIN);
  servo2.attach(SERVO2_PIN);
  servo3.attach(SERVO3_PIN);

  // Inicializar motor
  pinMode(MOTOR_PIN, OUTPUT);
  digitalWrite(MOTOR_PIN, LOW); // Motor apagado inicialmente

  // Conectar a WiFi
  WiFi.begin(ssid, password);
  Serial.print("Conectando a WiFi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("\nConectado a WiFi");
  Serial.print("Dirección IP: ");
  Serial.println(WiFi.localIP());

  // Iniciar servidor de cámara
  startCameraServer();
}

// ===========================
// Lógica principal
// ===========================
void loop() {
  // Simular clasificación (prueba inicial)
  int material_detectado = random(0, 4); // 0: Nada, 1: Plástico, 2: Vidrio, 3: Cartón

  if (material_detectado == 1) {
    Serial.println("Material detectado: Plástico");
    servo1.write(90);  // Mueve Servo 1
    delay(1000);
    servo1.write(0);   // Regresa
  } else if (material_detectado == 2) {
    Serial.println("Material detectado: Vidrio");
    servo2.write(90);  // Mueve Servo 2
    delay(1000);
    servo2.write(0);   // Regresa
  } else if (material_detectado == 3) {
    Serial.println("Material detectado: Cartón");
    servo3.write(90);  // Mueve Servo 3
    delay(1000);
    servo3.write(0);   // Regresa
  }

  // Activar banda transportadora
  Serial.println("Banda transportadora activada");
  digitalWrite(MOTOR_PIN, HIGH); // Motor encendido
  delay(3000);
  digitalWrite(MOTOR_PIN, LOW);  // Motor apagado

  delay(5000); // Esperar antes del siguiente ciclo
}
