accelerate launch -m lm_eval --model llada \
    --model_args pretrained_model_name_or_path=inclusionAI/LLaDA-MoE-7B-A1B-Base,gen_length=1024,steps=1024,block_length=1024 \
    --tasks gsm8k \
    --batch_size 16