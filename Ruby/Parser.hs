module Ruby.Parser
( parseRuby
, parseRuby_
)
where

import ApplicativeParsec
import Ruby.Nodes

-- common

sp = space

-- 8. Lexical structure

local_variable_identifier = (:) <$> (lower <|> char '_') <*> many1 identifier_character

constant_identifier = (:) <$> upper <*> many1 identifier_character

assignment_like_method_identifier = asIdent <$> (constant_identifier <|> local_variable_identifier) <* char '='
  where asIdent str = str ++ "="

identifier_character = lower <|> upper <|> digit <|> char '_'

-- 10. Program structure

program = Program <$> compstmt

compstmt = CompStmt <$> many1 stmt

-- 11. Expressions

expression = keyword_logical_expression

keyword_logical_expression = NotExpr <$> (string "not" *> sp *> many1 letter)

method_name = local_variable_identifier --todo
              

aliasstmt = AliasStmt <$> (string "alias" *> sp *> many1 letter)
                      <*> (sp *> many1 letter)

-- 12. Statements

stmt :: Parser Stmt
stmt = try aliasstmt
     <|> exprstmt

exprstmt = ExprStmt <$> expression

-- 13.3 Methods

defined_method_name = try assignment_like_method_identifier
                    <|> method_name

-- run

run :: Show a => Parser a -> String -> IO ()
run p input
        = case (parse p "" input) of
            Left err -> do{ putStr "parse error at "
                          ; print err
                          }
            Right x  -> print x

parseRuby = run program

parseRuby_ = run program "alias foo bar"
