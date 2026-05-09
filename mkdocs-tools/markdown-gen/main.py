import os
import os.path

from generators.patches import generate as patches_generate
from generators.productstes import generate as productstes_generate


def join_path(*args) -> str:
    return os.path.normpath(os.path.join(*args))


THIS_FILE_DIR = os.path.dirname(os.path.abspath(__file__))

SOURCE_DIR = join_path(THIS_FILE_DIR, "..", "..", "mkdocs", "docs", "assets", "converted")
OUTPUT_DIR = join_path(THIS_FILE_DIR, "..", "..", "mkdocs", "docs")


def main():
    productstes_generate(
        join_path(SOURCE_DIR, "Cakewalk"), join_path(OUTPUT_DIR, "Cakewalk"), "Cakewalk"
    )

    patches_generate(
        join_path(SOURCE_DIR, "Cubase"), join_path(OUTPUT_DIR, "Cubase"), "Cubase"
    )

    patches_generate(
        join_path(SOURCE_DIR, "Logic"), join_path(OUTPUT_DIR, "Logic"), "Logic"
    )

    productstes_generate(
        join_path(SOURCE_DIR, "StudioOne"),
        join_path(OUTPUT_DIR, "StudioOne"),
        "StudioOne",
    )


if __name__ == "__main__":
    main()
