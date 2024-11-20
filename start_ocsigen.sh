eval $(opam config env)
if [ ! -f "myapp" ]; then
    sudo chown -R opam /dev/app
    mkdir myapp
    echo "YES" | eliom-distillery -name myapp -template app.exe
fi
cd myapp
make test.byte