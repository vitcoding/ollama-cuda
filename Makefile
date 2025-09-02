# ollama (gpu)
OLLAMA-GPU-DC = docker-compose-gpu.yml
OLLAMA-GPU-NAME = ollama-gpu
# ollama (cpu)
OLLAMA-CPU-DC = docker-compose-cpu.yml
OLLAMA-CPU-NAME = ollama-cpu


# net-create:
# 	docker network create shared-network;
# net-rm:
# 	docker network rm shared-network;

# default (gpu)
up:
	make up-$(OLLAMA-GPU-NAME)
down:
	make down-$(OLLAMA-GPU-NAME)
stop:
	make stop-$(OLLAMA-GPU-NAME)
start:
	make start-$(OLLAMA-GPU-NAME)

restart:
	make stop
	make start


# ollama (gpu)
# OLLAMA-GPU-NAME = ollama-gpu
create-$(OLLAMA-GPU-NAME):
	docker compose -f $(OLLAMA-GPU-DC) up -d --build --force-recreate
destroy-$(OLLAMA-GPU-NAME):
	docker compose -f $(OLLAMA-GPU-DC) down --rmi all --volumes --remove-orphans
up-$(OLLAMA-GPU-NAME):
	docker compose -f $(OLLAMA-GPU-DC) up -d
down-$(OLLAMA-GPU-NAME):
	docker compose -f $(OLLAMA-GPU-DC) down -v
stop-$(OLLAMA-GPU-NAME):
	docker compose -f $(OLLAMA-GPU-DC) stop
start-$(OLLAMA-GPU-NAME):
	docker compose -f $(OLLAMA-GPU-DC) start


# ollama (cpu)
# OLLAMA-CPU-NAME = ollama-cpu
create-$(OLLAMA-CPU-NAME):
	docker compose -f $(OLLAMA-CPU-DC) up -d --build --force-recreate
destroy-$(OLLAMA-CPU-NAME):
	docker compose -f $(OLLAMA-CPU-DC) down --rmi all --volumes --remove-orphans
up-$(OLLAMA-CPU-NAME):
	docker compose -f $(OLLAMA-CPU-DC) up -d
down-$(OLLAMA-CPU-NAME):
	docker compose -f $(OLLAMA-CPU-DC) down -v
stop-$(OLLAMA-CPU-NAME):
	docker compose -f $(OLLAMA-CPU-DC) stop
start-$(OLLAMA-CPU-NAME):
	docker compose -f $(OLLAMA-CPU-DC) start


ollama-pull:
	docker exec -it ollama_gpu ollama list

### current
# docker exec -it ollama_gpu ollama pull gpt-oss:20b
# docker exec -it ollama_gpu ollama pull qwen3-coder:30b

# docker exec -it ollama_gpu ollama pull llama3.2:3b
# docker exec -it ollama_gpu ollama pull evilfreelancer/enbeddrus
# docker exec -it ollama_gpu ollama pull qwen2.5:7b
# docker exec -it ollama_gpu ollama pull qwen2.5:14b-instruct-q4_1
# docker exec -it ollama_gpu ollama pull qwen2.5-coder:7b
# docker exec -it ollama_gpu ollama pull qwen2.5-coder:14b-instruct-q4_1
# docker exec -it ollama_gpu ollama pull qwen2.5-coder:32b
# docker exec -it ollama_gpu ollama pull qwen3:14b
# docker exec -it ollama_gpu ollama pull gemma2:9b
# docker exec -it ollama_gpu ollama pull gemma2:9b-instruct-q4_1
# docker exec -it ollama_gpu ollama pull gemma3:4b
# docker exec -it ollama_gpu ollama pull gemma3:12b
# docker exec -it ollama_gpu ollama pull llama3.1:8b

### old
# docker exec -it ollama_gpu ollama pull qwen3:8b
# docker exec -it ollama_gpu ollama pull qwen3:8b-q4_K_M
# docker exec -it ollama_gpu ollama pull qwen3:8b-q8_0
# docker exec -it ollama_gpu ollama pull qwen3:14b
# docker exec -it ollama_gpu ollama pull qwen3:14b-q4_K_M
# docker exec -it ollama_gpu ollama pull qwen2.5:7b
# docker exec -it ollama_gpu ollama pull qwen2.5:7b-instruct-q8_0
# docker exec -it ollama_gpu ollama pull qwen2.5:14b-instruct-q4_1
# docker exec -it ollama_gpu ollama pull gemma2:9b
# docker exec -it ollama_gpu ollama pull gemma2:9b-instruct-q4_1
# docker exec -it ollama_gpu ollama pull gemma2:9b-instruct-q8_0
# docker exec -it ollama_gpu ollama pull qwen2.5-coder:7b
# docker exec -it ollama_gpu ollama pull qwen2.5-coder:7b-instruct-q8_0
# docker exec -it ollama_gpu ollama pull qwen2.5-coder:14b
# docker exec -it ollama_gpu ollama pull qwen2.5-coder:14b-instruct-q4_0
# docker exec -it ollama_gpu ollama pull qwen2.5-coder:14b-instruct-q4_1
# docker exec -it ollama_gpu ollama pull qwen2.5-coder:14b-instruct-q6_K
# docker exec -it ollama_gpu ollama pull qwen2.5-coder:32b-instruct-q4_1
# docker exec -it ollama_gpu ollama pull llama2-uncensored:7b
# docker exec -it ollama_gpu ollama pull llama2-uncensored:7b-chat-q8_0
# docker exec -it ollama_gpu ollama pull llama3.1:8b
# docker exec -it ollama_gpu ollama pull llama3.1:8b-instruct-q8_0
# docker exec -it ollama_gpu ollama pull codellama:13b
# docker exec -it ollama_gpu ollama pull llama3.2-vision:11b

# docker exec -it ollama_gpu ollama pull llama3.2:3b
# docker exec -it ollama_gpu ollama pull evilfreelancer/enbeddrus

# docker exec -it ollama_gpu ollama pull gemma3:4b
# docker exec -it ollama_gpu ollama pull gemma3:12b
# docker exec -it ollama_gpu ollama pull gemma3:12b-it-q8_0
# docker exec -it ollama_gpu ollama pull gemma3:12b-it-fp16
# docker exec -it ollama_gpu ollama pull gemma3:27b-it-qat


###
# ollama gpu commands
# docker exec -it ollama_gpu ollama list
# docker exec -it ollama_gpu ollama pull gemma3:4b
# docker exec -it ollama_gpu ollama run gemma3:4b


# docker logs --tail=100 ollama_gpu

# docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama