# Google Colab Terminal Configuration
[![system](https://img.shields.io/badge/system-ubuntu-blue)]()

## Implementation
### Preparation steps:  
1. Create ngrok account (https://dashboard.ngrok.com/signup)
2. After you login go to `Getting Started -> Setup & Installation` and copy **authtoken** from command in second section (save that token for later).
3. Go to terminal on your computer and get public **SSH key** with `cat ./.ssh/id_rsa.pub`.       
If you do not have SSH key you can generate new key with command `ssh-keygen`.   
          
Now we have **authtoken** and **SSH key**.   
  
### Main part: 
1. Run in cell `!cd ../content/drive/My\ Drive/\`
2. Clone this config repository `git clone git@github.com:galiuskas24/Google-Colab-Configuration.git`
3. Go to Google Colab and run fist cell from [Example of cells](#example-of-cells).    
4. Go to Gooble Colab and run second cell from  [Example of cells](#example-of-cells).     
  4a. The script will ask you first for **authtoken** and after that for **SSH key** (for SSH key -> copy the whole output from third preparation step)    
  4b. After that, the script will generate connection command like this:        
      `ssh -o TCPKeepAlive=yes -o ServerAliveInterval=30 root@0.tcp.ngrok.io -p 45454`   
  4c. Copy that command and run in your terminal! Enjoy!    


## Example of cells

### First cell:
```shell
# SET PATH AND LIB_PATH FOR CUDA
!printf "export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}\n" | cat >> ~/.bashrc #SET CUDA PATH
!printf "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}\n" | cat >> ~/.bashrc #SET LIB PATH

# OPTIONAL -> DOWNGRADE Tensrflow 2.0 to Tensorflow 1.4
# !pip3 uninstall -y -r  ~/../content/drive/My\ Drive/config/.tf2_delete 
# !pip3 install tensorflow-gpu==1.14.0

# SET START TERMINAL PATH
!printf "cd ../content/drive/My\ Drive/\n" | cat >> ~/.bashrc    

# INSTALL SOME BASIC PROGRAMS (WE CAN ADD PROGRAMS IN FILE AT WILL)
!bash  ~/../content/drive/My\ Drive/config/install_basics.sh
```

### Second cell:

```shell
# RUN OUR SCRIPT (OPEN SSH CONNECTION)
!bash  ~/../content/drive/My\ Drive/config/colab-ssh-jupyter.sh

# WE CAN PAST OUR AUTHTOKEN AND SSH KEY IN COMMENT BECAUSE IS EASY TO USE THEM
'''
Auth:
<--------------- AUTHTOKEN FROM NGROK ------------------->

SSH:
<------------- SSH PUBLIC KEY FROM COMUPTER -------------->
'''
```


## Remarks

### Memory stuck on GPU
Sometimes when we run some program on GPU from our new established terimnal, if we exit the program with `Ctrl + Z` than the memory will be stuck on GPU so we need to exit our program only with `Ctrl + C`.    
But if that problem happens to us anyway, the only way we can find that process is with this command `fuser -v /dev/nvidia*`. If we do not have fuser, install him with this command `apt-get psmisc`.     
After we find the  process kill him with `kill -9 <PID>` and that will empty you memory buffer on GPU. 


