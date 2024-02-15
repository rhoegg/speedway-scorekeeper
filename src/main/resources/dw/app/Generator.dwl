import * from dw::core::Arrays

type Station = {name: String, temperatureAnchor: Number}
type Measurement = {station: String, temperature: Number}

fun gaussianRandom(mu=0, scale=1) =
	(avg((1 to 12) map random()) - 0.5) * scale + mu

var stations: Array<Station> = readUrl("classpath://stations.csv", 'application/csv') as Array map {
	name: $.station as String,
	temperatureAnchor: gaussianRandom(20, 15)
}

fun randomStation(): Station = 
	randomStation(sizeOf(stations))
	
fun randomStation(maxUnique: Number): Station =
	(stations take maxUnique)[randomInt(maxUnique)]

fun randomTemperatures(count: Number): Array<Measurement> =
	(1 to count) map do {
		var station = 
			if (count < 100000) randomStation(count / 50) as Station
			else randomStation() as Station
		---
		{
			station: station.name,
			temperature: gaussianRandom(station.temperatureAnchor, 12) as String {format: "#.00000"} as Number
		} as Measurement
	}