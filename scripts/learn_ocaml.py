import os
import re
import json
import shutil


def extract_statement(md_content):
    statement_match = re.search(r'# Statement\n\n([\s\S]+)', md_content)
    if statement_match:
        return statement_match.group(1).strip()
    return ""


def extract_solution(md_content):
    solution_match = re.search(
        r'# Solution\n\n```ocaml\n([\s\S]+?)\n```', md_content)
    if solution_match:
        return solution_match.group(1).strip()
    return ""


def extract_title(md_content):
    title_match = re.search(r'title:\s*(.+)', md_content)
    if title_match:
        return title_match.group(1).strip()
    return ""


def extract_difficulty(md_content):
    difficulty_match = re.search(r'difficulty:\s*(\w+)', md_content)
    if difficulty_match:
        return difficulty_match.group(1).strip()
    return "beginner"


def difficulty_to_stars(difficulty):
    if difficulty == "beginner":
        return 1
    elif difficulty == "intermediate":
        return 2
    elif difficulty == "advanced":
        return 3
    return 1


def create_files(exercise_number, statement, solution, title, stars, practice_folder_path):
    exercise_folder = f'./learn-ocaml-repository/exercises/{exercise_number:03d}'
    os.makedirs(exercise_folder, exist_ok=True)

    # descr.md
    with open(os.path.join(exercise_folder, 'descr.md'), 'w') as f:
        f.write("# Statement\n\n")
        f.write(statement)

    # meta.json
    meta_content = {
        "learnocaml_version": "1",
        "kind": "exercise",
        "stars": stars,
        "title": title
    }
    with open(os.path.join(exercise_folder, 'meta.json'), 'w') as f:
        json.dump(meta_content, f, indent=2)

    # solution.ml
    practice_solution_path = os.path.join(
        practice_folder_path, f'{exercise_number:03d}/answer/impl.ml')
    if os.path.exists(practice_solution_path):
        shutil.copy(practice_solution_path, os.path.join(
            exercise_folder, 'solution.ml'))
    else:
        print(
            f"Solution file not found for exercise {exercise_number:03d}. Deleting the folder.")
        shutil.rmtree(exercise_folder)
        return False

    # prelude.ml
    with open(os.path.join(exercise_folder, 'prelude.ml'), 'w') as f:
        f.write(
            "(* Some code is loaded in the toplevel before your code. *)\nlet greetings = \"Hello world!\"\n")

    # prepare.ml
    open(os.path.join(exercise_folder, 'prepare.ml'), 'w').close()

    # template.ml
    practice_template_path = os.path.join(
        practice_folder_path, f'{exercise_number:03d}/work/impl.ml')
    if os.path.exists(practice_template_path):
        shutil.copy(practice_template_path, os.path.join(
            exercise_folder, 'template.ml'))
    else:
        open(os.path.join(exercise_folder, 'template.ml'), 'w').close()

    # test.ml
    with open(os.path.join(exercise_folder, 'test.ml'), 'w') as f:
        f.write("""open Test_lib
open Report

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [
    Message ([ Text "That was easy!" ], Success 1)
  ]
""")

    return True


def process_md_file(md_file_path, practice_folder_path):
    with open(md_file_path, 'r') as f:
        md_content = f.read()

    statement = extract_statement(md_content)
    if not statement:
        print(f"Warning: No statement found in {md_file_path}")
    solution = extract_solution(md_content)
    title = extract_title(md_content)
    difficulty = extract_difficulty(md_content)
    stars = difficulty_to_stars(difficulty)

    exercise_number_match = re.search(
        r'(\d{3})', os.path.basename(md_file_path))
    if exercise_number_match:
        exercise_number = int(exercise_number_match.group(1))
    else:
        print(
            f"Error: No valid exercise number found in filename {os.path.basename(md_file_path)}")
        return None

    if create_files(exercise_number, statement, solution, title, stars, practice_folder_path):
        return exercise_number
    else:
        return None


def update_index_json(index_json_path, exercise_numbers):
    with open(index_json_path, 'r') as f:
        index_data = json.load(f)

    ocaml_exercises = index_data["groups"]["ocaml.org exercises"]["exercises"]
    updated_exercises = [f"{num:03d}" for num in exercise_numbers]

    index_data["groups"]["ocaml.org exercises"]["exercises"] = sorted(
        set(ocaml_exercises + updated_exercises))

    with open(index_json_path, 'w') as f:
        json.dump(index_data, f, indent=2)


if __name__ == '__main__':
    exercises_folder = './exercises'
    practice_folder = './practice'
    index_json_path = './learn-ocaml-repository/exercises/index.json'

    exercise_numbers = []
    for md_file in os.listdir(exercises_folder):
        if md_file.endswith('.md'):
            exercise_number = process_md_file(os.path.join(
                exercises_folder, md_file), practice_folder)
            if exercise_number is not None:
                exercise_numbers.append(exercise_number)

    update_index_json(index_json_path, exercise_numbers)
