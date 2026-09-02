# MiniMax H3 video worker for RunPod Serverless
# Models are NOT baked in - they come from the network volume (see extra_model_paths.yaml)

FROM runpod/worker-comfyui:5.1.0-base

# Only one custom node pack is needed: VHS_VideoCombine
RUN comfy-node-install comfyui-videohelpersuite

# Point ComfyUI at the models on the mounted network volume
COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
