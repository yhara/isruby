module Ruby.Nodes
( hello )
where

data Stmt = Stmt String

data CompStmt = CompStmt [Stmt]

data Program = Program CompStmt

hello :: Int
hello = 1
