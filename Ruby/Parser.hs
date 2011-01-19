module Ruby.Parser
( parseRuby
, parseRuby_
)
where

import ApplicativeParsec
import Ruby.Nodes

-- common

sp = space

-- 10. Program structure

program = Program <$> compstmt

compstmt = CompStmt <$> many1 stmt

-- 11. Expressions

aliasstmt = AliasStmt <$> (string "alias" *> sp *> many1 letter)
                      <*> (sp *> many1 letter)

-- 12. Statements

stmt = try aliasstmt
     <|> exprstmt

exprstmt = ExprStmt <$> many1 letter

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
