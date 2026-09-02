# contrix-video-worker

RunPod Serverless worker image for MiniMax H3 video generation.

The image carries **only** ComfyUI plus the one custom node the workflow needs
(`VideoHelperSuite`). The ~67 GB of model weights are **not** baked in — they are
read from the `Contrix-Video` network volume, which mounts at `/runpod-volume`.
`extra_model_paths.yaml` is what points ComfyUI at them.

## Endpoint setup

- Build from this repo
- Attach network volume **Contrix-Video** (EUR-IS-1)
- `min workers = 0`
- GPU priority: RTX 5090 → RTX PRO 4500 → RTX 4090

## Request

Send the workflow API JSON under `input.workflow` and the reference image under
`input.images`. Parameters injected per request: prompt, width, height, length
(must be `17k + 5` frames), seed.
