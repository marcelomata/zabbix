ALTER TABLE nodes ALTER COLUMN nodeid SET WITH DEFAULT NULL
/
REORG TABLE nodes
/
ALTER TABLE nodes ALTER COLUMN masterid SET WITH DEFAULT NULL
/
REORG TABLE nodes
/
ALTER TABLE nodes ALTER COLUMN masterid DROP NOT NULL
/
REORG TABLE nodes
/
ALTER TABLE nodes DROP COLUMN timezone
/
REORG TABLE nodes
/
ALTER TABLE nodes DROP COLUMN slave_history
/
REORG TABLE nodes
/
ALTER TABLE nodes DROP COLUMN slave_trends
/
REORG TABLE nodes
/
UPDATE nodes SET masterid=NULL WHERE masterid=0
/
ALTER TABLE nodes ADD CONSTRAINT c_nodes_1 FOREIGN KEY (masterid) REFERENCES nodes (nodeid)
/