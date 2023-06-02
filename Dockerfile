FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y curl

RUN useradd -u 1000 -m docker-user

# Install arduino-cli
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

# ESP requirements
COPY arduino-cli.yml /root/.arduino15/
RUN apt-get install -y python-is-python3 pip
RUN pip install esptool

RUN arduino-cli core update-index
RUN arduino-cli core install esp32:esp32
RUN arduino-cli core install esp8266:esp8266

# Arduino requirements
RUN arduino-cli lib install autowp-mcp2515;
RUN arduino-cli core install arduino:avr;
