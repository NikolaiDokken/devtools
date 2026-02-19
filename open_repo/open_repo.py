#!/usr/bin/env python3

# Standard library imports
from pathlib import Path
import json
import subprocess

# Third-party imports
import questionary

CONFIG_PATH = '~/.config/open-repo/config.json'

def config_exists():
    config_file_path = Path(CONFIG_PATH).expanduser()
    return config_file_path.exists()

def create_default_config():
    default_config_path = Path('./default_config.json')
    new_config_path = Path(CONFIG_PATH).expanduser()
    new_config_path.parent.mkdir(parents=True, exist_ok=True)
    with open(default_config_path, "rt") as default_config, open(new_config_path, 'wt') as new_config:
        new_config.write(default_config.read())

def get_config_value(config_key):
    config_path = Path(CONFIG_PATH).expanduser()
    with open(config_path, 'rt') as conf:
        config = json.load(conf)
        return config[config_key]


def identify_repos(project_dirs):
    repos = []
    for dir_path in project_dirs:
        path = Path(dir_path).expanduser()
        if not path.exists():
            continue
        for git_dir in path.glob('*/.git'):
            if git_dir.is_dir():
                repos.append(git_dir.parent)
    return repos


def select_repo(repos):
    choices = [{"name": repo.name, "value": repo} for repo in repos]
    selected = questionary.select(
        "Select a repository:",
        choices=choices,
        use_search_filter=True,
        use_jk_keys=False,
    ).ask()
    return selected

def select_code_editor_command():
    editors = get_config_value('code_editors')
    choices = [{"name": editor['display_name'], "value": editor['command']} for editor in editors]
    selected = questionary.select(
        "Select an editor to open the project in:",
        choices=choices,
        use_search_filter=False,
        use_jk_keys=False,
    ).ask()
    return selected

def main():
    if not config_exists():
        create_default_config()

    project_dirs = get_config_value('project_directories')
    repos = identify_repos(project_dirs)
    selected_repo = select_repo(repos)
    if not selected_repo:
        return
    editor_command = select_code_editor_command()
    if not editor_command:
        return
    subprocess.run([editor_command, str(selected_repo)])

if __name__ == "__main__":
    main()