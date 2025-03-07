%dw 2.0
output application/json
var position = vars.selectedChallenge.formulaOneRecord.position
var round = vars.selectedChallenge.formulaOneRecord.round
var season = vars.selectedChallenge.formulaOneRecord.season
var constructor = vars.selectedChallenge.formulaOneRecord.constructor.name
var driver = vars.selectedChallenge.formulaOneRecord.driver.first ++ " " ++ vars.selectedChallenge.formulaOneRecord.driver.last


var question = vars.selectedChallenge.fact match {
	case "driver" -> 
		"Who finished in position $(position) in round $(round) of $(season)?"
	case "constructor" -> 
		"Who constructed the car that finished in position $(position) in round $(round) of $(season)?"
	case "constructorNationality" -> 
		"What is the constructor nationality of the car that finished in position $(position) in round $(round) of $(season)?"
	case "position" ->
		"What position did $(driver) finish in round $(round) in $(season)?"
}
var answer = vars.selectedChallenge.fact match {
	case "driver" -> 
		driver
	case "constructor" -> 
		constructor
	case "constructorNationality" -> 
		vars.selectedChallenge.formulaOneRecord.constructor.nationality
	case "position" ->
		position
}
---
{
	question: question,
	answer: answer
}
