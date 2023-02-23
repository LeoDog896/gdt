use pest_derive::Parser;

#[derive(Parser)]
#[grammar = "../grammar/gdscript.pest"] // relative to src
struct MyParser;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = 2 + 2;
        assert_eq!(result, 4);
    }
}
