# Central Limit Theorem proof as a Lean 4 example

This repository contains a simple example of a proof of the central limit theorem to
help me learn Lean 4. 

Below are references and links provided by the setup guide after installing [Lean 4 VS Code Extension](https://marketplace.visualstudio.com/items?itemName=leanprover.lean4&utm_source=chatgpt.com) taken from the [Lean 4 VS Code GitHub Repo](https://github.com/leanprover/vscode-lean4/tree/v0.0.242)

# [Books and Documentation](https://raw.githubusercontent.com/leanprover/vscode-lean4/refs/tags/v0.0.242/vscode-lean4/media/guide-documentation.md)

## Books
If you want to learn Lean 4, choose one of the following introductory books based on your background. If you are getting stuck or have any questions, click on the 'Questions and Troubleshooting' step at the bottom on the left side.

- [Functional Programming in Lean](https://lean-lang.org/functional_programming_in_lean/)  
  The standard introduction to using Lean 4 as a general-purpose programming language. Suited for all users who wish to learn how to use Lean 4 as a programming language.
- [Theorem Proving in Lean 4](https://lean-lang.org/theorem_proving_in_lean4/)  
  The standard introduction to using Lean 4 as an interactive theorem prover for users with a computer science background. Also suited for advanced users as a bottom-up introduction to Lean 4.
- [Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/)  
  The standard introduction to using Lean 4 as an interactive theorem prover for users with a mathematics background. Also suited for all users who wish to learn the basics of how to use [Mathlib](https://github.com/leanprover-community/mathlib4), Lean's math library.
- [The Lean Language Reference](https://lean-lang.org/doc/reference/latest/)  
  The reference manual of Lean 4. Suited for all users who need a comprehensive and precise description of any Lean 4 feature.

## Hands-On Tutorial
If you want to dive right into using Lean 4 to prove elementary theorems about natural numbers, you can play the [Natural Number Game](https://adam.math.hhu.de/#/g/leanprover-community/NNG4), which uses a simplified dialect of Lean 4. It can be played online using your browser without a local installation.

## Validating Lean 4 Proofs
If you want to use Lean for validating a Lean proof from an untrusted source, you should use Lean's [Comparator](https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/Lake/#lake-comparator). It is strongly recommended to carefully read the [Validating a Lean Proof](https://lean-lang.org/doc/reference/latest/ValidatingProofs/#validating-proofs) section of the Lean language reference.

## Using Lean 4 in VS Code
The [Lean 4 VS Code extension manual](command:lean4.docs.showExtensionManual) covers all kinds of essential tools when working with Lean 4 in VS Code. Even if you are already familiar with other programming languages and VS Code in general, you may still find the first five subsections of the 'Interacting with Lean files' section in the manual to be very helpful. The manual covers several essential Lean-specific VS Code features, e.g. how to work with multiple Lean files, how to use the InfoView in VS Code and how to input Unicode characters.

## Additional Resources
**Website**  
[Lean's website](https://lean-lang.org/) provides information on further resources for Lean 4 itself and the Lean community.

**Lean Community**  
The [Lean community website](https://leanprover-community.github.io/index.html) links to several other helpful learning resources not listed here and provides an introduction to [Mathlib](https://github.com/leanprover-community/mathlib4), Lean's math library.

**Lean Zulip**  
The [Lean Zulip](https://leanprover.zulipchat.com/) is the primary forum of discussion for all topics and questions related to Lean.

**Reservoir**  
[Reservoir](https://reservoir.lean-lang.org/) indexes all public Lean packages and provides information on Lean version compatibility, package dependencies and package dependents.

## Finding Definitions and Theorems
A complete API reference for Lean 4 and [Mathlib](https://github.com/leanprover-community/mathlib4), Lean's math library, can be found on the [Mathlib documentation page](https://leanprover-community.github.io/mathlib4_docs/).

Additionally, there are multiple search engines that help you find definitions and theorems in Lean 4 and Mathlib:

- [Loogle](command:lean4.loogle.search): A pattern-based search engine that finds definitions and theorems by type signature or by the names of their identifiers.
- [LeanExplore](https://www.leanexplore.com/) and [LeanSearch](https://leansearch.net/): Two AI-based search engine that find definitions and theorems by a description in natural language.

# [Install Lean](https://raw.githubusercontent.com/leanprover/vscode-lean4/refs/tags/v0.0.242/vscode-lean4/media/guide-installLean-mac.md)

## Installed Components
The following components are automatically installed when clicking [this link](command:lean4.setup.installLean) or the 'Install Lean' button associated with this step:
- [Elan](https://github.com/leanprover/elan) is Lean's version manager and automatically manages all the different versions of Lean and ensures that the correct version is used when opening a project.
- [Apple Command Line Tools](https://developer.apple.com/xcode/resources/) (also known as 'Xcode Command Line Tools') includes several utility tools that are useful for working with a programming language. Lean in particular needs [Git](https://git-scm.com/) from Apple Command Line Tools, a commonly used [Version Control System](https://en.wikipedia.org/wiki/Version_control) that is used by Lean to help manage different versions of Lean formalization packages and software packages. Git can also be used to collaborate on Lean projects.

Components that are already installed will be skipped.

## Installation Procedure Details
The automatic installation will run the following script to install Elan and Apple Command Line Tools:
```bash
# Install Apple Command Line Tools using `softwareupdate`.
touch "/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress"
aclt_label="$(/usr/sbin/softwareupdate -l |
              grep -B 1 -E 'Command Line Tools' |
              awk -F'*' '/^ *\*/ {print $2}' |
              sed -e 's/^ *Label: //' -e 's/^ *//' |
              sort -V |
              tail -n1 |
              tr -d '\n')"
/usr/sbin/softwareupdate -i "$aclt_label"
# Download the Elan installation script at https://github.com/leanprover/elan/blob/master/elan-init.sh using `curl` and run it using `sh`. Elan will be installed to `~/.elan`.
curl "https://elan.lean-lang.org/elan-init.sh" -sSf | sh -s -- -y --default-toolchain leanprover/lean4:stable
```

## Restricted Environments
If you are in a restricted environment where you cannot install Git or curl and they are not already installed, for example a restricted university computer, then the installation script above may fail. In this case, there is currently no way to try Lean 4 with a local installation. If you want to try out Lean 4 regardless, you can read [Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/) and do the exercises with [an online instance of Lean 4 hosted using Gitpod](https://gitpod.io/#/https://github.com/leanprover-community/mathematics_in_lean). Doing so requires creating a GitHub account. Alternatively, you can also [play the Natural Number Game](https://adam.math.hhu.de/#/g/hhu-adam/NNG4) or [try a single-file version of Lean 4 in your web browser](https://live.lean-lang.org/).

# [Setup Lean 4 Project](https://raw.githubusercontent.com/leanprover/vscode-lean4/refs/tags/v0.0.242/vscode-lean4/media/guide-setupProject.md)
## Creating a Project
Below, you will find links that create new projects or download projects for you. After creating or downloading a project, you can re-open the project in the future by clicking the ∀-symbol in the top right, choosing 'Open Project…' > 'Open Local Project…' and selecting the project you created. If possible, you should avoid creating projects on network drives or in directories indexed by cloud storage, e.g. OneDrive.
Completing the project creation process and choosing to open the new project will close this guide. You can re-open it later by clicking the ∀-symbol in the top right and selecting 'Documentation…' > 'Show Setup Guide'.

  ![∀-symbol buttons](open-local-project_show-setup_buttons.png)

If you want to create a new project, click on one of the following:
- [Create a new standalone project](command:lean4.project.createStandaloneProject)  
  Standalone projects do not depend on any other Lean 4 projects. This option is suitable if you want to use Lean 4 as a general-purpose programming language or for program verification.  
  Dependencies can be added by modifying 'lakefile.lean' in the newly created project as described [here](https://github.com/leanprover/lean4/blob/master/src/lake/README.md#adding-dependencies). You may want to add [Lean's standard library](https://github.com/leanprover/std4) to the list of dependencies.
- [Create a new project using Mathlib](command:lean4.project.createMathlibProject)  
  The created project will depend on [Mathlib](https://github.com/leanprover-community/mathlib4), the math library of Lean 4. This option is suitable if you want to use Lean 4 for a math formalization project.  
  To update Mathlib after creating the project, you can click the ∀-symbol in the top right and choose 'Project Actions…' > 'Update Dependency…'.

If you want to open an existing project, click on one of the following:
- [Download an existing project](command:lean4.project.clone)  
  This option is suitable if you want to contribute to another Lean 4 project, like [Mathlib](https://github.com/leanprover-community/mathlib4).
- [Open an existing local project](command:lean4.project.open)  
  This option is suitable if you have been provided with a local Lean 4 project by someone else, like an instructor.

## Complex Project Setups
Using its build system and package manager Lake, Lean 4 supports more complex project setups than the ones described above. You can find out more about Lake in the [Lean 4 GitHub repository](https://github.com/leanprover/lean4/blob/master/src/lake/README.md).
