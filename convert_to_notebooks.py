import os
import re
import nbformat as nbf


def parse_markdown(file_path):
    """ Parse the markdown file to extract the title, problem statement, and code blocks. """
    exercise_number = os.path.basename(file_path).split("_")[0]
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()

    title_match = re.search(r'^title:\s*"?(.*?)"?\s*$', content, re.MULTILINE)
    description_match = re.search(
        r'^description:\s*"?(.*?)"?\s*$', content, re.MULTILINE)
    statement_match = re.search(
        r'# Statement\s*\n(.*?)(\n```|$)', content, re.DOTALL)
    code_matches = re.findall(r'```ocaml\s*(.*?)```', content, re.DOTALL)

    title = f"Question {exercise_number}: {title_match.group(1) if title_match else ''}"
    description = description_match.group(
        1).strip('"') if description_match else ""
    statement = f"## Exercise Instructions\n\n**Implement the function definition below.**\n\n{(statement_match.group(1).strip() if statement_match else '')}"

    # Fetch initial code from practice folder
    impl_path = f"./practice/{exercise_number}/work/impl.ml"
    code_example = ""
    if os.path.exists(impl_path):
        with open(impl_path, 'r', encoding='utf-8') as code_file:
            code_example = code_file.read()

    # Process the last code block if available
    try_it_out_code = ""
    if code_matches:
        last_example = code_matches[-1].strip().split('\n')[0]
        try_it_out_code = last_example.strip('# ').strip()

    return title, statement, code_example, try_it_out_code, exercise_number, description


def create_notebook(title, statement, code_example, try_it_out_code, solution_code, exercise_number, output_path, description):
    """ Create a Jupyter Notebook with the exercise content. """
    nb = nbf.v4.new_notebook()
    nb['cells'] = [
        nbf.v4.new_markdown_cell(
            f"# {title}\n\n{description}\n\n{statement}"),
        nbf.v4.new_code_cell(code_example),
        nbf.v4.new_markdown_cell(
            "## Try It Out!\n\nTest the function with different inputs and see the results. Modify the function if needed."),
        nbf.v4.new_code_cell(try_it_out_code),
        nbf.v4.new_markdown_cell(
            "## Run Test Cases\n\nRun the cell below to run pre-defined test cases and to see if your implementation passes them."),
        nbf.v4.new_code_cell(f'#use "./tests/{exercise_number}.ml"'),
        nbf.v4.new_markdown_cell(
            f'## Solution\n<details>\n<summary>Click here for the solution</summary>\n\n```ocaml\n{solution_code}\n```\n</details>')
    ]
    with open(output_path, 'w', encoding='utf-8') as f:
        nbf.write(nb, f)


def main():
    exercises_dir = './exercises'
    output_dir = './jupyter'
    os.makedirs(output_dir, exist_ok=True)

    for filename in os.listdir(exercises_dir):
        if filename.endswith('.md'):
            file_path = os.path.join(exercises_dir, filename)
            title, statement, code_example, try_it_out_code, exercise_number, description = parse_markdown(
                file_path)
            solution_path = f"./practice/{exercise_number}/answer/impl.ml"
            solution_code = ""
            if os.path.exists(solution_path):
                with open(solution_path, 'r', encoding='utf-8') as sol_file:
                    solution_code = sol_file.read()
            output_path = os.path.join(
                output_dir, filename.replace('.md', '.ipynb'))
            create_notebook(title, statement, code_example, try_it_out_code,
                            solution_code, exercise_number, output_path, description)
            print(f"Processed {filename}")


if __name__ == "__main__":
    main()
