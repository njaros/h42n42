open Creet

let print_pos pos =
  match pos with
  | [] -> ()
  | x :: tail ->
    match tail with
    | [] -> ()
    | y :: _ ->
      Printf.printf "X: %i; Y: %i\n" x y

let rec display_pos_creets creets =
  match creets with
  | [] -> ()
  | head :: tail ->
      Printf.printf "id: %i -> " head#getId;
      print_pos head#getPos;
      display_pos_creets tail

let () =
  let creet1 = new creet 0 0 0 4 3 in
  let creet2 = new creet 1 5 7 2 10 in
  Lwt_main.run (Lwt.pick [creet1#run; creet2#run])
