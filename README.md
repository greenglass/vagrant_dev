# vagrant_dev

This is a development environment based on Ubuntu 14.04 that will use vagrant to setup a new environment to develop Java (or any language) in. 

## Usage

To start, you need to download Vagrant. This technology will create and customize the development environment based on the chef cookbooks in this project.  
https://www.vagrantup.com/downloads.html

You will need to download and install Virtual Box since Vagrant will use Virtual Box as it's virtualization platform.   
https://www.virtualbox.org/wiki/Downloads

Download and install Git (https://git-scm.com/downloads) on your local machine so you can clone this repository:

```bash
git clone https://github.com/greenglass/vagrant_dev.git
```

or

```bash
git clone git@github.com:greenglass/vagrant_dev.git
```

Once you clone the vagrant_dev repository, go into that directory (it should be in your current directory, unless otherwise specified).

```bash
cd vagrant_dev
```

Execute the following command for Vagrant to create a new development environment.

```bash
vagrant up
```

NOTE: During vagrant provisioning if you experience failure with issues that end with ^M then the file format is in dos (windows) on a unix (linux) file system. The file be complained about needs to be set to unix using vi/vim. Open the file and enter the following command in vi/vim by using ':'. Once this is complete then save the file and provision again.

```bash
set ff=unix
```

Because of the different packages being downloaded and installed this may take several hours depending on your internet connection speed. Downloading the Ubuntu 14.04 box and Eclipse both take a good amount of time.

Once the machine is up and done customizing you are able to start development. You can now ssh to the machine via PuTTy (if using Windows) or SSH using Linux. The following information can be used to access the development box.  
 
* IP: 127.0.0.1  
* Port: 2222  
* Username: vagrant  
* Password: vagrant  

```bash
ssh vagrant@127.0.0.1 -p 2222
```

You can now clone other repositories in the machine to start working on.

## Notable Packages

Below are some notable packages installed on the development box and more information about these packages can be at the below links.

Git:  
  * https://git-scm.com/downloads
  * https://github.com  

Tmuxinator: 
  * https://github.com/tmuxinator/tmuxinator  
  tmuxinator config is located at ~/.tmuxinator/  
  Start tmuxinator using this command

  ```bash
  mux start tmuxsetup
  ```

Eclim: 
  * http://eclim.org/  
  Eclim will automatically be started as part of using tmuxinator via starting eclim headlessly.

  When pulling a new git project and you want to use Eclim for their project (which I suggest), you need to create a new Eclim project for the code, as an example when in a vi/vim session:
  
  ```bash
  :ProjectCreate /path/to/my_project -n java
  ```
  
  More information about projects using Eclim can be found at: http://eclim.org/gettingstarted.html
