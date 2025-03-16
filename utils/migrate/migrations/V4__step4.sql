ALTER TABLE icebergnessie.test.mig_1 ADD COLUMN crossXY DOUBLE;

UPDATE icebergnessie.test.mig_1 SET crossXY = value_x * value_y;