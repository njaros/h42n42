cd myapp
eval $(opam config env)
make db-delete
make db-init
make db-create
make db-schema
make test.byte