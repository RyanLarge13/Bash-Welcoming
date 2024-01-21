#!bin bash


echo "*** Weather Today ***"

weatherData=$(curl -s 'https://api.open-meteo.com/v1/forecast?latitude=42.88&longitude=-78.87&daily=weather_code,temperature_2m_max,temperature_2m_min,uv_index_max,wind_speed_10m_max&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch&timezone=America%2FNew_York')

highTemp=$(echo "$weatherData" | jq -r '.daily.temperature_2m_max[0]')
lowTemp=$(echo "$weatherData" | jq -r '.daily.temperature_2m_min[0]')

echo "High: $highTemp °F"
echo "Low: $lowTemp °F"
