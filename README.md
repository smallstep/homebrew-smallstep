# Smallstep Homebrew Formulas

This repository contains `Ruby` Formulas for installing Smallstep tools via
[Homebrew](https://brew.sh/)

## Step CLI Formula

The `step cli` formula is located at [./step.rb](./step.rb). Below we will
explain how to update this formula for new releases.

### Bumping the Version

Homebrew will distribute the version of Step CLI hardcoded into the
[step cli formula](./step.rb). Follow the steps below to update this formula.

1. Update the Step CLI formula.

**DO NOT** edit [./step.rb](./step.rb) directly. Instead run [./bin/step](./bin/step)
with the appropriate arguments to update the existing formula.

Locate the [Github Release](https://github.com/smallstep/cli/releases) that should
be deployed in the Step CLI Homebrew Formula. Copy the link address for the
`brew_step_xxx.tar.gz` asset in the chosen Release.

Then run:
    ```
    ./bin/step https://github.com/smallstep/cli/releases/download/v0.0.2-rc.16/brew_step_0.0.2-rc.16.tar.gz
    ```

2. Test the formula locally.

    ```
    $ brew uninstall step
    $ brew install --build-from-source ./step.rb
    ```

3. Commit and push your changes to the master branch.

4. Test the public formula.

    ```
    $ brew install smallstep/smallstep/step
    or ...
    $ brew upgrade smallstep/smallstep/step
    ```

*All Done!*
