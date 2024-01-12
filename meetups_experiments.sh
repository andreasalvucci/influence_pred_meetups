#!/bin/bash

for i in {1..2}
do
  echo "communicability degree: $i"
  for exp in {1..5}
  do
    echo "esperimento $exp"
    for model in uniform frequency inverse-frequency fit dnn
    do
      python main.py \
        -m $model \
        -i resources/meetups_20.ttl \
        -tp "http://w3id.org/polifonia/ontology/meetups-ontology#hasParticipant" \
        -ip "http://w3id.org/polifonia/ontology/meetups-ontology#hasRole" \
        --device "cpu" \
        -d $i \
        -it 300 \
        -o "meetups_experiments/$model.$i.$exp.json"
    done
  done
done