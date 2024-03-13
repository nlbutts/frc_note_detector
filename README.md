# frc_note_detector

This is an example to train a Yolov8 network to detect the FRC 2024 Notes.

This repo is used in conjunction with this repo:
https://github.com/nlbutts/ultralytics

## Setup
Setup a virtualenv:

```
virtualenv -p python3 venv_yolov8
. venv_yolov8/bin/activate
pip install ultralytics
```

## Train

To train the network, download the data set. TBD: Still trying to figure out
where to put that.

Make sure you have sourced the virtualenv

`yolo train detect cfg=notes.yaml imgsz=320`

## Test

`yolo detect predict model=best.pt source=<video clip>`

## Export to TFLite

`yolo export model=best.pt format=edgetpu imgsz=320`

## Test TFLite

The YOLOV8-OpenCV-int8-tflite-python directory in the custom Ultralystics repo
has a modifed Python code to support Coral TPUs.

Setup is a little challenging. You will need to follow the directions here:
https://coral.ai/software/

The general steps are listed here:
1) Install the Coral TPU apt source
2) apt-get edgetpu-compiler, libedgetpu1-max, python3-pycoral
3) Manually download the correct tflite version
4) Install older Python (if needed, this is required for Ubuntu 22 and newer)
5) Setup a virtualenv and manually install tflite
6) Run the script below

`python ~/projects/ultralytics/examples/YOLOv8-OpenCV-int8-tflite-Python/main.py --model yolov8n_full_integer_quant_edgetpu.tflite --img bus.jpg --threads 4 --edgetpu`

