## Introduction

This Bash script allows you to obtain current weather data for any location in the world by providing a city name and an OpenWeatherMap API key. The script provides temperature, weather condition, and an ASCII art representation of the weather conditions.

## Getting Started

### Prerequisites

Before using this script, you need to sign up for an OpenWeatherMap API key. You can obtain an API key by creating an account at [OpenWeatherMap](https://openweathermap.org/).

Install jq (command-line JSON processor). If jq is not already installed on your system, you can download and install it from the official website https://jqlang.github.io/jq/download/. For example on Debian/Ubuntu-based

```bash
sudo apt-get install jq
```
### Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/WalidGharianiEAGLE/getweather.git
   ```

2. Navigate to the project directory:

   ```bash
   cd getweather
   ```

3. Make the script executable:

   ```bash
   chmod +x getweather.sh
   ```

## Usage

1. Run the script:

   ```bash
   ./weather.sh
   ```

2. When prompted, enter your OpenWeatherMap API key.

3. Enter the city for which you want to retrieve weather information.

4. The script will display the weather data, including temperature, weather description, and an ASCII art representation of the weather conditions.

```
Enter the city for weather information: Berlin
City: Berlin
Country: DE
Coordinates: [52.5244, 13.4105]
Temperature: 16.56 °C (min: 14.49, max: 18.32)
Humidity: 70 %
Air Pressure: 1012 hPa
Wind: 4.12 m/s SW
Visibility: 10.00 km
Weather: Clear, clear sky
ASCII Art Representation:
🌞🌞
```
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- this project was inspired by wttr.in https://github.com/chubin/wttr.in.
