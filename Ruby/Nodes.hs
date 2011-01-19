module Ruby.Nodes where

data Stmt = ExprStmt String
          | AliasStmt String String
  deriving Show

data CompStmt = CompStmt [Stmt]
  deriving Show

data Program = Program CompStmt
  deriving Show
