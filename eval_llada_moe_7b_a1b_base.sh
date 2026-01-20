#!/bin/bash

export HF_ALLOW_CODE_EVAL=1
export HF_DATASETS_TRUST_REMOTE_CODE=true


accelerate launch -m lm_eval --model llada_moe \
    --model_args model_path=inclusionAI/LLaDA-MoE-7B-A1B-Base,gen_length=512,steps=512,block_length=512 \
    --tasks gsm8k \
    --num_fewshot 0 \
    --batch_size 8 \
    --output_path ./eval_results/llada_moe_7b_a1b_base \
    --log_samples \
    --confirm_run_unsafe_code
