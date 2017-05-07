#! /usr/bin/env bash
 
### acceptanceTest.sh ###
 
function testItCanProvideAllTheScores () {
    cd ..
    ./tennisGame.sh ./input.txt > ./results.txt
    diff ./output.txt ./results.txt
    assertTrue 'Expected output differs.' $?
}
 
## Call and Run all Tests
. "../shunit2"
