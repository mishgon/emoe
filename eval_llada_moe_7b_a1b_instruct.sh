export HF_ALLOW_CODE_EVAL=1
export HF_DATASETS_TRUST_REMOTE_CODE=true


accelerate launch -m lm_eval --model llada \
    --model_args pretrained_model_name_or_path=inclusionAI/LLaDA-MoE-7B-A1B-Instruct,gen_length=512,steps=512,block_length=32 \
    --tasks bbh,gsm8k,minerva_math,humaneval,mbpp \
    --apply_chat_template \
    --batch_size 8 \
    --output_path ./eval_results/ \
    --log_samples \
    --confirm_run_unsafe_code
