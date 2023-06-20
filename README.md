# moonshine_backend

## Compile and Run
For running server instance, use
```bash
    cd node
    npm install
    npm start
```

For Database initialization use
```bash
    cd sqls
    psql -U ${username} -f init.sql
```

For parsing data to database, you should configure main file of both Parsing directories.
At the first line,
```rust
fn main() {
    let mut client = Client::connect( "host=localhost user= password= dbname= port=5432", NoTls)
        .expect("Failed to connect to database");
```
fill user= as username, password= with password, and dbname= with database name.

For parsing cocktail taste data, use
```bash
    cd csvParsing
    cargo run
```
Crawled data is in csvParsing/src/taste_crawling.csv

For parsing cocktail recipe data, use
```bash
    cd jsonParsing
    cargo run
```