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
# inside docker shell
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
source workspace
```bash
source devel/setup.bash
```

docking
```bash
rosrun rans_ros run_ros.py task=MFP_eval/MFP2D_CloseProximityDock_perturbed \
train=MFP/MFP2D_PPOmulti_dict_MLP_dock hl_task=CloseProximityDock \
checkpoint=/home/ros1_ws/src/rans_ros/runs/MFP2D_perturbed/nn/last_MFP2D_perturbed_ep_2000_rew__126.402306_.pth
```