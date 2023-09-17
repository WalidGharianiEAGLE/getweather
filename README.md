## Introduction

This Bash script allows you to obtain current weather data for any location in the world by providing a city name and an OpenWeatherMap API key. The script provides temperature, weather condition, and an ASCII art representation of the weather conditions.

## Getting Started

### Prerequisites

Before using this script, you need to sign up for an OpenWeatherMap API key. You can obtain an API key by creating an account at [OpenWeatherMap](https://openweathermap.org/).

### Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/WalidGharianiEAGLE/getweather.git
   ```

2. Navigate to the project directory:

   ```bash
   cd weather-info-script
   ```

3. Make the script executable:

   ```bash
   chmod +x weather.sh
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
Temperature: 26.72 °C (min: 25.55, max: 28.9)
Air Pressure: 1003
Humidity: 49
Weather: Clear, clear sky
ASCII Art Representation:
🌞🌞
```
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- this project was inspired by wttr.in https://github.com/chubin/wttr.in.
