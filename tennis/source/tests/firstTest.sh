#! /usr/bin/env bash
 
### firstTest.sh ###
 
function testWeCanWriteTests () {
    assertEquals "it works" "it does not work"
}
 
## Call and Run all Tests
. "../shunit2"