(* This file was generated by Eliom-distillery.
   Feel free to use it, modify it, and redistribute it as you wish. *)

let%server application_name = "myapp"
let%client application_name = Eliom_client.get_application_name ()

let%server () =
    Ocsipersist_settings.set_db_file "local/var/data/myapp/myapp_db";

(* Create a module for the application. See
   https://ocsigen.org/eliom/manual/clientserver-applications for more
   information. *)
module%shared App = Eliom_registration.App (struct
    let application_name = application_name
    let global_data_path = Some ["__global_data__"]
  end)

(* As the headers (stylesheets, etc) won't change, we ask Eliom not to
   update the <head> of the page when changing page. (This also avoids
   blinking when changing page in iOS). *)
let%client _ = Eliom_client.persist_document_head ()

let%server h42n42 =
  Eliom_service.create ~path:(Eliom_service.Path [])
    ~meth:(Eliom_service.Get Eliom_parameter.unit) ()

let%client h42n42 = ~%h42n42

let%shared () =
  App.register ~service:h42n42 (fun () () ->
    Lwt.return
      Eliom_content.Html.D.(
        html
          (head
             (title (txt "myapp"))
             [ css_link
                 ~uri:
                   (make_uri
                      ~service:(Eliom_service.static_dir ())
                      ["css"; "myapp.css"])
                 () ])
          (body [h1 [txt "Welcome to Eliom!"]])));
