extern crate git2; 

use std::process::Command;
use git2::Repository;

fn main(){
    // Call ls -lah --color and catch the output
    let output = Command::new("ls").arg("-lah").arg("--color").output()
        .expect("Failed to execute process");
    let repository = match Repository::init(".") {
        Ok(repository)  => repository,
        Err(e)          => panic!("Failed to init: {}", e),
    };
    println!("{}", String::from_utf8_lossy(&output.stdout));
}
