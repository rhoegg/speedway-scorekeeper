
fun gaussianRandom(mu=0, scale=1) =
	(avg((1 to 12) map random()) - 0.5) * scale + mu

var stations = readUrl("classpath://stations.csv", 'application/csv') map {
	name: $.station,
	temperatureAnchor: gaussianRandom(20, 15)
}

fun randomStation() = stations[randomInt(sizeOf(stations))]