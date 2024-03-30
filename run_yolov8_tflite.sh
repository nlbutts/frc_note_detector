#!/bin/bash
MLDIR=/home/nlbutts/projects/ml
#cd $MKDIR
export LD_LIBRARY_PATH=$MLDIR/armnn
source $MLDIR/venv/bin/activate && python $MLDIR/yolov8_tflite.py --model $MLDIR/notes_n_320_integer_quant.tflite
