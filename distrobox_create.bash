# https://github.com/kyuz0/amd-strix-halo-toolboxes?tab=readme-ov-file
sudo usermod -aG video,render $USER
distrobox create llama-rocm-7.2 \
  --image docker.io/kyuz0/amd-strix-halo-toolboxes:rocm-7.2 \
  -- --device /dev/dri --device /dev/kfd --group-add video --group-add render --group-add sudo --security-opt seccomp=unconfined

distrobox enter llama-rocm-7.2
# https://huggingface.co/Qwen/Qwen3-Coder-Next-GGUF?local-app=llama.cpp
llama-server -hf Qwen/Qwen3-Coder-Next-GGUF:latest -c 262144 -ngl 999 -fa 1 --no-mmap  # F16
# llama-server -hf Qwen/Qwen3-Coder-Next-GGUF:Q8_0 -c 262144 -ngl 999 -fa 1 --no-mmap  # Q8
