%dw 2.0
import * from dw::core::Arrays

fun checkRacer(rubric: Array, racer: Array): Array = do {
    var racerExtras = racer drop sizeOf(rubric)
    var pairs = (rubric zip racer) 
        map (pair, index) -> { index: index, rubric: pair[0], racer: pair[1]}
    var tolerance = Mule::p("challenge.1brc.tolerance") as Number
    var mismatches = pairs filter (pair) -> 
    	pair.rubric.station != pair.racer.station
    	or
    	abs(pair.rubric.temperature - pair.racer.temperature) > tolerance
    ---
    mismatches ++ (racerExtras map (racerRow, index) -> {index: index + sizeOf(rubric), racer: racerRow})
}