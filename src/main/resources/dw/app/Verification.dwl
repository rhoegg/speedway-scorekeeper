%dw 2.0

fun checkRacer(rubric: Array, racer: Array): Array = do {
    var racerExtras = racer drop sizeOf(rubric)
    var pairs = (rubric zip racer) 
        map (pair, index) -> { index: index, rubric: pair[0], racer: pair[1]}
    var mismatches = pairs filter (pair) -> pair.rubric != pair.racer
    ---
    mismatches ++ (racerExtras map (racerRow, index) -> {index: index + sizeOf(rubric), racer: racerRow})
}