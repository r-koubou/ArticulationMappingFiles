import os
from jinja2 import Template


from templates import loader as template_loader


def generate(input_dir: str, output_dir: str, daw: str):

    if not os.path.exists(input_dir):
        print(f"Input directory '{input_dir}' does not exist. Skipping generation for {daw}.")
        return

    os.makedirs(output_dir, exist_ok=True)
    template: Template = template_loader.load("template-productsets.md")

    root_path = input_dir
    manufacturers = [
        f for f in os.listdir(root_path) if os.path.isdir(os.path.join(root_path, f))
    ]

    manufacturers.sort()

    for manufacturer in manufacturers:
        product_names = [
            f
            for f in os.listdir(os.path.join(root_path, manufacturer))
            if os.path.isfile(os.path.join(root_path, manufacturer, f))
        ]

        product_names.sort()

        rendered = template.render(manufacturer=manufacturer, products=product_names, daw=daw)
        output_path = os.path.join(output_dir, manufacturer + ".md")
        os.makedirs(os.path.dirname(output_path), exist_ok=True)
        with open(output_path, "w", encoding="utf-8") as file:
            file.write(rendered)
