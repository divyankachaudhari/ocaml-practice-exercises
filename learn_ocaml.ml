open Unix
open Str

let read_file filename =
  let ic = open_in filename in
  let n = in_channel_length ic in
  let s = really_input_string ic n in
  close_in ic;
  s

let write_file filename content =
  let oc = open_out filename in
  output_string oc content;
  close_out oc

let extract_statement md_content =
  let re = regexp "# Statement\n\n\\(\\(.\\|\n\\)+\\)" in
  try
    let _ = search_forward re md_content 0 in
    Some (matched_group 1 md_content)
  with Not_found -> None

let extract_solution md_content =
  let re = regexp "# Solution\n\n```ocaml\n\\(\\(.\\|\n\\)+?\\)\n```" in
  try
    let _ = search_forward re md_content 0 in
    Some (matched_group 1 md_content)
  with Not_found -> None

let extract_title md_content =
  let re = regexp "title: \\(.+\\)" in
  try
    let _ = search_forward re md_content 0 in
    Some (matched_group 1 md_content)
  with Not_found -> None

let extract_difficulty md_content =
  let re = regexp "difficulty: \\(\\w+\\)" in
  try
    let _ = search_forward re md_content 0 in
    Some (matched_group 1 md_content)
  with Not_found -> None

let difficulty_to_stars = function
  | "beginner" -> 1
  | "intermediate" -> 2
  | "advanced" -> 3
  | _ -> 1

let create_files exercise_number statement solution title stars practice_folder_path =
  let exercise_folder = Printf.sprintf "learn-ocaml-repository/exercises/%03d" exercise_number in
  mkdir exercise_folder 0o755;
  
  (* descr.md *)
  write_file (Filename.concat exercise_folder "descr.md")
    (Printf.sprintf "# Statement\n\n%s" statement);
  
  (* meta.json *)
  let meta_content = Printf.sprintf {|{
  "learnocaml_version": "1",
  "kind": "exercise",
  "stars": %d,
  "title": "%s"
}|} stars title in
  write_file (Filename.concat exercise_folder "meta.json") meta_content;
  
  (* solution.ml *)
  let practice_solution_path = Filename.concat practice_folder_path (Printf.sprintf "%03d/answer/impl.ml" exercise_number) in
  if Sys.file_exists practice_solution_path then begin
    write_file (Filename.concat exercise_folder "solution.ml") (read_file practice_solution_path);
    (* prelude.ml *)
    write_file (Filename.concat exercise_folder "prelude.ml") "(* Some code is loaded in the toplevel before your code. *)\nlet greetings = \"Hello world!\"\n";
    (* prepare.ml *)
    write_file (Filename.concat exercise_folder "prepare.ml") "";
    (* template.ml *)
    let practice_template_path = Filename.concat practice_folder_path (Printf.sprintf "%03d/work/impl.ml" exercise_number) in
    if Sys.file_exists practice_template_path then
      write_file (Filename.concat exercise_folder "template.ml") (read_file practice_template_path)
    else
      write_file (Filename.concat exercise_folder "template.ml") "";
    (* test.ml *)
    write_file (Filename.concat exercise_folder "test.ml") "open Test_lib\nopen Report\n\nlet () =\n  set_result @@\n  ast_sanity_check code_ast @@ fun () ->\n  [\n    Message ([ Text \"That was easy!\" ], Success 1)\n  ]\n";
    true
  end else begin
    Printf.printf "Solution file not found for exercise %03d. Deleting the folder.\n" exercise_number;
    rmdir exercise_folder;
    false
  end

let process_md_file md_file_path practice_folder_path =
  let md_content = read_file md_file_path in
  let statement = extract_statement md_content in
  let solution = extract_solution md_content in
  let title = extract_title md_content in
  let difficulty = extract_difficulty md_content in
  begin
    match statement with
    | None -> Printf.printf "Warning: Missing statement in %s\n" md_file_path
    | Some _ -> ()
  end;
  begin
    match solution with
    | None -> Printf.printf "Warning: Missing solution in %s\n" md_file_path
    | Some _ -> ()
  end;
  begin
    match title with
    | None -> Printf.printf "Warning: Missing title in %s\n" md_file_path
    | Some _ -> ()
  end;
  begin
    match difficulty with
    | None -> Printf.printf "Warning: Missing difficulty in %s\n" md_file_path
    | Some _ -> ()
  end;
  match statement, solution, title, difficulty with
  | Some statement, Some solution, Some title, Some difficulty ->
      let stars = difficulty_to_stars difficulty in
      let re = regexp "\\([0-9]\\{3\\}\\)" in
      if string_match re (Filename.basename md_file_path) 0 then
        let exercise_number = int_of_string (matched_group 1 (Filename.basename md_file_path)) in
        if create_files exercise_number statement solution title stars practice_folder_path then
          Some exercise_number
        else
          None
      else begin
        Printf.printf "Error: No valid exercise number found in filename %s\n" (Filename.basename md_file_path);
        None
      end
  | _ -> None

let update_index_json index_json_path exercise_numbers =
  let index_data = Yojson.Basic.from_file index_json_path in
  let index_data = Yojson.Basic.Util.to_assoc index_data in
  let groups = List.assoc "groups" index_data in
  let groups = Yojson.Basic.Util.to_assoc groups in
  let ocaml_exercises = List.assoc "ocaml.org exercises" groups in
  let ocaml_exercises = Yojson.Basic.Util.to_assoc ocaml_exercises in
  let exercises = List.assoc "exercises" ocaml_exercises |> Yojson.Basic.Util.to_list |> List.map Yojson.Basic.Util.to_string in
  let updated_exercises = List.sort_uniq compare (exercises @ List.map (Printf.sprintf "%03d") exercise_numbers) in
  let ocaml_exercises = ("exercises", `List (List.map (fun s -> `String s) updated_exercises)) :: ocaml_exercises in
  let groups = ("ocaml.org exercises", `Assoc ocaml_exercises) :: groups in
  let index_data = ("groups", `Assoc groups) :: index_data in
  Yojson.Basic.to_file index_json_path (`Assoc index_data)

let () =
  let exercises_folder = "exercises" in
  let practice_folder = "practice" in
  let index_json_path = "learn-ocaml-repository/exercises/index.json" in

  let exercise_numbers = ref [] in
  Array.iter (fun md_file ->
    if Filename.check_suffix md_file ".md" then
      match process_md_file (Filename.concat exercises_folder md_file) practice_folder with
      | Some exercise_number -> exercise_numbers := exercise_number :: !exercise_numbers
      | None -> ()
  ) (Sys.readdir exercises_folder);

  update_index_json index_json_path !exercise_numbers
