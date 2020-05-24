# Contributing Guide

> This contribution guideline is derived from the [Vue.js](https://github.com/vuejs/vue/blob/dev/.github/CONTRIBUTING.md), [Atom](https://github.com/atom/atom/blob/master/CONTRIBUTING.md), [Starship](https://github.com/starship/starship/blob/master/CONTRIBUTING.md) and [Convetional Commits](https://github.com/conventional-commits/conventionalcommits.org/blob/master/CONTRIBUTING.md) contribution guidelines.

:tada: First of all, thank you so much for taking the time to contribute! :tada:

Secondly, before submitting your contribution, please make sure to take a moment and read through the guidelines:

- [Code of Conduct](#code-of-conduct)
- [Issue Reporting Guidelines](#issue-reporting-guidelines)
- [Pull Request Guidelines](#pull-request-guidelines)
- [License](#license)

## 💚 Code of Conduct

This project and everyone participating in it is governed by the [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to our [community chat](https://gitter.im/lcbm/community?utm_source=share-link&utm_medium=link&utm_campaign=share-link).

## 🚩 Issue Reporting Guidelines

The issue list is reserved exclusively for [bug reports](.github/ISSUE_TEMPLATE/BUG_REPORT.md) and [feature requests](.github/ISSUE_TEMPLATE/FEATURE_REQUEST.md). For usage questions, please use the following resources:

- Read the [docs](./README.md)
- Ask at [the community's chat](https://gitter.im/lcbm/community?utm_source=share-link&utm_medium=link&utm_campaign=share-link)

Also try to search for your issue - it may have already been answered or even fixed in the development branch. However, if you find that an old, closed issue still persists in the latest version, you should open a new issue using the form below instead of commenting on the old issue.

## ✏️ Pull Request Guidelines

We use the [GitHub flow](https://guides.github.com/introduction/flow/) as main versioning workflow:

1. Fork this repository
2. Create a new branch for each feature, fix or improvement, off of `master`: `git checkout -b my-feature-branch`
3. Make some changes, committing them along the way (make sure to follow the [Commit Convention](.github/COMMIT_CONVENTION.md) guidelines)
4. When your changes are ready for review, push your branch: `git push origin my-feature-branch`
5. Create a pull request from your branch to `lcbm/master` (make sure to fill in all [Pull Request](.github/PULL_REQUEST_TEMPLATE.md) requirements)
6. No need to assign the pull request to anyone, we'll review it when we can
7. When the changes have been reviewed and approved, if there are no conflicts with the `master` branch, someone will rebase and merge for you. If there are conflicts, go to step 8
8. If your branch has conflicts with the `master` branch, use [interactive rebase to resolve conflicts](https://help.github.com/en/github/using-git/resolving-merge-conflicts-after-a-git-rebase): `git rebase master -i`, then `git push -f` to update your branch (this automatically updates the pull request)

It is very important to separate new features or improvements into separate feature branches, and to send a pull request for each branch. This allow us to review and pull in new features or improvements individually.

## 📝 License

You must agree that your patch will be licensed under the repository's [license](LICENSE), and when we change the license we will assume that you agreed with the change unless you object.
