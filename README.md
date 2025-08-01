# 🛠️ Bulk MR Template Injector

Automate creating branches and text files (`.`) across multiple Git repositories.

## 📦 Description

This repository contains Bash scripts that help you:

1. Clone all your repositories into a local folder.
2. Create a custom branch  `fix/hotfix/bug/feat/release` in each repo.
3. Add a Cat file `txt, md, sh` at a custom path `. /srv/ assets`.
4. Commit changes locally (without pushing).
5. Later, push the new branches to the remote.

---

## 🚀 Included Scripts

### 1. `clone-repo.sh`
A list of repositories that needs to be updated and clone into local

### 2. `inject-template.sh`

Iterates through each local repo, creates the branch, and generates the `filepath`.

### 3. `push-changes.sh`

push changes safetly, once that your template have being update and branch create in `filepath`.
