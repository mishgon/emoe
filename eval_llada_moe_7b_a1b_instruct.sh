accelerate launch -m lm_eval --model llada \
    --model_args pretrained_model_name_or_path=inclusionAI/LLaDA-MoE-7B-A1B-Instruct,gen_length=512,steps=512,block_length=32 \
    --tasks bbh,gsm8k,math,humaneval,humaneval_infilling,mbpp \
    --apply_chat_template \
    --batch_size 16 \
    --output_path ./eval_results/ \
    --log_samples
