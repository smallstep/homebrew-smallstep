# Smallstep Homebrew Formulas

This repository contains `Ruby` Formulas for installing Smallstep tools via
[Homebrew](https://brew.sh/)

## Step CLI Formula

The `step cli` formula is located at [./step.rb](./step.rb). Below we will
explain how to update this formula for new releases.

### Bumping the Version

Homebrew will distribute the version of Step CLI hardcoded into the
[step cli formula](./step.rb). Follow the steps below to update this formula.

1. [Create and push a standard release](https://github.com/smallstep/cli/blob/master/distribution.md)
of the [Step CLI](https://github.com/smallstep/cli).

2. Update the Step CLI formula.

    **DO NOT** edit [./step.rb](./step.rb) directly. Instead run [./bin/step](./bin/step)
    with the appropriate arguments to update the existing formula.

    Using the `tag` from step 1, run:

    ```
    # assuming the new tag is v1.0.3 ...

    ./bin/step https://github.com/smallstep/cli/archive/v1.0.3.tar.gz v1.0.3
    ```

3. Commit and push your changes.

4. Test

    ```
    brew install smallstep/smallstep/step
    or ...
    brew upgrade smallstep/smallstep/step
    ```

*All Done!*
