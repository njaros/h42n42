sudo chown -R opam /dev/app
eval $(opam config env)
echo "YES" | eliom-distillery -name myapp -template os.pgocaml

bash