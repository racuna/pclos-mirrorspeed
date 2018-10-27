# pclos-mirrorspeed

Simple Bash script to compare the average speed of response of the different repository mirrors of PCLinuxOS.

[PCLinuxOS](http://pclinuxos.com/) is a small Rolling Release Linux distro, and my personal favorite at the moment.

## Requirements

- curl

## Instalation and Execution

`curl https://raw.githubusercontent.com/racuna/pclos-mirrorspeed/master/pclos-mirrorspeed.sh > pclos-mirrorspeed.sh && chmod +x pclos-mirrorspeed.sh && ./pclos-mirrorspeed.sh` 

## Change Repository
IF you want to change the repository on PCLinuxOS after the speed comparision. Choose __just one__ repo:

Open Synaptic:

> Config -> Repositories -> Choose One -> OK

Then click "Reload"

## Disclaimer
The devs and mantainers of PCLOS recommends to choose the first repo on the list, this script is just for testing.

