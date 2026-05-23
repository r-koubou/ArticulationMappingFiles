import os
import os.path
import sys
import uuid

from ruamel.yaml import YAML

yaml = YAML()

loaded_list: dict[uuid.UUID, list[str]] = {}


def check_yaml(yaml_file: str) -> bool:
    with open(yaml_file, "r", encoding="utf-8") as f:
        data = yaml.load(f)

    id: uuid.UUID = uuid.UUID(data["Id"])

    if id in loaded_list:
        loaded_list[id].append(yaml_file)
        return False
    else:
        loaded_list[id] = [yaml_file]
        return True


def main(args: list[str]) -> int:
    input_dir = args[0]
    exit_code = 0

    # check uuid in yaml files from input\dir recursively
    for root, dirs, files in os.walk(input_dir):
        for file in files:
            if file.endswith(".yaml") or file.endswith(".yml"):
                yaml_file = os.path.join(root, file)
                if not check_yaml(yaml_file):
                    exit_code = 1

    if exit_code == 1:
        print("-" * 32)
        print("*** Duplicate UUIDs found ***")
        print("-" * 32)
        for id, files in loaded_list.items():
            if len(files) > 1:
                print(f"{id}")
                for file in files:
                    print(f"  - {file}")
    else:
        print("👍 No duplicate UUIDs found.")

    return exit_code


if __name__ == "__main__":

    if len(sys.argv) < 2:
        print("Usage: python main.py <input_directory>")
        sys.exit(1)

    exit_code = main(sys.argv[1:])
    sys.exit(exit_code)
