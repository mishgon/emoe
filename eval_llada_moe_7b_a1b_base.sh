export HF_ALLOW_CODE_EVAL=1
export HF_DATASETS_TRUST_REMOTE_CODE=true
export TOKENIZERS_PARALLELISM=false
export TORCH_DISTRIBUTED_DEFAULT_TIMEOUT=3600
export NCCL_TIMEOUT=3600
export NCCL_ASYNC_ERROR_HANDLING=1
export NCCL_DEBUG=INFO


accelerate launch -m lm_eval --model llada \
    --model_args pretrained_model_name_or_path=inclusionAI/LLaDA-MoE-7B-A1B-Base,gen_length=1024,steps=1024,block_length=1024 \
    --tasks bbh,gsm8k,math,humaneval,mbpp \
    --batch_size 8 \
    --output_path ./eval_results/ \
    --log_samples \
    --confirm_run_unsafe_code
