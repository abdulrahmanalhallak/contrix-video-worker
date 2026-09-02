# MiniMax H3 video worker for RunPod Serverless
# Models are NOT baked in - they come from the network volume (see extra_model_paths.yaml)

FROM runpod/worker-comfyui:5.10.0-base

# 5.10.0 ships ComfyUI 0.34.0, which is what MiniMaxH3ReferenceToVideo needs.
# VHS_VideoCombine is the only custom node the workflow uses. comfy-node-install
# silently produced an image without it, so clone it explicitly instead.
RUN cd /comfyui/custom_nodes \
 && git clone --depth 1 https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git \
 && pip install --no-cache-dir -r ComfyUI-VideoHelperSuite/requirements.txt \
 && test -f ComfyUI-VideoHelperSuite/__init__.py

# Point ComfyUI at the models on the mounted network volume
COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
