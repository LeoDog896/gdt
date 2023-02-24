// https://docs.godotengine.org/en/latest/contributing/development/file_formats/gdscript_grammar.html
program = {
	SOI
    ~ statement* ~
    EOI
}

// all chars allowed by gdscript in an identifier
ident_char = { ASCII_ALPHANUMERIC | "_" }
identifier = @{ ident_char+ }

digit = { ASCII_DIGIT }
number = @{ digit+ }

chars = @{ (!"\"" ~ ANY)* }
string = ${ "\"" ~ chars ~ "\"" }

array = {
	"[" ~ "]" |
    "[" ~ expression ~ ("," ~ expression)* ~ "]"
}

pair = { (string | identifier | number) ~ ("=" | ":") ~ expression }

object = {
    "{" ~ "}" |
    "{" ~ pair ~ ("," ~ pair)* ~ "}"
}

expression = { identifier | number | string | array | object }

inheritance = ${ "extends " ~ identifier }
class_name = ${ "class_name " ~ identifier }

annotation = @{ "@" ~ identifier ~ "(" ~ string ~ ")" }

statement = { annotation* ~ (
		variable_declaration
    	| const_declaration
    	| inheritance
    	| class_name
    	| enum_declaration
	)
}

onready = { "onready " }
export = { "export " }

variable_type = { ":" ~ identifier }
inferred = @{ ":=" }
variable_declaration = { 
	onready?
    ~ export?
    ~ "var "
    ~ identifier
    ~ (
    	(variable_type ~ ("=" ~ expression)?)
        | (variable_type? ~ ("=" ~ expression))
        | (inferred ~ expression)
    )?
}

enum_token = { "enom" }

enum_declaration = {
	enum_token
}

// const's don't have walrus operators
const_declaration = {
	export?
    ~ "const "
    ~ identifier
    ~ variable_type?
    ~ "="
    ~ expression
}

WHITESPACE = _{ " " | "\t" | "\n" }
COMMENT = { "#" ~ (!"\n" ~ ANY)* }