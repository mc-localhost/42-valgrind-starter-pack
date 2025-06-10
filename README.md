# 42-valgrind-starter-pack
The simplest setup for checking memory leaks with Valgrind on C/C++ projects at 42

## Getting Started (only do it once)
Clone the repository and run the setup script:

If you're normally using zsh:
```sh
git clone https://github.com/mc-localhost/42-valgrind-starter-pack
cd 42-valgrind-starter-pack
zsh setup.sh
```

If you're using bash:
```sh
git clone https://github.com/mc-localhost/42-valgrind-starter-pack
cd 42-valgrind-starter-pack
bash setup.sh
```

## How to Use
1. Launch Docker Desktop app (tick **Open Docker Dashboard at startup** in **Docker Desktop settings** to launch it automatically on computer startup).

2. Go to your C/C++ project folder. Or don't. You can do it from Docker shell later as well.

3. In terminal:
```sh
valgrind-docker # opens Docker shell
make re # re-compiles your project for Linux (if you have a Makefile, obviously)
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./your_executable # checks for leaks
exit # exits Docker shell
```

Always run `make re` to re-compile your project inside Docker, especially if you previously compiled on macOS. This ensures compatibility with the Linux environment.

### Project-Specific Tips

In **philosophers** project you might wanna do:
```sh
valgrind --tool=helgrind ./your_executable
```

In **minishell** you might want to play with something like `--track-fds=yes`.

In **graphical projects** (so_long, miniRT, etc.) you should use something else, as this is a headless environment that cannot display your beautiful 2D/3D stuff.
In that case and for the exams, consider these alternatives:

**system leaks**
```c
#include <stdlib.h>

void	leaks(void)
{
	system("leaks your_executable");

}
int main(void)
{
    atexit(leaks);
    // your code here
    return (0);
}
```

**address sanitizer:**
```sh
gcc -fsanitize=address -g your_file.c -o your_executable
./your_executable
```

## Advantages Compared to Dorker or 200 Lines of Bash Script Solutions:
- Usable from any directory — no need to copy project files or cd to some specific folder
- You choose which valgrind flags to use since you're basically running the command on your own
- Understandable Dockerfile and installation script — you can build up based on these on your own

If you miss some package, change Dockerfile and run setup.sh again or just do `apt-get` inside your Docker shell (but know that it won't be saved once you exit)

## If Your Docker Desktop Doesn't Want to Start
**(Warning! This is a full reset and it will delete all images you have)**

```sh
rm -rf ~/Library/Containers/com.docker.docker
rm -rf ~/Library/Containers/com.docker.helper
rm -rf ~/.docker
mkdir -p ~/Library/Containers/com.docker.docker/Data/
chmod -R 755 ~/Library/Containers/com.docker.docker
open -a Docker
```