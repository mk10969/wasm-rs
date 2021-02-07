# rus-wasm
RustからWebAssemblyにコンパイルするHello World

### pre install
cargo install wasm-pack

### target (wasm32-unknown-unknown)
rustup target list

なければ、下記で追加。
rustup target add wasm32-unknown-unknown

### build
wasm-pack build --target web

### おまじない
Cargo.tomlに下記追記。
[package.metadata.wasm-pack.profile.release]
wasm-opt = false

### index.htmlの作成
