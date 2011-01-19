module Ruby.Nodes where

data Expression = NotExpr String
  deriving Show

data Stmt = ExprStmt Expression
          | AliasStmt String String
  deriving Show

data CompStmt = CompStmt [Stmt]
  deriving Show

data Program = Program CompStmt
  deriving Show
