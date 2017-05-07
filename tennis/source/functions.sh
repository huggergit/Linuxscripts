#! /usr/bin/env bash
### functions.sh ###

function getFirstPlayerFrom () { 
  echo "$1" | sed -e 's/ -.*//'
}

function getSecondPlayerFrom () {
  echo "$1" | sed -e 's/.*- //'
}

function getScoreFor () {
	player="${1}"
	standings="${2}"
	totalMatches=$(echo "$standings" | grep -c "$player" )
	echo $((totalMatches-1))
}

function displayScore () {
    firstPlayerName="${1}"; firstPlayerScore="${2}"
    secondPlayerName="${3}"; secondPlayerScore="${4}"
 
    if outOfRegularScore "$firstPlayerScore" "$secondPlayerScore"; then
        checkEquality "$firstPlayerScore" "$secondPlayerScore"
        checkAdvantageFor "$firstPlayerName" "$firstPlayerScore" "$secondPlayerScore"
        checkAdvantageFor "$secondPlayerName" "$secondPlayerScore" "$firstPlayerScore"
    else
        echo "${1}: $(convertToTennisScore "${2}") - ${3}: $(convertToTennisScore "${4}")"
    fi
}
 
function checkAdvantageFor () {
    if [ "${2}" -gt "${3}" ]; then
        if [[ $((${2} - ${3})) -gt 1 ]]; then
            echo "${1}: Winner"
        else
            echo "${1}: Advantage"
        fi
    fi
}

function outOfRegularScore () {
    [ "${1}" -gt 2 ] && [ "${2}" -gt 2 ]
    return $?
}
 
function checkEquality () {
    if [ "${1}" -eq "${2}" ]; then
        echo "Deuce"
    fi
}
 
function checkFirstPlayerAdv () {
    if [ "${2}" -gt "${3}" ]; then
        echo "${1}: Advantage"
    fi
}

function convertToTennisScore () {
   declare -a scoreMap=('Love' '15' '30' '40')
    echo "${scoreMap["${1}"]}"
}
