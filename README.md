# rus-wasm
RustからWebAssemblyにコンパイルするHello World

### pre install
cargo install wasm-pack

### target (wasm32にビルド)
rustup target list

なければ、下記で追加。
rustup target add wasm32-unknown-unknown
rustup target add wasm32-wasi

### build
wasm-pack build --target web

or

cargo build --target wasm32-wasi --release

### おまじない
Cargo.tomlに下記追記。  
[package.metadata.wasm-pack.profile.release]  
wasm-opt = false  

### Run
❯ wasmtime target/wasm32-wasi/release/hello-k8s.wasm
Hello, world!  

wasmtimeは、インストールすること。
https://github.com/bytecodealliance/wasmtime



https://blog.hayashikun.com/entry/2021/01/24/220352

https://github.com/deislabs/krustlet/tree/master/demos/wasi/wasmerciser

https://github.com/hayashikun/krustlet-example/tree/master/prime-api