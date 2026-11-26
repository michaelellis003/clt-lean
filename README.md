# A Lean 4 example

This repository contains a simple example to help me learn Lean 4.

# Installing Lean 4 and setting up VS Code

## Install the VS Code extension
Assuming you're developing on macOS and using VS Code, install Lean 4 from the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=leanprover.lean4). Or install it using the terminal,

```
code --install-extension leanprover.lean4
```
You will need the [VS Code CLI](https://code.visualstudio.com/docs/configure/command-line) installed to run this command.

## Install Elan
Elan is a tool from "managing different Lean versions used in packages you create or download." You can install it from the terminal 

```
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh
```

This will also add the lake, lean, and elan commands to Elan's bin directory. You can uninstall at any time with elan self uninstall. After elan is installed, you will need Elan's bin directory ($HOME/.elan/bin) in your PATH 
environment variable. To configure your current shell run `source $HOME/.elan/env`.

To verify the install run
```
elan --version
lean --version
lake --version
```

In Lean two tools, elan and lake, are responaible for language version management, project creation, dependency management and builds.

- [**Elan**](https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/Managing-Toolchains-with-Elan/#elan) manages Lean installations and selects which Lean version to use.
- [**Lake**](https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/Lake/) creates projects, manages dependencies, and builds Lean code.

## Creating a Lean Project

Lean 4 uses a 'toolchain'. A toolchain includes:
- Lean compiler: Compiles Lean source code and checks mathematical proofs.
- Lean language server: Provides diagnostics, autocomplete, and interactive proof states in VS Code.
- Lake: Lean's build system and package manager.
- Supporting binaries and libraries: Components needed by the compiler and other tools.

We will want to prove the Central Limit Theorem and to help us we will use some the open source library [Mathlib](https://github.com/leanprover-community/mathlib4) that has defintions and results we can build upon instead of starting from scratch. But in order to use this we will need to use the Lean toolchain specified by the Mathlib repository.

If you're already inside the folder where you want your Lean project, run:
```
lake +leanprover-community/mathlib4:lean-toolchain init clt math
```

Otherwise, if you want to create the folder and initialize the Lean project in that
newly created folder run:
```
lake +leanprover-community/mathlib4:lean-toolchain new clt math
```

The difference is the `init` vs `new` command. Of course here I named my project `clt` because I am using the Central Limit Theorem as an example. You change this for your project. In these commands the `+leanprover-community/mathlib4:lean-toolchain` is what tells Elan to use the Lean toolchain specified by the Mathlib repository. The `math` statement at the end of command defines a template we want to use. The `math` template sets up a project intended for formalizing mathematics using Mathlib.

Then inside either current directory or your newly created directly run:
```
lake exe cache get
lake build
```

## Dependency management with Lake
| Task	| Command |
| Create project | lake new <project-name> math |
| Resolve or update dependencies | lake update |
| Build project	| lake build |
| Build a particular target	| lake build <project-name> |
| Download Mathlib cache | lake exe cache get |
| Run a Lean file	| lake env lean File.lean |
| Run tests | lake test |
| Run linters | lake lint |
| Remove build artifacts | lake clean |

# Other Information and References
Below are references and links provided by the setup guide after installing [Lean 4 VS Code Extension](https://marketplace.visualstudio.com/items?itemName=leanprover.lean4) taken from the [Lean 4 VS Code GitHub Repo](https://github.com/leanprover/vscode-lean4/tree/v0.0.242)

## [Books and Documentation](https://raw.githubusercontent.com/leanprover/vscode-lean4/refs/tags/v0.0.242/vscode-lean4/media/guide-documentation.md)

### Books
If you want to learn Lean 4, choose one of the following introductory books based on your background. If you are getting stuck or have any questions, click on the 'Questions and Troubleshooting' step at the bottom on the left side.

- [Functional Programming in Lean](https://lean-lang.org/functional_programming_in_lean/)  
  The standard introduction to using Lean 4 as a general-purpose programming language. Suited for all users who wish to learn how to use Lean 4 as a programming language.
- [Theorem Proving in Lean 4](https://lean-lang.org/theorem_proving_in_lean4/)  
  The standard introduction to using Lean 4 as an interactive theorem prover for users with a computer science background. Also suited for advanced users as a bottom-up introduction to Lean 4.
- [Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/)  
  The standard introduction to using Lean 4 as an interactive theorem prover for users with a mathematics background. Also suited for all users who wish to learn the basics of how to use [Mathlib](https://github.com/leanprover-community/mathlib4), Lean's math library.
- [The Lean Language Reference](https://lean-lang.org/doc/reference/latest/)  
  The reference manual of Lean 4. Suited for all users who need a comprehensive and precise description of any Lean 4 feature.

### Hands-On Tutorial
If you want to dive right into using Lean 4 to prove elementary theorems about natural numbers, you can play the [Natural Number Game](https://adam.math.hhu.de/#/g/leanprover-community/NNG4), which uses a simplified dialect of Lean 4. It can be played online using your browser without a local installation.

### Validating Lean 4 Proofs
If you want to use Lean for validating a Lean proof from an untrusted source, you should use Lean's [Comparator](https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/Lake/#lake-comparator). It is strongly recommended to carefully read the [Validating a Lean Proof](https://lean-lang.org/doc/reference/latest/ValidatingProofs/#validating-proofs) section of the Lean language reference.

### Using Lean 4 in VS Code
The [Lean 4 VS Code extension manual](command:lean4.docs.showExtensionManual) covers all kinds of essential tools when working with Lean 4 in VS Code. Even if you are already familiar with other programming languages and VS Code in general, you may still find the first five subsections of the 'Interacting with Lean files' section in the manual to be very helpful. The manual covers several essential Lean-specific VS Code features, e.g. how to work with multiple Lean files, how to use the InfoView in VS Code and how to input Unicode characters.

### Additional Resources
**Website**  
[Lean's website](https://lean-lang.org/) provides information on further resources for Lean 4 itself and the Lean community.

**Lean Community**  
The [Lean community website](https://leanprover-community.github.io/index.html) links to several other helpful learning resources not listed here and provides an introduction to [Mathlib](https://github.com/leanprover-community/mathlib4), Lean's math library.

**Lean Zulip**  
The [Lean Zulip](https://leanprover.zulipchat.com/) is the primary forum of discussion for all topics and questions related to Lean.

**Reservoir**  
[Reservoir](https://reservoir.lean-lang.org/) indexes all public Lean packages and provides information on Lean version compatibility, package dependencies and package dependents.

### Finding Definitions and Theorems
A complete API reference for Lean 4 and [Mathlib](https://github.com/leanprover-community/mathlib4), Lean's math library, can be found on the [Mathlib documentation page](https://leanprover-community.github.io/mathlib4_docs/).

Additionally, there are multiple search engines that help you find definitions and theorems in Lean 4 and Mathlib:

- [Loogle](command:lean4.loogle.search): A pattern-based search engine that finds definitions and theorems by type signature or by the names of their identifiers.
- [LeanExplore](https://www.leanexplore.com/) and [LeanSearch](https://leansearch.net/): Two AI-based search engine that find definitions and theorems by a description in natural language.