# ollama (gpu)
OLLAMA-GPU-DC = docker-compose-gpu.yml
OLLAMA-GPU-NAME = ollama-gpu


# net-create:
# 	docker network create shared-network;
# net-rm:
# 	docker network rm shared-network;


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


# ollama gpu commands
# docker exec -it ollama_gpu ollama list
# docker exec -it ollama_gpu ollama pull gemma3:4b
# docker exec -it ollama_gpu ollama run gemma3:4b


# docker logs --tail=100 ollama_gpu

# docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama