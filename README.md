# rs3clone
vhdl files for RS3CLN VB2 HW and later  
2025-01-09

## objects  
All vhdl files that are necessary in vivado (currently 2024.1 version as for now).  
Due to the problematic nature of Vivado, it is hard to gitify a vivado project.  
Hence we only track files that are in .srcs directories of the project. So, files are all mixed in directories and there is almost no reason to look for. Vivado is weird. Files go into new, or imports/new depending on actions you make that sometimes have nothing to do with sensible reasons... So the mix up is complete and the hierarchy is lost.  
Then you have the problems of IPs. How to save files in IPs to get track of them, that's another pain in the back.  
We have no staisfyting solution to submit yet. Maybe it will improve with time. The idea for now is the hope that in the case of a pc failure, all won't be lost, and it will be still feasible to rebuild the project with limited loss of time and resources. But, don't count on a painless effort in that case.  

Moreover, I am all alone to develop and maintain 3 different subprojects:
- vhdl files for the fpga (this repo)
- python files on PC or Mac for the board config and wifi communication
- c++ files for the esp8285

all 3 packages are interdependant somehow and a version of 1 line may be incompatible with a version of another. That's rather complex, and I confess that vcs policy at the moment is unclear. Sorry for the inconvenience.  



