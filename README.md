# mac-bootstrap
Bootstrap script for preparing a new Mac

## Goals
* Personal
  * Get more familiar with scripted OS configuration
  * Get more comfortable with ZSH
  * Start collecting the random scripts and configurations I have into something reproducible
  * Move closer to being able to replace a laptop without any headache (beyond cost)
* Output: Onboarding Tooling
  * Allow creating onboarding "profiles" for modular usage
  * Allow users to load a personal profile for individual customization
  * Require no extra tools be installed on the machine
    * Ideally all you need is a copy of the repo

Bottom line, make it easy to make an opinionated starting point for a job role, and also easy to admit your opinion needs some adjustment.

## Testing
I am currently running this against a [MacVM](https://github.com/khaost/macvm) machine.
The base image has a static IP, and allows SSH.
This isn't ideal, as a clean run requires fully downloading all of the software.
(My internet is not very fast.)
It is not terrible, but it is terribly wasteful.
I might introduce some code to try and mock this, pull from a local machine or the host.

### Data Sync
Right now, SSH is being used to push code to the test machine.
Environment variables are read in `sync.sh` to set the connection.
SSH keys would be definitely be easier.

## Design
Both the installation system and the output are intended to be modular.
Rather than bundling pre-configured scripts to source in `.zprofile`, this aims to rewrite / update the scripts as part of execution.
This is introducing some complexity.
(Is it providing any value?)

Output scripts are separated into two categories:
* Managed
* Unmanaged

The managed scripts can be thought of as "company" or "role" scripts.
These are meant to be a base configuration for anyone working in a given job role at a company.
It should set up all necessary tools for the job, with sensible defaults.

The unmanaged scripts allow individual users to either create overrides or install additional modules.

Something will need to be done to ensure that unmanaged scripts do not _interfere_ with managed scripts.
Wouldn't want to accidentally override a configuration that should be different for work.
Lots to think about on this.
Possibly more argument for simple script files.
Possibly a need to manage toggling scripts on and off based upon some logic.

## Modules
### System Preferences Automation
When you run the installer script, if it attempts to make changes to System Prefernces you will have to allow it through a popup.
The allowed application will differ between a sandbox VM and a physical machine.

## Usage Notes
This is more of an exploratory project than a functional one at this point.
The basic use case is building out a modular laptop preparation tool that does not require external tools or systems.
Because this is much about learning and exploring tools as it is building something useful, there will likely be some "field trips," and lots of ugly code.
Possibly forever.
