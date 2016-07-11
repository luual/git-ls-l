extern crate git2; 

use std::process::Command;
use git2::Repository;
use git2::StatusOptions;

fn main(){
    // Call ls -lah --color and catch the output
    let output = Command::new("ls").arg("-lah").arg("--color").output()
        .expect("Failed to execute process");
    let repository = match Repository::open(".") {
        Ok(repository)  => repository,
        Err(e)          => panic!("Failed to init: {}", e),
    };
    //let mut status_option: Option<git2::StatusOptions> = StatusOptions::new();
    //let mut statuses = repository.statuses(&mut status_option);
    let index_repo = match repository.index(){
        Ok(index)       => index,
        Err(e)          => panic!("Failed to get index {}", e),
    };
    let mut status_option = StatusOptions::new();
    // Include untracked files
    status_option.include_untracked(true);
    let status_2: Option<& mut StatusOptions> = Some(&mut status_option);
    let mut statuses = match repository.statuses(status_2){
        Ok(statuses)    => statuses,
        Err(e)          => panic!("Failed to get statuses {}", e),
    };
    if statuses.len() > 0 {
        println!("length : {}", statuses.len());
        let iterator = statuses.iter();
    }
    //println!("{}", String::from_utf8_lossy(&output.stdout));
}
