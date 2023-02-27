use bevy::prelude::*;

struct Postion { x:f32, y: f32 }

fn print_position_system(query: Query<&Transform>) {
    for transorm in query.iter() {
        println!("postion: {:?}", transform.translation)
    }
}

fn wtf () {
    println!("wtf");
}



fn hello_world() {
    println!("hello world!");
}

fn main(){
    App::build().run()
        .add_system(hello_world.system())
        .run();
}
