module Ruby.Parser
( parseRuby
, parseRuby_
)
where

import ApplicativeParsec
import Ruby.Nodes

aliasstmt = AliasStmt <$> (string "alias" *> letter) <*> letter

exprstmt = ExprStmt <$> many1 letter

stmt = aliasstmt <|> exprstmt

compstmt = CompStmt <$> many1 stmt

program = Program <$> compstmt

run :: Show a => Parser a -> String -> IO ()
run p input
        = case (parse p "" input) of
            Left err -> do{ putStr "parse error at "
                          ; print err
                          }
            Right x  -> print x

parseRuby = run program

parseRuby_ = run program "aliasii"
