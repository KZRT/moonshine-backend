use std::collections::HashMap;
use csv;
use postgres::{Client, NoTls, Error};
use postgres::error::DbError;

fn main() {
    let mut client = Client::connect( "host=localhost user= password= dbname= port=5432", NoTls)
        .expect("Failed to connect to database");

    let select_cocktail_id_query = "SELECT cocktail_id FROM moonshine.cocktail_taste_composition";
    let mut cocktail_id_list : Vec<i32> = Vec::new();
    for row in client.query(
        select_cocktail_id_query,
        &[],
    ).unwrap() {
        let cocktail_id : i32 = row.get(0);
        println!("cocktail_id: {}", cocktail_id);
        cocktail_id_list.push(cocktail_id);
    }
    let mut composition_count = 564;
    for i in 1..=660{
        if cocktail_id_list.contains(&(i as i32)) {
            continue;
        } else {
            let taste_query = "INSERT INTO moonshine.tastes (taste_id, gentle, boozy, sweet, dry, alcohol) VALUES ($1, $2, $3, $4, $5, $6)";
            let cocktail_taste_query = "INSERT INTO moonshine.cocktail_taste_composition (cocktail_id, taste_id) VALUES ($1, $2)";
            client.execute(
                taste_query,
                &[
                    &(composition_count as i32),
                    &0.0,
                    &0.0,
                    &0.0,
                    &0.0,
                    &0.0,
                    ]
            ).unwrap();
            match client.execute(
                cocktail_taste_query,
                &[&(i as i32), &(composition_count as i32)],
            ){
                Ok(_) => println!("cocktail_id: {} is inserted", i),
                Err(e) => println!("cocktail_id: {} is not inserted", i),
            }
            composition_count += 1;
        }
    }
}
