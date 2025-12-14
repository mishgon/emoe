export HF_ALLOW_CODE_EVAL=1
export HF_DATASETS_TRUST_REMOTE_CODE=true
export TOKENIZERS_PARALLELISM=false
export TORCH_DISTRIBUTED_DEFAULT_TIMEOUT=3600
export NCCL_TIMEOUT=3600
export NCCL_ASYNC_ERROR_HANDLING=1


accelerate launch -m lm_eval --model llada \
    --model_args pretrained_model_name_or_path=inclusionAI/LLaDA-MoE-7B-A1B-Instruct,gen_length=512,steps=512,block_length=32 \
    --tasks bbh,gsm8k,minerva_math,humaneval,mbpp \
    --apply_chat_template \
    --batch_size 8 \
    --output_path ./eval_results/ \
    --log_samples \
    --confirm_run_unsafe_code
