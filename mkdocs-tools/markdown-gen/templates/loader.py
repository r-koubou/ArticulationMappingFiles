import os.path

from jinja2 import Template

THIS_FILE_DIR = os.path.dirname(os.path.abspath(__file__))


def load(file_name: str) -> Template:
    full_path = os.path.join(THIS_FILE_DIR, file_name)

    with open(full_path, "r", encoding="utf-8") as file:
        content = file.read()
    return Template(content)
