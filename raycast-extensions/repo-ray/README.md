<div align="center">
  <img src="assets/icon.png" width="80" />
  <h1>RepoRay</h1>
  <p>Manage your local git repositories directly from Raycast</p>
</div>

---

**RepoRay** is a Raycast extension that lets you open, clone, and remove git repositories without ever leaving your keyboard. Point it at your project directories and it handles the rest.

## Commands

| Command               | Description                                                                              |
| --------------------- | ---------------------------------------------------------------------------------------- |
| **Open Repo**         | Search your project directories for git repos and open them in your preferred editor     |
| **Clone Repository**  | Clone a remote git repository into one of your project directories                       |
| **Remove Repository** | Delete a local repository — blocked if there are uncommitted changes or unpushed commits |

## Configuration

### Extension Preferences

| Preference          | Description                                           | Default |
| ------------------- | ----------------------------------------------------- | ------- |
| Project Directories | Comma-separated list of directories to scan for repos | `~/dev` |

> Example: `~/Documents, ~/Work, ~/dev`

### Open Repo Preferences

Configure up to 5 editors to appear in the editor picker when opening a repo.

| Preference | Required |
| ---------- | -------- |
| Editor 1   | Yes      |
| Editor 2–5 | No       |
