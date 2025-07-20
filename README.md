# dotfiles

My development environment

## Usage

### macOS Setup

#### Step 1: Clone and Initial Setup

Clone this repository and run the initial setup:

```shell
mkdir -p ~/src/github.com/holidayworking
cd ~/src/github.com/holidayworking
git clone git@github.com:holidayworking/dotfiles.git
cd dotfiles
make darwin/setup
```

#### Step 2: Configure Fish Shell

After `make darwin/setup` completes, open a new terminal and configure the fish shell:

```shell
cd ~/src/github.com/holidayworking/dotfiles
make fish/setup
```

### Lima Setup

#### Step 1: Create and Start VM

```shell
make lima/create
```

#### Step 2: Configure SSH Access

Add the following configuration to your `~/.ssh/config` file on macOS:

```config
Host taurus
  IdentityFile "~/.lima/_config/user"
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null
  Hostname 127.0.0.1
  Port 60022
```

#### Step 3: Bootstrap from macOS

**Note**: The following commands should be run on your **macOS host**, not inside the VM.

```shell
make lima/bootstrap
```

#### Step 4: Final VM Setup

SSH into the VM and complete the fish shell setup:

```shell
cd ~/src/github.com/holidayworking/dotfiles
make fish/setup
```

### NixOS VM Setup

#### Step 1: Create and Start VM

```shell
make vm/create
```

#### Step 2: Initial VM Configuration

1. After VM startup, log into the VM console and become the root user:

   ```shell
   sudo -i
   passwd
   ```

2. Find the VM's IP address (look for the `inet` address on `enp0s1` or similar interface):

   ```shell
   ip addr show
   ```

#### Step 3: Bootstrap from macOS

**Note**: The following commands should be run on your **macOS host**, not inside the VM.

1. Run the bootstrap command with the VM's IP address:

   ```shell
   make vm/bootstrap VM_IP=<VM_IP_ADDRESS>
   ```

   Replace `<VM_IP_ADDRESS>` with the actual IP address found in Step 2.

2. The NixOS installation will complete and the VM will automatically restart.

#### Step 4: Configure SSH Access

Add the following configuration to your `~/.ssh/config` file on macOS:

```config
Host gemini
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
  HostName <VM_IP_ADDRESS>
```

Replace:

- `<VM_IP_ADDRESS>` with the actual IP address from Step 2

#### Step 5: Final VM Setup

SSH into the VM and complete the fish shell setup:

```shell
ssh gemini
mkdir -p ~/src/github.com/holidayworking
cd ~/src/github.com/holidayworking
git clone git@github.com:holidayworking/dotfiles.git
cd dotfiles
make fish/setup
```
