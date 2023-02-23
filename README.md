# gdt
gdscript tools for abstract manipulation of ASTs.

**ALL TOOLS ARE UNSTABLE**. The grammer is subject to change at any time, and so are formatting tools, as of 0.x

## Grammar Development

We use [pest](https://pest.rs) for making grammar. As a good reference guide, [GDScript has a EBNF grammar](https://docs.godotengine.org/en/latest/contributing/development/file_formats/gdscript_grammar.html).

However, since it is [EBNF](https://en.wikipedia.org/wiki/Extended_Backus%E2%80%93Naur_form) and not [PEG](https://en.wikipedia.org/wiki/Parsing_expression_grammar?scrlybrkr=7b5d6ae7), and doesn't really comform to the implementation, there may be some extra edge cases that are covered in test.

Some useful pest resources:
- Indentation: https://github.com/pest-parser/pest/discussions/716
