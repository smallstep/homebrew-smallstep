# Smallstep Homebrew Formulas

This repository contains `Ruby` Formulas for installing Smallstep tools via
[Homebrew](https://brew.sh/)

## Step CLI Formula

The `step cli` formula is located at [./step.rb](./step.rb). Below we will
explain how to update this formula for new releases.

### How to update the formula

DO NOT EDIT [./step.rb](./step.rb). Instead run [./bin/step](./bin/step) to
overwrite the existing formula.

**Examples**:

Download release `v0.0.1` and build as version `0.0.1`:
```
./step https://github.com/smallstep/cli/archive/v0.0.1.tar.gz v0.0.1
```

Download release `v5.4.3` and build as version `0.1.2`:
```
./step https://github.com/smallstep/cli/archive/v5.4.3.tar.gz v0.1.2
```
