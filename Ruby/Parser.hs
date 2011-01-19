module Ruby.Parser
( parseRuby
, parseRuby_
)
where

import Text.ParserCombinators.Parsec
import Ruby.Nodes

stmt = do s <- many1 letter
          return $ ExprStmt s

compstmt = do s <- many1 stmt
              return $ CompStmt s

program = do cs <- compstmt
             return $ Program cs

run :: Show a => Parser a -> String -> IO ()
run p input
        = case (parse p "" input) of
            Left err -> do{ putStr "parse error at "
                          ; print err
                          }
            Right x  -> print x

parseRuby = run program

parseRuby_ = run program "a"
