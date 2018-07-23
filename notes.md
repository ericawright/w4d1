
### Structured Query Langauge

### ERD - Entity Relationship Diagrams
  Very often, the first step in designing an application is to think about the data you'll be working with. What things (entities) exist in your application, what attributes do they have, and how are they related? This process can be called Entity Relationship Diagramming.
  
  Figuring out what attributes deserve their own tables as entities, and which can be attributes can be a difficult process, consider the importance of each attibute and how much the data can be reduced by separating it into a table. Think about how you are going to use that information in the future in and which tables might have a dependant relationship on other tables when creating forgeign keys.
  
### How data is organized in relational databases:

    Database: the structure of information and the data stored within that structure
        Tables: represent collections of information
        Rows: represents a single object in a particular collection/table
            Columns (or fields)
    Keys
        - Primary keys
        Provide a way to uniquely identify each row in a table.
        By convention, we use an auto-incrementing counting number. This column is named identically (usually id) in every table for programming convenience.
        - Foreign keys
        Describe the association between two tables.
        The data in a foreign key column in the child table must be the same as the data in the primary key column of a row in the parent table.

Note: A foreign key is meant only to constrain the data. ie enforce referential integrity.


Query using SQL:
SELECT statements are broken up into seven clauses:

    SELECT - list the data you wanna get
    FROM - list the tables that you wanna get data from
    WHERE - filter down which rows are gonna come in the output
    GROUP BY - treat a bunch of rows that would have been in the output as a single row
    HAVING - is like WHERE for the result of aggregated data
    ORDER BY - what order do you want the resulting rows to come back in
    LIMIT - how many rows do you want to come back

ex:
```
SELECT
  total_amount
FROM
  invoices
WHERE
  total_amount > 100
ORDER BY
  total_amount DESC
LIMIT 10;
```
