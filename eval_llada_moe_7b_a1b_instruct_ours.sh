#!/bin/bash

export HF_ALLOW_CODE_EVAL=1
export HF_DATASETS_TRUST_REMOTE_CODE=true

# All tasks: --tasks bbh,gsm8k,minerva_math,humaneval_instruct,mbpp
accelerate launch -m lm_eval --model llada_moe \
    --model_args model_path=./LLaDA-MoE-7B-A1B-Instruct-Ours,gen_length=512,steps=512,block_length=32 \
    --tasks gsm8k \
    --apply_chat_template \
    --batch_size 8 \
    --output_path ./eval_results/llada_moe_7b_a1b_instruct_ours \
    --log_samples \
    --confirm_run_unsafe_code