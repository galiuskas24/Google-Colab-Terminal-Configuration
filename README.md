# Google Colab Configuration

## Implementation
### Preparation steps 
1. Create ngrok account (https://dashboard.ngrok.com/signup)
2. After you login go to `Getting Started -> Setup & Installation` and copy *authtoken* from command in second section (we will need that token later)
3. Go to terminal on your computer and get public *SSH key* with `cat ./.ssh/id_rsa.pub`. If you do not have that SSH you can generate key with command `ssh-keygen`
Now we have *authtoken* and *SSH key*.

### Main part
3. Go to Google Colab and set position to My Drive, run in cell this command `!cd  ~/../content/drive/My\ Drive/`
4. Clone this config repository `git clone git@github.com:galiuskas24/Google-Colab-Configuration.git`
5. Run this script with `!bash  ~/../content/drive/My\ Drive/config/colab-ssh-jupyter.sh`
  5a. The script will ask you first for *authtoken* and after that for *SSH key* (SSH key copy all output from step 3.)
  5b. After that the script will generate connect command like this 'ssh -o TCPKeepAlive=yes -o ServerAliveInterval=30 root@0.tcp.ngrok.io -p 45454'
##
