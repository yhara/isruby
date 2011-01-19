module Ruby.Nodes where

data Stmt = ExprStmt String
          | AliasStmt Char Char
  deriving Show

data CompStmt = CompStmt [Stmt]
  deriving Show

data Program = Program CompStmt
  deriving Show
