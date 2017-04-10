#!/bin/bash
# run the dependency parser
# if you run it without arguments you can see its options
python3 src/tinydepparser.py --train data/nl-train.conll --test data/nl-dev.conll --model modeldir