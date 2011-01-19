module Ruby.Nodes where

data Expression = NotExpr String
                | StrLit String
                | ExStrLit Program
  deriving Show

data Stmt = ExprStmt Expression
          | AliasStmt String String
  deriving Show

data CompStmt = CompStmt [Stmt]
  deriving Show

data Program = Program CompStmt
  deriving Show
