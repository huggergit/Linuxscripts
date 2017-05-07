#! /usr/bin/env bash
#set -x 
### unitTest.sh ###
 
source ../functions.sh
 
function testItCanProvideFirstPlayersName () {
    assertEquals 'John' "$(getFirstPlayerFrom 'John - Michael')"
}
 
function testItCanProvideSecondPlayersName () {
	assertEquals 'Michael' "$(getSecondPlayerFrom 'John - Michael')"
}

function testtCanGetScoreForAPlayerWIthOnlyOneWin () {
	standings=$'John - Michael\n\John'
	assertEquals '1' "$(getScoreFor 'John' "$standings")"
}

function testItCanGetScoreForAPlayer () {
	standings=$'John - Michael\nJohn\nMichael\nJohn'
	assertEquals '2' "$(getScoreFor 'John' "$standings")"
}

function testItCanOutputScoreAsInTennisForFirstPoint () {
	assertEquals 'John: 15 - Michael: Love' "$(displayScore 'John' 1 'Michael' 0)"
}

function testItCanOutputScoreAsInTennisForSecondPointFirstPlayer () {
	assertEquals 'John: 30 - Michael: Love' "$(displayScore 'John' 2 'Michael' 0)"
}

function testItCanOutputScoreAsInTennisForThirdPointFirstPlayer () {
	assertEquals 'John: 40 - Michael: Love' "$(displayScore 'John' 3 'Michael' 0)"	
}

function testItCanOutputScoreWhenSecondPlayerWinsFirst3Points () {
    assertEquals 'John: Love - Michael: 15' "$(displayScore 'John' 0 'Michael' 1)"
    assertEquals 'John: Love - Michael: 30' "$(displayScore 'John' 0 'Michael' 2)"
    assertEquals 'John: Love - Michael: 40' "$(displayScore 'John' 0 'Michael' 3)"
}

function testItCanOutputScoreAdvantageForFirstPlayer () {
  assertEquals 'John: Advantage' "$(displayScore 'John' 4 'Michael' 3)" 
}

function testItCanOutputAdvantageForSecondPlayer () {
    assertEquals 'Michael: Advantage' "$(displayScore 'John' 3 'Michael' 4)"
}

function testItCanOutputWinnerForFirstPlayer () {
    assertEquals 'John: Winner' "$(displayScore 'John' 5 'Michael' 3)"
}


## Call and Run all Tests
. "../shunit2"
