I have a helper function to nuke everything so that our Continuous blah, cycle can be tested, erm... continuously. Basically it boils down to the following:

To clear containers:

docker rm -f $(docker ps -a -q)

To clear images:

docker rmi -f $(docker images -a -q)

To clear volumes:

docker volume rm $(docker volume ls -q)

To clear networks:

docker network rm $(docker network ls | tail -n+2 | awk '{if($2 !~ /bridge|none|host/){ print $1 }}')