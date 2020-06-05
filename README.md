# Google Colab Configuration

## Implementation
### Preparation steps 
1. Create ngrok account (https://dashboard.ngrok.com/signup)
2. After you login go to `Getting Started -> Setup & Installation` and copy **authtoken** from command in second section (we will need that token later)
3. Go to terminal on your computer and get public **SSH key** with `cat ./.ssh/id_rsa.pub`. If you do not have SSH key you can generate new key with command `ssh-keygen`.   
Now we have **authtoken** and **SSH key**.   
  
### Main part
1. Go to Google Colab and set position to My Drive, run in cell this command `!cd  ~/../content/drive/My\ Drive/`
2. Clone this config repository `git clone git@github.com:galiuskas24/Google-Colab-Configuration.git`
3. Run this script with `!bash  ~/../content/drive/My\ Drive/config/colab-ssh-jupyter.sh`    
  3a. The script will ask you first for **authtoken** and after that for **SSH key** (SSH key copy all output from step 3.)    
  3b. After that the script will generate connect command like this        
      `ssh -o TCPKeepAlive=yes -o ServerAliveInterval=30 root@0.tcp.ngrok.io -p 45454`   
  3c. Copy that command to your terminal and enjoy!    


## Remarks

### Memory stuck on GPU
Sometimes when we run some program on GPU from our new established terimnal if we exit the program with `Ctrl + Z` than the memory will be sturck on GPU so we need to exit our program only with `Ctrl + C`.    
But if that problem happens to us anyway, the only way we can find that process is with `fuser -v /dev/nvidia*` (if we do not have fuser -> `apt-get psmisc`.     
After we find the  process kill him with `kill -9 <PID>` and that will empty you memory buffer on GPU. 


## Example of cells

### First cell:
```shell
# FIRST TWO COMMANDS IS ONLY FOR TENSORFLOW
!printf "export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}\n" | cat >> ~/.bashrc #SET CUDA PATH
!printf "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}\n" | cat >> ~/.bashrc #SET LIB PATH

# SET START TERMINAL PATH
!printf "cd ../content/drive/My\ Drive/\n" | cat >> ~/.bashrc # set start terminal path 

# INSTALL SOME BASIC PROGRAMS (WE CAN ADD PROGRAMS IN FILE AT WILL)
!bash  ~/../content/drive/My\ Drive/config/install_basics.sh
```

### Second cell:

```shell
# RUN OUR SCRIPT
!bash  ~/../content/drive/My\ Drive/config/colab-ssh-jupyter.sh # open ssh connection

# WE CAN PAST OUR AUTHTOKEN AND SSH KEY IN COMMENT BECAUSE IS EASY TO USE THEM
'''
Auth:
< --------------- AUTHTOKEN FROM NGROK ------------------- >

SSH:
< ------------- SSH PUBLIC KEY FROM COMUPTER -_------------>
'''
```
