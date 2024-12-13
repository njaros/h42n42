FROM ocaml/opam:ubuntu-20.04-ocaml-5.0

# Installing ocsigen dependencies
RUN sudo apt-get update -y && sudo apt-get upgrade -y
RUN sudo apt-get install -y libgmp-dev npm pkg-config zlib1g-dev
RUN sudo apt-get install -y postgresql ruby-sass libsqlite3-dev

# Installing ocsigen
RUN opam init
RUN opam install -y ocsigen-start js_of_ocaml-ppx ocsipersist-sqlite-config eliom dune tyxml tyxml-ppx

# Just for the os to be able to locate the Ocaml binary...
# I begin to anderstand why nobody uses this language.
RUN sudo apt-get install -y ocaml-findlib

# Update binary path

# Run container script
WORKDIR /dev/app
# RUN sudo chown -R opam /dev/app
# RUN eval $(opam config env)
# RUN echo "YES" | eliom-distillery -name myapp -template os.pgocaml
ENTRYPOINT [ "bash" ]
CMD [ "./start_ocsigen.sh" ]