module Ruby.Nodes where

data Stmt = Stmt String
  deriving Show

data CompStmt = CompStmt [Stmt]
  deriving Show

data Program = Program CompStmt
  deriving Show
