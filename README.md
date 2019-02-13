# Smallstep Homebrew Formulas

This repository contains `Ruby` Formulas for installing Smallstep tools via
[Homebrew](https://brew.sh/)

## Step CLI Formula

The `step cli` formula is located at [./step.rb](./step.rb). Below we will
explain how to update this formula for new releases.

### Bumping the Version

Homebrew will distribute the versions of Step CLI and Step CA hardcoded into the
[step formula](./step.rb). Follow the steps below to update this formula.

1. Update the Step formula.

    **DO NOT** edit [./step.rb](./step.rb) directly. Instead run [./bin/step](./bin/step)
    with the appropriate arguments to update the formula.

    Select the versions of `step cli` and `step certificates` that will be
    distributed in the homebrew release.

    Then run:
        ```
        # ./bin/step <cli-version> <certificates-version>
        $ ./bin/step v0.8.5 v0.8.4
        ```

2. Test the formula locally.

    ```
    $ brew uninstall step
    $ brew install --build-from-source ./step.rb

    # Copy ./step.rb to /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/step.rb
    # brew audit and brew test will be run against the formula stored in .../Taps/...
    $ sudo cp ./step.rb /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/step.rb
    $ brew audit step --online --new-formula
    $ brew test step
    ```

3. Commit and push your changes to the master branch.

4. Test the public formula.

    ```
    $ brew install smallstep/smallstep/step
    or ...
    $ brew upgrade smallstep/smallstep/step
    ```

*All Done!*
