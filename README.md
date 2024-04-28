# RANS ROS package

## 1. Launch docker container
To run experiments, run docker container.
```bash
cd {/path/to/this/package}
./docker/build_docker.sh
./docker/run_docker.sh
```

## 2. Run experiment

There are three ROS topics communicated here. 

`/vrpn_client_node/FP_exp_RL/pose`: agent's pose \
`/vrpn_client_node/FPB/pose`: goal pose \
`/spacer_floating_platform/valves/input`: output RL action

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
checkpoint=/home/ros1_ws/src/rans_ros/runs/MFP2D_perturbed/nn/docking.pth
```
</details>