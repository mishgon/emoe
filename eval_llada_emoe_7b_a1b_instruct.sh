#!/bin/bash

export HF_ALLOW_CODE_EVAL=1
export HF_DATASETS_TRUST_REMOTE_CODE=true

# All tasks: --tasks bbh,gsm8k,minerva_math,humaneval_instruct,mbpp
accelerate launch -m lm_eval --model llada_emoe \
    --model_args model_path=./LLaDA-EMoE-7B-A1B-Instruct,gen_length=512,steps=512,block_length=32 \
    --tasks gsm8k \
    --apply_chat_template \
    --num_fewshot 0 \
    --batch_size 8 \
    --output_path ./eval_results/llada_emoe_7b_a1b_instruct \
    --log_samples \
    --confirm_run_unsafe_code
