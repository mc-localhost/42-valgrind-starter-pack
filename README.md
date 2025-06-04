# 42-valgrind-starter-pack
the simplest setup for checking memory leaks with Valgrind on C/C++ projects at 42

## getting started
clone the repository and run the setup script:

```sh
git clone https://github.com/mc-localhost/42-valgrind-starter-pack
cd 42-valgrind-starter-pack
bash setup.sh
# or if you're using zsh:
zsh setup.sh
```

## then, in any C/C++ project
launch Docker Desktop app (tick Open Docker Dashboard at startup in Docker Desktop settings to launch it automatically on computer startup)

in terminal:
```sh
valgrind-docker # opens Docker shell
make re # re-compiles your project for Linux (if you have a Makefile, obviously)
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./your_executable # checks for leaks
exit # exits Docker shell
```

in **philosophers** project you might wanna do:

```sh
valgrind --tool=helgrind ./your_executable
```

in **minishell** you might want to play with something like `--track-fds=yes `

## advantages compared to dorker or 200 lines of bash script solutions:
- usable from any directory - no need to copy project files or cd to osme specific folder
- you choose which valgrind flags to use since you're basically running the command on your own
- undestandable Dockerfile and installation script - you can build up based on these on your own

if you miss some package, change Dockerfile and run the script again or just do `apt-get` inside your docker shell (but know that it won't be saved once you exit)

## if your Docker Desktop doesn't want to start
(warning! this is a full reset and it will delete all images you have)

```sh
rm -rf ~/Library/Containers/com.docker.docker
rm -rf ~/Library/Containers/com.docker.helper
rm -rf ~/.docker
mkdir -p ~/Library/Containers/com.docker.docker/Data/
chmod -R 755 ~/Library/Containers/com.docker.docker
open -a Docker
```