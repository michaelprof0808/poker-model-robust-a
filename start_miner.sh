#!/usr/bin/env bash
set -euo pipefail
cd /opt/poker-model-robust-a
export PYTHONPATH=/opt/poker-model-robust-a
export POKER44_MODEL_PATH=${POKER44_MODEL_PATH:-/opt/poker-model-robust-a/models/poker-model-robust-a.joblib}
# HSP guard: native trained remap was selected for low FPR; keep batch-rank OFF unless emergency live FPR penalty appears.
export POKER44_BATCH_RANK=${POKER44_BATCH_RANK:-0}
export POKER44_BATCH_RANK_TARGET_FRACTION=${POKER44_BATCH_RANK_TARGET_FRACTION:-0.08}
export POKER44_BATCH_RANK_SPAN=${POKER44_BATCH_RANK_SPAN:-0.80}
export POKER44_EMERGENCY_TOPK=${POKER44_EMERGENCY_TOPK:-1}
export POKER44_EMERGENCY_TOPK_COUNT=${POKER44_EMERGENCY_TOPK_COUNT:-1}
export POKER44_EMERGENCY_TOPK_MIN_N=${POKER44_EMERGENCY_TOPK_MIN_N:-10}
export POKER44_MODEL_NAME=${POKER44_MODEL_NAME:-poker-model-robust-a}
export POKER44_MODEL_VERSION=${POKER44_MODEL_VERSION:-4.1-a}
export POKER44_MODEL_REPO_URL=${POKER44_MODEL_REPO_URL:-https://github.com/michaelprof0808/poker-model-robust-a}
export POKER44_MODEL_REPO_COMMIT=${POKER44_MODEL_REPO_COMMIT:-$(git -C /opt/poker-model-robust-a rev-parse HEAD 2>/dev/null || true)}
export POKER44_MODEL_ARTIFACT_SHA256=${POKER44_MODEL_ARTIFACT_SHA256:-363942310ae68d18477c2ed100e757fce5d8af9272a1f33fd35b6598245a8e06}
exec /opt/poker-model-robust-a/.venv/bin/python neurons/miner.py --netuid 126 --wallet.name poker --wallet.hotkey sn126_1 --subtensor.network finney --neuron.name poker-model-robust-a --axon.port 8195 --blacklist.force_validator_permit
