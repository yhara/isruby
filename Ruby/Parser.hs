module Ruby.Parser
(parseRuby)
where

import Text.ParserCombinators.Parsec

program :: Parser Char
program = letter

run :: Show a => Parser a -> String -> IO ()
run p input
        = case (parse p "" input) of
            Left err -> do{ putStr "parse error at "
                          ; print err
                          }
            Right x  -> print x

parseRuby = run program
