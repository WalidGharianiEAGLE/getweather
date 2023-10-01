#!/bin/bash

# get a specific field
get_field() {
  jq -r "$2" <<< "$1"
}

extract_weather_data() {
  local weather_data="$1"
  city=$(get_field "$weather_data" '.name')
  country=$(get_field "$weather_data" '.sys.country')
  lat=$(get_field "$weather_data" '.coord.lat')
  lon=$(get_field "$weather_data" '.coord.lon')
  temp=$(get_field "$weather_data" '.main.temp')
  temp_min=$(get_field "$weather_data" '.main.temp_min')
  temp_max=$(get_field "$weather_data" '.main.temp_max')
  humidity=$(get_field "$weather_data" '.main.humidity')
  pressure=$(get_field "$weather_data" '.main.pressure')
  wind=$(get_field "$weather_data" '.wind.speed')
  wind_degr=$(get_field "$weather_data" '.wind.deg')
  visibility_meter=$(get_field "$weather_data" '.visibility')
  visibility_km=$( bc -l <<< "scale=2; ($visibility_meter /1000)")
  sky_main=$(get_field "$weather_data" '.weather[0].main')
  sky_desc=$(get_field "$weather_data" '.weather[0].description')
}

get_wind_orientation(){
  wind_run=$( bc -l <<< "scale=2; ($wind_degr /22.5)")
  wind_run_int=${wind_run%.*}
  orientation=("N" "NNE" "NE" "ENE" "E" "ESE" "SE" "SSE" "S" "SSW" "SW" "WSW" "W" "WNW" "NW" "NNW" "N")
  compass_direction="${orientation[$wind_run_int]}"
}

display_weather_data() {
  echo "City: $city"
  echo "Country: $country"
  echo "Coordinates: [$lat, $lon]"
  echo "Temperature: $temp °C (min: $temp_min, max: $temp_max)"
  echo "Humidity: $humidity %"
  echo "Air Pressure: $pressure hPa"
  echo "Wind: $wind m/s $compass_direction"
  echo "Visibility: $visibility_km km"
  echo "Weather: $sky_main, $sky_desc"
}

map_weather_to_ascii() {
    case "$1" in
        "Thunderstorm") echo "⚡️🌩️⛈️" ;;
        "Drizzle") echo "🌧️🌦️" ;;
        "Rain") echo "🌧️☔️" ;;
        "Snow") echo "❄️⛄" ;;
        "Mist") echo "🌫️🌁" ;;
        "Smoke") echo "🌫️🔥" ;;
        "Haze") echo "🌫️🏞️" ;;
        "Fog") echo "🌫️🌁" ;;
        "Sand") echo "🌫️🏜️" ;;
        "Dust") echo "🌫️💨" ;;
        "Ash") echo "🌫️🌋" ;;
        "Squall") echo "🌧️💨" ;;
        "Tornado") echo "🌪️🌊" ;;
        "Clear") echo "🌞🌞" ;;
        "Clouds") echo "☁️☁️☁️" ;;
        *) echo "🤷‍♂️" ;;
    esac
}

# Function to get weather information
get_weather() {
  config_file="config.txt"
  # Check if the API key is already set in the environment variable
  if [ -z "$OPENWEATHERMAP_API_KEY" ]; then
    if [ -f "$config_file" ]; then
      source "$config_file"
      echo "Using the stored API key from '$config_file'."
    else
      echo "You need an OpenWeatherMap API key to use this script."
      echo "You can obtain an API key by signing up for an account at https://openweathermap.org/."
      read -p "Enter your OpenWeatherMap API key: " api_key
      echo "OPENWEATHERMAP_API_KEY=\"$api_key\"" > "$config_file"
      export OPENWEATHERMAP_API_KEY="$api_key"
      echo "API key has been stored in '$config_file' and will be used for future sessions."
    fi
  fi

  read -p "Enter the city for weather information: " city
  units="metric"  # Change to Fahrenheit if needed

  weather_data=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$city&units=$units&appid=$OPENWEATHERMAP_API_KEY")

  # Extract weather information and pass it to extract_weather_data
  extract_weather_data "$weather_data"
  get_wind_orientation
  display_weather_data
  # Map the weather description to ASCII art
  weather_ascii=$(map_weather_to_ascii "$sky_main")
  echo "ASCII Art Representation:"
  echo "$weather_ascii"
}

main() {
  get_weather
}

main
