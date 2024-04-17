# RANS ROS package

## 1. Launch docker container
```bash
cd {/path/to/this/package}
./docker/build_docker.sh
./docker/run_docker.sh
```

## 2. Install dependencies & build package

Install dependencies
```bash
cd /home/ros1_ws
rosdep update && rosdep install --from-paths src -yi
pip3 install cvxpy hydra-core omegaconf mujoco
cd ../thirdparty/rl_games && pip3 install -e .
```

Build package
```bash
cd /home/ros1_ws
mkdir build logs devel
catkin build
```

## 3. Run experiment

<details><summary><b>docking</b></summary>

download weight
```bash
cd /home/ros1_ws/src/rans_ros
wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1M_zCYP5VczzJq0TZ1VaAcsgRxW2v_Wcf' -O runs.zip
unzip runs.zip && rm runs.zip
```

source workspace
```bash
cd /home/ros1_ws
source devel/setup.bash
```

run command
```bash
rosrun rans_ros run_ros.py task=MFP_eval/MFP2D_CloseProximityDock_perturbed \
train=MFP/MFP2D_PPOmulti_dict_MLP_dock hl_task=CloseProximityDock \
checkpoint=/home/ros1_ws/src/rans_ros/runs/MFP2D_perturbed/nn/last_MFP2D_perturbed_ep_2000_rew__126.402306_.pth
```
</details>