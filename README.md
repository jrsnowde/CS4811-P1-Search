# Programming Project P1 : Search


## Contributing
To clone this project: 
```shell
    git clone git@github.com:jlammilliman/CS4811-P1-Search.git
```
"When you approach a door, pull before you push" --Somebody, probably


## Pacman
YOU CAN PLAY PACMAN WITH THIS:
```shell
    python pacman.py
```

... to test the agents, you can run any of the following commands:
```shell
    python pacman.py --layout testMaze --pacman GoWestAgent
```
```shell
    python pacman.py --layout tinyMaze --pacman GoWestAgent
```

## Layouts
See the `/layouts` directory for all of the possible maps. You can run pacman with any given layout using `--layout <'layout_file_name' - '.lay'>`


## Notes
1). Add any notes about the project in here, like how to run this, manipulate with git, etc.

2). If you haven't already, add your name and mtu username to the `group.txt` file

3). See the Canvas assignment for details [here](https://mtu.instructure.com/courses/1437845/assignments/10713401?module_item_id=20944875)
    - [HTML Specifications Here](https://mtu.instructure.com/courses/1437845/files/107037675?fd_cookie_set=1)

4) If you have a linux supported shell, you can run all the layouts against any number of specified agents by running the `./runTheGauntlet.sh` shell script. You will have to directly modify the agents list in the script, and it will run against all layout it can find in the layouts directory specified with a `.lay` extension. [Note: You may have to modify perms: `chmod +x ./runTheGauntlet.sh`]

## Submission
For this project we will only need to modify the files `search.py` and `searchAgents.py`. I've added TODO's for all of the places I know we will have to modify. The submission should be named `project1.zip` containing:
- `search.py`
- `searchAgents.py`
- `group.txt`