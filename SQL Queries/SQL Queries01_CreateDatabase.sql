IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'MiniECommerceDB'
)

CREATE DATABASE MiniECommerceDB;




