#!/bin/bash
# Lancer les commandes Curl :
test1=$(curl --limit-rate 1k -d '{"champ1":"Value1", "champ2":"value2", "champ3":"value3"}' -H "Content-Type: application/json" -X POST https://site.com/data)
test2=$(curl --limit-rate 1k -d '{"champ1":"Value1", "champ2":"value2", "champ3":"value3"}' -H "Content-Type: application/json" -X POST https://site.com/data)
test3=$(curl --limit-rate 1k -d '{"champ1":"Value1", "champ2":"value2", "champ3":"value3"}' -H "Content-Type: application/json" -X POST https://site.com/data)
test4=$(curl --limit-rate 1k -d '{"champ1":"Value1", "champ2":"value2", "champ3":"value3"}' -H "Content-Type: application/json" -X POST https://site.com/data)
test5=$(curl --limit-rate 1k -d '{"champ1":"Value1", "champ2":"value2", "champ3":"value3"}' -H "Content-Type: application/json" -X POST https://site.com/data)
test6=$(curl --limit-rate 1k -d '{"champ1":"Value1", "champ2":"value2", "champ3":"value3"}' -H "Content-Type: application/json" -X POST https://site.com/data)
test7=$(curl --limit-rate 1k -d '{"champ1":"Value1", "champ2":"value2", "champ3":"value3"}' -H "Content-Type: application/json" -X POST https://site.com/data)
test8=$(curl --limit-rate 1k -d '{"champ1":"Value1", "champ2":"value2", "champ3":"value3"}' -H "Content-Type: application/json" -X POST https://site.com/data)

#Echo les réponses HTTP :
#TEST 1 :
echo $test1
echo "Anti Rate-limiter in progress"
sleep 5

#TEST 2 :
echo $test2
echo "Anti Rate-limiter in progress"
sleep 5

#TEST 3 :
echo $test3
echo "Anti Rate-limiter in progress"
sleep 5

#TEST 4 :
echo $test4
echo "Anti Rate-limiter in progress"
sleep 5

#TEST 5 :
echo $test5
echo "Anti Rate-limiter in progress"
sleep 5

#TEST 6 :
echo $test6
echo "Anti Rate-limiter in progress"
sleep 5

#TEST 7 :
echo $test7
echo "Anti Rate-limiter in progress"
sleep 5

#TEST 8 :
echo $test8
sleep 5
