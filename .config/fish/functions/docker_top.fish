function docker_top
    docker stats --no-stream (docker-compose ps --services )
end
