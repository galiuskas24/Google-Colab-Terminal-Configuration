# Google Colab Configuration

## Implementation
### Preparation steps 
1. Create ngrok account (https://dashboard.ngrok.com/signup)
2. After you login go to `Getting Started -> Setup & Installation` and copy **authtoken** from command in second section (we will need that token later)
3. Go to terminal on your computer and get public **SSH key** with `cat ./.ssh/id_rsa.pub`. If you do not have SSH key you can generate new key with command `ssh-keygen`.   
Now we have *authtoken* and *SSH key*.   
  
### Main part
1. Go to Google Colab and set position to My Drive, run in cell this command `!cd  ~/../content/drive/My\ Drive/`
2. Clone this config repository `git clone git@github.com:galiuskas24/Google-Colab-Configuration.git`
3. Run this script with `!bash  ~/../content/drive/My\ Drive/config/colab-ssh-jupyter.sh`    
  3a. The script will ask you first for *authtoken* and after that for *SSH key* (SSH key copy all output from step 3.)    
  3b. After that the script will generate connect command like this 'ssh -o TCPKeepAlive=yes -o ServerAliveInterval=30 root@0.tcp.ngrok.io -p 45454'   
  3c. Copy that command to your terminal and enjoy!    


##
