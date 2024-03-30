
#!/bin/bash
sudo apt update
sudo apt install -y git build-essential ffmpeg locate gstreamer1.0-plugins-bad gstreamer1.0-libav net-tools pipenv libncurses5-dev
sudo apt install -y libssl-dev nano htop python3-opencv tmux cmake libopencv-dev python3-picamera2 gstreamer1.0-tools libffi-dev libprotobuf-dev
sudo apt install -y fd-find git-lfs

git config --global user.email "nlbutts@ieee.org"
git config --global user.name "Nick Butts"

cd $USER
echo "alias ll='ls -al'" >> .profile

mkdir -p $USER/projects
cd $USER/projects

# Get fd, because find sucks
sudo ln -s /usr/bin/fdfind /usr/bin/fd

# Setup wpilib
# Do this in a virtualenv
git clone https://github.com/nlbutts/frc_note_detector.git
mv frc_note_detector ml
cd ml
virtualenv -p python3 venv
source venv/bin/activate
pip install --extra-index-url=https://wpilib.jfrog.io/artifactory/api/pypi/wpilib-python-release-2024/simple robotpy
wget https://github.com/ARM-software/armnn/releases/download/v24.02/ArmNN-linux-aarch64.tar.gz
mkdir armnn
cd armnn
tar -xf ../ArmNN-linux-aarch64.tar.gz

sudo cp systemd/*.service /lib/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable zmqcam
sudo systemctl enable yolov8_tflite

# Setup Python 3.9
#wget https://www.python.org/ftp/python/3.9.19/Python-3.9.19.tar.xz

# Setup the Coral


